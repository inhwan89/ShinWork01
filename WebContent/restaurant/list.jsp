<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.restaurant-pic{
   background-size: cover;
   width: 100%;
}
</style>

<body>





<form name='rest_list' method='post'>
   <input type="hidden" name="hiddenAdd1" value="${param.raddress1 }">
   <input type="hidden" name="hiddenAdd2" value="${param.raddress2 }">
   <div class="container restaurant-pic" style = "background-image: url(./imgs/restaurant.jpg)">
      <div class="visual-text w3-center" style = 'z-index: 4; height: 30%'>
         <h1
            style="background-image: url('./imgs/full_course.svg'); margin-top: -5%;">Full
            Course Trip</h1>
         <div style = "margin-top: -3%">
         <div class="w3-row"
            style='width: 40%; margin-right: 30%; margin-left: 30%;'>
            <div class="w3-half" id="result1"></div>
            <div class="w3-half" id="result2"></div>
         </div>
         <div class="w3-row search"
            style='width: 40%; margin-right: 30%; margin-left: 30%;'>
            <input type="text" placeholder="검색할 레스토랑명 입력.."
               name="findStr" 
               style="border: 0px; border-radius: 3px; padding-left: 16px; z-index: 3;" value="${param.findStr}">
            <button type="button" class="w3-teal" name='btnFind'>
               <i class="fa fa-search"></i>
            </button>
         </div>
         </div>
      </div>
   </div>

   <div class = 'w3-right'id='list_range'>
      <select name='orderBy' size='1' onchange="submit()" class="w3-select w3-border" style="width:150px;">
         <option value="등록순" ${param.orderBy eq "등록순" ? "selected" :""}>등록순</option>
         <option value='조회순' ${param.orderBy eq "조회순" ? "selected" :""}>조회순</option>
      </select>
   </div>


   <div class="row">
   <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
      <h2 class="cursive-font primary-color">Restaurant</h2>
   </div>
   </div>



   <div class=container>
      <div class="row">
      <c:forEach var="rvo" items="${list}">
         <div class="col-lg-4 col-md-4 col-sm-6">
            <div class="fh5co-card-item image-popup" onclick="serialFunc(this)" id='${rvo.pserial}'>
               <figure>
               <div class="overlay"></div>
               <img src="./restaurant/thumbnail/thumb_${rvo.rmAttFile}" alt="Image" class="img-responsive">
               </figure>
               <div class="fh5co-text">
                  <h2>${rvo.rname}</h2>
                  <p>${rvo.rmenus }</p>
                  <p>${rvo.rinfo }</p>
               </div>
            </div>
         </div>
         </c:forEach>
      </div>
   </div>
   
      <% 
      if(session.getAttribute("sId") != null){
         String sId = (String)session.getAttribute("sId");         
      }
      if(session.getAttribute("selection") != null){
			String selection = (String)session.getAttribute("selection");
	  }
   %>
      
   <input type='hidden' name='serial' value='1'>
   <input type='hidden' name='nowPage' value='1'>
         
   <br><br>
   <div class='w3-center'>
      <ul class="pagination pagination-sm">
         <c:if test="${dao.nowBlock>1 }">
            <li class="page-item"><a class="page-link"
               onclick='movePage(1);return false;'>First</a></li>
            <li class="page-item"><a class="page-link"
               onclick='movePage(${dao.startPage-1});return false;'>Previous</a></li>
         </c:if>
         <c:forEach var='i' begin="${dao.startPage}" end="${dao.endPage}">
            <c:if test="${dao.nowPage == i}">
               <li class="page-item active"><a class="page-link"
                  onclick='movePage(${i});return false;'>${i}</a></li>
            </c:if>
            <c:if test="${dao.nowPage != i}">
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
   <c:if test="${sId != null and selection == 'c'}">
      <div id='insert'>
         <input type='button' value='맛집 등록하기' name='btnInsert' class="btn btn-primary" onclick = 'insert()'>
      </div>
   </c:if>
</form>   
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
   
   si();
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
	            str1 += "<select class= 'selectpicker form-control' name  = 'raddress1' id = 'raddress1' onchange = 'gu()'>";
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
	         
	         var str2 = "<select class= 'selectpicker form-control' name  = 'raddress2' id = 'raddress2' >";
	         	 str2 += "<option value = ''>전체</option>";
	         	 str2 += "</select>";
	         rs2.innerHTML = str2;
	         
	   }
	si2();
	}
}

	/* json으로 구 목록 나타내기 */
	   function gu(){
	      var add = document.getElementById("raddress1");
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
	            str += "<select class= 'selectpicker form-control' name  = 'raddress2' >";
	               
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
	
   
   
   var frm = document.rest_list;
   frm.btnFind.onclick = function() {      // 상단 검색 버튼 클릭시
      frm.action = "list.donghwan";
      frm.submit();
   }

   
   function insert(){      // 맛집 등록하기 버튼 클릭시
      frm.action = "insert.donghwan";
      frm.submit();
   }
   
   function serialFunc(obj){
      frm.serial.value = obj.id;  
      frm.action = "view.donghwan";
      frm.submit();
   }
   
   function submit(){
      frm.action = "list.donghwan";
      frm.submit();
   }
   
   function movePage(nowPage){
      frm.nowPage.value = nowPage;
      frm.submit();
   }
   
   function si2(){
      frm.raddress1.value=frm.hiddenAdd1.value;
      gu();      
   }
   function gu2(){
      if(frm.hiddenAdd2.value!=""&& frm.raddress1.value==frm.hiddenAdd1.value){
         frm.raddress2.value=frm.hiddenAdd2.value;
      }
   }
   </script>
</body>
</html>