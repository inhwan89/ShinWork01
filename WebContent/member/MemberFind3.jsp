<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#MemberFind3 {height: 500px; width:500px; margin: auto;}
#MemberFind3 header{text-align: center; margin-top: 50px; height: 60px; }
#MemberFind3 h1{line-height: 60px;}
#MemberFind3 #btnLogin{width: 100px; width: 100px; height: 40px; margin-bottom: 20px;}
#MemberFind3 #btnCancel{margin-left: 120px;  width: 100px; height: 40px; margin-bottom: 20px;}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<br/><br/><br/><br/><br/>
<div id="MemberFind3">
	<header class="w3-blue">
	  <h1>ID/Password 찾기</h1>
	</header>

	<div name="MemberFind_div" class="w3-container w3-half w3-margin-top" style="width:100%; ">
	<form name="frm_MemberFind3" method="post" class="w3-container w3-card-4" style="width:100%">

		<br/>
		<label>아이디</label>
		<input class="w3-input" type="text" name="mid" style="width:100%" value="${param.mid }" disabled="disabled" ><br/>
		
		<label>비밀번호</label>
		<input class="w3-input" type="text" name="pwd" style="width:100%" value="${param.pwd }" disabled="disabled" >
		</p><br/>
	
		<input type="button" id="btnCancel" class="w3-button w3-blue"  value="홈"/>
		<input type="button" id="btnLogin"  class="w3-button w3-blue" value="로그인"/>
	</form>
</div>
</div>
<script>
var frm = document.frm_MemberFind3;

frm.btnLogin.onclick = function(){
	
	frm.action = "index.jsp?inc=/member/MemberLogin.jsp";
	frm.submit();
}

frm.btnCancel.onclick = function(){
	frm.action = "index.jsp";
	frm.submit(); 
}
</script>
</body>
</html>