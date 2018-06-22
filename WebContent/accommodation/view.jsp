<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel='stylesheet' type = 'text/css' href='css/magnific-popup.css'/> -->
<link href="css/magic-check.css" rel="stylesheet">
<link rel='stylesheet' type = 'text/css' href='css/magnific-popup.css'/>

<!-- summernote CSS/js-->

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<title>Insert title here</title>
</head>
<style>
i {
	font-style: normal;
}

#main_pic {
	width: 100%;
}


.file_input {
	max-height: 340px;
}

.rimage {
	width: 100%;
	max-height: 340px;
}

.floating {
	position: fixed;
	right: 54%;
	top: 38%;
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

.floating div:nth-child(3) {
	border-radius: 8px;
}

.floating div:nth-child(3) {
	border-radius: 8px;
}
.img-responsive {
  display: block;
  max-width: 100%;
  height: auto;
}
/* 별점 CSS */
#star {margin: auto; float: left}
#star > input.star { display: none; }
#star > label.star {float:right; padding: 2px;font-size: 16px;color: #444;transition: all .2s; }
#star > input.star:checked ~ label.star:before {content: '\f005';color: #FD4;transition: all .25s;}
#star > input.star-5:checked ~ label.star:before {color: #FE7;text-shadow: 0 0 20px #952;}
#star > input.star-1:checked ~ label.star:before { color: #F62; }
#star > label.star:before {content: '\f006';font-family: FontAwesome;}

</style>
<body>
<form name = "frm_view" method = "post">
<input type = "hidden" name = "serial" value = "${vo.serial}">
<input type = "hidden" name = "worker" value = "${vo.worker}">
<input type = "hidden" name = "store" value = "${vo.aname}">

</form>
<!-- Header -->

<div class = "w3-container">
<br>
<header class="w3-display-container">
	<img class="w3-image" src="./accommodation/accommodation_album/${vo.attfileshow}" alt="The Hotel" style="width:100%; min-height: 340px; height="800">


  <div class="w3-display-left w3-padding w3-col l5 m7">
    <div class="w3-container w3-grey w3-opacity-min">
    
    <h2><i class="fa fa-bed w3-margin-right"></i><i id = "aname2" class = ''>${vo.aname}</i></h2>
    </div>
    <div class="w3-container w3-white w3-padding-16 w3-opacity-min">
      <div action="/action_page.php" target="_blank">
      	<div class = "w3-row-padding" style="margin:8px -16px;">
      	<div class = "w3-large">&nbsp;<i class="fa fa-map-marker w3-text-red"></i> <span id = 'addr1'>${vo.address1}</span>, <span id = 'addr2'>${vo.address2}</span></div>
        </div>
					<span id="star">
						
						<input class="star star-5" id="star-5" type="radio" name="service"
							${(avg == 5)?'checked': 'disabled'} />
							<label class="star star-5"
							for="star-5"></label> <input class="star star-4" id="star-4"
							type="radio" name="service"
							${(avg <5 && avg >= 4 )?'checked': 'disabled'} /> <label
							class="star star-4" for="star-4"></label> <input
							class="star star-3" id="star-3" type="radio" name="service"
							${(avg <4 && avg >= 3 )?'checked': 'disabled'} /> <label
							class="star star-3" for="star-3"></label> <input
							class="star star-2" id="star-2" type="radio" name="service"
							${(avg <3 && avg >= 2 )?'checked': 'disabled'} /> <label
							class="star star-2" for="star-2"></label> <input
							class="star star-1" id="star-1" type="radio" name="service"
							${(avg <2 && avg >= 1 )?'checked': 'disabled'} /> <label
							class="star star-1" for="star-1"></label>
					</span>
					<span style = 'margin-left: 10px; float:left'><label>평점: ${avg}</label></span>
					
		<br>
		<div class="w3-row-padding w3-large w3-red" id = "facilities" style="margin:8px -16px;">
      
        <c:if test="${vo.freeparking == 'O'}"><i class = 'flaticon-parking'></i></c:if>
        <c:if test="${vo.pool == 'O'}"><i class = 'flaticon-swimming-silhouette'></i></c:if>
        <c:if test="${vo.nosmoking == 'O'}"><i class = 'flaticon-no-smoking-sign'></i></c:if>
        <c:if test="${vo.freewifi == 'O'}"><i class = 'flaticon-wifi'></i></c:if>
        <c:if test="${vo.fitness == 'O'}"><i class = 'flaticon-exercise'></i></c:if>
        <c:if test="${vo.freemeal == 'O'}"><i class = 'flaticon-breakfast'></i></c:if>
   
        </div>
      </div>
    </div>
  </div>
</header>
</div> 
<br>


<c:set var="cntpb" value="1"></c:set>
<c:set var="cntpe" value="5"></c:set>
<c:set var="cntb" value="0"></c:set>
<c:set var="cntbb" value="1"></c:set>
<c:set var="cntbe" value="5"></c:set>
<c:set var="cntnum" value = "-1"></c:set>
<c:forEach var = "room" items = '${list}'>
<c:set var="cntb" value="${cntb+1}"></c:set>
<div class='container-fluid'>
<div class = 'container'>
<h3 class = 'w3-padding-24 w3-center ' style = 'border-bottom: 1px solid black;'>방 정보 </h3>
  <div class='row'>
	<div class='col-lg-6 col-md-12'>
    <br/>
	<div id="myCarousel${cntb}" class="carousel slide" data-interval="0" style = 'z-index: 1;'>
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	    <c:forEach begin="${cntbb}" end="${cntbe}">
	    <c:if test = "${cntbe-cntbb == 4 and picList[cntbb]!=null}">
	    <c:set var="cntnum" value = "${cntnum+1}"></c:set>
	   	<li data-target="#myCarousel${cntb}" data-slide-to="${cntnum}" class="active"></li>
	    </c:if>
	    <c:if test = "${cntbe-cntbb != 4 and picList[cntbb]!=null}">
	    <c:set var="cntnum" value = "${cntnum+1}"></c:set>
	    <li data-target="#myCarousel${cntb}" data-slide-to="${cntnum}"></li>
	    </c:if>
	    <c:set var="cntbb" value="${cntbb+1}"></c:set>
	    </c:forEach>
	    <c:set var="cntbe" value="${cntbe+5}"></c:set>
	    <c:set var="cntnum" value = "-1"></c:set>
	    </ol>
		<div class="carousel-inner" role="listbox">
		<c:forEach begin="${cntpb}" end="${cntpe}">
				<c:if test = "${cntpe-cntpb == 4}">
				    <div class="item active">
					  <a href="./accommodation/accommodation_album/${picList[cntpb]}" style="width:100%;" class="image-popup">
					  <figure>
						<div class="overlay"></div> 
						  <img class='w3-image rimage' src='./accommodation/accommodation_album/${picList[cntpb]}' alt='The Hotel'>
					  </figure>
					  </a>
			      </div>
			     </c:if>
			     <c:if test = "${cntpe-cntpb != 4 && picList[cntpb]!=null}">
			     	<div class="item">
					  <a href="./accommodation/accommodation_album/${picList[cntpb]}" style="width:100%;" class="image-popup"> 
					  	<figure>
						<div class="overlay"></div> 
						  <img class='w3-image rimage' src='./accommodation/accommodation_album/${picList[cntpb]}' alt='The Hotel'>
						</figure>
					  </a>
			      </div>
			     </c:if>
				<c:set var="cntpb" value="${cntpb+1 }"></c:set>
		</c:forEach>
		</div>
		<c:set var="cntpe" value="${cntpe+5 }"></c:set>
	
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel${cntb}" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel${cntb}" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
	</div>
	<br>
	</div>
	
	<div class='col-lg-6 col-md-12' id = 'col_imgs'>
	<br/>
	<div class = 'w3-content'>
	<div class = 'w3-row'>
	<h4 class = 'w3-center roomN  '>${room.room}</h4>
	<div class = 'w3-center facilities'>
	<h4 class = 'w3-center'></h4></div>
	<div class = 'w3-center'><h4 class = 'w3-center'>
	<c:if test="${room.r_wifi == 'O'}"><i class = 'flaticon-wifi'></i></c:if>
	<c:if test="${room.r_pc == 'O'}"><i class = 'flaticon-pc-computer-with-monitor'></i></c:if>
	<c:if test="${room.r_breakfast == 'O'}"><i class = 'flaticon-breakfast'></i></c:if>
	<c:if test="${room.r_bath == 'O'}"><i class = 'flaticon-bathtub-with-opened-shower'></i></c:if>
	<c:if test="${room.r_tv == 'O'}"><i class = 'flaticon-television'></i></c:if>
	</h4>
	</div>
	</div>
	<hr>
	<div class = 'w3-row'>
		<div class = 'w3-half w3-center'>
		<c:if test="${room.checkin != '' || room.checkout != ''}">
		<span>숙박 입실시간: </span>${room.checkin}<span class = 'checkinN'></span><br>
		<span>숙박 퇴실시간: </span>${room.checkout}<span class = 'checkoutN'></span>
		</c:if>
		<c:if test="${room.checkins != ''}">
		<div class = "short_stay0 w3-animate-opacity">
		<span>대실 이용시간: </span>${room.checkins}<span class = 'checkinSN'></span><br>
		<span>대실 퇴실시간: </span>${room.checkouts}<span class = 'checkoutSN'></span>
		</div>
		</c:if>
		</div>
		<div class = 'w3-half w3-center'>
		<c:if test="${room.weekdays != '' || room.weekends != ''}">
		<span>숙박 평일가격: </span>${room.weekdays}<span class = 'weekdaysN'></span><br>
		<span>숙박 주말가격: </span>${room.weekends}<span class = 'weekendsN'></span>
		</c:if>
		<c:if test="${room.checkouts != ''}">
		<div class = "short_stay0 w3-animate-opacity">
		<span>대실 평일가격: </span>${room.weekendss}<span class = 'weekdaysSN'></span><br>
		<span>대실 주말가격: </span>${room.weekendss}<span class = 'weekendsSN'></span>
		</div>
		</c:if>
		</div>
	</div>
		<hr>
		<div class = 'w3-row'>
		<h5 class="rcontentN w3-center" style = "padding-right: 15%; padding-left: 15%;">${room.rcontent}</h5>
		</div>
		<hr>
	</div>
	</div>
	</div>
</div>
</div>
</c:forEach>

<br><br><br>
	<div class="container-fluid">
		<div class='container'>
		<h3 class = 'w3-padding-24 w3-center ' style = 'border-bottom: 1px solid black;'>개요 </h3>
			<div class="w3-row">
				<div class="w3-half" style = 'padding: 0px 10px 0px 10px'>
					<div id="content2" style = 'padding-right: 50px;'><h5><textarea class="form-control rcontent" name = "rcontent" rows="6" readonly>${vo.content}</textarea></h5></div>
					<br>
					<h5><i class ='fa fa-map-marker w3-text-red' style = 'padding: 0px 5px 0px 5px'></i> <span> 주소: ${vo.address3}</span></h5><br>
					<h5><i class="fa fa-phone w3-text-red" style = 'padding: 0px 2px 0px 5px'></i> <span>연락처: ${vo.phone}</span></h5><br>
					<h5><i class="fa fa-envelope w3-text-red" style = 'padding: 0px 1px 0px 4px'></i> <span>이메일: ${vo.email}</span></h5><br>
				</div>
				<div class="w3-half">
					<div id='detail'>
						<div id='map'>
							<div id='map' style="width: 100%; height: 300px;"></div>
							<input type='text' name='rjuso' id='rjuso' value='${vo.address3}'
								placeholder="(시/군/구를 제외한)전체 주소를 입력해주세요" size='50' />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<br><br><br>

<div class=container>
	<div class="row">
	<h3 class = 'w3-padding-24 w3-center' style = 'border-bottom: 1px solid black;'>가까운 음식점 </h3>
	<br/>
	<c:forEach var="rvo" items="${restaurant_list}" begin = '0' end = '2'>
		<div class="col-lg-4 col-md-4 col-sm-6">
			<div class="fh5co-card-item" onclick="serialFunc(this)" id='${rvo.pserial}'>
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



<div class='floating' style = 'z-index: 12;'>


<c:if test="${sId == vo.worker}">
<div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '수정' onclick = 'modify()'><i class="fa fa-edit" style = 'padding: 6px 6px 5px 6px;'></i></button></div><br>
<div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '삭제' onclick = 'del()'><i class="fa fa-trash-o" style = 'padding: 5px 10px 5px 10px;'></i></button></div><br>
</c:if>
<div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '나가기' onclick = 'list()'><i class="fa fa-sign-out" style = 'padding: 7px;'></i></button></div><br>
<c:if test="${sessionScope.selection == 'i' and sessionScope.sId !='admin'}">
<div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '후기 작성하기' onclick = 'review()'><i class="fa fa-envelope" style = 'padding: 7px;'></i></button></div><br>
<div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '예약하기' onclick = 'booking()'><i class="fa fa fa-table" style = 'padding: 7px;'></i></button></div>
</c:if>
</div>


<div class = "w3-bottom">
<div id = 'booking' class = 'w3-button w3-animate-opacity w3-block w3-hover-grey w3-red' style = "display: none;">예약</div>
</div>



<div id="show_msg" class="w3-modal w3-center w3-opacity">
	<div class="w3-modal-content w3-animate-top w3-card-4 w3-round-large w3-padding">
		<span
			onclick="document.getElementById('show_msg').style.display='none'"
			class="w3-button w3-hover-white w3-xxlarge w3-display-topright w3-round-large">×</span>
		<h4 class="w3-wide w3-padding" id='msg'>
			<i class="fa fa-exclamation-circle w3-margin-right"></i>
		</h4>
	</div>
</div>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/magnific-popup-options.js"></script>




<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=uJlO5e3KXL6BKDiiZFmv&submodules=geocoder"></script>
<script>
window.onload=function(){			// 주소 찾기 버튼 클릭시
	var rjuso = document.getElementById("rjuso").value;
	$('input').attr('autocomplete','off');
    var navbar = document.getElementById("myNavbar");
    var holder = document.getElementById("holder");
    navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    holder.className = "nav-holder" + " w3-padding-large" + " nav_small";
    $(".default").css("display","none");
    $(".scrolled").css("display","block");
	
	
	var juso = rjuso;
	

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
});


var frm = document.frm_view;
function modify(){
	frm.action = "selectToModify.ac";
	frm.submit();
}

function list(){
	location.href = "list.ac";
}

function del(){
 	$('#msg').text("숙박업체 정보가 삭제 되었습니다.");
	document.getElementById('show_msg').style.display='block';
	frm.action = "delete.ac";
	frm.submit();
}

function booking(){
	frm.action = "reservation_acc.reserve";
	frm.submit();
}

function review(){
	frm.action = "insert.review";
	frm.submit();
}
function serialFunc(obj){
	frm.serial.value = obj.id;  
	frm.action = "view.donghwan";
	frm.submit();
}
</script>
</body>
</html>