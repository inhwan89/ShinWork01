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
jQuery(document).ready(function(){
    
    var select = $("select#color");
    
    select.change(function(){
        var select_name = $(this).children("option:selected").text();
        $(this).siblings("label").text(select_name);
    });
});
</script>
<style>
#reservation_acc{margin: auto;width: 55%;padding: 45px; background: linear-gradient(180deg, #041c42 40%, #ccd4e0 100%);  border-radius: 15px 15px 0 0;}
#reservation_acc h2{border-bottom: 3px solid #036; padding-bottom: 5px;}
#reservation_acc .container-fluid{margin: 0; width: 100%; padding: 15px; margin-bottom: 12px; background-color:#ffffff; border-radius: 15px;  box-shadow: 0px 0px 25px -5px rgba(0, 0, 0, 0.8);}
#reservation_acc .input-group-addon{width: 250px; background-color: #000000; opacity: 0.6; color: #ffffff; font-weight: bold;} 
#reservation_acc .form-control text-center{background-color: #ffffff;}
#reservation_acc .input_div{width: 100%; padding: 15px; padding-top: 18px;  opacity: 0.8;}
#reservation_acc .input-group{padding-left: 27px; width: 96.5%; font-weight: bold;}
#reservation_acc #checkInOut{margin: 0; width: 100%; padding-left: 5%; margin-bottom: 25px; font-weight: bold;}
#reservation_acc .checkOut{margin-left: 5px; margin-right: 5px; color: #a97228;}
#reservation_acc .checkIn{margin-right: 5px; color: #a97228;}
#reservation_acc .room{margin-left: 5px; margin-right: 5px; color: #335de8;}
#reservation_acc .btnReservation_acc{margin: 0; width: 100%; padding: 20px; padding-left: 43%;}
/* selectBox / date CSS */ 
#reservation_acc div#select_box {position: relative;width: 210px;height: 40px;background: url(select_arrow.png) 180px center no-repeat; /* 화살표 이미지 */border: 1px solid #335de8;display: inline-block;}
#reservation_acc div#select_box label {position: absolute;font-size: 14px;color: #335de8;top: 9px;left: 12px;letter-spacing: 1px;}
#reservation_acc div#select_box select#color {width: 100%;height: 40px;min-height: 40px;line-height: 40px;padding: 0 10px;opacity: 0;filter: alpha(opacity=0); /* IE 8 */}
#reservation_acc [type=date]{color: #a97228;border: 1px solid #a97228;}
</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="reservation_acc">
	<form name="frm_reservation_acc" method="post">
		<input type="hidden" name="serial" value="${vo.serial }">
		<input type="hidden" name="worker" value="${vo.worker }">
		<input type="hidden" name="period" value="${vo.period }">
		<input type="hidden" name="weekendCnt" value="${vo.weekendCnt }">
		
		<div class="container-fluid">
				<div class="input_div">
				<h2 class="w3-text-blue">Reservation</h2>
					<div class="input-group">
						<div class="input-group-addon">회원명</div>
						<input type="text" class="form-control text-center"  name="irum" value = '${mem_vo.irum}' style="background-color: white;" readonly>
					</div>
					<div class="input-group">
						<div class="input-group-addon">연락처</div>
						<input type="text" class="form-control text-center" name="phone" value = '${mem_vo.phone}' style="background-color: white;" readonly>
					</div>	  	
					<div class="input-group">
						<div class="input-group-addon">마일리지</div>
						<input type="text" class="form-control text-center" name="mileage" value = '${mem_vo.mileage}' style="background-color: white;" readonly>
						<input type="hidden" name="mem_se" value="${mem_vo.serial }">
					</div>
				</div>
		
		
		<div style="text-align: center; margin-bottom: 10px;">예약일자와 방을 선택해주세요</div>
		
	
		<div id="checkInOut">
			<label class="checkIn">CheckIn</label><input type="date" onchange="cal(1)" id="startDate" name="startDate" value="${vo.startDate }">
			<label class="checkOut">CheckOut</label><input type="date" onchange="cal(2)" id="endDate" name="endDate" value="${vo.endDate }">
			<label class="room">Room</label>
			<div id="select_box">			
			<c:if test="${vo.period ==0 }">
				<label for="color">날짜를 먼저 선택해 주세요</label>
			</c:if>
			<c:if test="${vo.period !=0 }">
				<label for="color">방을 선택해 주세요</label>
			</c:if>
			<select name="select_room" id="color" title="select color" onchange="roomsel(this)">
				<c:if test="${vo.period ==0 }">
					<option disabled="disabled" selected="selected" value="">날짜를 먼저 선택해 주세요</option>
				</c:if>
				<c:if test="${vo.period !=0 }">
					<option disabled="disabled" selected="selected" value="">방을 선택해 주세요</option>
				</c:if>
				<c:forEach var="room" items="${roomlist }">
					<c:if test="${room.room_num>roomCnt.get(room.room) }">
						<option value="${room.serial }">${room.room } 예약가능(${roomCnt.get(room.room)}/${room.room_num })</option>					
					</c:if>
					<c:if test="${room.room_num<=roomCnt.get(room.room) }">
						<option class="text-danger" value="${room.serial }" disabled="disabled">${room.room } 예약불가(${roomCnt.get(room.room)}/${room.room_num })</option>					
					</c:if>
				</c:forEach>
			</select>
			</div>
		</div>		
		</div>
		<div id="result">
			
		</div>
		
		
		<div class="btnReservation_acc">
			<input type="button" name="btnReserve" class="w3-button w3-lime"  value="예약" style="border-radius: 10px;">
			<input type="button" name="btnCancle" class="w3-button w3-lime"  value="취소" style="border-radius: 10px;">
		</div>
	</form>
</div>
<div id="show_msg" class="w3-modal w3-center w3-opacity" style = 'z-index: 100'>
	<div class="w3-modal-content w3-animate-top w3-card-4 w3-round-large w3-padding">
	<span onclick="document.getElementById('show_msg').style.display='none'" class="w3-button w3-hover-white w3-xxlarge w3-display-topright w3-round-large">×</span>
         <h4 class="w3-wide w3-padding" id='msg'>
         <i class="fa fa-exclamation-circle w3-margin-right"></i>
         </h4>
        <button type="button" onclick="okFunc()" name="ok" class="btn btn-default" data-dismiss="modal" style="text-align: center;">확인</button>
	</div>
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
var frm=document.frm_reservation_acc;
frm.btnReserve.onclick=function(){
	if(frm.startDate.value==""){
		$('#msg').text("체크인 날짜를 선택해주세요.");
	    document.getElementById('show_msg').style.display='block';
		frm.startDate.focus();
	}else if(frm.endDate.value==""){
		$('#msg').text("체크아웃 날짜를 선택해주세요.");
	    document.getElementById('show_msg').style.display='block';
		frm.endDate.focus();
	}else if(frm.select_room.value==""){
		$('#msg').text("예약할 방을 선택해주세요.");
	    document.getElementById('show_msg').style.display='block';
	}else{		
		$('#msg').text("숙박 예약이 완료되었습니다.");
	    document.getElementById('show_msg').style.display='block';
	}
}
frm.btnCancle.onclick=function(){
	history.back();
}
function cal(index){
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	if(dd<10) {
	    dd='0'+dd
	} 
	if(mm<10) {
	    mm='0'+mm
	} 
	today =yyyy+'-'+mm+'-'+dd;
	if(index==1){
		if(today>startDate){
			$('#msg').text("현재날짜 이전의 날짜는 예약할 수 없습니다.");
		    document.getElementById('show_msg').style.display='block';
			frm.startDate.value="";
			return false;
		}
	}else if(index==2){
		if(today>endDate){
			$('#msg').text("현재날짜 이전의 날짜는 예약할 수 없습니다.");
		    document.getElementById('show_msg').style.display='block';
			frm.endDate.value="";
			return false;
		}
	}
	if(startDate!="" && endDate!=""){
		//-을 구분자로 연,월,일로 잘라내어 배열로 반환
		var startArray = startDate.split('-');
		var endArray = endDate.split('-');   
		//배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
		var start_date = new Date(startArray[0], startArray[1]-1, startArray[2]);
		var end_date = new Date(endArray[0], endArray[1]-1, endArray[2]);
		//날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
		if(start_date.getTime() >= end_date.getTime()) {
			$('#msg').text("현재날짜 이전의 날짜는 예약할 수 없습니다.");
		    document.getElementById('show_msg').style.display='block';
			if(index==1){
				frm.startDate.value="";
			}else if(index==2){
				frm.endDate.value="";
			}
			return false;
		}
		var period = (end_date-start_date)/(24 * 60 * 60 * 1000);
		frm.period.value=period;
		frm.action="reservation_acc.reserve";
		frm.submit();
	}
}
function okFunc(){
    if($('#msg').text() =="숙박 예약이 완료되었습니다."){
    	frm.action="reservation_acc_result.reserve";
		frm.submit();
    }
    else{
       document.getElementById('show_msg').style.display='none';      
    }
 }
function roomsel(obj){ 
	      
	    var url="reservation_acc_room.reserve";  
	    var weekendCnt=frm.weekendCnt.value;
	    var period=frm.period.value;
	    var param={"serial":obj.value,"weekendCnt":weekendCnt,"period":period};  
	  
	    $.ajax({      
	        type:"POST",  
	        url:url,      
	        data:param,      
	        success:function(args){   
	            $("#result").html(args);      
	        },  
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });  
	    

}
</script>
</body>
</html>