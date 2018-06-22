<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<style>
img {
    width: 100%; /* Set a small width */
}

/* Add a hover effect (blue shadow) */
img:hover {
    box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}
</style>

<body>
<script>

/* json으로 시 목록 나타내기 */
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
			for(var i=0; i<data2[0].district.length; i++){
			str2 += "<option>" + data2[0].district[i] + "</option>";
			}
			str2 += "</select>";
			rs2.innerHTML = str2;
			
		}
	}
}

/* json으로 구 목록 나타내기 */
	function gu(){
		var add = document.getElementById("address1");
		var index= add.selectedIndex;

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
					str += "<select class= 'selectpicker form-control' name  = 'address2'>";
					
				for(i=0; i<data[index].district.length; i++){
					str += "<option >" +data[index].district[i]+ "</option>";
						}
					str += "</select>";
				rs.innerHTML = str;
			}
		}
	}
</script>

<div class= container>
<div class="jumbotron text-center">
  <p>To see the world, things dangerous to come to, to see behind walls, draw closer, to find each other, and to feel. That is the purpose of life.</p> 
  <form name = "frm_search" method = "post" action = "">
  <div class="input-group">
    <span id = "result1"></span>
    <span id = "result2"></span>
    <input type="text" class="form-control" name="findStr" placeholder="What are you looking for?">
    <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
  </div>
	<input type="hidden" name="serial" value = '${vo.serial}'>
  </form>
</div>


  <div class="row">
    <h3 class = "text-center">Resort</h3>
   	<c:forEach var = "vo" items = "${list}">
   		<c:if test = "${vo.part == '리조트'}">
   	    <div class="col-sm-3" onclick = "go('${vo.serial}')">
	    	<img src="./accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Forest">
        <p id = 'info'>${vo.aname}</p>
        <p id = 'info'>Rating(Views)</p>
        <p id = 'info'>${vo.address1}, ${vo.address2}</p>
        <br/>
        <input type = "hidden" name = "serial" value = "${vo.serial}">
    	</div>
    	</c:if>
	</c:forEach>
  </div>
  
  <br/>
  <div class="row">
  <h3 class = "text-center">Hotel</h3>
   	<c:forEach var = "vo" items = "${list}">
   		<c:if test = "${vo.part == '호텔'}">
   	    <div class="col-sm-3" onclick = "go('${vo.serial}')">
	    	<img src="./accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Forest">
        <p id = 'info'>${vo.aname}</p>
        <p id = 'info'>Rating(Views)</p>
        <p id = 'info'>${vo.address1}, ${vo.address2}</p>
        <br/>
        <input type = "hidden" name = "serial" value = "${vo.serial}">
    	</div>
    	</c:if>
	</c:forEach>
    <br/>
  </div>
  <br/>

  <div class="row">
  <h3 class = "text-center">Motel</h3>
   	<c:forEach var = "vo" items = "${list}">
   		<c:if test = "${vo.part == '모텔'}">
   	    <div class="col-sm-3" onclick = "go('${vo.serial}')">
	    	<img src="./accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Forest">
        <p id = 'info'>${vo.aname}</p>
        <p id = 'info'>Rating(Views)</p>
        <p id = 'info'>${vo.address1}, ${vo.address2}</p>
        <br/>
        <input type = "hidden" name = "serial" value = "${vo.serial}">
    	</div>
    	</c:if>
	</c:forEach>
    <br/>
  </div>
  <br/>
   
  <div class="row">
  <h3 class = "text-center">Guest House</h3>
   	<c:forEach var = "vo" items = "${list}">
   		<c:if test = "${vo.part == '게스트하우스'}">
   	    <div class="col-sm-3" onclick = "go('${vo.serial}')">
	    	<img src="./accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Forest">
        <p id = 'info'>${vo.aname}</p>
        <p id = 'info'>Rating(Views)</p>
        <p id = 'info'>${vo.address1}, ${vo.address2}</p>
        <br/>
        <input type = "hidden" name = "serial" value = "${vo.serial}">
    	</div>
    	</c:if>
	</c:forEach>
    <br/>
  </div>
  
</div>

<script>
si();
function go(serial){
	var frm = frm_search;
	frm.serial.value = serial;
	frm.action = "selectOne.ac";
	frm.submit();
}
</script>
</body>
</html>