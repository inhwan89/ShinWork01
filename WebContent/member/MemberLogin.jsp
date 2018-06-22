<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 로그인 라디오버튼 -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.1.0.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<title>Login</title>
<script>
window.onload = function(){
	document.getElementById('id01').style.display='block'
}
</script>
<script>
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='mid']").val(userInputId);
     
    if($("input[name='mid']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#ex_chk3").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#ex_chk3").change(function(){ // 체크박스에 변화가 있다면,
        if($("#ex_chk3").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='mid']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='mid']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#ex_chk3").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='mid']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>
<style>
#MemberLogin {
height:1000px;
background-image: url("imgs/login_background.jpg");
padding-top: 0px;
}
#MemberLogin label{display: inline-block;width: 120px;}
#MemberLogin #btnLogin, #btnJoin, #btnSearch{height: 50px;}
/*텍스트박스 CSS*/
#MemberLogin input[type=text], select {width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;border-radius: 4px;box-sizing: border-box;}
#MemberLogin input[type=password], select {width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;border-radius: 4px;box-sizing: border-box;}
/*체크박스 CSS*/
#MemberLogin .checks {position: relative;}
#MemberLogin .checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */position: absolute;width: 1px;height: 1px;padding: 0;margin: -1px;overflow: hidden;clip:rect(0,0,0,0);border: 0}
#MemberLogin .checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */content: ' ';display: inline-block;width: 21px;  /* 체크박스의 너비를 지정 */height: 21px;  /* 체크박스의 높이를 지정 */line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */margin: -2px 8px 0 0;text-align: center; vertical-align: middle;background: #fafafa;border: 1px solid #cacece;border-radius : 3px;box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);}
#MemberLogin .checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */ content: '\2714';  /* 체크표시 유니코드 사용 */color: #99a1a7;text-shadow: 1px 1px #fff;background: #e9ecee;border-color: #adb8c0;box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);}
#MemberLogin .checks.etrans input[type="checkbox"] + label {padding-left: 30px;}
#MemberLogin .checks.etrans input[type="checkbox"] + label:before {position: absolute;left: 0;top: 0;margin-top: 0;opacity: .6;box-shadow: none;border-color: #6cc0e5;-webkit-transition: all .12s, border-color .08s;transition: all .12s, border-color .08s;}
#MemberLogin .checks.etrans input[type="checkbox"]:checked + label:before {position: absolute;content: "";width: 10px;top: -5px;left: 5px;border-radius: 0;opacity:1; background: transparent;border-color:transparent #6cc0e5 #6cc0e5 transparent;border-top-color:transparent;border-left-color:transparent;-ms-transform:rotate(45deg);-webkit-transform:rotate(45deg);transform:rotate(45deg);}
#MemberLogin #btnCancle{margin-left: 230px; }
/*라디오버튼 CSS*/
#MemberLogin label.btn span {font-size: 1.5em ;}
#MemberLogin label input[type="radio"] ~ i.fa.fa-circle-o{color: #c8c8c8;display: inline;}
#MemberLogin label input[type="radio"] ~ i.fa.fa-dot-circle-o{display: none;}
#MemberLogin label input[type="radio"]:checked ~ i.fa.fa-circle-o{display: none;}
#MemberLogin label input[type="radio"]:checked ~ i.fa.fa-dot-circle-o{color: #7AA3CC;display: inline;}
#MemberLogin label:hover input[type="radio"] ~ i.fa {color: #7AA3CC;}
#MemberLogin div[data-toggle="buttons"] label.active{color: #7AA3CC;}
#MemberLogin div[data-toggle="buttons"] label {display: inline-block;padding: 6px 12px;margin-bottom: 0;font-size: 8px;font-weight: normal;line-height: 2em;text-align: left;white-space: nowrap;vertical-align: top;cursor: pointer;background-color: none;border: 0px solid #c8c8c8;border-radius: 3px;color: #c8c8c8;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;-o-user-select: none;user-select: none;}
#MemberLogin div[data-toggle="buttons"] label:hover {color: #7AA3CC;}
#MemberLogin div[data-toggle="buttons"] label:active, div[data-toggle="buttons"] label.active {-webkit-box-shadow: none;box-shadow: none;}
</style>
</head>
<body>
<div id="MemberLogin">
	<div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px; z-index: 21;">
		<div class="w3-center"><br>
			<!-- <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">×</span> -->
			<span onclick="xMark()" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">×</span>
			<img src="./imgs/welcome.jpg" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
		</div>
	
		<form name='frm_login' method='POST' class="w3-container">
	        <div class="w3-section">
				<c:choose>
				<c:when test="${sId == null }">
					<input type="text" name='mid' placeholder="아이디" class="w3-border-blue"  /><br/>
					<input type="password" name='pwd' placeholder="패스워드" class="w3-border-blue" /><br/>
			 	<div class="checks etrans">
				  	<input type="checkbox" name="chk" id="ex_chk3"> 
			 		<label for="ex_chk3">아이디저장</label>
				</div><br/>
				
				<div id="colthree" class="col three"> 
								            
					<span class="span_1" style="font-weight: bold;">ㆍ아직 회원이 아니신가요?</span><br/>						
						<div class="btn-group btn-group" data-toggle="buttons">
					        <label class="btn active">
					          <input type="radio" name='selection' value="i" checked><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i> <span> 개인회원</span>
					        </label>
					        
					        <label class="btn">
					          <input type="radio" name='selection'value="c" ><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i><span> 사업자회원</span>
					        </label>
				      	</div><br/>												
						<input type='button' id='btnLogin' class="w3-button w3-blue" value='로그인' style="width: 100%"/><br/><br/> 
						<input type='button' id='btnJoin'  class="w3-button w3-blue" value='회원가입' style="width: 100%"/><br/><br/>
					
					<span class="span_2" style="font-weight: bold;">ㆍ아이디 비밀번호를 잊어버리셨나요?</span><br/>
						<div class="btn-group btn-group" data-toggle="buttons">
					        <label class="btn active">
					          <input type="radio" name='selection2' value="e" checked><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i> <span> E-mail</span>
					        </label>
					        
					        <label class="btn">
					          <input type="radio" name='selection2'value="p" ><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i><span> 전화번호</span>
					        </label>
				      	</div><br/>			
						<input type='button' id='btnSearch' class="w3-button w3-blue" value='아이디/비밀번호 찾기' style="width: 100%; margin-top: 10px;"/><br/>
			    </div>
				</c:when>			
				<c:when test="${sId != null }">
				로그인상태입니다.
				</c:when>			
				</c:choose>
	        </div>
	        
		    <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
		       	<button name="btnCancle" id="btnCancle" type="button" class="w3-button w3-blue">Cancel</button>	 
		    </div>
 	 </form>
  </div>
  </div>

</div>
<script>
var frm = document.frm_login;
	
frm.btnLogin.onclick = function(){
	frm.action = "MemberLogin.member";
	frm.submit();	
}
	
frm.btnJoin.onclick = function(){
	frm.action = "index.jsp?inc=/member/MemberJoin.jsp";
	frm.submit();
}
	
frm.btnSearch.onclick = function(){
	frm.action = "index.jsp?inc=/member/MemberFind.jsp"; 
	
	frm.submit();
}

frm.btnCancle.onclick = function(){
	frm.action ="index.jsp";
	frm.submit();
}

function xMark(){
	frm.action ="index.jsp";
	frm.submit();
	
}
</script>
</body>
</html>