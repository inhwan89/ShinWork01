<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<title>맛집 수정 하기(삭제도 가능)</title>

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

		xhr1.onreadystatechange = function() {
			if (xhr1.status == 200 && xhr1.readyState == 4) {
				var rs1 = document.getElementById("result1");
				var temp1 = xhr1.responseText;
				var data1 = JSON.parse(temp1);
				var str1 = "";
					str1 += "<select class= 'selectpicker form-control' name  = 'raddress1' id = 'raddress1' onchange = 'gu()'>";
					str1 += "<option value = ''>전체</option>"
				
				for (var i = 0; i < data1[0].location1.length; i++) {
					str1 += "<option >" + data1[0].location1[i] + "</option>";
				}
				str1 += "</select>";
				rs1.innerHTML = str1;
			}
		}

		xhr2.onreadystatechange = function() {
			if (xhr2.status == 200 && xhr2.readyState == 4) {
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
	function gu() {
		var add = document.getElementById("raddress1");
		var index = add.selectedIndex-1;

		var xhr = new XMLHttpRequest();
		var url = './location/location2.txt';
		xhr.open('get', url);
		xhr.send();

		xhr.onreadystatechange = function() {
			if (xhr.status == 200 && xhr.readyState == 4) {
				var rs = document.getElementById("result2");
				var temp = xhr.responseText;
				var data = JSON.parse(temp);

				var str = "";
				str += "<select class= 'selectpicker form-control' name  = 'raddress2' id='raddress2'>";
				
				
				if(index==-1){
		            str += "<option value = ''>전체</option>";
		        }else{
		        	str += "<option value = ''>전체</option>";
					for (i = 0; i < data[index].district.length; i++) {
						str += "<option >" + data[index].district[i] + "</option>";
					}
		        }
			
					str += "</select>";
				rs.innerHTML = str;
			}
			gu2();
		}
	}
	
	function select(holiday) {
		var frm = document.rest_modify;
		frm.rholiday.value = holiday;
	}
</script>
<div class='container'>
		
	<form name='rest_modify' id='rest_modify' method = "post" 
			enctype="multipart/form-data">
 		
 		<input type='hidden' name='serial' 	value='${param.serial }'>
 		<input type='hidden' name='rhit' 	value='${rvo.rhit }'>
 		<input type="hidden" name="hiddenAdd1" value="${rvo.raddress1 }">
		<input type="hidden" name="hiddenAdd2" value="${rvo.raddress2 }">
 		<p/> 
 
 		<div id='a' style="text-align: center;">
 			<label>작성자 : </label>
 			<input type='text' name='mid' value='${rvo.mid }' readonly/>
 			<label>음식점 이름 : </label>
 			<input type='text' name='rname' size='50' 
 				placeholder="가게이름" value='${rvo.rname }' required/><br/>
 		</div>
 		<p/>
 
		<div id='center'>
 		<!-- 사진 첨부 부분 -->
 		  <div id='rphoto'>
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
 		  <div class = "file_input" style = "width:100%; overflow: hidden;">
 				<label class = "accommodation_img" style = "width:100%;">
 				<c:forEach var='main' items='${rphotoList}'>
	 				<img class="w3-image" src="./restaurant/download/${main}"  
	 					alt="메인사진" style="width:100%; height:100%; overflow:hidden" >
					<input type="file" name='rphoto_main' 
						onchange="mainLoadImg(this)">
	 			</c:forEach>
 				</label>
 			</div>
 			</div>
 			
 
 			<c:set var="c" value="1"></c:set>
 		
 				<c:forEach var='sub' items='${rphotoList2 }'>
		 		  <div class="item">
		 		  <div class = "file_input">
		 		  	 <label class = "accommodation_img" style = "width:100%"> 
	 				<img class="w3-image" src="./restaurant/download/${sub }" 
	 					alt="서브사진2" style="width:100%; height:100%; overflow:hidden" id="rphoto_sub${c }"> 
	 				
					<input type="file" name='rphoto_sub${c }'
						onchange="readURLM(this)">
					</label>
 				  </div>
 				  </div>
	 			
 					<c:set var="c" value="${c+1 }"></c:set>
 				</c:forEach>
 		
 		
 			<c:forEach begin="${c }" end="5" >
 				<div class="item">
 				<div class = "file_input">
 				<label class = "accommodation_img" style = "width:100%">
 				<img class="w3-image" 
 					src="./restaurant/main_upload.png" alt="서브사진3" style="width:100%; height:100%; overflow:hidden" id="rphoto_sub${c }"> 
				<input type="file" name='rphoto_sub${c }'
					onchange="readURLM(this)">
				</label>
				</div>
				</div>
				<c:set var="c" value="${c+1 }"></c:set>
 			</c:forEach>
 		 
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
	 
		<c:set var="cnt" value="0"></c:set>
	 
	<div id='menu'>
	
	 	<c:forEach var="rmvo" items='${menuList }'>
	 	 <div>
	 	 
	 		<div style="float:left;">
	  			<img src="./restaurant/download/${menuPhotoList[cnt] }" 
			 		width='200px' height='200px' 
			 		class="rmAttFile${cnt }">
			</div>
				
	 			<div class='input-group'>
	 			<span class='input-group-addon'>메뉴 이름</span>
	 			<input type='text' name='rmName' class='form-control'	 
	 			 	value='${rmvo.rmName }' required>
	 			</div>
	 			
	 			<div class='input-group'>
	 			<span class='input-group-addon'>메뉴 설명</span>
	 			<input type='text' name='rmExplain'
	 				value='${rmvo.rmExplain }' class='form-control' required>
	 			</div>
	 			
	 			<div class='input-group'>
	 			<span class='input-group-addon'>메뉴 가격</span>
	 			<input type='number' name='rmPrice' min='0' class='form-control'
	 				value='${rmvo.rmPrice }' size='10' required>
	 			</div>	
	 			
	 			<br/>	
	 			<input type='button' name='btnDelete' 
	 				value='삭제' onclick='delFunc(this)' style="float:right;" class="btn btn-primary"/>
	 			<br/>
	 			<input type='file' name='rmAttFile${cnt }' 
	 				id="rmAttFile${cnt }"  onchange="menuLoadImg(this)">
				<br/>
				<br/>
			<c:set var="cnt" value="${cnt+1 }"></c:set>
		 </div>
		</c:forEach>
	 	<input type='hidden' name='menuCount' id="menuCount"value="${cnt }">  
	
</div>
	 
	 <br/> 
 </div>
</div>

 
 <div id='detail'>

		<hr>
		<h3 class="text-center">상세 설명</h3>
		<p class="text-center"><em>자세히</em></p>
		<hr>
	 	<p/>
	
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'>
	 <span class='input-group-addon'  style="width:150px; text-align:center;">대표 메뉴들</span>
	 <input class='form-control' type='text' name='rmenus' value='${rvo.rmenus }' required>
	</div>
	 
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'> 
	 <span class='input-group-addon'  style="width:150px; text-align:center;">음식점 간략 설명</span>
	 <input class='form-control' type='text' name='rinfo' value='${rvo.rinfo }' required>
	</div>
	
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'>
	 <span class='input-group-addon' style="width:150px; text-align:center;">오픈시간</span>
	 <input class='form-control' type='number' min="0" name='rtimeOpen' value='${rvo.rtimeOpen }'
	 	placeholder="예)09 또는 9" required/>
	
	 <span class='input-group-addon' style="width:150px; text-align:center;">마감시간</span>	 
	 <input class='form-control' type='number' min="1" name='rtimeClose' value='${rvo.rtimeClose }' 
	  	placeholder="예)24"  required/>
	</div>
	 
 	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'>
	 <span class='input-group-addon' style="width:150px; text-align:center;">전체 테이블 수</span>
	 <input class='form-control' type='number' min="1" name='rtable' value='${rvo.rtable }'
	  	placeholder="테이블 1개 당 최대 인원 4명 기준" required/>
	</div>
	 
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'>
	 <span class='input-group-addon' style="width:150px; text-align:center;">휴일</span>
	 <select name='rholiday' class="form-control" size='1' >
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
	 <input class='form-control' type='text' name='rbathroom'  value='${rvo.rbathroom }' required/><br/>
	</div>
	 
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'> 
	 <span class='input-group-addon' style="width:150px; text-align:center;">주류판매</span>
	 <input class='form-control' type='text' name='rdrink' value='${rvo.rdrink }' required/><br/>
	</div>
	 
	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'> 
	 <span class='input-group-addon' style="width:150px; text-align:center;">기타시설</span>
	 <input class='form-control' type='text' name='rfacilities' value='${rvo.rfacilities }' required/><br/>
	</div>
	
 	<div class='form-group input-group col-ms-12 col-xs-12 col-lg-12'> 
	 <span class='input-group-addon' style="width:150px; text-align:center;">대표전화</span>
	 <input class='form-control' type='text' name='rphone' value='${rvo.rphone }' required/><br/>
	</div> 
	 <p/>
	 
	 
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


	<hr>
		<h3 class="text-center">주소 입력</h3>
		<p class="text-center"><em>지도</em></p>
	<hr>

<div id='insert_map' class='form-group input-group col-ms-12 col-xs-12 col-lg-12'>
 	<div id='find'>
		 <div id = "result1"></div>
		 <div id = "result2"></div>
 	 </div>
 	
 <div class='form-group input-group col-ms-12 col-xs-12 col-lg-12' > 	 	
  	<span class='input-group-addon' style="width:150px; text-align:center;">나머지 주소</span>
 	<input type='text' class='form-control' name='rjuso' id='rjuso' value='${rvo.rjuso }'
 			placeholder="(시/군/구를 제외한)전체 주소를 입력해주세요"  required/>
 	<input type='button' name='btnFindAd' value='주소 찾기' class="btn btn-primary" style="float:right;" />
 </div>
 <br/>
 
 	<div id='map' style="width:100%;height:400px;">
 	</div>
</div>	
 
  <div style="height:100px">
	
 </div>
 
	<div id='tail' style="text-align: center;">
	<p/>
	<p/>
	<input type='button' name='btnModify' value='저장' class="btn btn-primary"/>
	<input type='button' name='btnView' value='취소' class="btn btn-primary"/>
	 
 </div> 
	</form>	
		

	
</div>
<!-- 주소 지도 api 불러오기-->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=uJlO5e3KXL6BKDiiZFmv&submodules=geocoder"></script>
<script> 
si();
select("${rvo.rholiday}");
window.onload=function(){
	$('input').attr('autocomplete','off');
	var navbar = document.getElementById("myNavbar");
	var holder = document.getElementById("holder");
	navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
	holder.className = "nav-holder" + " w3-padding-large" + " nav_small";
	$(".default").css("display","none");
	$(".scrolled").css("display","block");
	rholiday_val = $('select.rholiday').attr('id');		// 요일 불러오는 제이쿼리
	  $('select.rholiday option[value=' + rholiday_val + ']').attr('selected', 'selected');
	
	
	var frm = document.rest_modify;
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
	
	        var items = response.result.items,
	            htmlAddresses = [];
	
	        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
	            item = items[i];
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';
	
	            htmlAddresses.push((i+1) +'. '+ addrType +' '+ item.address);
	          /*   htmlAddresses.push('&nbsp&nbsp&nbsp -> '+ item.point.x +','+ item.point.y); */
	        }
	
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

function mainLoadImg(value){
	if(value.files && value.files[0]){
		var reader = new FileReader();
		reader.onload = function (e) {
			$('#rphoto_main').attr('src', e.target.result);
		}
		reader.readAsDataURL(value.files[0]);
	}
}

function subLoadImg(value){
	var targetId = value.name;
	if(value.files && value.files[0]){
		var reader = new FileReader();
		reader.onload = function (e) {
			$("#"+targetId).attr('src', e.target.result);
		}
		reader.readAsDataURL(value.files[0]);
	}
}


function menuLoadImg(value){
	var targetId = value.id;
	if(value.files && value.files[0]){
		var reader = new FileReader();
		reader.onload = function (e) {
			$("."+targetId).attr('src', e.target.result);
		}
		reader.readAsDataURL(value.files[0]);
	}
}



</script>	



<!-- 주소 지도 api 재 등록시  -->

<script> 
var frm = document.rest_modify;


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
	
	        var items = response.result.items,
	            htmlAddresses = [];
	
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
	var frm = document.rest_modify;
	var menuCount = document.getElementById("menuCount").value;
	var cnt = menuCount;
	
	frm.addmenu.onclick = function(){		// 메뉴 추가 버튼 클릭시
		var menu = document.getElementById("menu");
		var topdiv = document.createElement("div");// div 생성 하고 지정
		var div = document.createElement("div");// div 생성 하고 지정
		var img  = document.createElement("img");
		var div2 = document.createElement("div");// div 생성 하고 지정
		var span2 = document.createElement("span");
		var inputname = document.createElement("input");
		var div3 = document.createElement("div");// div 생성 하고 지정
		var span3 = document.createElement("span");
		var inputex   = document.createElement("input");	
		var div4 = document.createElement("div");// div 생성 하고 지정
		var span4 = document.createElement("span");
		var inputprice= document.createElement("input");	
		var inputdel  = document.createElement("input");	
		var inputfile = document.createElement("input");// input 생성하고 지정	
		var br = document.createElement("br");
		var br2 = document.createElement("br");
		var br3 = document.createElement("br");
		var br4 = document.createElement("br");
						
		img.setAttribute("src", "./restaurant/menu_upload.jpg");
		img.setAttribute("width", "200px");
		img.setAttribute("height", "200px");
		img.setAttribute("class", "rmAttFile"+cnt);
		div.setAttribute("style", "float:left");
		div.appendChild(img);
		
		span2.setAttribute("class", "input-group-addon");
		span2.innerHTML = "메뉴 이름";
		inputname.setAttribute("type", "text");
		inputname.setAttribute("name", "rmName");
		inputname.setAttribute("class", "form-control");
		inputname.setAttribute("required", "");	// element.required = true

		div2.setAttribute("class", "input-group");
		div2.appendChild(span2);
		div2.appendChild(inputname);
			
		span3.setAttribute("class", "input-group-addon");
		span3.innerHTML = "메뉴 설명";
		inputex.setAttribute("type", "text");
		inputex.setAttribute("name", "rmExplain");
		inputex.setAttribute("class", "form-control");
		inputex.setAttribute("required", "");
		
		div3.setAttribute("class", "input-group");
		div3.appendChild(span3);
		div3.appendChild(inputex);
			
		span4.setAttribute("class", "input-group-addon");
		span4.innerHTML = "메뉴 가격";
		inputprice.setAttribute("type", "number");
		inputprice.setAttribute("name", "rmPrice");
		inputprice.setAttribute("class", "form-control");
		inputprice.setAttribute("required", "");
		inputprice.setAttribute("min", "0");
	
		div4.setAttribute("class", "input-group");
		div4.appendChild(span4);
		div4.appendChild(inputprice);
		
		inputdel.setAttribute("type", "button");
		inputdel.setAttribute("name", "btnDelete");
		inputdel.setAttribute("value", "삭제");
		inputdel.setAttribute("onclick", "delFunc(this)");
		inputdel.setAttribute("style", "float:right");
		inputdel.setAttribute("class", "btn btn-primary");
				
		inputfile.setAttribute("type", "file");// input type 지정
		inputfile.setAttribute("name", "rmAttFile"+cnt);// name 지정
		inputfile.setAttribute("id", "rmAttFile"+cnt);
		inputfile.setAttribute("onchange", "menuLoadImg(this)");
		
		topdiv.appendChild(div);
		topdiv.appendChild(div2);
		topdiv.appendChild(div3);
		topdiv.appendChild(div4);
		topdiv.appendChild(br4);
		topdiv.appendChild(inputdel);
		topdiv.appendChild(br);
		topdiv.appendChild(inputfile);
		topdiv.appendChild(br2);
		topdiv.appendChild(br3);
		
		menu.appendChild(topdiv);
		
		cnt++;
		
	}
	
	
	frm.btnModify.onclick = function(){		// 글 저장 버튼 누를시
		if(frm.rname.value == ""){
			$('#msg').text("음식점 상호명을 입력해주세요.");
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
				$('#msg').text("맛집이 정상적으로 수정 되었습니다.");
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
			$('#msg').text("맛집이 정상적으로 수정 되었습니다.");
			document.getElementById('show_msg').style.display='block';
		}
	}

	function okFunc(){
		if($('#msg').text() =="맛집이 정상적으로 수정 되었습니다."){
			frm.action = "modifyR.donghwan";
			frm.submit();				
		}else{
			document.getElementById('show_msg').style.display='none';		
		}
	}
	
	frm.btnView.onclick = function(){		// 취소 버튼 누를시
		frm.action = "list.donghwan";
		frm.submit();
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
	
	function delFunc(obj){
		var parent = obj.parentNode;			
		var granpar = parent.parentNode;	
		granpar.removeChild(parent);
		cnt--;
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