<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<title>맛집 목록</title>

	<style>
		body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
		
		#rest_list{
			max-width:1600px;
		}
		
		#list_range{
			float:right;
			
		}
		
		#list_cate{
			display:inline-block;
			width:320px;
			margin-right: 30px;
		}
		
		#insert{
			float:right;
		}
		
	</style>

</head>
<body>

<script>
function si(){
	   var xhr1 = new XMLHttpRequest();
	   var xhr2 = new XMLHttpRequest();
	   var url1 = './location/location1.txt';
	   var url2 = './location/location2.txt';
	   xhr1.open('get', url1);
	   xhr1.send();
	   xhr2.open('get', url2);
	   xhr2.send();
	   
	   xhr1.onreadystatechange = function(){
	      if(xhr1.status == 200 && xhr1.readyState==4){
	         var rs1 = document.getElementById("result1");
	         var temp1 = xhr1.responseText;
	         var data1 = JSON.parse(temp1);
	         var str1 = "";
	            str1 += "<select class= 'selectpicker form-control' name  = 'raddress1' id = 'raddress1' onchange = 'gu()' style='width:130px'>";
	            str1 += "<option value = ''>전체</option>"
	            
	         for(var i=0; i<data1[0].location1.length; i++){
	            str1 += "<option >" +data1[0].location1[i]+ "</option>";
	         }
	            str1 += "</select>";
	            rs1.innerHTML = str1;
	      }
	   }
	   
	   xhr2.onreadystatechange = function(){
	      if(xhr2.status == 200 && xhr2.readyState==4){
	         var rs2 = document.getElementById("result2");
	         var temp2 = xhr2.responseText;
	         var data2 = JSON.parse(temp2);
	         
	         var str2 = "<select class= 'selectpicker form-control' name  = 'raddress2' id = 'raddress2' style='width:130px'>";
	         	 str2 += "<option value = ''>전체</option>";
	         	 str2 += "</select>";
	         rs2.innerHTML = str2;
	         
	   }
	si2();
	}
}

	/* json으로 구 목록 나타내기 */
	   function gu(){
	      var add = document.getElementById("raddress1");
	      var index= add.selectedIndex-1;

	      var xhr = new XMLHttpRequest();
	      var url = './location/location2.txt';
	      xhr.open('get', url);
	      xhr.send();

	      xhr.onreadystatechange = function(){
	         if(xhr.status == 200 && xhr.readyState==4){
	            var rs = document.getElementById("result2");
	            var temp = xhr.responseText;
	            var data = JSON.parse(temp);
	            
	            var str = "";
	            str += "<select class= 'selectpicker form-control' name  = 'raddress2' style='width:130px'>";
	               
	            if(index==-1){
	                str += "<option value = ''>전체</option>";
	            }else{
	            	str += "<option value = ''>전체</option>";	
	            	for(i=0; i<data[index].district.length; i++){
	               		str += "<option >" +data[index].district[i]+ "</option>";
	                }
	            }
	            str += "</select>";
	            rs.innerHTML = str;
	         }
	         gu2();
	      }
	   }
	
</script>

<div class='container'>

<div id='rest_list'>
	
	<br/>
	<br/>
	<br/>

	<form name='rest_list' method='post'>
		
		
		<!-- 시/군/구, 검색 부분 -->
		<div id='find'>
		<input type="hidden" name="hiddenAdd1" value="${param.raddress1 }">
		<input type="hidden" name="hiddenAdd2" value="${param.raddress2 }">
	 	<div id = "result1" style="float:left;"></div>
 		<div id = "result2" style="float:left;"></div>
 		
		<input type='text' name='findStr' value="${param.findStr }" class="w3-half" style="height:35px;" />
		<input type='button' name='btnFind' value='검색' class="btn btn-primary" style="height:35px;"/><br/>

		</div>
		<p/> 
		<p/>
		
	<div id='list_range'>
		<select name='orderBy' size='1' onchange="submit()" class="w3-select w3-border" style="width:150px;">
			<option value="등록순" ${param.orderBy eq "등록순" ? "selected" :""}>등록순</option>
			<option value='조회순' ${param.orderBy eq "조회순" ? "selected" :""}>조회순</option>
		</select>
	</div>
			
	
	<div style="height:100px"></div>

	
	
	<c:forEach var="rvo" items='${list }'>
		<div id='list_cate'>
			<a href='#' onclick='serialFunc(this)' id='${rvo.pserial}' >
			<img src='./restaurant/thumbnail/thumb_${rvo.rmAttFile }' width="100%" class="w3-border" style="padding:4px;" /><br/>
			<br/>
			<h3>${rvo.rname}</h3>
			<p>${rvo.rmenus }</p>
			<p>${rvo.rinfo }</p>
			</a>
			<br/>
			<br/>
		</div>
	</c:forEach>
	
		
		<!-- 반복문끝 -->	
	
	<!-- 사업자인 경우에만 보이게 if문 작성 -->
	<% 
		if(session.getAttribute("sId") != null){
			String sId = (String)session.getAttribute("sId");			
		}
		if(session.getAttribute("selection") != null){
			String selection = (String)session.getAttribute("selection");
		}
	%>
	<c:if test="${sId != null and selection == 'c'}">
		<div id='insert'>
			<input type='button' value='맛집 등록하기' name='btnInsert' class="btn btn-primary">
		</div>
	</c:if>
		
			<input type='hidden' name='serial' value='1'>
			<input type='hidden' name='nowPage' value='1'>
			
			
	<div id='page'>
     	<c:if test='${dao.nowBlock>1 }'>	<!-- 현재 블럭이 2이상 일때만 -->
     		<input type='button' name='btnFirst' value='≤' class="btn btn-primary" 
     			onclick='movePage2(1)'>
     		<input type='button' name='btnPrev'  value='＜'  class="btn btn-primary"
     			 onclick='movePage2(${dao.startPage-1 })'>
     	</c:if>
     	
     	<c:forEach var='i' begin='${dao.startPage }' end='${dao.endPage }'>
     		<input type='button' name='${i }'	 value='${i }' class="btn btn-primary"
     			 onclick='movePage2(${i})'>
     	</c:forEach>
     	
     	<c:if test='${dao.nowBlock < dao.totBlock }'>  <!-- 현재 블럭 번호가 전체 블럭 보다 작을 경우 -->
     		<input type='button' name='btnNext'	 value='＞' class="btn btn-primary" 
     			 onclick='movePage2(${dao.endPage+1 })'>
     		<input type='button' name='btnLast'	 value='≥' class="btn btn-primary"
     			 onclick='movePage2(${dao.totPage})'>
     	</c:if>
     </div>
	
	
	
	</form>	

</div>
	
	<br/>
	<br/>
</div>
<script>
	si();
	var frm = document.rest_list;
	frm.btnFind.onclick = function() {		// 상단 검색 버튼 클릭시
		frm.action = "list.donghwan";
		frm.submit();
	}

	frm.btnInsert.onclick = function(){		// 맛집 등록하기 버튼 클릭시
		frm.action = "insert.donghwan";
		frm.submit();
	}
	function serialFunc(obj){
		frm.serial.value = obj.id;  
		frm.action = "view.donghwan";
		frm.submit();
	}
	
	function submit(){
		frm.action = "list.donghwan";
		frm.submit();
	}
	
	function movePage2(nowPage){
		frm.nowPage.value = nowPage;
		frm.submit();
	}
	
	function si2(){
		frm.raddress1.value=frm.hiddenAdd1.value;
		gu();		
	}
	function gu2(){
		if(frm.hiddenAdd2.value!=""&& frm.raddress1.value==frm.hiddenAdd1.value){
			frm.raddress2.value=frm.hiddenAdd2.value;
		}
	}
</script>
</body>
</html>