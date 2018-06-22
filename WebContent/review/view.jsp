<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>
#view {margin: 0 auto; width: 70%; padding: 5px;}
#view #subject{width: 100%; font-size: 18px; padding: 5px; color: #036; border-bottom: 3px solid #036;}
#view #view_table{width: 55%; display: inline-block;}
#view #picture{ float: right; display: inline-block; margin-top:40px;}
#view .td_1{background-color: #f2f4f7; width: 40%;}
#view  td{text-align: center;}
#view #btnView_div{margin: 0;width: 100%;padding: 5px;padding-left: 42%;}
#view #Repl_div{padding: 12px 12px; background: #e1e4ea;}
#view #btnRepl{float: right; height: 50px;}
#view #contentRelpl{width: 94%; height: 50px;}
#view #repl{background: #e1e4ea;}
#view .worker_mdate_repl{padding: 15px 15px; border-bottom: 1px dotted gray;}
#view .worker_repl{display: inline-block; font-weight: bold; font-size: 15px; color: #000000; }
#view .mdate_repl{display: inline-block; font-size: 8px;}
#view .content_repl{padding: 15px 15px;}
#view .delete_repl{float: right; }
#view thead th {padding: 10px;font-weight: bold; vertical-align: top; color: #369; border-bottom: 3px solid gray;}
#view .btnRD{background: #d4d9de; font-size: 12px;}
/* 별점 CSS */
#view #star {margin: auto; width: 29%;}
#view #star > input.star { display: none; }
#view #star > label.star {float:right; padding: 2px;font-size: 16px;color: #444;transition: all .2s; }
#view #star > input.star:checked ~ label.star:before {content: '\f005';color: #FD4;transition: all .25s;}
#view #star > input.star-5:checked ~ label.star:before {color: #FE7;text-shadow: 0 0 20px #952;}
#view #star > input.star-1:checked ~ label.star:before { color: #F62; }
#view #star > label.star:before {content: '\f006';font-family: FontAwesome;}
</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="view">
	
	<!-- 제목 -->
		<div id="subject">
			<h2>${vo.subject }</h2>
		</div>
		
		<div id="view_table_picture">
			<div id="view_table">
				<table class="w3-table w3-bordered">	
				<thead>
			    <tr>
			        <th scope="cols">매장정보</th>
			         <th scope="cols"></th>
			    </tr>
			    </thead>						
			    <tr>
			      <td class="td_1">작성자</td>
			      <td>${vo.worker }</td>    
			    </tr>
				  <tr>
			      <td class="td_1">Service</td>
			      <td>
			      <div id="star">
			      <input class="star star-5" id="star-5" type="radio" name="service" ${(vo.service == 5)?'checked': 'disabled'}/>
	   				<label class="star star-5" for="star-5"></label>  				  				
				    <input class="star star-4" id="star-4" type="radio" name="service" ${(vo.service <5 && vo.service >= 4 )?'checked': 'disabled'}/>
				    <label class="star star-4" for="star-4"></label>			    			    
				    <input class="star star-3" id="star-3" type="radio" name="service" ${(vo.service <4 && vo.service >= 3 )?'checked': 'disabled'}/>
				    <label class="star star-3" for="star-3"></label>		    		    
				    <input class="star star-2" id="star-2" type="radio" name="service" ${(vo.service <3 && vo.service >= 2 )?'checked': 'disabled'}/>
				    <label class="star star-2" for="star-2"></label>		    		    
				    <input class="star star-1" id="star-1" type="radio" name="service" ${(vo.service <2 && vo.service >= 1 )?'checked': 'disabled'}/>
				    <label class="star star-1" for="star-1"></label>	 
			      </div>
			      </td>  
			    </tr>
			    
			     <tr>
			      <td class="td_1">Quality</td>
			      <td>
			      <div id="star">
			      <input class="star star-5" id="star-5" type="radio" name="quality" ${(vo.quality == 5)?'checked': 'disabled'}/>
	   				<label class="star star-5" for="star-5"></label>  				  				
				    <input class="star star-4" id="star-4" type="radio" name="quality" ${(vo.quality <5 && vo.quality >= 4 )?'checked': 'disabled'}/>
				    <label class="star star-4" for="star-4"></label>			    			    
				    <input class="star star-3" id="star-3" type="radio" name="quality" ${(vo.quality <4 && vo.quality >= 3 )?'checked': 'disabled'}/>
				    <label class="star star-3" for="star-3"></label>		    		    
				    <input class="star star-2" id="star-2" type="radio" name="quality" ${(vo.quality <3 && vo.quality >= 2 )?'checked': 'disabled'}/>
				    <label class="star star-2" for="star-2"></label>		    		    
				    <input class="star star-1" id="star-1" type="radio" name="quality" ${(vo.quality <2 && vo.quality >= 1 )?'checked': 'disabled'}/>
				    <label class="star star-1" for="star-1"></label>	 
			      </div>
			      </td>  
			    </tr>
			     <tr>
			      <td class="td_1">Cleans</td>
			      <td>
			      <div id="star">
			      <input class="star star-5" id="star-5" type="radio" name="cleans" ${(vo.cleans == 5)?'checked': 'disabled'}/>
	   				<label class="star star-5" for="star-5"></label>  				  				
				    <input class="star star-4" id="star-4" type="radio" name="cleans" ${(vo.cleans <5 && vo.cleans >= 4 )?'checked': 'disabled'}/>
				    <label class="star star-4" for="star-4"></label>			    			    
				    <input class="star star-3" id="star-3" type="radio" name="cleans" ${(vo.cleans <4 && vo.cleans >= 3 )?'checked': 'disabled'}/>
				    <label class="star star-3" for="star-3"></label>		    		    
				    <input class="star star-2" id="star-2" type="radio" name="cleans" ${(vo.cleans <3 && vo.cleans >= 2 )?'checked': 'disabled'}/>
				    <label class="star star-2" for="star-2"></label>		    		    
				    <input class="star star-1" id="star-1" type="radio" name="cleans" ${(vo.cleans <2 && vo.cleans >= 1 )?'checked': 'disabled'}/>
				    <label class="star star-1" for="star-1"></label>	 
			      </div>
			      </td> 
			    </tr>  
			    <tr>
			      <td class="td_1">Rating AVG</td>
			      <td>${vo.avg}</td>    
			    </tr>
			     <tr>
			      <td class="td_1">Season</td>
			      <td>${vo.seasons }</td>  
			    </tr>
			    </table>
		    </div>
  
			<div id="picture">	
				<div class="w3-content w3-display-container">
		  			<c:forEach var="att" items="${vo.attFile}">
						<img src="./download/${att.key }" alt="${att.value }" class="mySlides" style="border-radius: 7px;"   width="490px" height="273px"/>
					</c:forEach>
					<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)" style="opacity: 0.7;">&#10094;</button>
					<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)" style="opacity: 0.7">&#10095;</button>
				</div>	
			</div>	
	</div><br><br>
	 
  <span>${vo.content }</span><br>
	<p/>
	
	<form name="frm_view" method="post">
	
	<div id="Repl_div">
	
		<c:forEach var="v" items="${list }">
			<div id="repl">
				<div class="worker_mdate_repl">
					<div class="worker_repl">
						${v.worker }   
					</div>
					
					<div class="mdate_repl">
						${v.mdate }
					</div>		
				
					<div class="content_repl">${v.content }
					
					<div class="delete_repl">
						<c:if test="${ v.worker eq sessionScope.sId || sessionScope.sId eq 'admin' }">
							<input type="button" name="btnRD" class="btnRD" value="삭제" onclick="rd(${v.serial})" >
						</c:if>
					</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<input type="hidden" name="rserial" value="1">
		<c:if test="${sessionScope.sId ne null }">
			<input type="text"   name="content" id="contentRelpl">
			<input type="hidden" name="worker" value="${sessionScope.sId }">
			<input type="button" value="등록" name="btnRepl" id="btnRepl" class="w3-button w3-blue" >		
		</c:if>
	</div><br/>
		
		<div id="btnView_div">
			<c:if test='${sessionScope.sId eq vo.worker || sessionScope.sId eq "admin"}'>
				<input type="button" value="수정" name="btnModify" class="w3-button w3-blue" >
				<input type="button" value="삭제" name="btnDelete" class="w3-button w3-blue" >
			</c:if>
			<input type="button" value="매장보기" onclick='funcGo("${vo.acc_se }","${vo.res_se }")'  class="w3-button w3-blue">
			<input type="button" value="목록으로" name="btnList" class="w3-button w3-blue" >
			<input type="hidden" name="serial" value="${vo.serial }"	>
			<input type="hidden" name="reviewPage" value="${vo.reviewPage }">
			<input type="hidden" name="findStr" value="${vo.findStr}">
		</div>			
	</form>
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
var frm=document.frm_view;
if(frm.btnModify!=null){
	frm.btnModify.onclick=function(){
		frm.action="modify.review";
		frm.submit();
	}
}
if(frm.btnDelete!=null){
	frm.btnDelete.onclick=function(){
		message = "정말 삭제하시겠습니까?";
		if(confirm(message) == true){
			frm.action="delete.review";
			frm.submit();
		}	
	}
}
frm.btnList.onclick=function(){
	frm.action="list.review";
	frm.submit();
}
if(frm.btnRepl!=null){
	frm.btnRepl.onclick=function(){
		frm.action="replI.review";
		frm.submit();
	}
}
function funcGo(acc_se,res_se){
	if(acc_se!=0){
		frm.serial.value=acc_se;
		frm.action="selectOne.ac";
		frm.submit();
	}else if(res_se!=0){
		frm.serial.value=res_se;
		frm.action="view.donghwan";
		frm.submit();
	}
}
function rd(serial){
	message = "정말 삭제하시겠습니까?";
	if(confirm(message) == true){
		frm.rserial.value=serial;
		frm.action="replD.review";
		frm.submit();
	}
}

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

</body>
</html>