<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="list_detail_inner">
	<div class="row">
		<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
			<h2 class="cursive-font primary-color">${vo.part }</h2>
		</div>
	</div>

	<div class=container>
		<div class="row">
			<c:forEach var="vo" items="${list}">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="fh5co-card-item image-popup"
						onclick="go('${vo.serial}')">
						<figure>
						<div class="overlay"></div>
						<img src="./accommodation/accommodation_album_thumbnail/thumb_${vo.attfileshow}"
							alt="Image" class="img-responsive"> </figure>
						<div class="fh5co-text">
							<h2>${vo.aname}</h2>
							<p>Rating(Views)</p>
							<p>${vo.address1},${vo.address2}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class='w3-center'>
		<ul class="pagination pagination-sm">
			<c:if test="${dao.nowBlock>1 }">
				<li class="page-item"><a class="page-link"
					onclick='movePage(1);return false;'>First</a></li>
				<li class="page-item"><a class="page-link"
					onclick='movePage(${dao.startPage-1});return false;'>Previous</a></li>
			</c:if>
			<c:forEach var='i' begin="${dao.startPage}" end="${dao.endPage}">
				<c:if test="${dao.acco_nowPage == i}">
					<li class="page-item active"><a class="page-link"
						onclick='movePage(${i});return false;'>${i}</a></li>
				</c:if>
				<c:if test="${dao.acco_nowPage != i}">
					<li class="page-item"><a class="page-link"
						onclick='movePage(${i});return false;' >${i}</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${dao.nowBlock < dao.totBlock}">
				<li class="page-item"><a class="page-link"
					onclick='movePage(${dao.endPage+1});return false;'>Next</a></li>
				<li class="page-item"><a class="page-link"
					onclick='movePage(${dao.totPage});return false;'>Last</a></li>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>