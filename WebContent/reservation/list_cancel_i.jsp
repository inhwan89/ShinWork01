<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#list_cancel h2{border-bottom: 3px solid #036; padding-bottom: 5px; margin-left:60px; margin-right:60px; }
#list_cancel th{text-align: center;}
#list_cancel td{text-align: center;}
#list_cancel #title_items{margin-left: 60px; margin-right:60px;}
/* SelectBox CSS */ 
#list_cancel #select_box{float: right; margin-right: 60px;}
#list_cancel div#select_box {position: relative;width: 200px;height: 40px;background: url(select_arrow.png) 180px center no-repeat; /* 화살표 이미지 */border: 1px solid #335de8;}
#list_cancel div#select_box label {position: absolute;font-size: 14px;color: #335de8;top: 13px;left: 12px;letter-spacing: 1px;}
#list_cancel div#select_box select#color {width: 100%;height: 40px;min-height: 40px;line-height: 40px;padding: 0 10px;opacity: 0;filter: alpha(opacity=0); /* IE 8 */}
#list_cancel .label_for{  text-align: center;}
</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="list_cancel">
<h2 class="w3-text-blue">Reservation Cancel</h2><br/>
	<form name="frm_clist_ind" method="post">	
		<div id="select_box">
		 <label class="label_for" id="label_for">　　　　전체검색1</label>
			<select name="select" onchange="funcSelect()" id="color" title="select color">
				<option value="">　　　　전체검색</option>
				<option value="acc">　　　　숙박검색</option>
				<option value="res">　　　　맛집검색</option>
			</select>
		</div>	
		<input type="hidden" name="reservationPage" value="${vo.reservationPage}">
		<input type="hidden" name="hiddenSel"  value="${vo.select }">
	</form><br/><br/>
		<div id='title_items'>       
	  <table class="table table-striped">	  
	    <thead>	 	
	      <tr id='header_list' class="w3-blue">
	        <th class='no'>No</th>
	        <th class='store'>업체명</th>
	        <th class="reason">취소사유</th>
	        <th class='detail'>메뉴/방이름</th>
	        <th class='rdate'>예약일</th>
	        <th class="cdate">예약 취소일 </th>
	        <th class='price'>취소금액</th>     
	      </tr>
	    </thead>
	    <c:set var = 'cnt' value = "${dao.startNo }"/>
			<c:forEach var='v' items="${list}">
	    <tbody>
	      <tr class ='items'>
	        <td class ='no''>${cnt }</td>
	        <td class ='store'>${v.store }</td>
	        <td class="reason">${v.reason }</th>
	        <td class ='detail'>${v.menu }</td>
	        <td class ='rdate'>${v.rdate }</td>
	        <td class ='cdate'>${v.cdate }</td>
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
var frm =document.frm_clist_ind;
function goPage(reservationPage){
	frm.reservationPage.value=reservationPage;
	frm.action="list_cancel_i.reserve";
	frm.submit();
}
function funcSelect(){
	frm.reservationPage.value=1;
	frm.action="list_cancel_i.reserve";
	frm.submit();
}
function page(){
	frm.select.value=frm.hiddenSel.value;
	
	if(frm.select.value==""){
		document.getElementById("label_for").innerHTML = "　　　　전체검색";	
	}else if(frm.select.value=="acc"){
		document.getElementById("label_for").innerHTML = "　　　　숙박검색";	
	}else if(frm.select.value=="res"){
		document.getElementById("label_for").innerHTML = "　　　　맛집검색";	
	}
}
page();
</script>
</body>
</html>