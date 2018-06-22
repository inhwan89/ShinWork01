<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insert</title>
</head>
<style>
i {
	font-style: normal;
}

#main_pic {
	width: 100%;
}

.bgimg-1, .bgimg-2 {
	background-attachment: scroll;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.bgimg-1 {
	background-image: url(./imgs/hotel_insert.jpg);
	min-height: 450px;
}

.bgimg-2 {
	background-image: url(./imgs/room_insert.png);
	min-height: 300px;
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
	top:34%;
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

.floating div:nth-child(2) {
	border-radius: 8px;
}
</style>
<body>

<form name = 'frm_back' method = 'post'>
<input type = "hidden" id  = "serial" name = "serial" value = "${vo.serial}">
</form>


<!-- Header -->
<form name = "frm_modify" method = "post" enctype = "multipart/form-data">
<div id = "rserial_list"></div>
<div class = "w3-container">
<div class="bgimg-1 w3-display-container w3-opacity">
  <div class="w3-display-middle" style = "margin-top: 50px">
    <span class="w3-xxlarge w3-wide w3-text-white">업체 정보 수정하기</span>
  </div>
</div>
<br>
<header class="w3-display-container">
	<div class = "file_input_m">
	  <label style="width:100%;"> 
		  <img class="w3-image" src="./accommodation/accommodation_album/${vo.attfileshow}" alt="The Hotel" style="width:100%; min-height: 340px; height="800">
		  <input type="file" class = 'file_check' name = "attfile0" onchange="readURL(this)">
		  <input type = "hidden" value = "${vo.attfileshow}">
	  </label>
	</div>

  <div id = "accommodation_info" class="w3-display-left w3-padding w3-col l5 m7" onclick="document.getElementById('insert_info').style.display='block'">
    <div class="w3-container w3-grey w3-opacity-min">
    
    <h2><i class="fa fa-bed w3-margin-right"></i><i id = "aname2">${vo.aname}</i></h2>
    </div>
    <div class="w3-container w3-white w3-padding-16 w3-opacity-min">
      <div action="/action_page.php" target="_blank">
      	<div class = "w3-row-padding" style="margin:8px -16px;">
      	<div class = "w3-large">&nbsp;<i class="fa fa-map-marker w3-text-red"></i> <span id = 'addr1'>${vo.address1}</span>, <span id = 'addr2'>${vo.address2}</span></div>
        </div>
        <div class="w3-row-padding w3-large" style="margin:8px -16px;">
            &nbsp;<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
			<span class="fa fa-star"></span>
			<span>평가(200명)</span>
		</div>
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

<input type = "hidden" id  = "serial" name = "serial" value = "${vo.serial}">
<div class = 'container'>
<div class="bgimg-2 w3-display-container w3-opacity">
  <div class="w3-display-middle">
    <span class="w3-xxlarge w3-wide w3-text-white">방 정보 수정하기</span>
  </div>
</div>
</div>
<br>
<c:set var="cntpb" value="1"></c:set>
<c:set var="cntpe" value="5"></c:set>
<c:set var="cntb" value="0"></c:set>

<c:set var="cntbb" value="1"></c:set>
<c:set var="cntbe" value="5"></c:set>

<c:set var="cntnum" value = "1"></c:set>
<div id = "deleteAtt"></div>


<div id = 'room_zone'>
<c:forEach var = "room" items = '${list}'>
<div>
<c:set var="cntb" value="${cntb+1}"></c:set>

<div class='container-fluid'>
<input type = "hidden" name = "pserial" value = "${vo.serial}">
<input type = "hidden" class = "data_index">
<input type = "hidden" class= "index">
<div class = 'container'>

  <div class='row'>
    <div class='col-lg-6 col-md-12'>
    <br/>
    <input type = "hidden" name = "cntn">
	<div id="myCarousel${cntb}" class="carousel slide" data-interval="0" style = 'z-index: 1;'>
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	    <c:forEach begin="${cntbb}" end="${cntbe}">
	    <c:if test = '${cntnum%5==1}'>
	    <li data-target="#myCarousel${cntb}" data-slide-to="${cntnum-1}" class="active"></li>
	    </c:if>
	  	<c:if test = '${cntnum%5!=1}'>
	    <li data-target="#myCarousel${cntb}" data-slide-to="${cntnum-1}"></li>
	    </c:if>  
	    <c:set var="cntnum" value="${cntnum+1}"></c:set>
	    </c:forEach>
	    <c:set var="cntnum" value = "1"></c:set>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class='carousel-inner' role='listbox'>
	    <c:forEach begin="${cntpb}" end="${cntpe}">
	    <c:if test = "${cntpb%5==1 && picList[cntpb] != null}">
	    <input type = "hidden" name = "cnt">
	      <div class='item active'>
			<div class = 'file_input'>
			  <label style="width:100%;"> 
				  <img class='w3-image rimage' src='./accommodation/accommodation_album/${picList[cntpb]}'>
				  <input type='file' name = 'attfile${cntpb}' onchange='readURL(this)'>
				  <input type ="hidden" class = "deleteAtt" value = "${picList[cntpb]}">	
			  </label>
			</div>
	      </div>
	    </c:if>
	   	<c:if test = "${cntpb%5==1 && picList[cntpb] == null}">
	    <input type = "hidden" name = "cnt">
	      <div class='item active'>
			<div class = 'file_input'>
			  <label style="width:100%;"> 
				  <img class='w3-image rimage' src='./imgs/upload_pic_r.jpg'>
				  <input type='file' name = 'attfile${cntpb}' onchange='readURL(this)'>
				  <input type ="hidden" class = "deleteAtt" value = "${picList[cntpb]}">	
			  </label>
			</div>
	      </div>
	    </c:if>
	    
	    <c:if test = "${cntpb%5!=1 && picList[cntpb] != null}">
	      <div class='item'>
			<div class = 'file_input'>
			  <label style="width:100%;">
				  <img class='w3-image rimage' src='./accommodation/accommodation_album/${picList[cntpb]}'>
				  <input type='file' name = 'attfile${cntpb}' onchange='readURL(this)'>
				  <input type ="hidden" class = "deleteAtt" value = "${picList[cntpb]}">	
			  </label>
			</div>
	      </div>
	     </c:if>
	     <c:if test = "${cntpb%5!=1 && picList[cntpb] == null}">
	      <div class='item'>
			<div class = 'file_input'>
			  <label style="width:100%;">
				  <img class='w3-image rimage' src='./imgs/upload_pic_r.jpg'>
				  <input type='file' name = 'attfile${cntpb}' onchange='readURL(this)'>
				  <input type ="hidden" class = "deleteAtt" value = "${picList[cntpb]}">	
			  </label>
			</div>
	      </div>
	     </c:if>
	     
	     <c:set var="cntpb" value="${cntpb+1 }"></c:set>
		</c:forEach>
		<c:set var="cntpe" value="${cntpe+5 }"></c:set>
		</div>
		
	    <!-- Left and right controls -->
	    <a class='left carousel-control' href='#myCarousel${cntb}' data-slide='prev'>
	      <span class='glyphicon glyphicon-chevron-left' ></span>
	      <span class='sr-only'>Previous</span>
	    </a>
	    <a class='right carousel-control' href='#myCarousel${cntb}' data-slide='next'>
	      <span class='glyphicon glyphicon-chevron-right'></span>
	      <span class='sr-only'>Next</span>
	    </a>
	</div>
	<br>
	</div>
	
	<div class='col-lg-6 col-md-12' id = 'col_imgs'>
	<br/>
	<div class = 'w3-content'>
	<div class = 'w3-row'>
	<h4 class = 'w3-center roomN'>${room.room}</h4>
	<div class = 'w3-center facilities'>
	<h4 class = 'w3-center'>
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
		<span>숙박 입실시간: </span><span class = 'checkinN'>${room.checkin}</span><br>
		<span>숙박 퇴실시간: </span><span class = 'checkoutN'>${room.checkout}</span>
		
		<div class = "short_stay0 w3-animate-opacity">
		<span>대실 이용시간: </span><span class = 'checkinSN'>${room.checkins}</span><br>
		<span>대실 퇴실시간: </span><span class = 'checkoutSN'>${room.checkouts}</span>
		</div>
		</div>
		<div class = 'w3-half w3-center'>
		<span>숙박 평일가격: </span><span class = 'weekdaysN'>${room.weekdays}</span><br>
		<span>숙박 주말가격: </span><span class = 'weekendsN'>${room.weekends}</span>

		<div class = "short_stay0 w3-animate-opacity">
		<span>대실 평일가격: </span><span class = 'weekdaysSN'>${room.weekendss}</span><br>
		<span>대실 주말가격: </span><span class = 'weekendsSN'>${room.weekendss}</span>
		</div>
		</div>
	</div>
		<hr>
		<div class = 'w3-row'>
		<h5 class="rcontentN w3-center" style = "padding-right: 15%; padding-left: 15%;">${room.rcontent}</h5>
		</div>
		<hr>
		<div class = 'w3-row'>
		<p class = 'w3-button w3-block' onclick = 'open_modal(this)'><i class = 'fa fa-edit' style = 'cursor:pointer;'></i>편집</p>
		</div>
	</div>
	</div>
	
<!-- modal list -->
<div id='insert_room_info1' class='w3-modal w3-center'>
  <div class='w3-modal-content w3-animate-opacity w3-card-4 w3-round-large'>
	<br/>
	<div class = 'w3-container'>
	<div class = 'w3-row'>
	<div class='input-group w3-quarter'>
		<span class='input-group-addon'>방이름</span>
		<input type='text' class='form-control room' name='room' style = 'width: 95%; text-align:right;' value = '${room.room}'>
	</div>
	<div class='input-group w3-quarter'>
		<span class='input-group-addon'>방개수</span>
		<input type='number' class='form-control' name='room_num' style = 'width: 95%; text-align:right;' value = '${room.room_num}'>
	</div>
	<div class='w3-twoquarter w3-center' style = 'margin-top: 7px;'>
		<label class='checkbox-inline'>
			<input type="checkbox" class = 'r_wifi' ${(room.r_wifi eq 'O')?'checked': ''}>와이파이
			<input type = 'hidden' name = 'r_wifi' value = 'X'>
		</label>
		<label class='checkbox-inline'>
			<input type='checkbox' class = 'r_bath' ${(room.r_bath eq 'O')?'checked': ''}>욕조
			<input type = 'hidden' name = 'r_bath' value = 'X'>
		</label>
		<label class='checkbox-inline'>
			<input type='checkbox' class = 'r_breakfast' ${(room.r_breakfast eq 'O')?'checked': ''}>조식
			<input type = 'hidden' name = 'r_breakfast' value = 'X'>
		</label>
		<label class='checkbox-inline'>
			<input type='checkbox' class = 'r_tv' ${(room.r_tv eq 'O')?'checked': ''}>TV
			<input type = 'hidden' name = 'r_tv' value = 'X'>
		</label>
		<label class='checkbox-inline'>
			<input type='checkbox' class = 'r_pc' ${(room.r_pc eq 'O')?'checked': ''}>PC
			<input type = 'hidden' name = 'r_pc' value = 'X'>
		</label>
	</div>
	</div>
	<hr>
	
	<h5>숙박정보</h5>
	<div class = 'w3-row'>
	<div class='w3-quarter'>
		<h6>숙박 입실시간</h6>
		<input type='time' class='form-control checkin' name='checkin' style = 'text-align:center;' value = '${room.checkin}'>
	</div>
	
	<div class='w3-quarter'>
		<h6>숙박 퇴실시간</h6>
		<input type='time' class='form-control checkout' name='checkout' style = 'text-align:center;' value = '${room.checkout}'>
	</div>
	
	<div class='w3-quarter'>
		<h6>숙박 평일가격</h6>
		<input type='number' class='form-control weekdays' name='weekdays' style = 'text-align:center;' value = '${room.weekdays}'>
	</div>
	<div class='w3-quarter'>
		<h6>숙박 주말가격</h6>
		<input type='number' class='form-control weekends' name='weekends' style = 'text-align:center;' value = '${room.weekends}'>
	</div>
	</div>
	<hr>
	<h5 onclick='dropdowns(0)'>대실정보</h5>
	<div class = 'short_stay0 w3-row w3-hide w3-animate-opacity'>
	<div class='w3-quarter'>
		<h6>대실이용시간</h6>
		<input type='time' class='form-control checkinS' name='checkins' style = 'text-align:center;' value = '${room.checkins}'>
	</div>
	
	<div class='w3-quarter'>
		<h6>대실 퇴실시간</h6>
		<input type='time' class='form-control checkoutS' name='checkouts' style = 'text-align:center;' value = '${room.checkouts}'>
	</div>
	
	<div class='w3-quarter'>
		<h6>대실 평일가격</h6>
		<input type='number' class='form-control weekdaysS' name='weekdayss' style = 'text-align:center;' value = '${room.weekdayss}'>
	</div>
	<div class='w3-quarter'>
		<h6>대실 주말가격</h6>
		<input type='number' class='form-control weekendsS' name='weekendss' style = 'text-align:center;' value = '${room.weekendss}'>
	</div>
	</div>
	<hr>
	<div class = w3-row>
	<h5>방정보</h5>
	<textarea class="form-control rcontent" name = "rcontent" rows="3">${room.rcontent}</textarea>
	</div>
	<hr>
  </div>
  <button type='button' class='btn btn-primary btn-block' onclick = 'close_modal(this);addIcons(${cntb});'>닫기</button>
  <br>
  </div>
  </div>
</div>
</div>
</div>
</div>
</c:forEach>
</div>


<!-- modal list -->
  <div id="insert_info" class="w3-modal w3-center" style = 'z-index: 11'>
    <div class="w3-modal-content w3-animate-opacity w3-card-4 w3-round-large">
            <span onclick="document.getElementById('insert_info').style.display='none'" 
       class="w3-button w3-hover-white w3-xxlarge w3-display-topright w3-round-large">×</span>
	  <br>
      <div class="w3-container">
      <br/>
  <!-- One "tab" for each step in the form: -->
		<div class="tab">
		<h3>다음 항목을 상세히 입력해주세요.</h3>
		
		
	<div class = "w3-row">
	<div class="w3-half">
		<div class="input-group">
			<span class="input-group-addon">업체이름</span>
			<input class="form-control" id = "aname1" name="aname" oninput="this.className = 'form-control';" value = "${vo.aname}">
   	    </div>
		</div>
		<div class = "w3-half">
		<div>
			<select class= 'w3-select form-control' name  = 'part'>
			  	<option ${(vo.freeparking eq '리조트')?'selected': ''}>리조트</option>
				<option ${(vo.freeparking eq '호텔')?'selected': ''}>호텔</option>
				<option ${(vo.freeparking eq '모텔')?'selected': ''}>모텔</option>
				<option ${(vo.freeparking eq '게스트하우스')?'selected': ''}>게스트하우스</option>
				<option ${(vo.freeparking eq '캠핑장')?'selected': ''}>캠핑장</option>
			</select>
		</div>
		</div>
		</div>
			
						
			<div class = "w3-row">
			<div class = "w3-half">
			<div class="input-group">
				<span class="input-group-addon">위&ensp;&ensp;&ensp;&ensp;치</span>
			<div class = "form-inline">
				<div id = "result1">
				</div>
			</div> 
			</div>
			</div>
 			<div class = "w3-half">
				<div id = "result2">
				</div>
			</div>
			</div>
			
			  <div class="input-group">
			  <span class="input-group-addon">상세주소</span>
			    <input type="text" class="form-control"  name='address3' id='rjuso' name='address3' id='rjuso' value = "${vo.address3}">
			    <div class="input-group-btn">
			      <button type = 'button' class="btn btn-default" id='findAdd' onclick="findAddress()" style = 'padding: 9px;'>
			        <i class="glyphicon glyphicon-search"></i>
			      </button>
			    </div>
			  </div>
			  
			 <div id='map' style="width:100%;height:400px;">
 			</div>
	  	</div>
	  		
		  <div class="tab"><h3>선택하세요:</h3>
		    <div id = "text-center">
			<label class="checkbox-inline">
			   <input type="checkbox" name = "freeparking" ${(vo.freeparking eq 'O')?'checked': ''} value = "O">무료주차
			</label>
			<label class="checkbox-inline">
			   <input type="checkbox" name = "freewifi" ${(vo.freewifi eq 'O')?'checked': ''} value = "O">와이파이
			</label>
			<label class="checkbox-inline">
			   <input type="checkbox" name = "freemeal" ${(vo.freemeal eq 'O')?'checked': ''} value = "O">아침식사
			</label>
			<label class="checkbox-inline">
			   <input type="checkbox" name = "pool" ${(vo.pool eq 'O')?'checked': ''} value = "O">풀장
			</label>
		 	<label class="checkbox-inline">
			   <input type="checkbox" name = "nosmoking" ${(vo.nosmoking eq 'O')?'checked': ''} value = "O">금연방
			</label>   
		 	<label class="checkbox-inline">
			   <input type="checkbox" name = "fitness" ${(vo.fitness eq 'O')?'checked': ''} value = "O">헬스장
			</label>
 
		   	</div>
		  </div>
		  <div class="tab"><h3>다음 항목을 상세히 기록해주세요.</h3>
		  	<div class = "w3-row">
			<div class = "w3-half">
				<div class="input-group">
				    <span class="input-group-addon" >업체번호</span>
				    <input class="form-control" id = "phone1" name ="phone" oninput="this.className = 'form-control'" value = "${vo.phone}">
			  	</div>
		  	</div>
		  	<div class = "w3-half">
			  	<div class="input-group">
				    <span class="input-group-addon" >이  &nbsp;메 &nbsp;일</span>
				    <input class="form-control" id = "email1" name ="email" oninput="this.className = 'form-control'" value = "${vo.email}">
			  	</div>
		  	</div>
			</div>
		  
		  
		  	<div class="input-group">
			    <span class="input-group-addon" >주차공간</span>
			    <input class="form-control" name ="parkingspace" oninput="this.className = 'form-control'" value = "${vo.parkingspace}">
		  	</div> 
		  	<div class="input-group">
			    <span class="input-group-addon" >업체설명</span>
			    <textarea class="form-control" id = "content1" name = "content" rows="3" oninput="this.className = 'form-control'">${vo.content}</textarea>
		  	</div>
		  	<div id = "text-center">
			  	<input type="radio" name="privacy" ${(vo.privacy eq 'private')?'checked': ''} value = "private">비공개
		  		<input type="radio" name="privacy" ${(vo.privacy eq 'private')?'checked': 'checked'} value = "public">공개
			</div>
		  </div>
		  <br>
		  <div style="overflow:auto;">
		  	  <button class = "button_insert" type="button" id="nextBtn" onclick="nextPrev(1)" style="float:right;">다음</button>
		      <button class = "button_insert" type="button" id="prevBtn" onclick="nextPrev(-1)" style="float:right;">이전</button>
		  </div>
	  <!-- Circles which indicates the steps of the form: -->
		  <div style="text-align:center;margin-top:10px;">
		    <span class="step"></span>
		    <span class="step"></span>
		    <span class="step"></span>
		  </div>
		  <br><br>
		</div>
  	</div>
 </div>
<input type = "hidden" name = "worker" value = "${vo.worker}">
</form>

<div class="container-fluid">
  <div class="w3-row w3-content">
  <span id = "content2"></span>
  </div>
  <div class = "w3-row">
<div class = "w3-half">
<div><i class="fa fa-phone w3-text-red"></i> <span id = "phone2">+00 000000</span></div>
</div>
<div class = "w3-half">
<div><i class="fa fa-envelope w3-text-red"></i> <span id = "email2">mail@mail.com</span></div>
</div>
</div>
</div>


<div class='floating' style = 'z-index: 12;'>
<div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '수정하기' onclick = 'modify();'><i class="fa fa-save" style = 'padding: 5px;'></i></button></div><br>
<div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '삭제' onclick = 'del()'><i class="fa fa-trash-o" style = 'padding: 5px 7px 5px 7px;'></i></button></div><br>
<div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '방 추가' onclick = 'add(this); addRoom();'><i class="fa fa-plus-square-o" style = 'padding: 6px;'></i></button></div><br>
<div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '방 삭제' onclick = 'del(); addRoom();'><i class="fa fa-minus-square-o" style = 'padding: 6px;'></i></button></div><br>
<div class='w3-xxlarge'><button type="button" class="w3-indigo w3-animate-opacity w3-hover-red w3-round-large" title = '나가기' onclick = 'view()'><i class="fa fa-sign-out" style = 'padding: 5px;'></i></button></div>
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



<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=uJlO5e3KXL6BKDiiZFmv&submodules=geocoder"></script>
<script> 
function findAddress(){         // 주소 찾기 버튼 클릭시
    var address1 = document.getElementById("address1").value;
   var address2 = document.getElementById("address2").value; 
   var rjuso = document.getElementById("rjuso").value;
   
   var juso = address1 + " " + address2 + " " + rjuso; 

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
    
   	var address1 = $('select.address1').attr('data-type');
   	$('select.fruit option[value=' + address1 + ']').attr('selected', 'selected');
});

si();
addRoom();
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
				str1 += "<select class= 'form-control' id = 'address1' name  = 'address1' id = 'address1' onchange = 'gu(); address();'>";
			for(var i=0; i<data1[0].location1.length; i++){
				str1 += "<option>" +data1[0].location1[i]+ "</option>";
			}
				str1 += "</select>";
				rs1.innerHTML = str1;
		}
	}
	
	xhr2.onreadystatechange = function(){
		if(xhr2.status == 200 && xhr2.readyState==4){
			var add = document.getElementById("address1");
			var index= add.selectedIndex;
			var rs2 = document.getElementById("result2");
			var temp2 = xhr2.responseText;
			var data2 = JSON.parse(temp2);
			
			
			var str2 = "<select class= 'form-control' id = 'address2' name  = 'address2' id = 'address2' onchange = 'address()'>";
			for(i=0; i<data2[index].district.length; i++){
				str2 += "<option>" +data2[index].district[i]+ "</option>";
					}
				str2 += "</select>";
				rs2.innerHTML = str2;
			
		}
	}
}

/* json으로 구 목록 나타내기 */
	function gu(){
		var add = document.getElementById("address1");
		var add2 = document.getElementById("address2");
		add.className = "form-control";
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
					str += "<select class= 'form-control' id = 'address2' name  = 'address2' onchange = 'address()'>";
				for(i=0; i<data[index].district.length; i++){
					str += "<option ${(vo.address2 eq '"+data[index].district[i]+"')?'checked': ''}>" +data[index].district[i]+ "</option>";
						}
					str += "</select>";
				rs.innerHTML = str;
			}
		}
	}


function readURL(input) {
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


function addRoom(){
$.event.special.inputchange = {
	    setup: function() {
	        var self = this, val;
	        $.data(this, 'timer', window.setInterval(function() {
	            val = self.value;
	            if ( $.data( self, 'cache') != val ) {
	                $.data( self, 'cache', val );
	                $( self ).trigger( 'inputchange' );
	            }
	        }, 20));
	    },
	    teardown: function() {
	        window.clearInterval( $.data(this, 'timer') );
	    },
	    add: function() {
	        $.data(this, 'cache', this.value);
	    }
	};

	//accommodation 자동 완성
	$('#aname1').on('inputchange', function() {
	    $('#aname2').text(this.value);
	});

	$('#content1').on('inputchange', function() {
	    $('#content2').text(this.value);
	});
	
	$('#phone1').on('inputchange', function() {
	    $('#phone2').text(this.value);
	});
	
	$('#email1').on('inputchange', function() {
	    $('#email2').text(this.value);
	});
	

    var checkin = document.getElementsByClassName("checkin");
    var checkinN = document.getElementsByClassName("checkinN");
    var checkout = document.getElementsByClassName("checkout");
    var checkoutN = document.getElementsByClassName("checkoutN");
    var checkinS = document.getElementsByClassName("checkinS");
    var checkinSN = document.getElementsByClassName("checkinSN");
    var checkoutS = document.getElementsByClassName("checkoutS");
    var checkoutSN = document.getElementsByClassName("checkoutSN");
    var weekdays = document.getElementsByClassName("weekdays");
    var weekdaysN = document.getElementsByClassName("weekdaysN");
    var weekdaysS = document.getElementsByClassName("weekdaysS");
    var weekdaysSN = document.getElementsByClassName("weekdaysSN");
    var weekends = document.getElementsByClassName("weekends");
    var weekendsN = document.getElementsByClassName("weekendsN");
    var weekendsS = document.getElementsByClassName("weekendsS");
    var weekendsSN = document.getElementsByClassName("weekendsSN");
    var room = document.getElementsByClassName("room");
    var roomN = document.getElementsByClassName("roomN");
    var rcontent = document.getElementsByClassName("rcontent");
    var rcontentN = document.getElementsByClassName("rcontentN");
    
	for (let i = 0; i < rcontent.length; i++) {
		$(rcontent[i]).on('inputchange', function() {
	    $(rcontentN[i]).text(this.value);
		});
	}
    

 	for (let i = 0; i < checkin.length; i++) {
		$(checkin[i]).on('inputchange', function() {
	    $(checkinN[i]).text(this.value);
		});
	}
	
	for (let i = 0; i < checkout.length; i++) {
		$(checkout[i]).on('inputchange', function() {
	    $(checkoutN[i]).text(this.value);
		});
	}
	
	for (let i = 0; i < checkinS.length; i++) {
		$(checkinS[i]).on('inputchange', function() {
	    $(checkinSN[i]).text(this.value);
		});
	}
	
	for (let i = 0; i < checkoutS.length; i++) {
		$(checkoutS[i]).on('inputchange', function() {
	    $(checkoutSN[i]).text(this.value);
		});
	}
	
	for (let i = 0; i < weekdays.length; i++) {
		$(weekdays[i]).on('inputchange', function() {
	    $(weekdaysN[i]).text(this.value);
		});
	}
	
	for (let i = 0; i < weekdaysS.length; i++) {
		$(weekdaysS[i]).on('inputchange', function() {
	    $(weekdaysSN[i]).text(this.value);
		});
	}
	
	for (let i = 0; i < weekends.length; i++) {
		$(weekends[i]).on('inputchange', function() {
	    $(weekendsN[i]).text(this.value);
		});
	}
	
	for (let i = 0; i < weekendsS.length; i++) {
		$(weekendsS[i]).on('inputchange', function() {
	    $(weekendsSN[i]).text(this.value);
		});
	}
	
	for (let i = 0; i < room.length; i++) {
		$(room[i]).on('inputchange', function() {
	    $(roomN[i]).text(this.value);
		});
	}	
}

	function addIcons(num){
		num = num-1;
		var facilities = document.getElementsByClassName("facilities");
		var r_wifi = document.getElementsByClassName("r_wifi");
		var r_breakfast = document.getElementsByClassName("r_breakfast");
		var r_bath = document.getElementsByClassName("r_bath");
		var r_tv = document.getElementsByClassName("r_tv");
		var r_pc = document.getElementsByClassName("r_pc");
		
		
		$(facilities[num]).text('');
		if($(r_wifi[num]).is(':checked')) {
			$(r_wifi[num]).next().val("O");
			$(facilities[num]).append("<i class = 'flaticon-wifi'></i>");
		}else{
			$(r_wifi[num]).next().val("X");
		}

		if($(r_tv[num]).is(':checked')) {
			$(r_tv[num]).next().val("O");
			$(facilities[num]).append("<i class = 'flaticon-television'></i>");
		}else{
			$(r_tv[num]).next().val("X");
		}
	
		if($(r_breakfast[num]).is(':checked')) {
			$(r_breakfast[num]).next().val("O");
			$(facilities[num]).append("<i class = 'flaticon-breakfast'></i>");
		}else{
			$(r_breakfast[num]).next().val("X");
		}
	
		if($(r_bath[num]).is(':checked')) {
			$(r_bath[num]).next().val("O");
			$(facilities[num]).append("<i class = 'flaticon-bathtub-with-opened-shower'></i>");
		}else{
			$(r_bath[num]).next().val("X");
		}
	
		if($(r_pc[num]).is(':checked')) {
			$(r_pc[num]).next().val("O");
			$(facilities[num]).append("<i class = 'flaticon-pc-computer-with-monitor'></i>");
		}else{
			$(r_pc[num]).next().val("X");
		}
	}
	
function address(){
	var address1 = document.getElementById("address1");
	var address2 = document.getElementById("address2");
	
	var addr1 = document.getElementById("addr1");
	var addr2 = document.getElementById("addr2");
	
	address1 = address1.options[address1.selectedIndex].value;
	address2 = address2.options[address2.selectedIndex].value;
	addr1.innerHTML = address1;
	addr2.innerHTML = address2;
	}

function open_modal(modal){
	$(modal).parent().parent().parent().next().css('display', 'block');
}


function close_modal(modal){
 	$(modal).parent().parent().css('display', 'none');
}

	
/* step form */
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the crurrent tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
	  document.getElementById("nextBtn").innerHTML = "닫기";
  } else {
	document.getElementById("nextBtn").innerHTML = "다음";
    document.getElementById("nextBtn").style.display = "block";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  
  if(currentTab ==2){
	$('#facilities').text('');
	if($('#freewifi').is(':checked')) {
		$('#facilities').append("<i class = 'flaticon-wifi'></i>");
	}
	if($('#freeparking').is(':checked')) {
		$('#facilities').append("<i class = 'flaticon-parking'></i>");
	}
	if($('#freemeal').is(':checked')) {
		$('#facilities').append("<i class = 'flaticon-breakfast'></i>");
	}
	if($('#pool').is(':checked')) {
		$('#facilities').append("<i class = 'flaticon-swimming-silhouette'></i>");
	}
	if($('#nosmoking').is(':checked')) {
		$('#facilities').append("<i class = 'flaticon-no-smoking-sign'></i>");
	}
	if($('#fitness').is(':checked')) {
		$('#facilities').append("<i class = 'flaticon-exercise'></i>");
	}
  }
  if (currentTab >= x.length) {
	  document.getElementById('insert_info').style.display='none';
	  currentTab = currentTab - n;
	  }
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, z, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  z = x[currentTab].getElementsByTagName("select");
  j = x[currentTab].getElementsByTagName("textarea");
  
  
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == '') {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  
  for (i = 0; i < z.length; i++) {
	    // If a field is empty...
	    if (z[i].value == '') {
	      // add an "invalid" class to the field:
	      z[i].className += " invalid";
	      // and set the current valid status to false
	      valid = false;
	 }
   }

  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
	    document.getElementsByClassName("step")[currentTab].className += " finish";
	  }
	  return valid; // return the valid status
	}

	function fixStepIndicator(n) {
	  // This function removes the "active" class of all steps...
	  var i, x = document.getElementsByClassName("step");
	  for (i = 0; i < x.length; i++) {
	    x[i].className = x[i].className.replace(" active", "");
	  }
	  //... and adds the "active" class on the current step:
	  x[n].className += " active";
	}
	
	function add(){
		var num = document.getElementsByClassName("index").length;
		var index = num+1;
		var cnt = (num*5)+1;

		var room_zone = document.getElementById("room_zone");
		var div = document.createElement("div");
		var div1 = document.createElement("div");
		
		
		var str = "<div class='container-fluid'>"
			+"<input type = 'text' name = 'pserial' value = '${vo.serial}'>"
				+ "<div class='container'>"
				 +"<div class='row'>"
				    +"<div class='col-lg-6 col-md-12'>"
				    +"<br/>"
					+"<div id='myCarousel"+index+"' class='carousel slide' data-interval='0'>"
					    +"<ol class='carousel-indicators'>"
					      +"<li data-target='#myCarousel"+index+"' data-slide-to='0' class='active'></li>"
					      +"<li data-target='#myCarousel"+index+"' data-slide-to='1'></li>"
				 	      +"<li data-target='#myCarousel"+index+"' data-slide-to='2'></li>"
					      +"<li data-target='#myCarousel"+index+"' data-slide-to='3'></li>"
					      +"<li data-target='#myCarousel"+index+"' data-slide-to='4'></li>"
					    +"</ol>"
					    +"<div class='carousel-inner' role='listbox'>"
					      +"<div class='item active'>"
							+"<div class = 'file_input'>"
							  +"<label style='width:100%;'>"
								  +"<img class='w3-image rimage' src='./imgs/upload_pic_r.jpg' alt='The Hotel'> "
								  +"<input type='file' class = 'file_check' name = 'attfile"+(cnt++)+"' onchange='readURL(this)'>"
							  +"</label>"
							+"</div>"
					      +"</div>"
					
					      +"<div class='item'>"
							+"<div class = 'file_input'>"
							  +"<label style='width:100%;'>"
								  +"<img class='w3-image rimage' src='./imgs/upload_pic_r.jpg' alt='The Hotel'> "
								  +"<input type='file' class = 'file_check' name = 'attfile"+(cnt++)+"' onchange='readURL(this)'>"
							  +"</label>"
							+"</div>"
					      +"</div>"
					    
					      +"<div class='item'>"
							+"<div class = 'file_input'>"
							  +"<label style='width:100%;'>"
								  +"<img class='w3-image rimage' src='./imgs/upload_pic_r.jpg' alt='The Hotel'> "
								  +"<input type='file' class = 'file_check' name = 'attfile"+(cnt++)+"' onchange='readURL(this)'>"
							  +"</label>"
							+"</div>"
					      +"</div>"
					      
					      +"<div class='item'>"
							+"<div class = 'file_input'>"
							  +"<label style='width:100%;'>"
								  +"<img class='w3-image rimage' src='./imgs/upload_pic_r.jpg' alt='The Hotel'> "
								  +"<input type='file' class = 'file_check' name = 'attfile"+(cnt++)+"' onchange='readURL(this)'>"
							  +"</label>"
							+"</div>"
					      +"</div>"
					      
					      +"<div class='item'>"
							+"<div class = 'file_input'>"
							  +"<label style='width:100%;'>" 
								  +"<img class='w3-image rimage' src='./imgs/upload_pic_r.jpg' alt='The Hotel'> "
								  +"<input type='file' class = 'file_check' name = 'attfile"+(cnt++)+"' onchange='readURL(this)'>"
							  +"</label>"
							+"</div>"
					      +"</div>"
					    +"</div>"
					
					    +"<!-- Left and right controls -->"
					    +"<a class='left carousel-control' href='#myCarousel"+index+"' data-slide='prev'>"
					      +"<span class='glyphicon glyphicon-chevron-left' ></span>"
					      +"<span class='sr-only'>Previous</span>"
					    +"</a>"
					    +"<a class='right carousel-control' href='#myCarousel"+index+"' data-slide='next'>"
					      +"<span class='glyphicon glyphicon-chevron-right'></span>"
					      +"<span class='sr-only'>Next</span>"
					    +"</a>"
					+"</div>"
					+"<br>"
					+"</div>"
					
					+"<div class='col-lg-6 col-md-12' id = 'col_imgs'>"
					+"<br/>"
					+"<div class = 'w3-content'>"
					+"<div class = 'w3-row'>"
					+"<h4 class = 'w3-center roomN'>방이름</h4>"
					+"<div class = 'w3-center facilities'><h4 class = 'w3-center'></h4></div>"
					+"</div>"
					+"<hr>"
					+"<div class = 'w3-row'>"
					+"<div class = 'w3-half w3-center'>"
					+"<span>숙박 입실시간: </span><span class = 'checkinN'></span><br>"
					+"<span>숙박 퇴실시간: </span><span class = 'checkoutN'></span>"
						
					+"<div class = 'w3-hide w3-animate-opacity short_stay"+index+"'>"
					+"<span>대실 이용시간: </span><span class = 'checkinSN'></span><br>"
					+"<span>대실 퇴실시간: </span><span class = 'checkoutSN'></span>"
					+"</div>"
					+"</div>"
					+"<div class = 'w3-half w3-center'>"
					+"<span>숙박 평일가격: </span><span class = 'weekdaysN'></span><br>"
					+"<span>숙박 주말가격: </span><span class = 'weekendsN'></span>"
					+"<div class = 'w3-hide w3-animate-opacity short_stay"+index+"'>"
					+"<span>대실 평일가격: </span><span class = 'weekdaysSN'></span><br>"
					+"<span>대실 주말가격: </span><span class = 'weekendsSN'></span>"
					+"</div>"
					+"</div>"
						+"</div>"
						+"<hr>"
						+"<div class = 'w3-row'>"
						+"<h5 class='rcontentN w3-center' style = 'padding-right: 15%; padding-left: 15%;'>방에 대한 정보</h5>"
						+"</div>"
						+"<hr>"
						+"<div class = 'w3-row'>"
						+"<p class = 'w3-button w3-block' onclick = 'open_modal(this)'><i class = 'fa fa-edit' style = 'cursor:pointer;'></i>편집</p>"
						+"</div>"
						+"</div>"
						+"</div>"
		
				+"<!-- modal list -->"
				+"<div id='insert_room_info1' class='w3-modal w3-center'>"
				  +"<div class='w3-modal-content w3-animate-opacity w3-card-4 w3-round-large'>"
					+"<br/>"
					+"<div class = 'w3-container'>"
					+"<div class = 'w3-row'>"
					+"<div class='input-group w3-quarter'>"
						+"<span class='input-group-addon'>방이름</span>"
						+"<input type='text' class='form-control room' name='room' style = 'width: 95%; text-align:right;'>"
					+"</div>"
					+"<div class='input-group w3-quarter'>"
						+"<span class='input-group-addon'>방개수</span>"
						+"<input type='number' class='form-control' name='room_num' style = 'width: 95%; text-align:right;'>"
					+"</div>"

					+"<div class='w3-twoquarter w3-center' style = 'margin-top: 7px;'>"
						+"<label class='checkbox-inline'>"
							+"<input type='checkbox' class = 'r_wifi'>와이파이"
							+"<input type = 'hidden' name = 'r_wifi' value = 'X'>"
						+"</label>"
						+"<label class='checkbox-inline'>"
							+"<input type='checkbox' class = 'r_bath'>욕조"
							+"<input type = 'hidden' name = 'r_bath' value = 'X'>"
						+"</label>"
						+"<label class='checkbox-inline'>"
							+"<input type='checkbox' class = 'r_breakfast'>조식"
							+"<input type = 'hidden' name = 'r_breakfast' value = 'X'>"
						+"</label>"
						+"<label class='checkbox-inline'>"
							+"<input type='checkbox' class = 'r_tv'>TV"
							+"<input type = 'hidden' name = 'r_tv' value = 'X'>"
						+"</label>"
						+"<label class='checkbox-inline'>"
							+"<input type='checkbox' class = 'r_pc'>PC"
							+"<input type = 'hidden' name = 'r_pc' value = 'X'>"
						+"</label>"
					+"</div>"
					
					
					+"</div>"
					+"<hr>"
					
					+"<h5>숙박정보</h5>"
					+"<div class = 'w3-row'>"
					+"<div class='w3-quarter'>"
						+"<h6>숙박 입실시간</h6>"
						+"<input type='time' class='form-control checkin' name='checkin' style = 'text-align:center;'>"
					+"</div>"
					
					+"<div class='w3-quarter'>"
						+"<h6>숙박 퇴실시간</h6>"
						+"<input type='time' class='form-control checkout' name='checkout' style = 'text-align:center;'>"
					+"</div>"
					
					+"<div class='w3-quarter'>"
						+"<h6>숙박 평일가격</h6>"
						+"<input type='number' class='form-control weekdays' name='weekdays' style = 'text-align:center;'>"
					+"</div>"
					+"<div class='w3-quarter'>"
						+"<h6>숙박 주말가격</h6>"
						+"<input type='number' class='form-control weekends' name='weekends' style = 'text-align:center;'>"
					+"</div>"
					+"</div>"
					+"<hr>"
					+"<h5 onclick='dropdowns("+index+")'>대실정보(대실기능 추가를 원하지 않으시면 빈칸상태로 닫아주세요.)</h5>"
					+"<div class = 'w3-row w3-hide w3-animate-opacity short_stay"+index+"'>"
					+"<div class='w3-quarter'>"
						+"<h6>대실 입실시간</h6>"
						+"<input type='time' class='form-control checkinS' name='checkins' style = 'text-align:center;'>"
					+"</div>"
					
					+"<div class='w3-quarter'>"
						+"<h6>대실 퇴실시간</h6>"
						+"<input type='time' class='form-control checkoutS' name='checkouts' style = 'text-align:center;'>"
					+"</div>"

					+"<div class='w3-quarter'>"
						+"<h6>대실 평일가격</h6>"
						+"<input type='number' class='form-control weekdaysS' name='weekdayss' style = 'text-align:center;'>"
					+"</div>"
					+"<div class='w3-quarter'>"
						+"<h6>대실 주말가격</h6>"
						+"<input type='number' class='form-control weekendsS' name='weekendss' style = 'text-align:center;'>"
					+"</div>"
					+"</div>"
					+"<hr>"
					+"<div class = 'w3-row'>"
					+"<h5>방정보</h5>"
					+"<textarea class='form-control rcontent' name = 'rcontent' rows='3'></textarea>"
					+"</div>"
					+"<hr>"
				  +"</div>"
				  +"<button type='button' class='btn btn-primary btn-block' onclick = 'close_modal(this);addIcons("+index+");'>닫기</button>"
				  +"<br>"
				  +"</div>"
				  +"</div>"
				  +"</div>" 
				  +"</div>"
				  +"</div>"
		div.innerHTML = str;
		room_zone.appendChild(div);
		room_zone.appendChild(div1);
		
	}
	
	function del(){
		var room_zone = document.getElementById("room_zone");
		var room_length = room_zone.childNodes.length-1;
		var data_index = document.getElementsByClassName("data_index").length;
		var num = document.getElementsByClassName("index").length;
		var i, rserial = document.getElementsByClassName("rserial");
		var rserial_list = document.getElementById("rserial_list");
		var div = document.createElement("div");
		var str = "<input type = 'text' class = 'rserial' name = 'rserial' value ='"+num+"'>";
		div.innerHTML = str;
		
		if(room_zone.lastChild != null && num>1){
		room_zone.removeChild(room_zone.childNodes[room_length]);
 		room_zone.removeChild(room_zone.childNodes[room_length-1]);
 		
 		if(rserial.length==0 && data_index>=num){
 			rserial_list.appendChild(div);
 		}else if(rserial.length !=0 && data_index>=num){
 		for(i = 0; i<rserial.length; i++){
 			if(rserial[i].value != num && rserial[i].value<num){
 				rserial_list.appendChild(div);	
 				}
 			}
 		}
		}else{
			$('#msg').text("최소 한개의 방정보가 필요합니다.");
			document.getElementById('show_msg').style.display='block';
		}
	}

	var x = document.getElementsByClassName("example");
	var i;
	for (i = 0; i < x.length; i++) {
	    x[i].style.backgroundColor = "red";
	}
	
	function dropdowns(id) {
	    var x = document.getElementsByClassName("short_stay"+id);
	    
		var i;
		for (i = 0; i < x.length; i++) {
		    if (x[i].className.indexOf("w3-show") == -1) {
		        x[i].className += " w3-show";
		    } else { 
		        x[i].className = x[i].className.replace(" w3-show", "");
		    }
		}
	}
	
	function modify(){
		var frm  = document.frm_modify;
		var insert_info = document.getElementById("insert_info");
		var f = document.getElementsByClassName("file_check");
		var y = insert_info.getElementsByTagName("input");
		var z = insert_info.getElementsByTagName("textarea");
		var x = insert_info.getElementsByTagName("select");
		  for (let i = 0; i < y.length; i++) {
			    // If a field is empty...
			    if (y[i].value == '') {
			    	$('#msg').text("숙박업체 정보를 확인해주세요.");
			    	document.getElementById('show_msg').style.display='block';
			    	return;
			    }
			  }
		  
		  for (let i = 0; i < z.length; i++) {
			    if (z[i].value == '') {
			    	$('#msg').text("숙박업체 정보를 확인해주세요.");
			    	document.getElementById('show_msg').style.display='block';
			    	return;
			    }
			  }
		  
		  for (let i = 0; i < x.length; i++) {
			    if (x[i].value == '') {
			    	$('#msg').text("숙박업체 정보를 확인해주세요.");
			    	document.getElementById('show_msg').style.display='block';
			    	return;
			    }
			  }
			    
			for (let i = 0; i < (f.length-1)/5; i++) {
			    if (f[(i*5)+1].value == '') {
			    	$('#msg').text("방 추가를 원하시면 첫번째 사진란을 채워주세요");
			    	document.getElementById('show_msg').style.display='block';
			    	return;
			    }
			  }
	 	
		 	$('#msg').text("숙박업체 정보가 변경 되었습니다.");
			document.getElementById('show_msg').style.display='block';
			frm.action = "modify.ac";
			frm.submit();
		} 

	function view(){
		var frm = document.frm_back;
		frm.action = "selectOne.ac";
		frm.submit();
	}
</script>


</body>
</html>