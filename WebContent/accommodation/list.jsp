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

.hotel-pic{
	background-size: cover;
	width: 100%;
}

.floating {
	position: fixed;
	right: 54%;
	top: 50%;
	margin-right: -52%;
	text-align: center;
	border-radius: 8px;
	-webkit-border-radius: 8px;
}

.floating div:nth-child(1) {
	border-radius: 8px;
}

.floating div:nth-child(2) {
	border-radius: 8px;
}

/* 별점 CSS */
#star {margin: auto; float: left; margin-left: 80px;}
#star > input.star { display: none; }
#star > label.star {float:right; padding: 2px;font-size: 16px;color: #444;transition: all .2s; }
#star > input.star:checked ~ label.star:before {content: '\f005';color: #FD4;transition: all .25s;}
#star > input.star-5:checked ~ label.star:before {color: #FE7;text-shadow: 0 0 20px #952;}
#star > input.star-1:checked ~ label.star:before { color: #F62; }
#star > label.star:before {content: '\f006';font-family: FontAwesome;}


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
function si2(){
	var frm =document.frm_search;
	frm.address1.value=frm.hiddenAdd1.value;
	gu();      
}
function gu2(){
	var frm =document.frm_search;
	if(frm.hiddenAdd2.value!=""&& frm.address1.value==frm.hiddenAdd1.value){
		frm.address2.value=frm.hiddenAdd2.value;
	}
}
</script>
  <form name = "frm_search" method = "post">
	<div class="container hotel-pic" style = "background-image: url(./imgs/hotel_list.jpg)">
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
				<input type="text" placeholder="검색할 호텔명 입력.."
					name="findStr"
					style="border: 0px; border-radius: 3px; padding-left: 16px; z-index: 3;" value="${param.findStr}">
				<button type="button" class="w3-teal" onclick = 'search()'>
					<i class="fa fa-search"></i>
				</button>
			</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="serial" value='${vo.serial}'>
	<input type="hidden" name="hiddenAdd1" value="${vo.address1 }">
    <input type="hidden" name="hiddenAdd2" value="${vo.address2 }">
    <input type="hidden" name = "acco_nowPage1" value = '${vo.acco_nowPage1}'>
</form>



<div class="row">
	<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
		<h2 class="cursive-font primary-color">Resort</h2>
	</div>
</div>

<form name = 'frm_list_main' method ='post'>
<input type = "hidden" name = "acco_nowPage" value = '${vo.acco_nowPage}'>
<input type = 'hidden' name = 'findStr' value = '${vo.findStr}'>
<input type = 'hidden' name = 'address1' value = '${vo.address1}'>
<input type = 'hidden' name = 'address2' value = '${vo.address2}'>
<input type = 'hidden' name = 'part' value = '${vo.part}'>
</form>

<div class=container>
	<div class="row">
	<c:set var = 'cnt' value = "1"/>
	<c:forEach var="vo" items="${list.get(0)}">
	<c:if test="${vo.part == '리조트'}">
		<div class="col-lg-4 col-md-4 col-sm-6">
			<div class="fh5co-card-item" onclick="go('${vo.serial}', '${vo.address1}', '${vo.address2}')">
				<figure>
				<div class="overlay"></div>
				<img src="./accommodation/accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Image" class="img-responsive">
				</figure>
				<div class="fh5co-text">
					<h2>${vo.aname}</h2>
					<span id="star">
						<input class="star star-5" id="star-5" type="radio" name="service${cnt }"
							${(vo.avg == 5)?'checked': 'disabled'} />
							<span style = 'margin-left: 10px; float: right'><label>평점: ${vo.avg}</label></span>	
							<label class="star star-5"
							for="star-5"></label> <input class="star star-4" id="star-4"
							type="radio" name="service${cnt }"
							${(vo.avg <5 && vo.avg >= 4 )?'checked': 'disabled'} /> <label
							class="star star-4" for="star-4"></label> <input
							class="star star-3" id="star-3" type="radio" name="service${cnt }"
							${(vo.avg <4 && vo.avg >= 3 )?'checked': 'disabled'} /> <label
							class="star star-3" for="star-3"></label> <input
							class="star star-2" id="star-2" type="radio" name="service${cnt }"
							${(vo.avg <3 && vo.avg >= 2 )?'checked': 'disabled'} /> <label
							class="star star-2" for="star-2"></label> <input
							class="star star-1" id="star-1" type="radio" name="service${cnt }"
							${(vo.avg <2 && vo.avg >= 1 )?'checked': 'disabled'} /> <label
							class="star star-1" for="star-1"></label>
					</span>		
					<br><br>
					<p>${vo.address1}, ${vo.address2}</p>
				</div>
				<input type="hidden" name="serial" value="${vo.serial}">
			</div>
		</div>
		</c:if>
		<c:set var = "cnt" value = "${cnt+1}"/>	
		</c:forEach>
		<div class = 'w3-button w3-center w3-block' onclick = 'list_resort()'>더보기</div>
	</div>
</div>

<div class="row">
	<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
		<h2 class="cursive-font primary-color">Hotel</h2>
	</div>
</div>

<div class=container>
	<div class="row">	
	<c:forEach var="vo" items="${list.get(1)}">
	<c:if test="${vo.part == '호텔'}">
		<div class="col-lg-4 col-md-4 col-sm-6">
			<div class="fh5co-card-item" onclick="go('${vo.serial}', '${vo.address1}', '${vo.address2}')">
				<figure>
				<div class="overlay"></div>
				<img src="./accommodation/accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Image" class="img-responsive">
				</figure>
				<div class="fh5co-text">
					<h2>${vo.aname}</h2>
					<span id="star">
						<input class="star star-5" id="star-5" type="radio" name="service${cnt }"
							${(vo.avg == 5)?'checked': 'disabled'} />
							<span style = 'margin-left: 10px; float: right'><label>평점: ${vo.avg}</label></span>	
							<label class="star star-5"
							for="star-5"></label> <input class="star star-4" id="star-4"
							type="radio" name="service${cnt }"
							${(vo.avg <5 && vo.avg >= 4 )?'checked': 'disabled'} /> <label
							class="star star-4" for="star-4"></label> <input
							class="star star-3" id="star-3" type="radio" name="service${cnt }"
							${(vo.avg <4 && vo.avg >= 3 )?'checked': 'disabled'} /> <label
							class="star star-3" for="star-3"></label> <input
							class="star star-2" id="star-2" type="radio" name="service${cnt }"
							${(vo.avg <3 && vo.avg >= 2 )?'checked': 'disabled'} /> <label
							class="star star-2" for="star-2"></label> <input
							class="star star-1" id="star-1" type="radio" name="service${cnt }"
							${(vo.avg <2 && vo.avg >= 1 )?'checked': 'disabled'} /> <label
							class="star star-1" for="star-1"></label>
					</span>		
					<br><br>
					<p>${vo.address1}, ${vo.address2}</p>
				</div>
				<input type="hidden" name="serial" value="${vo.serial}">
			</div>
		</div>
		</c:if>
		<c:set var = "cnt" value = "${cnt+1}"/>	
		</c:forEach>
		<div class = 'w3-button w3-center w3-block' onclick = 'list_hotel()'>더보기</div>
	</div>
</div>

<div class="row">
	<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
		<h2 class="cursive-font primary-color">Motel</h2>
	</div>
</div>

<div class=container>
	<div class="row">	
	<c:forEach var="vo" items="${list.get(2)}">
	<c:if test="${vo.part == '모텔'}">
		<div class="col-lg-4 col-md-4 col-sm-6">
			<div class="fh5co-card-item" onclick="go('${vo.serial}', '${vo.address1}', '${vo.address2}')">
				<figure>
				<div class="overlay"></div>
				<img src="./accommodation/accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Image" class="img-responsive">
				</figure>
				<div class="fh5co-text">
					<h2>${vo.aname}</h2>
					<span id="star">
						<input class="star star-5" id="star-5" type="radio" name="service${cnt }"
							${(vo.avg == 5)?'checked': 'disabled'} />
							<span style = 'margin-left: 10px; float: right'><label>평점: ${vo.avg}</label></span>	
							<label class="star star-5"
							for="star-5"></label> <input class="star star-4" id="star-4"
							type="radio" name="service${cnt }"
							${(vo.avg <5 && vo.avg >= 4 )?'checked': 'disabled'} /> <label
							class="star star-4" for="star-4"></label> <input
							class="star star-3" id="star-3" type="radio" name="service${cnt }"
							${(vo.avg <4 && vo.avg >= 3 )?'checked': 'disabled'} /> <label
							class="star star-3" for="star-3"></label> <input
							class="star star-2" id="star-2" type="radio" name="service${cnt }"
							${(vo.avg <3 && vo.avg >= 2 )?'checked': 'disabled'} /> <label
							class="star star-2" for="star-2"></label> <input
							class="star star-1" id="star-1" type="radio" name="service${cnt }"
							${(vo.avg <2 && vo.avg >= 1 )?'checked': 'disabled'} /> <label
							class="star star-1" for="star-1"></label>
					</span>		
					<br><br>
					<p>${vo.address1}, ${vo.address2}</p>
				</div>
				<input type="hidden" name="serial" value="${vo.serial}">
			</div>
		</div>
		</c:if>
		<c:set var = "cnt" value = "${cnt+1}"/>	
		</c:forEach>
		<div class = 'w3-button w3-center w3-block' onclick = 'list_motel()'>더보기</div>
	</div>
</div>

<div class="row">
	<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
		<h2 class="cursive-font primary-color">Guest House</h2>
	</div>
</div>

<div class=container>
	<div class="row">	
	<c:forEach var="vo" items="${list.get(3)}" >
	<c:if test="${vo.part == '게스트하우스'}">
		<div class="col-lg-4 col-md-4 col-sm-6">
			<div class="fh5co-card-item" onclick="go('${vo.serial}', '${vo.address1}', '${vo.address2}')">
				<figure>
				<div class="overlay"></div>
				<img src="./accommodation/accommodation_album_thumbnail/thumb_${vo.attfileshow}" alt="Image" class="img-responsive">
				</figure>
				<div class="fh5co-text">
					<h2>${vo.aname}</h2>
					<span id="star">
						<input class="star star-5" id="star-5" type="radio" name="service${cnt }"
							${(vo.avg == 5)?'checked': 'disabled'} />
							<span style = 'margin-left: 10px; float: right'><label>평점: ${vo.avg}</label></span>	
							<label class="star star-5"
							for="star-5"></label> <input class="star star-4" id="star-4"
							type="radio" name="service${cnt }"
							${(vo.avg <5 && vo.avg >= 4 )?'checked': 'disabled'} /> <label
							class="star star-4" for="star-4"></label> <input
							class="star star-3" id="star-3" type="radio" name="service${cnt }"
							${(vo.avg <4 && vo.avg >= 3 )?'checked': 'disabled'} /> <label
							class="star star-3" for="star-3"></label> <input
							class="star star-2" id="star-2" type="radio" name="service${cnt }"
							${(vo.avg <3 && vo.avg >= 2 )?'checked': 'disabled'} /> <label
							class="star star-2" for="star-2"></label> <input
							class="star star-1" id="star-1" type="radio" name="service${cnt }"
							${(vo.avg <2 && vo.avg >= 1 )?'checked': 'disabled'} /> <label
							class="star star-1" for="star-1"></label>
					</span>		
					<br><br>
					<p>${vo.address1}, ${vo.address2}</p>
				</div>
				<input type="hidden" name="serial" value="${vo.serial}">
			</div>
		</div>
		</c:if>
		<c:set var = "cnt" value = "${cnt+1}"/>	
		</c:forEach>
		<div class = 'w3-button w3-center w3-block' onclick = 'list_guesthouse()'>더보기</div>
	</div>
</div>

<c:if test="${sessionScope.selection == 'c'}">
<div class='floating' style = 'z-index: 12;'>
<a href="index.jsp?inc=/accommodation/insert.jsp"><div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '업체 추가'><i class="fa fa-plus-square-o" style = 'padding: 6px;'></i></button></div></a><br>
</div>
</c:if>


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

function go(serial, address1, address2){
	var frm = frm_search;
	frm.serial.value = serial;
	frm.serial.address1 = address1;
	frm.serial.address2 = address2;
	frm.action = "selectOne.ac";
	frm.submit();
}

function search(){
	var frm = document.frm_search;
	frm.action = "list.ac";
	frm.submit();
}

function list_resort(){
	var frm = document.frm_list_main;
	frm.part.value = '리조트';
	frm.action = 'list_detail.ac';
	frm.submit();
}

function list_hotel(){
	var frm = document.frm_list_main;
	frm.part.value = '호텔';
	frm.action = 'list_detail.ac';
	frm.submit();
}

function list_motel(){
	var frm = document.frm_list_main;
	frm.part.value = '모텔';
	frm.action = 'list_detail.ac';
	frm.submit();
}

function list_guesthouse(){
	var frm = document.frm_list_main;
	frm.part.value = '게스트하우스';
	frm.action = 'list_detail.ac';
	frm.submit();
}
</script>
</body>
</html>