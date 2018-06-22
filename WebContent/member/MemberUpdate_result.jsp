<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>
#MemberUpdate_result h2{border-bottom: 3px solid #036; padding-bottom: 5px; text-align: center; margin-left: 630px; margin-right: 630px;}
#MemberUpdate_result table{margin : 0 auto;}
#MemberUpdate_result tr, td{border: 1px solid gray;}
#MemberUpdate_result .w3-table{width: 600px;}
#MemberUpdate_result td{text-align: center; }
#MemberUpdate_result .td_1{margin-right: 5px; background-color: #eaedf2;}
#MemberUpdate_result #btnLogin_div{width: 40px; margin : 0 auto; }


</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/>
<div id="MemberUpdate_result">
<div class="w3-container">
<form name="frm_MemberUpdate_result" method="post">
<input type="hidden" name="selection" value="${vo.selection }">

  <h2 class="w3-text-blue">Modify Complete</h2><br/>
	
<c:choose>			
   <c:when test="${vo.selection == 'i' }">
  <table class="w3-table">

    <tr>
      <td class="td_1">아이디</td>
      <td>${vo.mid }</td>
    </tr>   
    <tr>
      <td class="td_1">이름</td>
      <td>${vo.irum }</td>   
    </tr> 
    <tr>
      <td class="td_1">생년월일</td>
      <td>${vo.mdate }</td>
    </tr> 
    <tr>
      <td class="td_1">전화번호</td>
      <td>${vo.phone }-${vo.phone2 }-${vo.phone3 }</td>
    </tr>     
    <tr>
      <td class="td_1">성별</td>
      <td>${vo.gender }</td>
    </tr>     
    <tr>
      <td class="td_1">우편번호</td>
      <td>${vo.post }</td>
    </tr>     
    <tr>
      <td class="td_1">기본주소</td>
      <td>${vo.address1 }</td>
    </tr>   
    <tr>
      <td class="td_1">상세주소</td>
      <td>${vo.address2 }</td>
    </tr>     
    <tr>
      <td class="td_1">이메일</td>
      <td>${vo.email } @ ${vo.email2 }</td>
    </tr>  
     <tr>
      <td class="td_1">지역</td>
      <td>${vo.area }</td>
    </tr>
  </table><br/>
 </c:when>
  <c:when test="${vo.selection == 'c' }">
  <table class="w3-table">

    <tr>
      <td class="td_1">아이디</td>
      <td>${vo.mid }</td>
    </tr>   
    <tr>
      <td class="td_1">상호명</td>
      <td>${vo.company_name }</td>   
    </tr> 
      <tr>
      <td class="td_1">사업자번호</td>
      <td>${vo.company_number }</td>
    </tr>     
    <tr>
      <td class="td_1">대표자</td>
      <td>${vo.delegate }</td>
    </tr> 
    <tr>
      <td class="td_1">전화번호</td>
      <td>${vo.phone }-${vo.phone2 }-${vo.phone3 }</td>
    </tr>     
  
    <tr>
      <td class="td_1">우편번호</td>
      <td>${vo.post }</td>
    </tr>     
    <tr>
      <td class="td_1">기본주소</td>
      <td>${vo.address1 }</td>
    </tr>   
    <tr>
      <td class="td_1">상세주소</td>
      <td>${vo.address2 }</td>
    </tr>     
    <tr>
      <td class="td_1">이메일</td>
      <td>${vo.email } @ ${vo.email2 }</td>
    </tr>  
    
    <tr>
      <td class="td_1">업종</td>
      <td>${vo.business_type}</td>
    </tr>  

    <tr>
      <td class="td_1">은행</td>
      <td>${vo.bank }</td>
    </tr>  
    
      <tr>
      <td class="td_1">계좌번호</td>
      <td>${vo.account_number }</td>
    </tr>    
    
     <tr>
      <td class="td_1">지역</td>
      <td>${vo.area }</td>
    </tr>
    
    
    
  </table><br/>
  
  
  
  </c:when>
  </c:choose> 
  <div id="btnLogin_div">
  <input type="button" id="btnHome" class="w3-button w3-blue" value="홈">
  </div>
</form>  
</div> 
</div><br/><br/><br/>
<script>
var frm = document.frm_MemberUpdate_result;

frm.btnHome.onclick = function(){
	frm.action = "index.jsp";
	frm.submit();
}
</script>
</body>
</html>