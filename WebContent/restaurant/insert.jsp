<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<title>맛집 등록 하기</title>


<style>

#input-group_address{
/* border: 1px solid red; */
width: 100%;


}

.text_div{
/* border: 1px solid green; */
display: inline-block;
width: 90.59%;
}

.button_div{
/* border: 1px solid blue; */
display: inline-block;
float: right;
}

.file_input {
	min-height: 300px;
	max-height: 580px;
}

.rimage {
	width: 100%;
	min-height: 300px;
	max-height: 580px;
}


.file_input2 label, .file_input_m label {
    cursor:pointer;
}
.file_input2 label input, .file_input_m label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.file_input2 input[type=text], .file_input_m input[type=text] {
 	width:0;
    height:0;
}


.bgimg-1{
	background-attachment: scroll;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.bgimg-1 {
	background-image: url(./imgs/img_restaurant.jpg);
	min-height: 450px;
}

</style>
</head>
<body>

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
	         
	         var str2 = "<select class= 'selectpicker form-control' name  = 'raddress2' id = 'raddress2'>";
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
	               str += "<select class= 'selectpicker form-control' name  = 'raddress2' id ='raddress2'>";
	               
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

<%
	if(session.getAttribute("sId") != null){
		String sId = (String)session.getAttribute("sId");
	}
%>
<div class = 'w3-container'>
<div class="bgimg-1 w3-display-container w3-opacity">
  <div class="w3-display-middle" style = "margin-top: 50px">
    <span class="w3-xxlarge w3-wide w3-text-white">업체 등록하기</span>
  </div>
</div>
</div>


<div class='container'>



<div id="insert_rest">
	<form name='rest_insert' id='rest_insert' method='post' 
			enctype="multipart/form-data" >
<div id='center'>

 <!-- 사진 첨부 부분 -->
<div id="rphoto" >
<div class="container-fluid">
  <div class="row content">
    <div class="col-lg-12">

	   	<hr>
		<h3 class="text-center">음식점 사진</h3>
		<p class="text-center"><em>첫 번째 사진은 메인 사진입니다.</em></p>
		<hr>
	 	<p/>

   <div id="myCarousel" class="carousel slide" data-interval="0">
       <!-- Indicators -->
       <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
         <li data-target="#myCarousel" data-slide-to="3"></li>
         <li data-target="#myCarousel" data-slide-to="4"></li>
         <li data-target="#myCarousel" data-slide-to="5"></li>
       </ol>
 
       <!-- Wrapper for slides -->
       <div class="carousel-inner" role="listbox">
         <div class="item active">
         <div class = "file_input">
           <label style = "width:100%;"> 
              <img class="w3-image rimage" src="./restaurant/main_upload.png" alt="메인사진" style="width:100%; height:100%; overflow:hidden">
              <input type="file" name = "rphoto_main" onchange="readURLM(this)" class = 'file_check'>
           </label>
         </div>
         </div>
   
         <div class="item">
           <div class = "file_input">
           <label style = "width:100%"> 
              <img class="w3-image rimage" src="./restaurant/main_upload.png" alt="서브사진1" style="width:100%; height:100%; overflow:hidden">
              <input type="file" name = "rphoto_sub1" onchange="readURLM(this)">
           </label>
          </div>
         </div>
       
         <div class="item">
          <div class = "file_input">
           <label style = "width:100%"> 
              <img class="w3-image rimage" src="./restaurant/main_upload.png" alt="서브사진2" style="width:100%; height:100%; overflow:hidden">
              <input type="file" name = "rphoto_sub2" onchange="readURLM(this)">
           </label>
          </div>
         </div>
         
         <div class="item">
          <div class = "file_input">
           <label style = "width:100%"> 
              <img class="w3-image rimage" src="./restaurant/main_upload.png" alt="서브사진3" style="width:100%; height:100%; overflow:hidden">
              <input type="file" name = "rphoto_sub3" onchange="readURLM(this)">
           </label>
         </div>  
         </div>
         
         <div class="item">
          <div class = "file_input">
           <label class = "accommodation_img" style = "width:100%"> 
              <img class="w3-image" src="./restaurant/main_upload.png" alt="서브사진4" style="width:100%; height:100%; overflow:hidden">
              <input type="file" name = "rphoto_sub4" onchange="readURLM(this)">
           </label>
         </div>     
         </div>
         
         <div class="item">
          <div class = "file_input">
           <label class = "accommodation_img" style = "width:100%"> 
              <img class="w3-image" src="./restaurant/main_upload.png" alt="서브사진5" style="width:100%; height:100%; overflow:hidden">
              <input type="file" name = "rphoto_sub5" onchange="readURLM(this)">
           </label>
         </div>     
         </div>
         
       </div>
   
       <!-- Left and right controls -->
       <a class="left carousel-control" href="#myCarousel" data-slide="prev">
         <span class="glyphicon glyphicon-chevron-left" ></span>
         <span class="sr-only">Previous</span>
       </a>
       <a class="right carousel-control" href="#myCarousel" data-slide="next">
         <span class="glyphicon glyphicon-chevron-right"></span>
         <span class="sr-only">Next</span>
       </a>
   </div>

   </div>
   
   </div>
 </div>
 <br>
 <div class = 'jumbotron'>
  <div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'' > 
		<span class='input-group-addon' style="width:150px; text-align:center;">작성자</span>	
		<input type='text' name='mid' class='form-control' value='${sId }' readonly>
  </div>
   <div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'> 
		<span class='input-group-addon' style="width:150px; text-align:center;">음식점 이름</span>	
		<input type='text' name='rname' class='form-control' placeholder="가게이름을 적어주세요">
  </div>
 </div> 
</div>



 <!-- 메뉴, 가격 등 설정 부분 -->
 <div id='option'>
 	 
 	
 	 <hr/>
 	<div style='text-align: center; width:100%;'>
		 <h3 class="text-center">메뉴 등록</h3>
		 <input type='button' value='메뉴추가' name='addmenu' 
		 	style="float:right;" class="btn btn-primary"/>
	</div>
	 <hr/>
	 <br/>
	 
	 
 	 
	 
<div id='menu'>
	<div class = 'jumbotron'>
		 <div style="float:left;">
		 <div class = 'file_input2' style = 'height: 150px'>
			  <label style="width:100%;">
		 <img src="./restaurant/menu_upload.jpg" width='150px' height='150px' 
				 		class="rmAttFile0">
		 <input type='file' name='rmAttFile0'
		 	id="rmAttFile0"  onchange="menuLoadImg(this)">
			  </label>
		</div>
		 </div>
		 <div class='input-group' > 
			 <span class='input-group-addon'>메뉴 이름</span>	
			 <input type='text' name='rmName' class='form-control' required >
		 </div>
		 	 		
		 <div class='input-group'> 
		 <span class='input-group-addon'>메뉴 설명</span>
		 <input type='text' name='rmExplain' class='form-control' required>
		 </div>
		
		 <div class='input-group'> 
			 <span class='input-group-addon'>메뉴 가격</span>
			 <input type='number' name='rmPrice' min='0' class='form-control'  required>
		 </div>
		 <br/>
			 <input type='button' name='btnDelete' value='삭제' 
			 	onclick='delFunc(this)' style="float:right;" class="btn btn-primary"/>
		 <br/>
	 	 <br/>
	 	 <br/>
	</div>
</div>
	 
	 <br/> 
 </div>
</div>


 
<div id='detail' class = 'jumbotron'>
	
		<hr>
		<h3 class="text-center">상세 설명</h3>
		<p class="text-center"><em>자세히</em></p>
		<hr>
	 	<p/>
	 
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'>
		<span class='input-group-addon'  style="width:150px; text-align:center;">대표 메뉴들</span>
		<input class='form-control' type='text' name='rmenus'  required>
	</div>
 
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'>
	 <span class='input-group-addon' style="width:150px; text-align:center;">음식점 간략 설명</span>
	 <input class='form-control' type='text' name='rinfo'  required>
	</div>
	
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'>
	 <span class='input-group-addon' style="width:150px; text-align:center;">오픈시간</span>
	 <input class='form-control' type='number' min="1" name='rtimeOpen' 
	 		 placeholder="예)09 또는 9" required/>
	
	 <span class='form-group input-group-addon' style="width:150px; text-align:center;">마감시간</span>
	 <input class='form-control' type='number' min="1" name='rtimeClose'
	 		 placeholder="예)24"  required/>
	</div> 
	 
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'>
	 <span class='input-group-addon' style="width:150px; text-align:center;">전체 테이블 수</span>
	 <input class='form-control' type='number' min="1" name='rtable' style="width:100%;  placeholder="테이블 1개 당 최대 인원 4명 기준" required/>
	</div>
	 
	
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'>
	 <span class='input-group-addon' style="width:150px; text-align:center;">휴일</span>
	 <select name='rholiday' class="form-control" size='1' style="width:100%;" >
	  <option>월</option>
	  <option>화</option>
	  <option>수</option>
	  <option>목</option>
	  <option>금</option>
	  <option>토</option>
	  <option>일</option>
	  <option>없음</option>
	 </select>
	</div>
	
	
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'> 
	 <span class='input-group-addon' style="width:150px; text-align:center;">화장실</span>
	 <input class='form-control' type='text' name='rbathroom' required/><br/>
	</div>
	
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'> 
	 <span class='input-group-addon' style="width:150px; text-align:center;">주류판매</span>
	 <input class='form-control' type='text' name='rdrink'  required/><br/>
	</div> 
		 
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'> 
	 <span class='input-group-addon' style="width:150px; text-align:center;">기타시설</span>
	 <input class='form-control' type='text' name='rfacilities' required/><br/>
	</div> 
	
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'> 
	 <span class='input-group-addon' style="width:150px; text-align:center;">대표전화</span>
	 <input class='form-control' type='text' name='rphone' required/><br/>
	</div> 
	 <p/>

</div>


	<hr>
		<h3 class="text-center">주소 입력</h3>
		<p class="text-center"><em>지도</em></p>
	<hr>

 <div id='insert_map'>
 	 <div id='find'>
		 <div id = "result1"></div>
		 <div id = "result2"></div>
 	 </div>
 	 
 	
	
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12' id="input-group_address" >
	
		
		<span class='input-group-addon' style="width:150px; text-align:center;">나머지 주소</span>
		
		
		<div class="text_div">
	 	<input type='text' class='form-control' name='rjuso' id='rjuso' 
	 			 placeholder="(시/군/구를 제외한)전체 주소를 입력해주세요"  required/>
	 	</div>
	 	
	 	<div class="button_div">	 
	 	<input type='button' name='btnFindAd' value='주소 찾기' class="btn btn-primary" id="btnFindAd" />
 		</div>	
 		
 	</div>
 	<br/>
 	
 		<div id='map' style="width:100%;height:400px;">
 		</div>
 	
 </div>

	<div id="show_msg" class="w3-modal w3-center w3-opacity" style = 'z-index: 100'>
  	 <div class="w3-modal-content w3-animate-top w3-card-4 w3-round-large w3-padding">
      	<span
         onclick="document.getElementById('show_msg').style.display='none'"
         class="w3-button w3-hover-white w3-xxlarge w3-display-topright w3-round-large">×</span>
     	 <h4 class="w3-wide w3-padding" id='msg'>
         <i class="fa fa-exclamation-circle w3-margin-right"></i>
      	</h4>
        <button type="button" onclick="okFunc()" name="ok" class="btn btn-default" data-dismiss="modal" style="text-align: center;">확인</button>
  	 </div>
	</div>


 
 <div style="height:100px">
	<p/>
	 
	<p/>
 </div>

 <div id='tail' style="text-align: center;">
	<p/>
	 <input type='hidden' name='nowPage' value='${param.nowPage }'>
	 <input type="hidden" name="hiddenAdd1" value="${param.raddress1 }">
	 <input type="hidden" name="hiddenAdd2" value="${param.raddress2 }">
	<p/>
	<input type='button' name='btnInsert' value='등록' class="btn btn-primary"/>
	<input type='button' name='btnList' value='취소' class="btn btn-primary"/>
	 
 </div>
	</form>	
  
</div>
</div>
<!-- 주소 지도 api -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=uJlO5e3KXL6BKDiiZFmv&submodules=geocoder"></script>
<script> 
var frm = document.rest_insert;
frm.btnFindAd.onclick = function(){			// 주소 찾기 버튼 클릭시
	 var raddress1 = document.getElementById("raddress1").value;
	var raddress2 = document.getElementById("raddress2").value; 
	var rjuso = document.getElementById("rjuso").value;
	
	var juso = raddress1 + " " + raddress2 + " " + rjuso; 

	var map = new naver.maps.Map("map", {
	    center: new naver.maps.LatLng(37.3595316, 127.1052133),
	    zoom: 10,
	    mapTypeControl: true
	});
	
	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});
	
	map.setCursor('pointer');
	
	// search by tm128 coordinate
	function searchCoordinateToAddress(latlng) {
	    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);
	
	    infoWindow.close();
	
	    naver.maps.Service.reverseGeocode({
	        location: tm128,
	        coordType: naver.maps.Service.CoordType.TM128
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	
	        var items = response.result.items,htmlAddresses = [];
	
	        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
	            item = items[i];
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';
	
	            htmlAddresses.push((i+1) +'. '+ addrType +' '+ item.address);
	          /*   htmlAddresses.push('&nbsp&nbsp&nbsp -> '+ item.point.x +','+ item.point.y); */
				
	        }
	            var idx = items[0].address.indexOf(" ");
				var a = items[0].address.substring(0, idx);
				var b = items[0].address.substring(idx+1);
				var idx2 = b.indexOf(" ");	
				var c=b.substring(idx2+1);
	            document.getElementById("rjuso").value = c;
	          
	
	        infoWindow.setContent([
	                '<div style="padding:10px;min-width:200px;line-height:150%;">',
	                /* '<h4 style="margin-top:5px;">검색 좌표 : '+ response.result.userquery +'</h4><br />', */
	                htmlAddresses.join('<br />'),
	                '</div>'
	            ].join('\n'));
	
	        infoWindow.open(map, latlng);
	    });
	}
	
	// result by latlng coordinate
	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        address: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	
	        var item = response.result.items[0],
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
	            point = new naver.maps.Point(item.point.x, item.point.y);
	
	        infoWindow.setContent([
	                '<div style="padding:10px;min-width:200px;line-height:150%;">',
	                '<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery +'</h4><br />',
	                addrType +' '+ item.address +'<br />',
	                /* '&nbsp&nbsp&nbsp -> '+ point.x +','+ point.y, */
	                '</div>'
	            ].join('\n'));
	
	
	        map.setCenter(point);
	        infoWindow.open(map, point);
	    });
	}
	
	function initGeocoder() {
	    map.addListener('click', function(e) {
	        searchCoordinateToAddress(e.coord);
	    });
	
	    $('#address').on('keydown', function(e) {
	        var keyCode = e.which;
	
	        if (keyCode === 13) { // Enter Key
	            searchAddressToCoordinate($('#address').val());
	        }
	    });
	
	    $('#submit').on('click', function(e) {
	        e.preventDefault();
	
	        searchAddressToCoordinate($('#address').val());
	    });
	
	    searchAddressToCoordinate(juso);
	}
	
	naver.maps.onJSContentLoaded = initGeocoder();

}
</script>



<script>
$(document).ready(function(){
	   $('input').attr('autocomplete','off');
	    var navbar = document.getElementById("myNavbar");
	    var holder = document.getElementById("holder");
	    navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
	    holder.className = "nav-holder" + " w3-padding-large" + " nav_small";
	    $(".default").css("display","none");
	    $(".scrolled").css("display","block");
	    $("#nameTest").keypress(function (e) {
	        if (e.which == 13){
	                   nameTest();  // 실행할 이벤트
	        }
	     });
});
	si(); 
	var frm = document.rest_insert;
	var cnt=1;
	frm.addmenu.onclick = function(){		// 메뉴 추가 버튼 클릭시
		var menu = document.getElementById("menu");
		
		var div = document.createElement("div");
		div.setAttribute("class", "jumbotron");
		
		var str = "<div style='float:left;'>"
		 +"<div class = 'file_input2' style = 'height: 150px'>"
		 +"<label style='width:100%;'>"
		 +"<img src='./restaurant/menu_upload.jpg' width='150px' height='150px' class='rmAttFile"+cnt+"'>"
		 +"<input type='file' name='rmAttFile"+cnt+"' id='rmAttFile"+cnt+"'  onchange='menuLoadImg(this)'>"
		 +"</label>"
		 +"</div>"
		 +"</div>"
		 +"<div class='input-group' > "
		 +"<span class='input-group-addon'>메뉴 이름</span>"	
		 +" <input type='text' name='rmName' class='form-control' required >"
		 +"</div>"
		 +"<div class='input-group'> "
		 +"<span class='input-group-addon'>메뉴 설명</span>"
		 +"<input type='text' name='rmExplain' class='form-control' required>"
		 +"</div>"
		
		 +"<div class='input-group'> "
		 +"<span class='input-group-addon'>메뉴 가격</span>"
		 +"<input type='number' name='rmPrice' min='0' class='form-control'  required>"
		 +"</div>"
		 +"<br/>"
		 +"<input type='button' name='btnDelete' value='삭제' onclick='delFunc(this)' style='float:right;' class='btn btn-primary'/>"
		 +"<br/>"
		 +"<br/>"
		 +"<br/>"
		
		div.innerHTML = str;
		menu.appendChild(div);
		cnt++;
		
	}
	
	frm.btnInsert.onclick = function(){		// 글 등록 버튼 누를시
		if(frm.rname.value == ""){1111
			$('#msg').text("음식점 상호명을 입력해주세요.");
	        document.getElementById('show_msg').style.display='block';
			return false;	        	
	       
		}else if(!frm.rphoto_main.value){
			$('#msg').text("메인 사진을 반드시 입력해주세요.");
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(!frm.rmenus.value){
			$('#msg').text("대표 메뉴를 입력해주세요.");
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(!frm.rinfo.value){
			$('#msg').text("음식점 소개를 입력해주세요.");
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(!frm.rtimeOpen.value){
			$('#msg').text("오픈 시간을 입력해주세요.");
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(!frm.rtimeClose.value){
			$('#msg').text("마감 시간을 입력해주세요.");
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(!frm.rtable.value){
			$('#msg').text("전체 테이블 수를 입력해주세요.")
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(!frm.rbathroom.value){
			$('#msg').text("화장실 내용을 입력해주세요.");
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(!frm.rdrink.value){
			$('#msg').text("주류판매 내용을 입력해주세요.");
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(!frm.rfacilities.value){
			$('#msg').text("기타시설 내용을 입력해주세요.");
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(!frm.rphone.value){
			$('#msg').text("대표전화를 입력해주세요.");
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(!frm.rjuso.value){
			$('#msg').text("나머지 주소를 입력해주세요.");
			document.getElementById('show_msg').style.display='block';
			return false;
		}else if(cnt==1){
			if(!frm.rmName.value){	
				$('#msg').text("메뉴 항목을 확인해주세요.1");
				document.getElementById('show_msg').style.display='block';
				return false;
			}else if(!frm.rmExplain.value){
				$('#msg').text("메뉴 항목을 확인해주세요.2");
				document.getElementById('show_msg').style.display='block';
				return false;
			}else if(!frm.rmPrice.value){
				$('#msg').text("메뉴 항목을 확인해주세요.3");
				document.getElementById('show_msg').style.display='block';
				return false;
			}else{
				$('#msg').text("맛집이 정상적으로 등록 되었습니다.");
				document.getElementById('show_msg').style.display='block';
			}
		}else if(cnt!=1){
			for(i=0;i<cnt;i++){
				if(!frm.rmName[i].value){	
					$('#msg').text("메뉴 항목을 확인해주세요.1");
					document.getElementById('show_msg').style.display='block';
					return false;
				}else if(!frm.rmExplain[i].value){
					$('#msg').text("메뉴 항목을 확인해주세요.2");
					document.getElementById('show_msg').style.display='block';
					return false;
				}else if(!frm.rmPrice[i].value){
					$('#msg').text("메뉴 항목을 확인해주세요.3");
					document.getElementById('show_msg').style.display='block';
					return false;
				}
			}
			$('#msg').text("맛집이 정상적으로 등록 되었습니다.");
			document.getElementById('show_msg').style.display='block';
		}
	}
	
	function okFunc(){
		if($('#msg').text() =="맛집이 정상적으로 등록 되었습니다."){
			frm.action = "insertR.donghwan";
			frm.submit();				
		}else{
			document.getElementById('show_msg').style.display='none';		
		}
	}
	
	frm.btnList.onclick = function(){		// 글 취소 버튼 누를시
		frm.action = "list.donghwan";
		frm.submit();
	}
	
	function delFunc(obj){					// 메뉴 삭제 버튼 클릭시
		if(cnt==1){
			$('#msg').text("메뉴는 한 개 이상이여야 합니다.");
			document.getElementById('show_msg').style.display='block';			
		}else{
			var menu = document.getElementById("menu");
			var parent = obj.parentNode;
			var granpar = parent.parentNode;
			
			granpar.removeChild(parent);
			cnt--;
		}
	}
	
	function readURLM(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	   var sibling = input.previousSibling.previousSibling;
	   console.log(sibling.outerHTML);
	    reader.onload = function (e) {
	            $(sibling).attr('src', e.target.result);
	            }
	      reader.readAsDataURL(input.files[0]);
	      }
	  }
	
	function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	   var sibling = input.previousSibling.previousSibling;
	   console.log(sibling.outerHTML);
	    reader.onload = function (e) {
	            $("#rphoto_main").attr('src', e.target.result);
	            }
	      reader.readAsDataURL(input.files[0]);
	      }
	  }
	
	function menuLoadImg(value){			// 메뉴사진 추가시
		var targetId = value.id;
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function (e) {
				$("."+targetId).attr('src', e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
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