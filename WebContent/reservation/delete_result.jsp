<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<div id="delete_result">
<br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
	<div class="delete_msg_div">
		<form name="frm_deleteR" method="post">
			<input type="hidden" name="reservationPage" value="${vo.reservationPage }">
			<input type="hidden" name="reservationPage2" value="${vo.reservationPage2 }">
			<input type="hidden" name="select" value="${vo.select }">
			<input type="hidden" name="serial2" value="${vo.serial2 }">
			<input type="hidden" name="serial"  value="${vo.serial }">
		</form>
	</div>
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
    $('#msg').text("${vo.msg}");
    document.getElementById('show_msg').style.display='block';
});
var frm= document.frm_deleteR;
function okFunc(){
    if($('#msg').text() =="${vo.msg}"){
    	if(frm.reservationPage2.value==0){
    		frm.action="list_cancel_i.reserve";		
    	}else{
    		frm.action="list_cancel_c.reserve";
    	}
    	frm.submit();
    }
    else{
       document.getElementById('show_msg').style.display='none';      
    }
 }
</script>
</body>
</html>