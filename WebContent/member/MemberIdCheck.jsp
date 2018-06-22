<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
window.onload = function(){
	document.getElementById('id01').style.display='block'
}
</script>

<style>
body {font-family: 'Lato', sans-serif;background: #ffffff;color: #b3aca7;}
@import url(https://fonts.googleapis.com/css?family=Lato:100,300,400);
::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
#MemberIdCheck input::-webkit-input-placeholder{color: #aca49c;font-size: 0.875em;}
#MemberIdCheck input:focus::-webkit-input-placeholder{color: #bbb5af;}
#MemberIdCheck input::-moz-placeholder{color: #aca49c;font-size: 0.875em;}#MemberIdCheck input:focus::-moz-placeholder{color: #bbb5af;}
#MemberIdCheck input::placeholder{color: #aca49c;font-size: 0.875em;}
#MemberIdCheck input:focus::placeholder{color: #bbb5af;}
#MemberIdCheck input::-ms-placeholder{color: #aca49c;font-size: 0.875em;}
#MemberIdCheck input:focus::-ms-placeholder{color: #bbb5af;}
/* on hover placeholder */
input:hover::-webkit-input-placeholder{color: #e2dedb;font-size: 0.875em;}
input:hover:focus::-webkit-input-placeholder{color: #cbc6c1;}
input:hover::-moz-placeholder{color: #e2dedb;font-size: 0.875em;}
input:hover:focus::-moz-placeholder{color: #cbc6c1;}
input:hover::placeholder{color: #e2dedb;font-size: 0.875em;}
input:hover:focus::placeholder{color: #cbc6c1;}
input:hover::placeholder{color: #e2dedb;font-size: 0.875em;}
input:hover:focus::-ms-placeholder{color: #cbc6c1;}
header {position: relative;margin: 50px 0 25px 0;font-size: 2.3em;text-align: center;letter-spacing: 7px;color: #474544}
#frm_idCheck {position: relative;width: 500px;margin: 50px auto 100px auto;}
input {font-family: 'Lato', sans-serif;font-size: 0.875em;width: 280px;height: 50px;background: transparent;outline: none;color: #726659; border: solid 1px #b3aca7;transition: all 0.3s ease-in-out;-webkit-transition: all 0.3s ease-in-out;-moz-transition: all 0.3s ease-in-out;-ms-transition: all 0.3s ease-in-out;}
input[type=text]{background: none;border: none;border-bottom: solid 2px #474544;color: #474544;font-size: 1.000em;font-weight: 400;letter-spacing: 1px;margin: 0em 0 1.875em 0;padding: 0 0 0.875em 0;width: 250px;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;-ms-box-sizing: border-box;-o-box-sizing: border-box;box-sizing: border-box;-webkit-transition: all 0.3s;-moz-transition: all 0.3s;-ms-transition: all 0.3s;-o-transition: all 0.3s;transition: all 0.3s;}
input[type=button]:hover {background: #b3aca7;color: #e2dedb;}
#btnUse{width: 100%;font-family: 'Lato', sans-serif;font-size: 0.875em;color: #474544;outline:none;cursor: pointer;}
#btnIdCheck {width: 200px;height: 54px;padding: 0;margin-left: 10px;font-family: 'Lato', sans-serif;font-size: 0.875em;color: #474544;outline:none;cursor: pointer;}
#btnIdCheck:hover {color: #e2dedb;}
#btnUse:hover {color: #e2dedb;}
#idCheck{height: 300px;display: inline-block;}
#mid{color: #082047;font-weight: bold;opacity: 0.5;}
#btnIdCheck{display: inline-block;float: right;}
</style>
</head>
<body onresize="parent.resizeTo(650,530)" onload="parent.resizeTo(650,530)">
<div id="MemberIdCheck">
		<header>ID Check</header>

<form name="frm_idCheck" id="frm_idCheck" method="POST" class="topBefore">
	<span>*ID는 영문(소문자), 숫자로 4~16자 이내로 입력해 주세요.</span><br/>
	<span>*공백 또는 특수문자가 포함된 ID는 사용할 수 없습니다.</span><br/>
	<span>*숫자로 시작하거나, 숫자로만 이루어진 ID는 사용할 수 없습니다.</span><br/><br/>
		  
	<div id="idCheck">
		<input type="text"   name="mid" value="${param.mid }" placeholder="ID">
	 	<input type="button" name="btnIdCheck" id="btnIdCheck" value="중복확인"><br/>
	 	<input type="hidden"name="selection" value="${param.selection }">
	 	<span id="mid">${msg }</span><br/><br/>
	 	<input type="button" name="btnUse" id="btnUse" value="사용하기"/>
  	</div>	

</form>
</div>
<script>
var frm = document.frm_idCheck;

frm.btnIdCheck.onclick = function(){	
	var mid = frm.mid.value;
	var reg = /^[a-zA-Z]{1}[a-zA-Z0-9_]{3,15}$/; //영문(소문자), 숫자로 4~16자//숫자로 시작 x
												 //{3,15}인 이유: [a-zA-Z]{1}는 첫번째는 무조건 영문자여야 하므로 뒤에 숫자부터 계산
	if(mid == ""){
		alert("아이디를 입력해주세요");		
	}else if(mid.match(reg)){			
		frm.action = "./MemberIdCheck.check"; 
		frm.submit();  		
	}else{
		alert("형식이 올바르지 않습니다.");		
	}		
}

frm.btnUse.onclick = function(){
	if('${msg }' == "이미 사용중인 아이디입니다."){
		return false;
	} else if('${msg }' == "사용할 수 있는 아이디입니다."){
		window.opener.document.frm_join.mid.value=frm.mid.value;
		self.close();
	}
}
</script>
</body>
</html>