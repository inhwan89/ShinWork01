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
#MemberIndividualList h2{border-bottom: 3px solid #036; padding-bottom: 5px;margin-left:30px; margin-right:30px;}
#MemberIndividualList #header_list {padding:3px; font-weight: bolder; color:#ffffff; font-size:10px; padding: .5em; border-bottom: 3px double gray; }
#MemberIndividualList #title_items{margin-left:30px; margin-right:30px; }

#MemberIndividualList .no{width:40px; text-align:center; font-size:15px; }
#MemberIndividualList .mid{width:150px; text-align:center; font-size:15px; }
#MemberIndividualList .mid1{width:150px; text-align:center; font-size:15px; color: #1a4282;}
#MemberIndividualList .irum{width:150px; text-align:center; font-size:15px; }
#MemberIndividualList .address1{width:670px; text-align:center;font-size:15px; }
#MemberIndividualList .phone{width:180px; text-align:center; font-size:15px; }
#MemberIndividualList .email{width:200px; text-align:center; font-size:15px;}
#MemberIndividualList .gender{width:100px; text-align:center; font-size:15px;}
#MemberIndividualList .mdate{width:120px; text-align:center; font-size:15px;}
#MemberIndividualList .area{width:80px; text-align:center; font-size:15px; }
#MemberIndividualList .confirmation{width:60px; text-align:center; font-size:15px; }

#MemberIndividualList #MemberIndividualList_top{display: inline-block; float: right;}
#MemberIndividualList #button_div{float: right; margin-top: 5px; margin-right: 30px;}
#MemberIndividualList #findStr{text-align: center;height: 30px; opacity: 0.8;  border-radius: 25px; border: 1px solid #ea4f37;}
#MemberIndividualList #title_items .items:hover{background-color: #c4e6ff; }
/* #MemberIndividualList{border: 1px solid green;} */

/*버튼 CSS*/       
#btnMemberFind{font-size: 14px;
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
margin-right: 30px;
bottom: 2.5px;

}
#btnRegisterOrder, #btnIrumOrder {
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

#MemberIndividualList .container{width: 100%}

#btnPrev, #btnNext{
color: #153366;
}

/*페이지분리 CSS*/ 

</style>

</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="MemberIndividualList">
<div class="container">   
<h2 class="w3-text-blue">Individual</h2><br/>
	<form name='frm_list' method="POST">

	<div id="MemberIndividualList_top">
			<input type='text' id="findStr" name='findStr' class="w3-border-blue" value='${param.findStr }' placeholder="Search"/>		
			<button name='btnMemberFind' id='btnMemberFind' class="w3-button w3-blue">검색</button><br/>
			<div id="button_div">
				<input type="button" id="btnRegisterOrder" class="w3-button w3-blue" value="지역순"/>
				<input type="button" id="btnIrumOrder" class="w3-button w3-blue" value="이름순"/>				
			</div>
	</div><br/><br/><br/>
			<input type='hidden' name='nowPage' value='1'/> 
			<input type="hidden" name="selection" value="i"/>


	<div id='title_items'>       
	  <table class="table table-striped">
	    <thead>	 	
	      <tr id='header_list' class="w3-blue">
	        <th class='no'>No</th>
	        <th class='mid'>아이디</th>
	        <th class='irum'>이름</th>
	        <th class='address1'>주소</th>
	        <th class='phone'>전화번호</th>
	        <th class='email'>E-mail</th>
	        <th class='gender'>성별</th>
	        <th class='mdate'>생년월일</th>
	        <th class='area'>지역</th>
	        <th class='confirmation'>내역</th>      
	      </tr>
	    </thead>
	    	    
	    <c:set var = 'cnt' value = "${dao.startNo }"/>
			<c:forEach var='v' items="${list}">
	    <tbody>
	      <tr class ='items'>
	        <td class ='no' align = 'center'>${cnt}</td>
	        <td class ='mid1'><a href="#" onclick="listModify('${v.mid}')">${v.mid }</a></td>
	        <td class ='irum'>${v.irum }</td>
	        <td class ='address1'>${v.address1 }</td>
	        <td class ='phone'>${v.phone }</td>
	        <td class ='email'>${v.email }</td>
	        <td class ='gender'>${v.gender }</td>
	        <td class ='mdate'>${v.mdate }</td>
	        <td class ='area'>${v.area }</td>
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
$(document).ready(function() {
	$('input').attr('autocomplete','off');
    var navbar = document.getElementById("myNavbar");
    var holder = document.getElementById("holder");
    navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    holder.className = "nav-holder" + " w3-padding-large" + " nav_small";
    $(".default").css("display","none");
    $(".scrolled").css("display","block");
});
var frm = document.frm_list;

frm.btnRegisterOrder.onclick = function(){
	frm.action ="MemberI_rgisterOrderList.member";
	frm.submit();
}

frm.btnIrumOrder.onclick = function(){
	frm.action ="MemberI_IrumOrderList.member";
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