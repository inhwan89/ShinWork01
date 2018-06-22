<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);
#MemberModify html {font-family: 'Montserrat', Arial, sans-serif;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;}
body { background-color: #ffffff;}
#MemberModify button {overflow: visible; }
#MemberModify button, select, input {text-transform: none; }
#MemberModify button, input, select, textarea {color: #5A5A5A;font: inherit;margin: 0;}
#MemberModify input {line-height: normal; }
#MemberModify #container {border: solid 3px #474544;max-width: 768px;margin: 60px auto;position: relative;}
#MemberModify form {padding: 37.5px; margin: 50px 0; }
#MemberModify h1 {color: #474544;font-size: 32px;font-weight: 700;letter-spacing: 7px;text-align: center;text-transform: uppercase;}
#MemberModify .underline {border-bottom: solid 2px #474544;margin: -0.512em auto;width: 80px;}
#MemberModify .irum {float: left; width: 45%; }
#MemberModify .mid {float: left; width: 45%; }
#MemberModify .pwd{float: left; width: 45%; }
#MemberModify .newPwd{float: left; width: 45%; }
#MemberModify .pwdCheck{float: left; width: 45%;}
#MemberModify .mdate{float: right; width: 45%;}
#MemberModify .company_name{float: left; width: 45%;}
#MemberModify .delegate{float: right; width: 45%;}
#MemberModify .company_number{float: right; width: 45%;}
#MemberModify .account_number{float: left; width: 45%;}
#MemberModify .bank{float: right; width: 45%;}
#MemberModify .mileage1{float: left; width: 45%;}
#MemberModify .mileage2{float: right; width: 45%;}
#MemberModify .mileage3{float: left; width: 100%; display: inline-block; border: 1px solid red;}
#MemberModify .mileage4{float: right; width: 100%; display: inline-block; border: 1px solid blue;}
#MemberModify .phone {width: 14.5%; display:inline-block; }
#MemberModify .phone2 {width: 14.5%; display:inline-block; }
#MemberModify .phone3 {width: 14.5%; display:inline-block; }
#email_group .email{display:inline-block; width: 21%; }
#email_group .email2{display:inline-block; width: 21%; }
#MemberModify #post{float: left; width: 45%; }
#MemberModify .area{float: right; width: 45%; }
#MemberModify input[type='text'], [type='password'], [type='date'], select,  textarea {background: none;border: none;border-bottom: solid 2px #474544;color: #474544;font-size: 1.000em;font-weight: 400;letter-spacing: 1px;margin: 0em 0 1.875em 0;padding: 0 0 0.875em 0;width: 100%;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;-ms-box-sizing: border-box;-o-box-sizing: border-box;box-sizing: border-box;-webkit-transition: all 0.3s;-moz-transition: all 0.3s;-ms-transition: all 0.3s;-o-transition: all 0.3s;transition: all 0.3s;}
#MemberModify input[type='text']:focus, [type='password']:focus, textarea:focus {outline: none; padding: 0 0 0.875em 0; }
#MemberModify select{background: url('https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-arrow-down-32.png') no-repeat right;outline: none;-moz-appearance: none;-webkit-appearance: none;}
#MemberModify select::-ms-expand {display: none; }
#MemberModify input[type='date']::-ms-expand {display: none; }
#MemberModify ::-webkit-input-placeholder {color: #474544; }
#MemberModify :-moz-placeholder {color: #474544; opacity: 1; }
#MemberModify ::-moz-placeholder {color: #474544; opacity: 1; }
#MemberModify :-ms-input-placeholder {color: #474544; }
#MemberModify #form_button {background: none;border: solid 2px #474544;color: #474544;cursor: pointer;display: inline-block;font-family: 'Helvetica', Arial, sans-serif;font-size: 0.875em;font-weight: bold;outline: none;padding: 20px 35px;text-transform: uppercase;-webkit-transition: all 0.3s;-moz-transition: all 0.3s;-ms-transition: all 0.3s;-o-transition: all 0.3s;transition: all 0.3s;}
#MemberModify #btnPost, #btnModify, #btnDelete, #btnCancle {background: none;border: solid 2px #474544;color: #474544;cursor: pointer;display: inline-block;font-family: 'Helvetica', Arial, sans-serif;font-size: 0.875em;font-weight: bold;outline: none;padding: 10px 35px;text-transform: uppercase;-webkit-transition: all 0.3s;-moz-transition: all 0.3s;-ms-transition: all 0.3s;-o-transition: all 0.3s;transition: all 0.3s;margin-left: 20px;}
#MemberModify #btnPost{width: 310px;}
#MemberModify .btnPost  {margin-left: 360px; }
#MemberModify #btnModify{margin-left: 160px; }
#MemberModify #btnPost:hover {background: #474544; color: #F2F3EB; }
#MemberModify #btnModify:hover {background: #474544; color: #F2F3EB; }
#MemberModify #btnDelete:hover {background: #474544; color: #F2F3EB; }
#MemberModify #btnCancle:hover {background: #474544; color: #F2F3EB; }
#MemberModify #form_button:hover {background: #474544; color: #F2F3EB; }
@media screen and (max-width: 768px) {#container {margin: 20px auto; width: 95%;}}
@media screen and (max-width: 480px) {h1 {font-size: 26px; } .underline {width: 68px; }#form_button {padding: 15px 25px; }}
@media screen and (max-width: 2000px) {h1 {font-size: 18px; }.icon {height: 35px; width: 35px; }.underline {width: 53px; }input[type='text'], [type='password'], input[type='date'], select, textarea {font-size: 0.875em; }
/* 라디오 버튼 CSS */
.genderName {width: 14.5%; display:inline-block; margin-left: 65px;}  
#radioBtn{display: inline-block; margin-left: 30px; }
#radio1{display: inline-block; }
#radio2{display: inline-block; margin-left: 35px;} 
#radioBtn .radio {display: block;position: relative;padding-left: 35px;margin-bottom: 12px;cursor: pointer;font-size: 22px;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;}
/* Hide the browser's default radio button */
#radioBtn .radio input {position: absolute; opacity: 0; cursor: pointer;}
/* Create a custom radio button */
#radioBtn .checkmark {position: absolute;top: 0;left: 0;height: 25px;width: 25px;background-color: #eee;border-radius: 50%;}
/* On mouse-over, add a grey background color */
#radioBtn .radio:hover input ~ .checkmark {background-color: #ccc;}
/* When the radio button is checked, add a blue background */
#radioBtn .radio input:checked ~ .checkmark {background-color: #474544;}
/* Create the indicator (the dot/circle - hidden when not checked) */
#radioBtn .checkmark:after {content: ""; position: absolute; display: none;}
/* Show the indicator (dot/circle) when checked */
#radioBtn .radio input:checked ~ .checkmark:after {display: block;}
/* Style the indicator (dot/circle) */
#radioBtn .radio .checkmark:after {top: 9px;left: 9px;width: 8px;height: 8px;border-radius: 50%;background: white;}
/* 사진파일 CSS */
#photo_div{overflow:hidden;height: 255px;width:308px;float: right;border-radius: 10px;box-shadow: 5px 5px 20px -5px rgba(0, 0, 0, 0.8);}
.file_input label {cursor:pointer;}
.file_input label input {position:absolute;width:0;height:0;overflow:hidden;}
.file_input input[type=text] {display:none;}
#btnPhotoDelete {position: absolute;background: #dee0e2;color: #000000;border: none;top: 130px;right: 30px;border-radius: 8px;}
</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="MemberModify">
<div id="container">
  <h1>&bull; Modification &bull;</h1>
  <div class="underline">
  </div>
  <form name="frm_modify" method="post" id="contact_form" enctype="multipart/form-data">
	  <input type="hidden" id="sId" name="sId" value="${sId }"> 
	  <input type="hidden" id="selection" name="selection" value="${vo.selection }"> 
	  <input type="hidden" name="photocheck" value="${vo.photo }">
  
	<c:choose>		
  	 <c:when test='${vo.selection == "i"}'>
 	
	 <div class="mid">
     	<label for="mid"></label>
     	<input type="text" placeholder="아이디" name="mid" id="mid" value="${vo.mid }" required>
     </div>
     
     <div id="photo_div">
     
	     <div class = "file_input">	  
	     	  <input type="button" id="btnPhotoDelete" value="X"/> 		 
		     <label class = "accommodation_img" style = "width:100%">     
		        <img id="ModifyImage" class="w3-image" src="./download/${vo.photo }" alt="" width="100%"  >
		        <input type="file" name = "attfile0" onchange="readURL(this)">	   
		     </label>
		 </div>
     </div>
   	 
     <br/><br/><br/>
  	 <div class="pwd">
        <label for="pwd"></label>
        <input type="password" placeholder="비밀번호" name="pwd" id="pwd" required>
     </div><br/><br/><br/>
     
     <div class="newPwd">
        <label for="newPwd"></label>
        <input type="password" placeholder="새로운 비밀번호" name="newPwd" id="newPwd">
     </div><br/><br/><br/>
     
    
     <div class="pwdCheck">
        <label for="pwdCheck"></label>
        <input type="password" placeholder="비밀번호확인" name="pwdCheck" id="pwdCheck">
     </div><br/><br/><br/><br/><br/>
    
     <div class="irum">
        <label for="irum"></label>
        <input type="text" placeholder="이름" name="irum" id="irum" value="${vo.irum }" required>
     </div>

     <div class="mdate">
        <label for="mdate"></label>
        <input type="date" placeholder="생년월일" name="mdate" id="mdate" value="${vo.mdate }" required >
     </div><br/><br/><br/><br/>
  
     <div class="phone">
        <label for="phone"></label>
        <input type="text" placeholder="전화번호" name="phone" id="phone" value="${vo.phone }" required >
     </div>
    
     <div class="phone2">
        <label for="phone2"></label>
        <input type="text" name="phone2" id="phone2" value="${vo.phone2 }" required >
     </div>
        
     <div class="phone3">
        <label for="phone3"></label>
        <input type="text" name="phone3" id="phone3" value="${vo.phone3 }" required >
     </div>

     <div class="genderName">
        <label for="genderName"></label>
        <input type="text" placeholder="성별" name="genderName" id="genderName" style="text-align: center;" readonly required>
     </div>
 
	 <div id="radioBtn">
		 <div id="radio1">
		 <label class="radio">M
		 <input type="radio" checked="checked" name="gender" ${(vo.gender eq '남')?'checked': ''} value = '남'>
		 <span class="checkmark"></span>
		 </label>
		 </div>
	
		 <div id="radio2">
		 <label class="radio">F
		 <input type="radio" name="gender" ${(vo.gender eq '여')?'checked': ''} value= '여'>
		 <span class="checkmark"></span>
		 </label>
		 </div>
	 </div>
	
	 <div class="post">
        <label for="post"></label>
        <input type="text" placeholder="우편번호" name="post" id="post" class="postcodify_postcode5" value="${vo.post }" required>
     </div>
    
     <div class="btnPost">
        <label for="btnPost"></label>
        <input type="button" name="btnPost" id="btnPost" value="우편번호" required>
     </div>
    
     <div class="address1">
        <label for="address1"></label>
        <input type="text" placeholder="기본주소" name="address1" id="address1" class="postcodify_address" value="${vo.address1 }" required>
     </div>
  
  	 <div class="address2">
        <label for="address2"></label>
        <input type="text" placeholder="상세주소" name="address2" id="address2" class="postcodify_details" value="${vo.address2 }" required>
     </div>
  
  	 <div id="email_group">
	  	 <div class="email">
	        <label for="email"></label>
	        <input type="text" placeholder="이메일" name="email" id="email" class="email" value="${vo.email }" required>
	     </div>
	       
	     <label>@</label>
	  
	     <div class="email2">
	      <label for="email2"></label>
	      <select name="email2" id="email2" value="${vo.email2 }" required>
	        <option>${vo.email2 }</option>
	        <option value="naver.com">naver.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="daum.net">daum.net</option>
			<option value="nate.com">nate.com</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="yahoo.com">yahoo.com</option>
			<option value="empas.com">empas.com</option>
			<option value="korea.com">korea.com</option>
			<option value="dreamwiz.com">dreamwiz.com</option>
	      </select>
	     </div>    
	  
	  	 <div class="area">
	      <label for="area"></label>
	      <select name="area" id="area"required>
	        <option>${vo.area }</option>      
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="인천">인천</option>
			<option value="강원">강원</option>
			<option value="충남">충남</option>
			<option value="충북">충북</option>
			<option value="대전">대전</option>
		    <option value="경북">경북</option>
			<option value="경남">경남</option>
			<option value="대구">대구</option>
			<option value="부산">부산</option>
			<option value="울산">울산</option>
			<option value="전북">전북</option>
			<option value="전남">전남</option> 
			<option value="광주">광주</option> 
			<option value="제주">제주</option> 		
	      </select>
	    </div>
  	</div>
  	
  	 <div class="mileage1">
        <label for="mileage1"></label>
        <input type="text" placeholder="마일리지" name="mileage1" id="mileage1" readonly>
     </div>
  	
  	<div class="mileage2">
        <label for="mileage"></label>
        <input type="text" name="mileage" id="mileage" value="${vo.mileage }" required>
     </div>
  	
 
    <div class="btnButton">
      <label for="btnModify"></label>
      <input type="button" name="btnModify" id="btnModify" value="수정" required>
      
      <label for="btnDelete"></label>
      <input type="button" name="btnDelete" id="btnDelete" value="탈퇴" required>
       
      <label for="btnCancle"></label>
      <input type="button" name="btnCancle" id="btnCancle" value="취소" required>
    </div>
     <input type="hidden" name="selection" value="i"> 
    </c:when>
 

	
	 <c:when test='${vo.selection == "c"}'>
	 <div class="mid">
     	<label for="mid"></label>
     	<input type="text" placeholder="아이디" name="mid" id="mid" value="${vo.mid }" required>
     </div>

	 <div id="photo_div">
     
	     <div class = "file_input">
		     <label class = "accommodation_img" style = "width:100%"> 
		        <img class="w3-image" src="./download/${vo.photo }" alt="" width="100%"  >
		        <input type="file" name = "attfile0" onchange="readURL(this)">
		     </label>
		 </div>

     </div><br/><br/><br/>
     
  	 <div class="pwd">
        <label for="pwd"></label>
        <input type="password" placeholder="비밀번호" name="pwd" id="pwd" required>
     </div><br/><br/><br/>
    
     <div class="newPwd">
        <label for="newPwd"></label>
        <input type="password" placeholder="새로운 비밀번호" name="newPwd" id="newPwd">
     </div><br/><br/><br/>
    
     <div class="pwdCheck">
        <label for="pwdCheck"></label>
        <input type="password" placeholder="비밀번호확인" name="pwdCheck" id="pwdCheck" required>
     </div><br/><br/><br/><br/>
    
	 <div class="delegate1">
        <label for="delegate"></label>
        <input type="text" placeholder="대표자명" name="delegate" id="delegate" value="${vo.delegate }" required>
     </div>
      
  
     <div class="phone">
        <label for="phone"></label>
        <input type="text" placeholder="전화번호" name="phone" id="phone" value="${vo.phone }" required >
     </div>
    
     <div class="phone2">
        <label for="phone2"></label>
        <input type="text" name="phone2" id="phone2" value="${vo.phone2 }" required >
     </div>
        
     <div class="phone3">
        <label for="phone3"></label>
        <input type="text" name="phone3" id="phone3" value="${vo.phone3 }" required >
     </div>

     <div class="company_number">
        <label for="company_number"></label>
        <input type="text" placeholder="사업자번호" name="company_number" id="company_number" value="${vo.company_number }" required>
     </div>
     
	 <div class="post">
        <label for="post"></label>
        <input type="text" placeholder="우편번호" name="post" id="post" class="postcodify_postcode5" value="${vo.post }" required>
     </div>
    
     <div class="btnPost">
        <label for="btnPost"></label>
        <input type="button" name="btnPost" id="btnPost" value="우편번호" required>
     </div>
    
     <div class="address1">
        <label for="address1"></label>
        <input type="text" placeholder="기본주소" name="address1" id="address1" class="postcodify_address" value="${vo.address1 }" required>
     </div>
  
  	 <div class="address2">
        <label for="address2"></label>
        <input type="text" placeholder="상세주소" name="address2" id="address2" class="postcodify_details" value="${vo.address2 }" required>
     </div>
  
  	 <div id="email_group">
  	 <div class="email">
        <label for="email"></label>
        <input type="text" placeholder="이메일" name="email" id="email" class="email" value="${vo.email }" required>
     </div>     
     <label>@</label>
     <div class="email2">
      <label for="email2"></label>
      <select name="email2" id="email2" required>
        <option>${vo.email2 }</option>
        <option value="naver.com">naver.com</option>
		<option value="gmail.com">gmail.com</option>
		<option value="hanmail.net">hanmail.net</option>
		<option value="daum.net">daum.net</option>
		<option value="nate.com">nate.com</option>
		<option value="hotmail.com">hotmail.com</option>
		<option value="yahoo.com">yahoo.com</option>
		<option value="empas.com">empas.com</option>
		<option value="korea.com">korea.com</option>
		<option value="dreamwiz.com">dreamwiz.com</option>
      </select>
     </div>    
  
  	 <div class="area">
      <label for="area"></label>
      <select name="area" id="area"required>
        <option>${vo.area}</option>      
		<option value="서울">서울</option>
		<option value="경기">경기</option>
		<option value="인천">인천</option>
		<option value="강원">강원</option>
		<option value="충남">충남</option>
		<option value="충북">충북</option>
		<option value="대전">대전</option>
	    <option value="경북">경북</option>
		<option value="경남">경남</option>
		<option value="대구">대구</option>
		<option value="부산">부산</option>
		<option value="울산">울산</option>
		<option value="전북">전북</option>
		<option value="전남">전남</option> 
		<option value="광주">광주</option> 
		<option value="제주">제주</option> 	
      </select>
    </div>
  	</div>
  	
  	<div class="business_type">
        <label for="business_type"></label>
        <input type="text" placeholder="업종" name="business_type" id="business_type" value="${vo.business_type}" required>
     </div>
  	<div id="back_group">
	  	 <div class="account_number">
	        <label for="account_number"></label>
	        <input type="text" placeholder="계좌번호" name="account_number" id="account_number" value="${vo.account_number}" required>
	     </div>
  	
  	     <div class="bank">
	         <label for="bank"></label>
	         <select name="bank" id="bank" required>
		         <option>${vo.bank}</option>
		         <option value="신한은행">신한은행</option>
			 	 <option value="산업은행">산업은행</option>
				 <option value="기업은행">기업은행</option>
				 <option value="국민은행">국민은행</option>
				 <option value="외환은행">외환은행</option>
				 <option value="우리은행">우리은행</option>
				 <option value="SC제일은행">SC제일은행</option>
				 <option value="씨티은행">씨티은행</option>
				 <option value="수협중앙회">수협중앙회</option>
				 <option value="농협중앙회">농협중앙회</option>
				 <option value="농협">농협</option>
				 <option value="카카오뱅크">카카오뱅크</option>
				 <option value="우체국">우체국</option>
				 <option value="새마을금고">새마을금고</option>	
      		 </select>
     </div>
     </div><br/><br/><br/><br/>
     
     <div class="mileage1">
        <label for="mileage1"></label>
        <input type="text" placeholder="마일리지" name="mileage1" id="mileage1" readonly>
     </div>
  	
  	<div class="mileage2">
        <label for="mileage"></label>
        <input type="text" name="mileage" id="mileage" value="${vo.mileage }" required>
     </div>
     
     
     <br/><br/><br/>
	
    <div class="btnButton">
      <label for="btnModify"></label>
      <input type="button" name="btnModify" id="btnModify" value="수정" required>
      
      <label for="btnDelete"></label>
      <input type="button" name="btnDelete" id="btnDelete" value="탈퇴" required>
       
      <label for="btnCancle"></label>
      <input type="button" name="btnCancle" id="btnCancle" value="취소" required>
    </div>
     <input type="hidden" name="selection" value="c">
	 </c:when>
  </c:choose> 
  </form><!-- // End form -->
</div><!-- // End #container -->
	<form name = "frm_delete" method = 'post'>
	<input type = 'hidden' name = 'mid' value="${vo.mid }">
	</form>
</div><!-- // END #MemberJoin-->

<!--우편번호-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#btnPost").postcodifyPopUp(); }); </script>
<script>
var frm = document.frm_modify;
window.onload = function(){
	if(frm.photocheck.value==""){
	   frm.ModifyImage.src="./imgs/basic_photoZone.png";	
	}
}

//Email Select Function
function chgdomain(){
	if(frm.email_select.value == ""){
		frm.email2.value ="";
		frm.email2.focus();
	}else{
		selectedIndex = frm.email_select.options.selectedIndex;
		frm.email2.value = frm.email_select.options[selectedIndex].value;	
	}
}

//수정
frm.btnModify.onclick = function(){
	
	//-------------------------------------------IF.로그인한 유저가 admin인경우 ----------------------------------------------------
	if(frm.sId.value == 'admin'){	
		
		if(frm.pwd.value != ""){//1.비밀번호가 공백값이 아닌 경우
		
			if(frm.pwd.value != '${vo.pwd}'){//1.비밀번호가 일치하지 않는 경우 
				alert("비밀번호가 일치하지 않습니다.");
				return false;	
			}else if(!frm.newPwd.value){//1-1 if.올바른 비밀번호 값이 있지만 새로운 비밀번호가 공백 값인 경우 -> pwd에 공백값이 들어가는 것을 방지
				frm.newPwd.value = frm.pwd.value; 
				frm.pwdCheck.value = frm.pwd.value;
				frm.action = "MemberUpdate.member";
				frm.submit();
			}else if(frm.newPwd.value != ""){//1-2 if.비밀번호와 새로운 비밀번호에 둘 다 값이 있는 경우				
				if(frm.newPwd.value != frm.pwdCheck.value){ //새로운 비밀번호와 새로운 비밀번호 확인란이 다른 경우
					alert("변경할 비밀번호를 다시 확인해주세요.");
					return false;	
				}else{
					frm.action = "MemberUpdate.member";
					frm.submit();
				}			
			}						
		}else if(!frm.newPwd.value){//2.비밀번호와 새로운 비밀번호가 둘 다 공백인 경우
			
			if(frm.pwd.value == ""){//2-1 if.admin은 비밀번호를 입력하지 않아도 수정이 가능하기 때문에 비밀번호를 입력하지 않은 경우 pwd에 공백 값이 들어감
				frm.pwd.value = '${vo.pwd}'; //그러므로 먼저 pwd값을 비밀번호란에 불러와서  기존 비밀번호 유지한 후
				frm.newPwd.value = frm.pwd.value; //불러온 비밀번호 값을 새로운 비밀번호에 대입
				frm.pwdCheck.value = frm.pwd.value; //새로운 비밀번호 확인하는 값에도 새로운 비밀번호에 대입하여 공백 값을 방지하고 기존 비밀번호 유지
				frm.action = "MemberUpdate.member";
				frm.submit();
			}
			
		}else if(frm.newPwd.value != frm.pwdCheck.value){ //새로운 비밀번호와 새로운 비밀번호 확인란이 다른 경우
			alert("변경할 비밀번호를 다시 확인해주세요.");
			return false;	
		}else{
			frm.action = "MemberUpdate.member";
			frm.submit();
		}  	
	//-----------------------------------------IF.로그인한 유저가 admin인이 아닌 경우 -----------------------------------------------------	
	}else{
		if(!frm.pwd.value){ 
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if(frm.pwd.value != '${vo.pwd}'){
			alert("비밀번호가 일치하지 않습니다.");
			return false;	
		}else if(!frm.newPwd.value){ //새로운 비밀번호가 공백인 경우 기존 비밀번호에 공백값이 들어가는 것을 방지
			frm.newPwd.value = frm.pwd.value;
			frm.action = "MemberUpdate.member";
			frm.submit();
		}else if(frm.newPwd.value != frm.pwdCheck.value){ //새로운 비밀번호와 새로운 비밀번호 확인란이 다른 경우
			alert("변경할 비밀번호를 다시 확인해주세요.");
			return false;	
		}else{
			frm.action = "MemberUpdate.member";
			frm.submit();
		}  		
	}
}

//삭제
frm.btnDelete.onclick = function(){
	message = "정말 삭제하시겠습니까?";
	if(!frm.pwd.value){ 
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if(frm.pwd.value != '${vo.pwd}'){
		alert("비밀번호가 일치하지 않습니다.");
		return false;	
	}else if(confirm(message) == true){
 		var frm2 = document.frm_delete; 
		frm2.action = "MemberDelete.member";
		frm2.submit();	
	}
}

//사진파일 
function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	   var sibling = input.previousSibling.previousSibling;
	   console.log(sibling.outerHTML);
	    reader.onload = function (e) {
	            $(sibling).attr('src', e.target.result);
	            }
	      reader.readAsDataURL(input.files[0]);
		}
}

frm.btnPhotoDelete.onclick = function(){
	frm.ModifyImage.src = "./imgs/basic_photoZone.png";	
}

frm.btnCancle.onclick = function(){
	frm.action = "index.jsp";
	frm.submit(); 
}
</script>
</body>
</html>