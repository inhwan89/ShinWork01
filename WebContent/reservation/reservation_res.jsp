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
#reservation_res{margin: auto;width: 65%;padding: 45px; background: linear-gradient(180deg, #041c42 40%, #ccd4e0 100%);  border-radius: 15px 15px 0 0;}
#reservation_res h2{border-bottom: 3px solid #036; padding-bottom: 5px;}
#reservation_res .container-fluid{margin: 0; width: 100%; padding: 15px; margin-bottom: 12px; background-color:#ffffff; border-radius: 15px;  box-shadow: 0px 0px 25px -5px rgba(0, 0, 0, 0.8); font-weight: bold;}
#reservation_res .input-group-addon{width: 250px; background-color: #000000; opacity: 0.6; color: #ffffff; font-weight: bold;} 
#reservation_res .form-control text-center{background-color: #ffffff;}
#reservation_res .input_div{width: 100%; padding: 15px; padding-top: 18px;  opacity: 0.8;}
#reservation_res .input-group{padding-left: 12px; width: 97%; font-weight: bold;}
#reservation_res #table_option{padding-left: 30px;}
#reservation_res .reservation_day{margin-left:100px;  margin-right: 5px; color: #a97228; padding-top: 2%; padding-bottom: 2%;}
#reservation_res .theDay{margin-right: 10px;}
#reservation_res .reservation_time{margin-left: 5px; margin-right: 5px; }
#reservation_res #option_bar{border-bottom: 3px double gray; width: 95%;}
#reservation_res .rmAttFile1{margin-left: 55px; }
#reservation_res .rmName1{margin-left: 135px; }
#reservation_res .rmExplain1{margin-left: 300px; }
#reservation_res .rmPrice1{margin-left: 240px; }
#reservation_res .rmAmount1{float:right; margin-right: 30px;}
#reservation_res .rmAttFile{margin-left: 35px;}
#reservation_res .rmName_div{display: inline-block; margin-left: 5px; line-height: 100px; width:240px; text-align:center;}
#reservation_res .rmExplain_div{display:inline-block;  width: 460px;}
#reservation_res .rmPrice_div{display:inline-block; margin-left: 5px; width: 100px; text-align: center;}
#reservation_res .btnReservation_res{margin: 0; width: 100%; padding: 20px; padding-left: 43%;}
/* selectBox / date CSS */ 
#reservation_res [type=date]{color: #a97228;border: 1px solid #a97228;font-weight: bold;}
#reservation_res #table{position: relative;width: 210px;height: 40px;background: url(select_arrow.png) 180px center no-repeat; /* 화살표 이미지 */border: 1px solid #335de8;display: inline-block;color: #335de8;}
#reservation_res  #rtime{position: relative;width: 270px;height: 40px;background: url(select_arrow.png) 180px center no-repeat; /* 화살표 이미지 */border: 1px solid #335de8;display: inline-block;color: #335de8;}
#reservation_res .reservation_time{color: #335de8;font-weight: bold;}
</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="reservation_res">
	<form name="frm_reservation_res" method="post">
		<input type="hidden" name="mem_se" value="${mem_vo.serial }">
		<input type="hidden" name="serial" value="${vo.serial }">
		<input type="hidden" name="worker" value="${rvo.mid }">
		<input type="hidden" name="holiday" value="${vo.holiday }">
			
		<div class="container-fluid">
			<div class="input_div">
				<h2 class="w3-text-blue">Reservation</h2>
					<div class="input-group">
						<span class="input-group-addon">회원명</span>
						<input type="text" class="form-control text-center" name="irum" value = '${mem_vo.irum}' readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon">연락처</span>
						<input type="text" class="form-control text-center" name="phone" value = '${mem_vo.phone}' readonly>
					</div>	  	
					<div class="input-group">
						<span class="input-group-addon">마일리지</span>
						<input type="text" class="form-control text-center" name="mileage" value = '${mem_vo.mileage}' readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon">총가격</span>
						<input type="text" class="form-control text-center" name="price" value = "0" readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon">메뉴</span>
						<input type="text" class="form-control text-center" name="menu" value = "" readonly>
					</div>
			</div>		
			
			
			
			
			
			
		<div id="table_option">
		<label class="reservation_day">예약일</label>
		<input type="date" onchange="cal()" name="rdate" id="theDay" class="theDay" value="${vo.rdate }">
		<select name="table" onchange="cal()" id="table">			
			<option value="0">테이블 수를 선택해 주세요</option>
			<c:forEach begin="1" end="${rvo.rtable }" var="i">
				<option value="${i }">${i } 테이블</option>	
			</c:forEach>
		</select>	
		<label class="reservation_time">예약시간대</label>
		<select name ="rtime" id="rtime">
			<c:if test ="${rvo.rholiday ==vo.holiday }">
				<option disabled="disabled" value="" selected >해당 요일은 매장의 정기휴일입니다</option>
			</c:if>
			<c:if test ="${rvo.rholiday !=vo.holiday }">
			<option disabled="disabled" value="" selected>예약시간을 선택해 주세요</option>
			<c:forEach var="rtime" items="${rtimelist }">
				<c:if test="${rvo.rtable-tableCnt.get(rtime)>=vo.table }">
					<option value="${rtime }">${rtime }시, 예약가능(${tableCnt.get(rtime)}/${rvo.rtable })</option>					
				</c:if>
				<c:if test="${vo.table>rvo.rtable-tableCnt.get(rtime) }">
					<option class="text-danger" value="${rtime }" disabled="disabled">${rtime }시, 예약불가(${tableCnt.get(rtime)}/${rvo.rtable })</option>					
				</c:if>
			</c:forEach>
			</c:if>
		</select>
			<p>
				<!-- 메뉴, 가격 등 설정 부분 -->
	
			<div id='option'>
			    <div id="option_bar" >
				<span class='rmAttFile1'>사진</span> 
				<span class='rmName1'>메뉴</span> 
				<span class='rmExplain1'>메뉴 설명</span> 			
				<span class='rmAmount1'>수량</span> 	
				<span class='rmPrice1'>가격</span>		
				</div>
				<br/>			
				<c:set var="cnt" value="0"/>
				<div id='menu' >
					<c:forEach var="rmvo" items='${menuList }'>
						<div style="overflow:hidden;">
						
							<img src="./restaurant/download/${menuPhotoList[cnt] }" width='100px' height='100px' style="float: left; margin-left: 20px;"> 
							
							<div class="rmName_div">
							<span class='rmName' id='rmName'>${rmvo.rmName }</span>
							</div>
							
							<div class="rmExplain_div">
								<span class='rmExplain' id='rmExplain'>${rmvo.rmExplain }</span>
							</div>
							
							<div class="rmPrice_div">
								<span class='rmPrice' id='rmPrice'>${rmvo.rmPrice }</span>
							</div>
							
							<input type="number" min="0"value="0" name="MCnt" onchange="cal2()" style="width: 90px; text-align: right;">
							<input type="hidden" value="${rmvo.rmName }" name="Mname">
							<input type="hidden" value="${rmvo.rmPrice }" name="Mprice">
							<br />
						</div>
						<br />
						<br />
						<c:set var="cnt" value="${cnt+1 }"/>
					</c:forEach>
				</div>
				<br />
			</div>
			</div>
				
			</div>
			
		<div class="btnReservation_res">
			<input type="button" name="btnReserve" class="w3-button w3-lime" value="예약" style="border-radius: 10px;">
			<input type="button" name="btnCancle" class="w3-button w3-lime" value="취소" style="border-radius: 10px;">
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
var frm=document.frm_reservation_res;
frm.table.value='${vo.table}';
frm.btnReserve.onclick=function(){
	if(frm.rdate.value==""){
		$('#msg').text("예약 날짜를 선택해주세요.");
	    document.getElementById('show_msg').style.display='block';
	}else if(frm.table.value==0){
		$('#msg').text("예약할 테이블 수를 선택해주세요.");
	    document.getElementById('show_msg').style.display='block';
	}else if(frm.rtime.value==""){
		$('#msg').text("예약할 시간을 선택해주세요.");
	    document.getElementById('show_msg').style.display='block';
	}else if(frm.price.value==0){
		$('#msg').text("예약 메뉴를 선택해주세요.");
	    document.getElementById('show_msg').style.display='block';
	}else{
		$('#msg').text("맛집 예약이 완료되었습니다.");
	    document.getElementById('show_msg').style.display='block';
	}
}
frm.btnCancle.onclick=function(){
	history.back();
}
function cal(){
	var theDay = $('#theDay').val();
	var table =$('#table').val();
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
	if(theDay!=""&&today>theDay){
		$('#msg').text("현재날짜 이전의 날짜는 예약할 수 없습니다.");
	    document.getElementById('show_msg').style.display='block';
	}else if(theDay!=""&&table!=""){
    	var startArray = theDay.split('-');
        //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
        var the_day = new Date(startArray[0], startArray[1]-1, startArray[2]);
        //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
        var week = ['일', '월', '화', '수', '목', '금', '토'];
		var dayOfWeek = week[the_day.getDay()];
		frm.holiday.value=dayOfWeek;
		frm.action="reservation_res.reserve";
		frm.submit();
	}
}
function cal2(){
	var price=0;
	var menu="";
	if('${cnt}'>1){
		for(i=0;i<'${cnt}'; i++){
			var temp = frm.MCnt[i].value*frm.Mprice[i].value;
			var temp2 = frm.Mname[i].value+" "+frm.MCnt[i].value+"개 ";
			price=price+temp;
			menu=menu+temp2;
		}
	}else{
		var temp = frm.MCnt.value*frm.Mprice.value;
		var temp2 = frm.Mname.value+" "+frm.MCnt.value+"개 ";
		price=price+temp;
		menu=menu+temp2;
	}
	frm.price.value=price;
	frm.menu.value=menu;
}
function okFunc(){
    if($('#msg').text() =="맛집 예약이 완료되었습니다."){
    	frm.action="reservation_res_result.reserve";
		frm.submit();
    }else if($('#msg').text()==("예약 날짜를 선택해주세요.")||$('#msg').text()==("현재날짜 이전의 날짜는 예약할 수 없습니다.")){
    	frm.rdate.value="";
    	frm.rdate.focus();
    	document.getElementById('show_msg').style.display='none'
    }
    else{
       document.getElementById('show_msg').style.display='none';      
    }
 }
</script>
</body>
</html>