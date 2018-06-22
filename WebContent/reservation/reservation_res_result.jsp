<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<div id="reservation_res_result">
	<form name="frm_reservation_res_result">
		<input type="hidden" name="serial" value="${vo.serial }">
		<input type="hidden" name="findStr" value="">
		<input type="hidden" name="acco_nowPage" value="1">
	</form>
</div>
<script>
$(document).ready(function(){
	var frm= document.frm_reservation_res_result;
	frm.action="view.donghwan";
	frm.submit();
});
</script>
</body>
</html>