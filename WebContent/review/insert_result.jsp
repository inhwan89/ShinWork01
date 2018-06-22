<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="insert_result">
	<h2>자료 입력 결과</h2>
	${msg }
<form name="frm_insertR" method="post">
	<input type="button" value="목록으로" name="btnList">
	<input type="hidden" name="nowPage" value='1'>
	<input type="hidden" name="findStr" value="">
</form>
</div>
<script>
	var frm=document.frm_insertR;
	frm.btnList.onclick=function(){
		frm.action="list.review";
		frm.submit();
	}
</script>
</body>
</html>