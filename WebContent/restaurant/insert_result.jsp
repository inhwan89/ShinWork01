<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>맛집 등록 결과</title>
</head>
<body>
	<div>
		<h3> 공갈 등록 결과 페이지</h3>
		
		${vo.msg }
		<form name='rest_ir' method='post'>
			<input type='button' name='btnList' value='목록으로' class="w3-button w3-teal">
		</form>
	</div>
	
	
<script>
	var frm = document.rest_ir;
	frm.btnList.onclick = function(){
		
		frm.action = "list.donghwan";
		frm.submit();
	}
</script>
</body>
</html>