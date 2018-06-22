<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
#MemberCompanyList h2{border-bottom: 3px solid #036; padding-bottom: 5px; margin-left:30px; margin-right:30px; }
#MemberCompanyList #header_list {padding:3px; font-weight: bolder; color:#ffffff; font-size:10px; padding: .5em; border-bottom: 3px double gray;}
#MemberCompanyList #title_items{margin-left:30px; margin-right:30px; }


#MemberCompanyList .no{margin-left:5px;  width:40px; text-align:center; font-size:15px; }
#MemberCompanyList .mid{width:150px; text-align:center; font-size:15px; color: #1a4282;}
#MemberCompanyList .mid1{width:150px; text-align:center; font-size:15px; }
#MemberCompanyList .delegate{width:80px; text-align:center; font-size:15px; }
#MemberCompanyList .company_number{width:200px; text-align:center; font-size:15px; }
#MemberCompanyList .address1{width:670px; text-align:center;font-size:15px; }
#MemberCompanyList .phone{width:180px; text-align:center; font-size:15px; }
#MemberCompanyList .email{width:200px; text-align:center; font-size:15px; }
#MemberCompanyList .area{width:80px; text-align:center; font-size:15px; }
#MemberCompanyList .mileage{width:80px; text-align:center; font-size:15px; }
#MemberCompanyList .confirmation{width:60px; text-align:center; font-size:15px; }

#MemberCompanyList #MemberCompanyList_top{display: inline-block; float: right; }
#MemberCompanyList #button_div{float: right; margin-top: 5px;}

#MemberCompanyList #MemberCompanyList_top{display: inline-block; float: right;}
#MemberCompanyList #button_div{float: right; margin-top: 5px; margin-right: 30px;}
#MemberCompanyList #findStr{margin-left:40px;	text-align: center; height: 30px; opacity: 0.8;  border-radius: 25px; border: 1px solid #ea4f37;}
#MemberCompanyList #title_items .items:hover{background-color: #c4e6ff; }


/*버튼 CSS*/       
#btnMemberFind{
font-size: 14px;
white-space:nowrap; 
padding:.25em 2em; 
font-family: Open Sans, Helvetica,Arial,sans-serif; 
line-height:18px; 
display: inline-block;
zoom: 1; 
color: #fff; 
text-align: center; 
position:relative; 
-webkit-transition: border .25s linear, color .25s linear, background-color .25s linear; 
transition: border .25s linear, color .25s linear, background-color .25s linear;
bottom: 2.5px;
margin-right: 30px;
}
#btnRegisterOrder, #btnIrumOrder, #btnHitOrder {
font-size: 14px; 
white-space:nowrap; 
padding:.25em 2em; 
font-family: Open Sans, Helvetica,Arial,sans-serif; 
line-height:18px; 
display: inline-block;
zoom: 1; 
color: #fff; 
text-align: center; 
position:relative; 
-webkit-transition: border .25s linear, color .25s linear, background-color .25s linear; 
transition: border .25s linear, color .25s linear, background-color .25s linear;
}

#btnMemberFind:hover, #btnRegisterOrder:hover, #btnIrumOrder:hover{background-color:#a53422;}
#btnMemberFind:active, #btnRegisterOrder:active, #btnIrumOrder:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}

#MemberCompanyList .container{width: 100%}

</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="MemberCompanyList">
<div class="container">   
<h2 class="w3-text-blue">Company</h2><br/>
	<form name='frm_list' method="POST">

	<div id="MemberCompanyList_top">
		  
			<input type='text' id="findStr" name='findStr' class="w3-border-blue" value='${param.findStr }' placeholder="Search"/>		
			<button name='btnMemberFind' id='btnMemberFind' class="w3-button w3-blue">검색</button><br/>
			<div id="button_div">
				<input type="button" id="btnRegisterOrder" class="w3-button w3-blue" value="지역순"/>
				<input type="button" id="btnIrumOrder" class="w3-button w3-blue" value="이름순"/>	
				<input type="button" id="btnHitOrder" class="w3-button w3-blue" value="마일리지순"/>			
			</div>
		</div><br/><br/><br/>
			<input type='hidden' name='nowPage' value='1'/> 
			<input type="hidden" name="selection" value="c"/>


	<div id='title_items'>       
	  <table class="table table-striped">
	  
	    <thead>	 	
	      <tr id='header_list' class="w3-blue">
	        <th class='no'>No</th>
	        <th class='mid1'>아이디</th>        
	        <th class='delegate'>대표자</th>
	        <th class='company_number'>사업자번호</th>
	        <th class='address1'>주소</th>
	        <th class='phone'>전화번호</th>
	        <th class='email'>E-mail</th>
	        <th class='area'>지역</th>
	        <th class='mileage'>Mileage</th>
	        <th class='confirmation'>내역</th>      
	      </tr>
	    </thead>
  
	    <c:set var = 'cnt' value = "${dao.startNo }"/>
			<c:forEach var='v' items="${list}">
	    <tbody>
	      <tr class ='items'>
	        <td class ='no' align = 'center'>${cnt}</td>
	        <td class ='mid'><a href="#" onclick="listModify('${v.mid}')">${v.mid }</a></td>	        
	        <td class ='delegate'>${v.delegate }</td>
	        <td class ='company_number'>${v.company_number }</td>
	        <td class ='address1'>${v.address1 }</td>
	        <td class ='phone'>${v.phone }</td>
	        <td class ='email'>${v.email }</td>	   
	        <td class ='area'>${v.area }</td>
	        <td class ='mileage'>${v.mileage }</td>
	        <td class ='confirmation'>1</td>
	        <c:set var = "cnt" value = "${cnt+1}"/>	
	      </tr>
	    </tbody>
	    
	    </c:forEach>
	
	  </table>
	  </div>
	  
	  	<input type="hidden" name="mid" value=""/>	
	    
	    <!---------------------------------------------------- 페이지분리 ------------------------------------------------------------->
	
		<div class="w3-center">
		<ul class="pagination">
		<ul class="pager">
			<c:if test ="${dao.nowBlock > 1 }">
				
				<li><a href="#" id='btnPrev' name='btnPrev' onclick='movePage2(${dao.startPage-1})'>Previous</a></li>
				
			</c:if>	
			
			<c:forEach var="i" begin="${dao.startPage}" end="${dao.endPage}">
				
				
				<li><a href="#" value='${i}' id='btn1' name='btn1' onclick='movePage2(${i})'>${i}</a></li>
				
			</c:forEach>
			
			<c:if test = "${dao.nowBlock < dao.totBlock }">
			
				<li><a href="#" id='btnNext' name='btnNext' onclick='movePage2(${dao.endPage+1})'>Next</a></li>
			</c:if>	
		</ul>	
		</ul>	
		</div>	
  </form>
</div>
</div>
<script>
var frm = document.frm_list;
$(document).ready(function() {
	$('input').attr('autocomplete','off');
    var navbar = document.getElementById("myNavbar");
    var holder = document.getElementById("holder");
    navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    holder.className = "nav-holder" + " w3-padding-large" + " nav_small";
    $(".default").css("display","none");
    $(".scrolled").css("display","block");
});
frm.btnRegisterOrder.onclick = function(){
	frm.action ="MemberC_rgisterOrderList.member";
	frm.submit();
}

frm.btnIrumOrder.onclick = function(){
	frm.action ="MemberC_IrumOrderList.member";
	frm.submit();
}

frm.btnHitOrder.onclick = function(){
	frm.action ="MemberC_HitOrderList.member";
	frm.submit();
}

function listModify(mid) { //anchor tag라 obj   
	if(frm != null) {
	      frm.action = 'MemberListModify.member';
	      frm.mid.value = mid; 
	      frm.submit();
	}
}

function movePage2(nowPage) {	  
	frm.nowPage.value = nowPage;
	frm.submit();
}
</script>
</body>
</html>