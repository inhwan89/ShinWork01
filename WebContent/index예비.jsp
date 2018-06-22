<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to full course trip</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?	family=Montserrat"
	rel="stylesheet" type="text/css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
<link rel='stylesheet' type='text/css' href='index.css' />
<!-- summernote CSS/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">

	<%
request.setCharacterEncoding("utf-8"); 
String inc = "intro.jsp";
if(request.getParameter("inc") != null){
	inc = request.getParameter("inc");
}
%>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#myPage">Logo</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${sId == 'admin' }">
						<li class="dropdown"><a class="dropdown-toggle"data-toggle="dropdown" href="#">MemberList 
						<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="MemberIndividualList.member">개인회원</a></li>
								<!-- .member로 변경 -->
								<li><a href="MemberCompanyList.member">사업자회원</a></li>
							</ul></li>
					</c:when>
				</c:choose>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">로그인 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:if test="${sessionScope.sId ==null }">
							<li><a href="index.jsp?inc=/member/MemberLogin.jsp">로그인</a></li>
						</c:if>
						<c:if test="${sessionScope.sId != null }">
							<c:if test="${sessionScope.selection == 'i' }">
							<li><a href="list_Individual.reserve">마이페이지</a></li>
							</c:if>
							<c:if test="${sessionScope.selection == 'c' }">
							<li><a href="list_company.reserve">마이페이지</a></li>
							</c:if>
							<li><a href="MemberModify.member">회원정보 수정</a></li>
							<li><a href="MemberLogout.member">로그아웃</a></li>
						</c:if>
					</ul></li>
				<li><a href="list.review">후기</a></li>
				<li><a href="insert.review">후기작성</a></li>
				<li><a href="list.donghwan">맛집</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">예약 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="reservation_acc.reserve">숙박예약</a></li>
						<li><a href="reservation_res.reserve">음식점예약</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">숙박 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="list.ac">ACCOMMDATION</a></li>
						<li><a href="index.jsp?inc=/accommodation/insert.jsp">ADD</a></li>
					</ul></li>
				<li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
			</ul>
		</div>
	</div>
	</nav>
	<br />

	<!-- Container (The Band Section) -->
	<div id="content">
		<jsp:include page="<%=inc %>"></jsp:include>
	</div>

	<!-- Footer -->
	<footer class="text-center"> <a class="up-arrow"
		href="#myPage" data-toggle="tooltip" title="TO TOP"> <span
		class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<br>
	<br>
	<p>
		Bootstrap Theme Made By <a href="https://www.w3schools.com"
			data-toggle="tooltip" title="Visit w3schools">www.w3schools.com</a>
	</p>
	</footer>

	<script>
$(document).ready(function(){
    // Activate Carousel
    $("#myCarousel").carousel({interval: 100000000});
})
</script>

</body>
</html>