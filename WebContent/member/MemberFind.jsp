<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>W3.CSS</title>
<style>
#MemberFind {height: 500px; width:500px; margin: auto;}
#MemberFind header{text-align: center; margin-top: 50px;  height: 60px; }
#MemberFind h1{line-height: 60px;}
#MemberFind #btnFind{margin-left: 160px; color: #ffffff; background-color: #ea4f37; width: 100px; height: 40px;margin-bottom: 20px;}
#MemberFind #phone, #phone2, #phone3{display:inline-block; width: 118px; text-align: center}
#MemberFind .member_g{margin-left: 50px;}
#MemberFind #selection{margin-left: 10px; width: 120px;}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<br/><br/><br/><br/><br/>
<div id="MemberFind">
	<header class="w3-blue">
	  <h1>ID/Password 찾기</h1>
	</header>

	<div name="MemberFind_div" class="w3-container w3-half w3-margin-top" style="width:100%; ">

	<form name="frm_MemberFind" method="post" action="MemberFind.member" class="w3-container w3-card-4" style="width:100%">
		<input type="hidden" name="selection2" value="${param.selection2 }">
		
		<c:choose>
	
		<c:when test="${param.selection2 == 'e' }">
		
		<p><p><p>
		<input class="w3-radio" type="radio" name="search_division" value="e" checked disabled>
		<label>E-mail</label>
		<input class="w3-radio" type="radio" name="search_division" value="f" disabled>
		<label>전화번호</label>
	
		
		<label class="member_g">회원유형</label>
		<select id="selection" name="selection">
			<option value="i">개인회원</option>
			<option value="c">사업자회원</option>	   
		</select><br/><br/>
	
		<p>
		<label>이름 및 대표자명</label>
		<input class="w3-input" type="text" name="irum" style="width:100%" required><br/>
		
		
		<label>E-mail</label>
		<input class="w3-input" type="text" name="email" style="width:100%" required>
		</p><br/>
		
		<input type="submit" id="btnFind" class="w3-button w3-blue" value="확인"/>
		
		</c:when>
	
		<c:when test="${param.selection2 == 'p' }">
		
		<p>
		<input class="w3-radio" type="radio" name="search_division" value="e" disabled>
		<label>E-mail</label>		
		<input class="w3-radio" type="radio" name="search_division" value="f" checked disabled>
		<label>전화번호</label>
		
		<label class="member_g">회원유형</label>
		<select id="selection" name="selection">
			<option value="i">개인회원</option>
			<option value="c">사업자회원</option>	   
		</select><br/><br/>
		
		<p>
		<label>이름 및 대표자명</label>
		<input class="w3-input" type="text" name="irum" style="width:100%"  required><br/>
		
		
		<label>전화번호</label>
		<div id="phone">
		<input class="w3-input" type="text" name="phone" style="width:100%" required>
		
		</div>
		<label>-</label>
		
		<div id="phone2">
		<input class="w3-input" type="text" name="phone2" style="width:100%" required>
		</div>
		<label>-</label>
		
		<div id="phone3">
		<input class="w3-input" type="text" name="phone3" style="width:100%" required>
		</div>
		</p>
		<br/>
		
		<input type="submit" id="btnFind" class="w3-button w3-blue" value="확인"/>
		
		</c:when>
		</c:choose>
	</form>
</div>
</div>
</body>
</html> 