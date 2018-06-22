<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




<div class="row">
	<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
		<h2 class="cursive-font primary-color">Resort</h2>
	</div>
</div>

<form name = 'frm_list_main' method ='post'>
<input type = "text" name = "nowPage" value = '${vo.nowPage}'>
<input type = 'text' name = 'findStr' value = '${vo.findStr}'>
<input type = 'text' name = 'address1' value = '${vo.address1}'>
<input type = 'text' name = 'address2' value = '${vo.address2}'>
<input type = 'text' name = 'part' value = '${vo.part}'>
</form>
<div class=container>
	<div class="row">
	<c:forEach var="vo" items="${list}" begin= '0' end = '5'>
	<c:if test="${vo.part == '리조트'}">
		<div class="col-lg-4 col-md-4 col-sm-6">
			<div class="fh5co-card-item image-popup" onclick="go('${vo.serial}')">
				<figure>
				<div class="overlay"></div>
				<img src="./accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Image" class="img-responsive">
				</figure>
				<div class="fh5co-text">
					<h2>${vo.aname}</h2>
					<p>Rating(Views)</p>
					<p>${vo.address1}, ${vo.address2}</p>
				</div>
				<input type="hidden" name="serial" value="${vo.serial}">
			</div>
		</div>
		</c:if>
		</c:forEach>
		<div class = 'w3-button w3-center w3-block' onclick = 'list_resort()'>더보기</div>
	</div>
</div>

<div class="row">
	<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
		<h2 class="cursive-font primary-color">Hotel</h2>
	</div>
</div>

<div class=container>
	<div class="row">	
	<c:forEach var="vo" items="${list}">
	<c:if test="${vo.part == '호텔'}">
		<div class="col-lg-4 col-md-4 col-sm-6">
			<div class="fh5co-card-item image-popup" onclick="go('${vo.serial}')">
				<figure>
				<div class="overlay"></div>
				<img src="./accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Image" class="img-responsive">
				</figure>
				<div class="fh5co-text">
					<h2>${vo.aname}</h2>
					<p>Rating(Views)</p>
					<p>${vo.address1}, ${vo.address2}</p>
				</div>
				<input type="hidden" name="serial" value="${vo.serial}">
			</div>
		</div>
		</c:if>
		</c:forEach>
		<div class = 'w3-button w3-center w3-block'>더보기</div>
	</div>
</div>

<div class="row">
	<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
		<h2 class="cursive-font primary-color">Motel</h2>
	</div>
</div>

<div class=container>
	<div class="row">	
	<c:forEach var="vo" items="${list}">
	<c:if test="${vo.part == '모텔'}">
		<div class="col-lg-4 col-md-4 col-sm-6">
			<div class="fh5co-card-item image-popup" onclick="go('${vo.serial}')">
				<figure>
				<div class="overlay"></div>
				<img src="./accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Image" class="img-responsive">
				</figure>
				<div class="fh5co-text">
					<h2>${vo.aname}</h2>
					<p>Rating(Views)</p>
					<p>${vo.address1}, ${vo.address2}</p>
				</div>
				<input type="hidden" name="serial" value="${vo.serial}">
			</div>
		</div>
		</c:if>
		</c:forEach>
		<div class = 'w3-button w3-center w3-block'>더보기</div>
	</div>
</div>

<div class="row">
	<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
		<h2 class="cursive-font primary-color">Guest House</h2>
	</div>
</div>

<div class=container>
	<div class="row">	
	<c:forEach var="vo" items="${list}" >
	<c:if test="${vo.part == '게스트하우스'}">
		<div class="col-lg-4 col-md-4 col-sm-6">
			<div class="fh5co-card-item image-popup" onclick="go('${vo.serial}')">
				<figure>
				<div class="overlay"></div>
				<img src="./accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Image" class="img-responsive">
				</figure>
				<div class="fh5co-text">
					<h2>${vo.aname}</h2>
					<p>Rating(Views)</p>
					<p>${vo.address1}, ${vo.address2}</p>
				</div>
				<input type="hidden" name="serial" value="${vo.serial}">
			</div>
		</div>
		</c:if>
		</c:forEach>
		<div class = 'w3-button w3-center w3-block'>더보기</div>
	</div>
</div>
<div class='floating' style = 'z-index: 12;'>
<a href="index.jsp?inc=/accommodation/insert.jsp"><div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '업체 추가'><i class="fa fa-plus-square-o" style = 'padding: 6px;'></i></button></div></a><br>
</div>

<script>
function go(serial){
	var frm = frm_search;
	frm.serial.value = serial;
	frm.action = "selectOne.ac";
	frm.submit();
}


$(document).ready(function(){
	$('input').attr('autocomplete','off');
    var navbar = document.getElementById("myNavbar");
    var holder = document.getElementById("holder");
    navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    holder.className = "nav-holder" + " w3-padding-large" + " nav_small";
    $(".default").css("display","none");
    $(".scrolled").css("display","block");
});


function list_resort(){
	var frm = document.frm_list_main;
	frm.part.value = '리조트';
	frm.action = 'list_resort.ac';
	frm.submit();
}
</script>
</body>
</html>