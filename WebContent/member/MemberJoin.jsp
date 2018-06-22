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
#MemberJoin html {font-family: 'Montserrat', Arial, sans-serif;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;}
body { background-color: #ffffff;} 
#MemberJoin button {overflow: visible; }
#MemberJoin button, select, input {text-transform: none; }
#MemberJoin button, input, select, textarea {color: #5A5A5A;font: inherit;margin: 0;}
#MemberJoin input {line-height: normal; }
#MemberJoin #container {border: solid 3px #474544;max-width: 768px;margin: 60px auto;position: relative;}
#MemberJoin form {padding: 37.5px; margin: 50px 0; }
#MemberJoin h1 {color: #474544;font-size: 32px;font-weight: 700;letter-spacing: 7px;text-align: center;text-transform: uppercase;}
#MemberJoin .underline {border-bottom: solid 2px #474544;margin: -0.512em auto;width: 80px;}
#MemberJoin .phone {width: 14.5%; display:inline-block;	}
#MemberJoin .phone2 {width: 14.5%; display:inline-block; }
#MemberJoin .phone3 {width: 14.5%; display:inline-block; }
#MemberJoin .irum {float: left; width: 45%; }
#MemberJoin .mid {float: left; width: 45%; height: 70px;}
#MemberJoin .pwd{float: left; width: 45%;}
#MemberJoin .pwdCheck{float: left; width: 45%;}
#MemberJoin .mdate{float: left; width: 45%;}
#MemberJoin .company_name{float: left; width: 45%;}
#MemberJoin .delegate{float: left; width: 45%;}
#MemberJoin .company_number{float: right; width: 45%;}
#MemberJoin .account_number{float: left; width: 45%;}
#MemberJoin .bank{float: right; width: 45%;}
#MemberJoin .email{display:inline-block; width: 21%; }
#MemberJoin .email2{display:inline-block; width: 21%; }
#MemberJoin #post{float: left; width: 45%; }
#MemberJoin .area{float: right; width: 45%; }
#MemberJoin input[type='text'], [type='password'], [type='date'], select,  textarea {background: none;border: none;border-bottom: solid 2px #474544;color: #474544;font-size: 1.000em;font-weight: 400;letter-spacing: 1px;margin: 0em 0 1.875em 0;padding: 0 0 0.875em 0;width: 100%;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;-ms-box-sizing: border-box;-o-box-sizing: border-box;box-sizing: border-box;-webkit-transition: all 0.3s;-moz-transition: all 0.3s;-ms-transition: all 0.3s;-o-transition: all 0.3s;transition: all 0.3s;}
#MemberJoin input[type='text']:focus, [type='password']:focus, textarea:focus {outline: none; padding: 0 0 0.875em 0; }
#MemberJoin select{background: url('https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-arrow-down-32.png') no-repeat right;outline: none;-moz-appearance: none;-webkit-appearance: none;}
#MemberJoin select::-ms-expand {display: none; }
#MemberJoin input[type='date']::-ms-expand {display: none; }
#MemberJoin ::-webkit-input-placeholder {color: #474544; }
#MemberJoin :-moz-placeholder {color: #474544; opacity: 1; }
#MemberJoin ::-moz-placeholder {color: #474544; opacity: 1; }
#MemberJoin :-ms-input-placeholder {color: #474544; }
#MemberJoin #form_button {background: none;border: solid 2px #474544;color: #474544;cursor: pointer;display: inline-block;font-family: 'Helvetica', Arial, sans-serif;font-size: 0.875em;font-weight: bold;outline: none;padding: 20px 35px;text-transform: uppercase;-webkit-transition: all 0.3s;-moz-transition: all 0.3s;-ms-transition: all 0.3s;-o-transition: all 0.3s;transition: all 0.3s;}
#MemberJoin #btnPost, #btnJoin, #btnCancle{background: none;border: solid 2px #474544;color: #474544;cursor: pointer;display: inline-block;font-family: 'Helvetica', Arial, sans-serif;font-size: 0.875em;font-weight: bold;outline: none;padding: 10px 35px;text-transform: uppercase;-webkit-transition: all 0.3s;-moz-transition: all 0.3s;-ms-transition: all 0.3s;-o-transition: all 0.3s;transition: all 0.3s;margin-left: 20px;}
#MemberJoin #idCheck{background: none;border: solid 2px #474544;color: #474544;cursor: pointer;display: inline-block;font-family: 'Helvetica', Arial, sans-serif;font-size: 0.875em;font-weight: bold;outline: none;padding: 10px 35px;text-transform: uppercase;-webkit-transition: all 0.3s;-moz-transition: all 0.3s;-ms-transition: all 0.3s;-o-transition: all 0.3s;transition: all 0.3s;margin-left: 30px;width: 310px; }
#MemberJoin #btnJoin{margin-left: 230px; }
#MemberJoin .idCheck, .btnPost  {margin-left: 348px;}
#MemberJoin #btnPost {width: 310px;}
#MemberJoin #idCheck:hover {background: #474544; color: #F2F3EB; }
#MemberJoin #btnPost:hover {background: #474544; color: #F2F3EB; }
#MemberJoin #btnJoin:hover {background: #474544; color: #F2F3EB; }
#MemberJoin #btnCancle:hover {background: #474544; color: #F2F3EB; }
#MemberJoin #form_button:hover {background: #474544; color: #F2F3EB; }
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
#photo_div{overflow:hidden;height: 255px;width:308px;float: right;border-radius: 10px;box-shadow: 5px 5px 20px -5px rgba(0, 0, 0, 0.8);}
/* 사진파일 */
.file_input label {cursor:pointer;}
.file_input label input {position:absolute;width:0;height:0;overflow:hidden; }
.file_input input[type=text] {display:none;}
</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="MemberJoin">
<div id="container">
  <h1>&bull; Registration &bull;</h1>
  <div class="underline">
  </div>
  <form name="frm_join" method="post" id="contact_form" enctype="multipart/form-data">
  <input type="hidden" name="selection" id="selection" value="${param.selection }">
  <input type="hidden" name="selection_JS" id="selection_JS" value="${param.selection }">
	
	 <c:choose>			
	 <c:when test="${param.selection == 'i' }">	
	 
	 <div id="join_up"> 
	  	 <div class="mid">
	     	<label for="mid"></label>
	     	<input type="text" placeholder="아이디" name="mid" id="mid" required>
	     </div>
	    
	     <div class="idCheck">
	        <label for="idCheck"></label>
	        <input type="button" name="idCheck" id="idCheck" value="ID 중복확인" required>	        
	     </div>         
    </div><br/><br/>
         
  	 <div class="pwd">
        <label for="pwd"></label>
        <input type="password" placeholder="비밀번호" name="pwd" id="pwd" required>
     </div>
     
     <div id="photo_div"> 
	     <div class = "file_input">
	     <label class = "accommodation_img" style = "width:100%"> 
	        <img class="w3-image" src="./imgs/basic_photoZone.png" alt="Picture" width="100%"  >
	        <input type="file" name = "attfile0" onchange="readURL(this)">
	     </label>
		 </div>
     </div>
     <br/><br/><br/>
 
     <div class="pwdCheck">
        <label for="pwdCheck"></label>
        <input type="password" placeholder="비밀번호확인" name="pwdCheck" id="pwdCheck" required>
     </div>
    
     <div class="irum">
        <label for="irum"></label>
        <input type="text" placeholder="이름" name="irum" id="irum" required>
     </div><br/><br/><br/><br/><br/>

     <div class="mdate">
        <label for="mdate"></label>
        <input type="date" placeholder="생년월일" name="mdate" id="mdate" required >
     </div><br/><br/><br/><br/><br/><br/>
  
  	 <div class="question">
      <label for="question"></label>
      <select name="question" id="question" required>
        <option disabled hidden selected>비밀번호 확인질문</option>
        <option value="가장 추억에 남는 장소는?">가장 추억에 남는 장소는?</option>
		<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
	    <option value="자신의 보물 제1호">자신의 보물 제1호</option>
		<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
		<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
		<option value="추억하고 싶은 날짜가 있다면?">추억하고 싶은 날짜가 있다면?</option>
		<option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
		<option value="유년시절 가장 생각나는 친구 이름은?">유년시절 가장 생각나는 친구 이름은?</option>
		<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
		<option value="읽은 책 중에서 좋아하는 구절이 있다면?">읽은 책 중에서 좋아하는 구절이 있다면?</option>
		<option value="자신이 두번째로 존경하는 인물은?">자신이 두번째로 존경하는 인물은?</option>
		<option value="초등학교 때 기억에 남는 짝꿍 이름은?">초등학교 때 기억에 남는 짝꿍 이름은?</option>
		<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
		<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
      </select>
     </div>
  	
  	 <div class="answer">
        <label for="answer"></label>
        <input type="text" placeholder="질문에 대한 답변" name="answer" id="answer" required>
     </div>
  
     <div class="phone">
        <label for="phone"></label>
        <input type="text" placeholder="전화번호" name="phone" id="phone" required >
     </div>
    
     <div class="phone2">
        <label for="phone2"></label>
        <input type="text" name="phone2" id="phone2" required >
     </div>
        
     <div class="phone3">
        <label for="phone3"></label>
        <input type="text" name="phone3" id="phone3" required >
     </div>

     <div class="genderName">
        <label for="genderName"></label>
        <input type="text" placeholder="성별" name="genderName" id="genderName" style="text-align: center;" readonly required>
     </div>
 
	 <div id="radioBtn">
		 <div id="radio1">
		 <label class="radio">M
		 <input type="radio" checked="checked" name="gender" value="남">
		 <span class="checkmark"></span>
		 </label>
		 </div>
	
		 <div id="radio2">
		 <label class="radio">F
		 <input type="radio" name="gender" value="여">
		 <span class="checkmark"></span>
		 </label>
		 </div>
	 </div>
	
	 <div class="post">
        <label for="post"></label>
        <input type="text" placeholder="우편번호" name="post" id="post" class="postcodify_postcode5" required>
     </div>
    
     <div class="btnPost">
        <label for="btnPost"></label>
        <input type="button" name="btnPost" id="btnPost" value="우편번호" required>
     </div>
    
     <div class="address1">
        <label for="address1"></label>
        <input type="text" placeholder="기본주소" name="address1" id="address1" class="postcodify_address" required>
     </div>
  
  	 <div class="address2">
        <label for="address2"></label>
        <input type="text" placeholder="상세주소" name="address2" id="address2" class="postcodify_details" required>
     </div>
  
  	 <div id="email_group">
  	 <div class="email">
        <label for="email"></label>
        <input type="text" placeholder="이메일" name="email" id="email" class="email" required>
     </div>    
     <label>@</label>
     <div class="email2">
      <label for="email2"></label>
      <select name="email2" id="email2" required>
        <option disabled hidden selected>이메일선택</option>
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
        <option disabled hidden selected>지역</option>      
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
  	
    <div class="btnButton">
      <label for="btnJoin"></label>
      <input type="button" name="btnJoin" id="btnJoin" value="가입" required>
      
      <label for="btnCancle"></label>
      <input type="button" name="btnCancle" id="btnCancle" value="취소" required>
      <input type="hidden" name="selection" value="i">
    </div>
    </c:when>
       
    <c:when test="${param.selection == 'c' }">
    
    <div class="mid">
     	<label for="mid"></label>
     	<input type="text" placeholder="아이디" name="mid" id="mid" required>
    </div>
    
    <div class="idCheck">
        <label for="idCheck"></label>
        <input type="button" name="idCheck" id="idCheck" value="ID 중복확인" required>
    </div><br/><br/>
  
  	<div class="pwd">
        <label for="pwd"></label>
        <input type="password" placeholder="비밀번호" name="pwd" id="pwd" required>
    </div> 
     
    <div id="photo_div">
	     <div class = "file_input">
	     <label class = "accommodation_img" style = "width:100%"> 
	        <img class="w3-image" src="./imgs/basic_photoZone.png" alt="Picture" width="100%"  >
	        <input type="file" name = "attfile0" onchange="readURL(this)">
	     </label>
		 </div>
    </div><br/><br/>

    <div class="pwdCheck">
        <label for="pwdCheck"></label>
        <input type="password" placeholder="비밀번호확인" name="pwdCheck" id="pwdCheck" required>
    </div><br/><br/>   
	
	<div class="delegate">
        <label for="delegate"></label>
        <input type="text" placeholder="대표자명" name="delegate" id="delegate" required>
    </div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
      
  	<div class="question">
      <label for="question"></label>
      <select name="question" id="question" required>
        <option disabled hidden selected>비밀번호 확인질문</option>
        <option value="가장 추억에 남는 장소는?">가장 추억에 남는 장소는?</option>
		<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
	    <option value="자신의 보물 제1호">자신의 보물 제1호</option>
		<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
		<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
		<option value="추억하고 싶은 날짜가 있다면?">추억하고 싶은 날짜가 있다면?</option>
		<option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
		<option value="유년시절 가장 생각나는 친구 이름은?">유년시절 가장 생각나는 친구 이름은?</option>
		<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
		<option value="읽은 책 중에서 좋아하는 구절이 있다면?">읽은 책 중에서 좋아하는 구절이 있다면?</option>
		<option value="자신이 두번째로 존경하는 인물은?">자신이 두번째로 존경하는 인물은?</option>
		<option value="초등학교 때 기억에 남는 짝꿍 이름은?">초등학교 때 기억에 남는 짝꿍 이름은?</option>
		<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
		<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
      </select>
    </div>
  	
  	<div class="answer">
        <label for="answer"></label>
        <input type="text" placeholder="질문에 대한 답변" name="answer" id="answer" required>
    </div> 
  
    <div class="phone">
        <label for="phone"></label>
        <input type="text" placeholder="전화번호" name="phone" id="phone" required >
    </div>
    
    <div class="phone2">
        <label for="phone2"></label>
        <input type="text" name="phone2" id="phone2" required >
    </div>
        
    <div class="phone3">
        <label for="phone3"></label>
        <input type="text" name="phone3" id="phone3" required >
    </div>

    <div class="company_number">
        <label for="company_number"></label>
        <input type="text" placeholder="사업자번호" name="company_number" id="company_number" required>
    </div>
     
	<div class="post">
        <label for="post"></label>
        <input type="text" placeholder="우편번호" name="post" id="post" class="postcodify_postcode5" required>
    </div>
    
    <div class="btnPost">
        <label for="btnPost"></label>
        <input type="button" name="btnPost" id="btnPost" value="우편번호" required>
    </div>
    
    <div class="address1">
        <label for="address1"></label>
        <input type="text" placeholder="기본주소" name="address1" id="address1" class="postcodify_address" required>
    </div>
  
  	<div class="address2">
        <label for="address2"></label>
        <input type="text" placeholder="상세주소" name="address2" id="address2" class="postcodify_details" required>
    </div>
  
  	<div id="email_group">
  	 <div class="email">
        <label for="email"></label>
        <input type="text" placeholder="이메일" name="email" id="email" class="email" required>
     </div>     
     <label>@</label>
     <div class="email2">
     <label for="email2"></label>
     <select name="email2" id="email2" required>
        <option disabled hidden selected>이메일선택</option>
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
        <option disabled hidden selected>지역</option>      
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
        <input type="text" placeholder="업종" name="business_type" id="business_type" required>
     </div>
  	
  	<div class="account_number">
        <label for="account_number"></label>
        <input type="text" placeholder="계좌번호" name="account_number" id="account_number" required>
    </div>
  	
    <div class="bank">
      <label for="bank"></label>
      <select name="bank" id="bank" required>
        <option disabled hidden selected>은행</option>
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
    </div><br/><br/><br/><br/>
	
    <div class="btnButton">
      <label for="btnJoin"></label>
      <input type="button" name="btnJoin" id="btnJoin" value="가입" required>
      
      <label for="btnCancle"></label>
      <input type="button" name="btnCancle" id="btnCancle" value="취소" required>
      <input type="hidden" name="selection" value="c">
    </div>
    </c:when>
    </c:choose>
  </form><!-- // End form -->
</div><!-- // End #container -->
</div><!-- // END #MemberJoin-->

<!--우편번호-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#btnPost").postcodifyPopUp(); }); </script>
<script>
var frm = document.frm_join;

//Id Check
frm.mid.onclick = function(){ //공백인 mid text를 클릭한 경우
	if(!frm.mid.value){	
	var page = './member/MemberIdCheck.jsp?selection=${param.selection}'; 
	var win = window.open(page, 'win', 'width=550, height=500');
	}	
}

frm.idCheck.onclick = function(){
	var page = './member/MemberIdCheck.jsp?selection=${param.selection}'; 
	var win = window.open(page, 'win', 'width=550, height=500');
}

//가입
frm.btnJoin.onclick = function(){	
	
	if(frm.selection_JS.value == 'i'){			

		if(!frm.mid.value){			
			alert("아이디를 입력해주세요");
			return false;
		}else if(!frm.pwd.value){
			alert("비밀번호를 입력해주세요");
			return false;
		}else if(!frm.pwdCheck.value){
			alert("비밀번호 확인란을 입력해주세요");
			return false;	
		}else if(!frm.irum.value){
			alert("이름을 입력해주세요");
			return false;	
		}else if(!frm.mdate.value){
			alert("생년월일을 입력해주세요");
			return false;	
		}else if(frm.question.value == "비밀번호 확인질문" ){
			alert("질문을 선택해주세요");
			return false;	
		}else if(!frm.answer.value){
			alert("답변을 입력해주세요");
			return false;	
		}else if(!frm.phone.value){
			alert("전화번호를 입력해주세요");
			return false;	
		}else if(!frm.phone2.value){
			alert("전화번호를 입력해주세요");
			return false;	
		}else if(!frm.phone3.value){
			alert("전화번호를 입력해주세요");
			return false;
		}else if(!frm.post.value){
			alert("우편번호를 입력해주세요");
			return false;	
		}else if(!frm.address1.value){
			alert("기본주소를 입력해주세요");
			return false;
		}else if(!frm.address2.value){
			alert("상세주소를 입력해주세요");
			return false;
		}else if(!frm.email.value){
			alert("이메일을 입력해주세요");
			return false;
		}else if(frm.email2.value == "이메일선택"){
			alert("이메일을 입력해주세요");
			return false;
		}else if(frm.area.value == "지역"){
			alert("지역을 입력해주세요");
			return false;
		}else if(frm.pwd.value != frm.pwdCheck.value){
			alert("비밀번호가 일치하지 않습니다.");	
			return false;
		}else{	
			frm.action ="MemberJoin.member";
			frm.submit();
		}
	
	}else if(frm.selection_JS.value == 'c'){
		
		if(!frm.mid.value){			
			alert("아이디를 입력해주세요");
			return false;
		}else if(!frm.pwd.value){
			alert("비밀번호를 입력해주세요");
			return false;
		}else if(!frm.pwdCheck.value){
			alert("비밀번호 확인란을 입력해주세요");
			return false;	
		}else if(!frm.delegate.value){
			alert("대표자명을 입력해주세요");
			return false;
		}else if(frm.question.value == "비밀번호 확인질문" ){
			alert("질문을 선택해주세요");
			return false;	
		}else if(!frm.answer.value){
			alert("답변을 입력해주세요");
			return false;	
		}else if(!frm.phone.value){
			alert("전화번호를 입력해주세요");
			return false;	
		}else if(!frm.phone2.value){
			alert("전화번호를 입력해주세요");
			return false;	
		}else if(!frm.phone3.value){
			alert("전화번호를 입력해주세요");
			return false;
		}else if(!frm.company_number.value){
			alert("사업자 번호를 입력해주세요");
			return false;
		}else if(!frm.post.value){
			alert("우편번호를 입력해주세요");
			return false;	
		}else if(!frm.address1.value){
			alert("기본주소를 입력해주세요");
			return false;
		}else if(!frm.address2.value){
			alert("상세주소를 입력해주세요");
			return false;
		}else if(!frm.email.value){
			alert("이메일을 입력해주세요");
			return false;
		}else if(frm.email2.value == "이메일선택"){
			alert("이메일을 입력해주세요");
			return false;
		}else if(frm.area.value == "지역"){
			alert("지역을 입력해주세요");
			return false;
		}else if(!frm.business_type.value){
			alert("업종을 입력해주세요");
			return false;
		}else if(!frm.account_number.value){
			alert("계좌번호를 입력해주세요");
			return false;
		}else if(frm.bank.value == "은행"){
			alert("은행을 선택해주세요");
			return false;
		}else if(frm.pwd.value != frm.pwdCheck.value){
			alert("비밀번호가 일치하지 않습니다.");	
			return false;
		}else{	
			frm.action ="MemberJoin.member";
			frm.submit();
		}
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
   
frm.btnCancle.onclick = function(){
	frm.action = "index.jsp";
	frm.submit(); 
}
</script>
</body>
</html>