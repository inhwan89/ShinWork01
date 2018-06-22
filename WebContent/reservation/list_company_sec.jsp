<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#list_com h2{border-bottom: 3px solid #036; padding-bottom: 5px; margin-left:60px; margin-right:60px; }
#list_com  #title_items{margin-left: 60px; margin-right: 60px; }
</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="list_com">
<h2 class="w3-text-blue">Reservation Confirm</h2><br/>
	<form name="frm_list_com" method="post">
		<input type="hidden" name="reservationPage" value="${vo.reservationPage}">
		<input type="hidden" name="reservationPage2" value="${vo.reservationPage2}">
		<input type="hidden" name="select" value="${vo.select }">
		<input type="hidden" name="serial2"  value="${vo.serial2 }">
		<input type="hidden" name="serial" value="1">
	</form>
		<div id='title_items'>       
	  <table class="table table-striped">
	  
	    <thead>	 	
	      <tr id='header_list' class="w3-blue">
	        <th class='no'>No</th>
	        <th class='irum'>회원명</th>
	        <th class='detail'>메뉴/방이름</th>
	        <th class='rdate'>예약일/예약시간</th>
	        <th class='price'>가격</th>     
	      </tr>
	    </thead>
	    <c:set var = 'cnt' value = "${dao.startNo }"/>
			<c:forEach var='v' items="${list}">
	    <tbody>
	      <tr class ='items'>
	        <td class ='no' align = 'center'>${cnt }</td>
	        <td class ='irum'><a href="#"onclick="view(${v.serial})">${v.store }</a></td>
	        <td class ='detail'>${v.menu }${v.room }</td>
	        <td class ='rdate'><c:if test="${v.rdate ne '' }">${v.rdate }/${v.rtime }시</c:if><c:if test="${v.rdate eq'' }">${v.startDate }~${v.endDate }</c:if></td>
	        <td class ='price'>${v.price }</td>
	        <c:set var ="cnt" value = "${cnt+1}"/>
	      </tr>
	    </tbody>    
	    </c:forEach>
	  </table>
	  </div>	
	<div id="pageZone" class="w3-center">
	<ul class="pagination">
		<ul class="pager">
		<c:if test ="${dao.nowBlock > 1 }">		
				<li><a href="#" id='btnPrev' name='btnPrev' onclick='goPage(${dao.startPage-1})'>Previous</a></li>			
			</c:if>			
			<c:forEach var="p" begin="${dao.startPage}" end="${dao.endPage}">					
				<li><a href="#" value='${p}' id='btn1' name='btn1' value="${p }" ${(dao.nowPage==p)? 'disabled':'' } onclick="goPage(${p})">${p}</a></li>		
			</c:forEach>	
			<c:if test = "${dao.nowBlock < dao.totBlock }">	
				<li><a href="#" id='btnNext' name='btnNext' onclick='goPage(${dao.endPage+1})'>Next</a></li>
			</c:if>	
		</ul>	
		</ul>
	</div>	
</div>
<script>
$(document).ready(function(){
	$('input').attr('autocomplete','off');
    var navbar = document.getElementById("myNavbar");
    var holder = document.getElementById("holder");
    navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    holder.className = "nav-holder" + " w3-padding-large" + " nav_small";
    $(".default").css("display","none");
    $(".scrolled").css("display","block");
});
var frm =document.frm_list_com;
function view(serial){
	frm.serial.value=serial;
	frm.action="view.reserve";
	frm.submit();
}
function goPage(reservationPage){
	frm.reservationPage.value=reservationPage;
	frm.action="list_store.reserve";
	frm.submit();
}
</script>
</body>
</html>