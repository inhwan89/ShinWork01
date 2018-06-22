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
<form name = "frm_view" method = "post">
<input type = "hidden" name = "serial" value = "${vo.serial}">
</form>

<div class="container">
<div class="container-fluid">
  <div class="row content">
   <div class="col-sm-6">
    <br/>
	  <div class="accommodation_img change_background" style = "background-image: url('./accommodation_album/${vo.attfileshow}'); board: 0px solid black; width: 100%">
	</div>
   </div>
    <div class="col-sm-6">
    <br/>
  <!-- One "tab" for each step in the form: -->
    <div class="input-group">
	    <span class="input-group-addon">업체이름</span>
	    <input type="text" class="form-control text-center" name="aname" value = '${vo.aname}' readonly>
  	</div>
  	<div class="input-group">
	<span class="input-group-addon">위&ensp;&ensp;&ensp;&ensp;치</span>
	<input type="text" class="form-control text-center" name="address" value = "${vo.address1}, ${vo.address2}" readonly>
	</div>
	<div class="input-group">
	    <span class="input-group-addon">상세주소</span>
	    <input type="text" class="form-control text-center" name="address3" value = "${vo.address3}" readonly>
  	</div>
  

  	<div class="input-group">
	    <span class="input-group-addon" >주차공간</span>
	    <input type="text" class="form-control text-center" name="parkingspace" value = "${vo.parkingspace}" readonly>
  	</div> 
  	<div class="input-group">
	    <span class="input-group-addon" >업체설명</span>
	    <textarea class="form-control text-center" rows="3" name ="content" readonly>${vo.content}</textarea>
  	</div>

</div>
<input type = "hidden" name = "worker" value = "park">
</div>
</div>
<br/>
<br/>



<c:set var="cntpb" value="1"></c:set>
<c:set var="cntpe" value="5"></c:set
>
<c:set var="cntb" value="0"></c:set>

<c:set var="cntbb" value="1"></c:set>
<c:set var="cntbe" value="5"></c:set>

<c:set var="cntnum" value = "-1"></c:set>


<c:forEach var = "vo" items = '${list}'>
<c:set var="cntb" value="${cntb+1}"></c:set>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-6">
    <br/>
	<div id="myCarousel${cntb}" class="carousel slide" data-interval="0">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	    <c:forEach begin="${cntbb}" end="${cntbe}">
	    <c:if test = "${cntbe-cntbb == 4 and picList[cntbb]!=null}">
	    <c:set var="cntnum" value = "${cntnum+1}"></c:set>
	   	<li data-target="#myCarousel${cntb}" data-slide-to="${cntnum}" class="active"></li>
	    </c:if>
	    <c:if test = "${cntbe-cntbb != 4 and picList[cntbb]!=null}">
	    <c:set var="cntnum" value = "${cntnum+1}"></c:set>
	    <li data-target="#myCarousel${cntb}" data-slide-to="${cntnum}"></li>
	    </c:if>
	    <c:set var="cntbb" value="${cntbb+1}"></c:set>
	    </c:forEach>
	    <c:set var="cntbe" value="${cntbe+5}"></c:set>
	    <c:set var="cntnum" value = "-1"></c:set>
	    </ol>
		<div class="carousel-inner" role="listbox">
		<c:forEach begin="${cntpb}" end="${cntpe}">
				<c:if test = "${cntpe-cntpb == 4}">
				    <div class="item active">
					 <div class="accommodation_img change_background" style = "background-image: url('./accommodation_album/${picList[cntpb]}'); board: 0px solid black">
					</div>
			      </div>
			     </c:if>
			     <c:if test = "${cntpe-cntpb != 4 && picList[cntpb]!=null}">
			     	<div class="item">
					 <div class="accommodation_img change_background" style = "background-image: url('./accommodation_album/${picList[cntpb]}'); board: 0px solid black">
					</div>
			      </div>
			     </c:if>
				<c:set var="cntpb" value="${cntpb+1 }"></c:set>
		</c:forEach>
		</div>
		<c:set var="cntpe" value="${cntpe+5 }"></c:set>
	
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel${cntb}" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel${cntb}" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
	</div>
	<br>
	</div>
	
	<div class="col-sm-6" id = "col_imgs">
	<br/>
	
	<div class="input-group">
		<span class="input-group-addon">방종류</span>
		<input type="text" class="form-control text-center" name="room" value = '${vo.room}' readonly>
	</div>
	<div class="input-group">
		<span class="input-group-addon">방개수</span>
		<input type="text" class="form-control text-center" name="room_num" value = '${vo.room_num}' readonly>
	</div>
		  	
	<div class="input-group">
		<span class="input-group-addon">평일가</span>
		<input  type="text" class="form-control text-center" name="weekdays" value = '${vo.weekdays}' readonly>
	</div>
	<div class="input-group">
		<span class="input-group-addon">주말가</span>
	<input  type="text" class="form-control text-center" name="weekends" value = '${vo.weekends}' readonly>
	</div>
	</div>
	</div>
</div>
</c:forEach>
<button type="button" class="btn btn-primary btn-block" onclick = "modify()">수정 페이지 이동하기</button>
<button type="button" class="btn btn-primary btn-block" onclick = "del()">삭제</button>
<button type="button" class="btn btn-primary btn-block" onclick = "list()">리스트로 돌아가기</button>
</div>
<script>
var frm = frm_view;
function modify(){
	frm.action = "selectToModify.ac";
	frm.submit();
}

function list(){
	location.href = "list.ac";
}

function del(){
	frm.action = "delete.ac";
	frm.submit();
}
</script>
</body>
</html>