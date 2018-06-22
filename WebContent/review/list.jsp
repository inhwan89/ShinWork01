<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<script>
function si(){
	   var xhr1 = new XMLHttpRequest();
	   var xhr2 = new XMLHttpRequest();
	   var url1 = './location/location1.txt';
	   var url2 = './location/location2.txt';
	   xhr1.open('get', url1);
	   xhr1.send();
	   xhr2.open('get', url2);
	   xhr2.send();
	   
	   xhr1.onreadystatechange = function(){
	      if(xhr1.status == 200 && xhr1.readyState==4){
	         var rs1 = document.getElementById("result1");
	         var temp1 = xhr1.responseText;
	         var data1 = JSON.parse(temp1);
	         var str1 = "";
	            str1 += "<select class= 'selectpicker form-control' name  = 'address1' id = 'address1' onchange = 'gu()'>";
	            str1 += "<option value = ''>전체</option>"
	            
	         for(var i=0; i<data1[0].location1.length; i++){
	            str1 += "<option >" +data1[0].location1[i]+ "</option>";
	         }
	            str1 += "</select>";
	            rs1.innerHTML = str1;
	      }
	   }
	   
	   xhr2.onreadystatechange = function(){
	      if(xhr2.status == 200 && xhr2.readyState==4){
	         var rs2 = document.getElementById("result2");
	         var temp2 = xhr2.responseText;
	         var data2 = JSON.parse(temp2);
	         
	         var str2 = "<select class= 'selectpicker form-control' name  = 'address2' id = 'address2'>";
	         	 str2 += "<option value = ''>전체</option>";
	         	 str2 += "</select>";
	         rs2.innerHTML = str2;      
		}
	si2();
	}
}
/* json으로 구 목록 나타내기 */
function gu(){
	var add = document.getElementById("address1");
	var index= add.selectedIndex-1;

	var xhr = new XMLHttpRequest();
	var url = './location/location2.txt';
	xhr.open('get', url);
	xhr.send();

	xhr.onreadystatechange = function(){
		if(xhr.status == 200 && xhr.readyState==4){
			var rs = document.getElementById("result2");
			var temp = xhr.responseText;
			var data = JSON.parse(temp);
	            
			var str = "";
			str += "<select class= 'selectpicker form-control' name  = 'address2' id ='address2'>";
	               
			if(index==-1){
				str += "<option value = ''>전체</option>";
			}else{
				str += "<option value = ''>전체</option>";
				for(i=0; i<data[index].district.length; i++){
					str += "<option >" +data[index].district[i]+ "</option>";
				}
			}
			str += "</select>";
			rs.innerHTML = str;
		}
		gu2();
	}
}
	
</script>
<style>

#list{
margin: 0 auto;
width: 70%;
padding: 5px;}
#list h2{border-bottom: 3px solid #036; padding-bottom: 5px;}
#list #frm_list{float: right; }
#list .items{margin-bottom: 5px; }

#result1{display:inline-block; width: 49%;}
#result2{display:inline-block; width: 49%; float: right;}
#findStr{margin-top: 5px; margin-bottom:10px; text-align: center; height: 30px; opacity: 0.8;  border-radius: 25px;}

#later_board #header_list{border-bottom: 3px double gray;}
#later_board .no{width: 3%;text-align: center; }
#later_board .img{width: 110px;height: 105px; display: inline-block;}
#later_board .title{text-align: center; width: 65%;}
#later_board .P_information{width: 100px; text-align: center; }
#later_board .store_name{text-align: center;}
#later_board .star_rating{text-align: center;}
#later_board .title1{line-height: 75px; cursor: pointer; color: #1a4282;}
#later_board .no1{line-height: 75px; }
#later_board .store_name1{line-height: 75px; text-align: center;}
#later_board .star_rating1{line-height: 75px; text-align: center;}
#list #pageZone{margin: auto;width: 17%;}
/* 별점 CSS */
#list #star > input.star { display: none; }
#list #star > label.star { float: right;padding: 2px;font-size: 16px;color: #444;transition: all .2s;}
#list #star > input.star:checked ~ label.star:before {content: '\f005';color: #FD4;transition: all .25s;}
#list #star > input.star-5:checked ~ label.star:before {color: #FE7;text-shadow: 0 0 20px #952;}
#list #star > input.star-1:checked ~ label.star:before { color: #F62; }
#list #star > label.star:before {content: '\f006';font-family: FontAwesome;}

</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="list">

	<h2 class="w3-text-blue">후기 게시판</h2><br/>
	<form name="frm_list" id="frm_list" method="post">
		<input type="hidden" name="hiddenAdd1" value="${vo.address1 }">
		<input type="hidden" name="hiddenAdd2" value="${vo.address2 }">
		<div id = "result1" ></div>
 		<div id = "result2" ></div><br/>
		<input type="text" placeholder="Search" class="w3-border-blue" name="findStr" id="findStr" value="${vo.findStr }">
		<input type="button" value="검색" id="btnFind" name="btnFind" class="w3-button w3-blue">
		<input type="hidden" name="reviewPage" value="${vo.reviewPage}">
		<input type="hidden" name="serial" value="1">
	</form><br/><br/><br/>
	
	<div id='later_board'>       
	  <table class="table table-striped">  
	    <thead>	 	
	      <tr id='header_list' class="w3-blue">
	        <th class='no'>No</th>
	        <th class='P_information'>상품정보</th>
	        <th class='title'>제목</th>
	        <th class='store_name'>매장명</th>
	        <th class='star_rating'>평점</th>
	      </tr>
	    </thead>
   
	    <c:set var = 'cnt' value = "${dao.startNo }"/>
			<c:forEach var='vo' items="${list}">
	    <tbody>
	      <tr class ='items' >
	        <td class ='no1' align = 'center' >${cnt}</td>	 
	        <c:if test='${vo.attlist[0] ne null}'>
	        	<td class ='img'><img src="./download/${vo.attlist[0] }"  style="width:100%; height:100%"/></td>
	        </c:if>
	        <c:if test='${vo.attlist[0] eq null}'>
	         	<td class ='img'><img src="./imgs/no_img.png"  style="width:100%; height:100%"/></td>
	        </c:if>	        
	        <td class ='title1' onclick="view(${vo.serial})">${vo.subject }</td>
	        <td class ='store_name1'>${vo.store }</td>
	       
	        <td class ='star_rating1'>
	         
	        <div id="star">	        			
				<input class="star star-5" id="star-5" type="radio" name="service${cnt }" ${(vo.avg == 5)?'checked': 'disabled'}/>
   				<label class="star star-5" for="star-5"></label>  				  				
			    <input class="star star-4" id="star-4" type="radio" name="service${cnt }" ${(vo.avg <5 && vo.avg >= 4 )?'checked': 'disabled'}/>
			    <label class="star star-4" for="star-4"></label>			    			    
			    <input class="star star-3" id="star-3" type="radio" name="service${cnt }" ${(vo.avg <4 && vo.avg >= 3 )?'checked': 'disabled'}/>
			    <label class="star star-3" for="star-3"></label>		    		    
			    <input class="star star-2" id="star-2" type="radio" name="service${cnt }" ${(vo.avg <3 && vo.avg >= 2 )?'checked': 'disabled'}/>
			    <label class="star star-2" for="star-2"></label>		    		    
			    <input class="star star-1" id="star-1" type="radio" name="service${cnt }" ${(vo.avg <2 && vo.avg >= 1 )?'checked': 'disabled'}/>
			    <label class="star star-1" for="star-1"></label>	        	 
			</div>
			
			<div id="grade">
				(${vo.avg }) 
			</div>
	        </td>      
	        <c:set var = "cnt" value = "${cnt+1}"/>	
	      </tr>
	    </tbody>	    
	    </c:forEach>
	  </table>
	  </div>	

	
	<!-- 페이지 분리 -->
	<div id="pageZone">
		<ul class="pagination">
		<ul class="pager">
			<c:if test ="${dao.startPage>1 }">
				<li><a href="#" id='btnPrev' name='btnPrev' onclick='goPage(${dao.startPage-1})'>Previous</a></li>	
			</c:if>			
			<c:forEach var="p" begin="${dao.startPage}" end="${dao.endPage}">						
				<li><a href="#" value="${p}" ${(dao.nowPage==p)? 'disabled':'' } id='btn1' name='btn1' onclick='goPage(${p})'>${p}</a></li>			
			</c:forEach>		
			<c:if test = "${dao.nowBlock < dao.totBlock }">
				<li><a href="#" id='btnNext' name='btnNext' onclick='goPage(${dao.endPage+1})'>Next</a></li>		
			</c:if>		
		</ul>
		</ul>	
	</div>
	

</div>
<script>
si();
$(document).ready(function(){
	$('input').attr('autocomplete','off');
    var navbar = document.getElementById("myNavbar");
    var holder = document.getElementById("holder");
    navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    holder.className = "nav-holder" + " w3-padding-large" + " nav_small";
    $(".default").css("display","none");
    $(".scrolled").css("display","block");
});
var frm= document.frm_list;
frm.btnFind.onclick=function(){
	frm.reviewPage.value=1;
	frm.action="list.review";
	frm.submit();
}
function view(serial){
	frm.serial.value=serial;
	frm.action="view.review";
	frm.submit();
}
function goPage(reviewPage){
	frm.reviewPage.value=reviewPage;
	frm.action="list.review";
	frm.submit();
}
function si2(){
	frm.address1.value=frm.hiddenAdd1.value;
	gu();		
}
function gu2(){
	if(frm.hiddenAdd2.value!=""&& frm.address1.value==frm.hiddenAdd1.value){
		frm.address2.value=frm.hiddenAdd2.value;
	}
}
</script>
</body>
</html>