<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#view_res{margin: auto; width:55%; padding: 45px; background: linear-gradient(180deg, #041c42 40%, #ccd4e0 100%);  border-radius: 15px 15px 0 0; border: 1px solid blue;}
#view_res h2{border-bottom: 3px solid #036; padding-bottom: 5px; margin-left:60px; margin-right:60px; }
#view_res .container-fluid{margin: 0; width: 100%; padding: 15px; margin-bottom: 12px; background-color:#ffffff; border-radius: 15px;  box-shadow: 0px 0px 25px -5px rgba(0, 0, 0, 0.8);}
#view_res #view_div{width: 100%; padding-bottom: 25px; padding-left: 100px;}
#view_res .input-group-addon{background-color: #000000; opacity: 0.6; color: #ffffff; font-weight: bold;}
</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="view_res" class="w3-center">
	<div class="container-fluid">
	<h2 class="w3-text-blue">My Reservation</h2><br/>
		 <div class="row content">
				<div id="view_div" >
				<br/>
					<div class="input-group">
						<span class="input-group-addon" style="width: 200px;">상호명</span>
						<input type="text" class="form-control text-center" name="irum" value = '${rvo.rname}' style="width: 550px;background: #ffffff;" readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width: 200px;">연락처</span>
						<input type="text" class="form-control text-center" name="irum" value = '${rvo.rphone}' style="width: 550px;background: #ffffff;" readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width: 200px;">회원명</span>
						<input type="text" class="form-control text-center" name="irum" value = '${mem_vo.irum}' style="width: 550px;background: #ffffff;" readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width: 200px;">회원 연락처</span>
						<input type="text" class="form-control text-center" name="phone" value = '${mem_vo.phone}' style="width: 550px;background: #ffffff;" readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width: 200px;">예약일/시간</span>
						<input type="text" class="form-control text-center" name="rdate" value = "${dvo.rdate }/${dvo.rtime }" style="width: 550px;background: #ffffff;" readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width: 200px;">메뉴</span>
						<input type="text" class="form-control text-center" name="menu" value = "${dvo.menu }" style="width: 550px;background: #ffffff;" readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width: 200px;">총가격</span>
						<input type="text" class="form-control text-center" name="price" value = "${vo.price }" style="width: 550px;background: #ffffff;" readonly>
					</div>
					</div>
		</div>
	</div>
	<form name="frm_view_res" method="post">
		<input type="hidden" name="menu" value = "${dvo.menu }">
		<input type="hidden" name="rdate" value="${dvo.rdate }">
		<input type="hidden" name="price" value="${vo.price }">
		<input type="hidden" name="mem_se" value="${mem_vo.serial }">
		<input type="hidden" name="res_se" value="${rvo.serial }">
		<input type="hidden" name="serial"  value="${vo.serial }">
		<input type="hidden" name="serial2"  value="${vo.serial2 }">
		<input type="hidden" name="reservationPage" value="${vo.reservationPage }">
		<input type="hidden" name="reservationPage2" value="${vo.reservationPage2 }">
		<input type="hidden" name="select" value="${vo.select }">
		<input type="button" name="btnDelete"  class="w3-button w3-lime" value="예약취소">
		<input type="button" name="btnList"  class="w3-button w3-lime" value="마이 페이지로">
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
var frm=document.frm_view_res;
frm.btnDelete.onclick=function(){
	frm.action="delete.reserve";
	frm.submit();
}
frm.btnList.onclick=function(){
	if(frm.reservationPage2.value==0){
		frm.action="list_Individual.reserve";		
	}else{
		frm.action="list_store.reserve";
	}
	frm.submit();
}
</script>
</body>
</html>