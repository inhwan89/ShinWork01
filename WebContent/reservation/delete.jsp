<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
#delete{margin: auto; width:48%; padding: 45px; margin-bottom:45px; background: #fcfcfc;  border-radius: 10px;box-shadow: 5px 5px 15px -5px rgba(0, 0, 0, 0.8); }
#delete h2{border-bottom: 3px solid #036; padding-bottom: 5px; margin-left:60px; margin-right:60px; }
#delete #table_div{padding-left: 100px; margin-top: 10px; margin-bottom: 10px;}
#delete table{padding: 3%; text-align: center;}
#delete thead{border: 1px solid #cacdd1; text-align: center;}
#delete tbody{border: 1px solid #cacdd1; text-align: center;}
#delete td, th{ text-align: center; padding: 5px;}
</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="delete" class="w3-center">
<h2 class="w3-text-blue">Reservation Cancel</h2><br/>
<form name="frm_delete" method="post">
	<label class="w3-text-blue" style="margin-left: -30px;">취소 사유를 입력해주세요</label>
	<input type="text" name="reason" class="w3-border-blue" style="border-radius: 10px; text-align: center; color: gray; width: 420px;" >	
	<input type="hidden" name="menu" value="${vo.menu }">
	<input type="hidden" name="rdate" value="${vo.rdate }">
	<input type="hidden" name="price" value="${vo.price }">
	<input type="hidden" name="serial"  value="${vo.serial }">
	<input type="hidden" name="serial2"  value="${vo.serial2 }">
	<input type="hidden" name="reservationPage" value="${vo.reservationPage }">
	<input type="hidden" name="reservationPage2" value="${vo.reservationPage2 }">
	<input type="hidden" name="select" value="${vo.select }">
	<input type="hidden" name="mem_se" value="${vo.mem_se }">
	<input type="hidden" name="res_se" value="${vo.res_se }">
	<input type="hidden" name="acc_se" value="${vo.acc_se }">
	<div id="table_div" class="w3-center">
	<table>
	<thead>
	<tr style="border-bottom: 3px double #cacdd1;">
		<th class="w3-blue"	 style="width: 200px; text-align: center;">구분</th>
		<th class="w3-blue"	 style="width: 200px; text-align: center;">취소일</th>
		<th class="w3-blue"	 style="width: 200px; text-align: center;">반환액</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td rowspan="4" style="border-bottom: 1px solid #cacdd1;">예약자 귀책사유</td>
		<td>1주일 전</td>
		<td>100%</td>
	</tr>
	<tr>
		<td>3일전</td>
		<td>80%</td>
	</tr>
	<tr>
		<td>1일전</td>
		<td>50%</td>
	</tr>
	<tr>
		<td style="border-bottom: 1px solid #cacdd1;">당일</td>
		<td style="border-bottom: 1px solid #cacdd1;">환불 불가</td>
	</tr>
	<tr>
		<td>천재지변/관리자 사정</td>
		<td>기일 관계없이</td>
		<td>100%</td>
	</tr>
	</tbody>
	</table>
	</div>
	<p>
	<input type="button" name="btnDelete" class="w3-button w3-blue" value="예약취소">
	<input type="button" name="btnView" class="w3-button w3-blue" value="돌아가기" >
</form>
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
var frm = document.frm_delete;
frm.btnDelete.onclick=function(){
	frm.action='deleteR.reserve';
	frm.submit();
}
frm.btnView.onclick=function(){
	frm.action='view.reserve';
	frm.submit();
}
</script>
</body>
</html>