<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>
#reservation_acc_room .input_div{width: 100%; padding: 15px; padding-top: 18px;  opacity: 0.8;}
#reservation_acc_room .input-group{font-weight: bold;} 
#reservation_acc_room .input-group-addon{width: 250px; background-color: #000000; opacity: 0.6; color: #ffffff; font-weight: bold;}
</style>
</head>
<body>
<div id="reservation_acc_room">
<div class="container-fluid">
  <div class="row content">
	<br/>
	<div class="input_div">
	<div class="input-group">
		<span class="input-group-addon">방종류</span>
		<input type="text" class="form-control text-center" name="room" value = '${vo.room}' style="background: #ffffff" readonly>
	</div>
	<div class="input-group">
		<span class="input-group-addon">방개수</span>
		<input type="text" class="form-control text-center" name="room_num" value = '${vo.room_num}' style="background: #ffffff" readonly>
	</div>
		  	
	<div class="input-group">
		<span class="input-group-addon">평일가</span>
		<input  type="text" class="form-control text-center" name="weekdays" value = '${vo.weekdays}' style="background: #ffffff" readonly>
	</div>
	<div class="input-group">
		<span class="input-group-addon">주말가</span>
	<input  type="text" class="form-control text-center" name="weekends" value = '${vo.weekends}' style="background: #ffffff" readonly>
	</div>
	
	<div class="input-group">
		<span class="input-group-addon">총가격</span>
	<input  type="text" class="form-control text-center" name="price" value ="${(vo.weekends*weekendCnt)+(vo.weekdays*(period-weekendCnt))}" readonly>
	</div>
	</div>
	</div>
</div>
</div>
</body>
</html>