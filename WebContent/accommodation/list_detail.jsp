<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.hotel-pic{
	background-size: cover;
	width: 100%;
}
</style>
</head>
<body>
<form name="frm_list_detail" method="post">
<div class="container hotel-pic"
			style="background-image: url(./imgs/hotel_list.jpg)">
			<div class="visual-text w3-center" style='z-index: 4; height: 30%'>
				<h1
					style="background-image: url('./imgs/full_course.svg'); margin-top: -5%;">Full
					Course Trip</h1>
				<div style="margin-top: -3%">
					<div class="w3-row"
						style='width: 40%; margin-right: 30%; margin-left: 30%;'>
						<div class="w3-half" id="result1"></div>
						<div class="w3-half" id="result2"></div>
					</div>
					<div class="w3-row search"
						style='width: 40%; margin-right: 30%; margin-left: 30%;'>
						<input type="text" placeholder="검색할 호텔명 입력.." name="findStr"
							style="border: 0px; border-radius: 3px; padding-left: 16px; z-index: 3;"
							value="${vo.findStr}">
						<button type="button" class="w3-teal" onclick='list_detail()'>
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	<input type="hidden" name="hiddenAdd1" value="${vo.address1 }">
    <input type="hidden" name="hiddenAdd2" value="${vo.address2 }">
	<input type='hidden' name='part' value = '${vo.part}'>
	<input type="hidden" name="serial" value='${vo.serial}'>
	<input type="hidden" name="acco_nowPage" value='${vo.acco_nowPage}'>
	<div id="list_inner">
	</div>
</form>
<script>
var frm = document.frm_list_detail;
$(document).ready(function(){
	$('input').attr('autocomplete','off');
	var navbar = document.getElementById("myNavbar");
	var holder = document.getElementById("holder");
	navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    holder.className = "nav-holder" + " w3-padding-large" + " nav_small";
    $(".default").css("display","none");
	$(".scrolled").css("display","block");	
	list_detail();
});
si();
	
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
             str1 += "<select class= 'selectpicker form-control' name  = 'address1' id = 'address1' onchange = 'gu()'>";
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
          
          var str2 = "<select class= 'selectpicker form-control' name  = 'address2' id = 'address2'>";
              str2 += "<option value = ''>전체</option>";
              str2 += "</select>";
          rs2.innerHTML = str2;      
    }
 si2();
 }
}
function gu(){
 var add = document.getElementById("address1");
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
       str += "<select class= 'selectpicker form-control' name  = 'address2' id ='address2'>";
                
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
function list_detail(){
	 var url="list_detail_inner.ac";  
	 var findStr=frm.findStr.value;
	 var address1=frm.address1.value;
	 var address2=frm.address2.value;
	 var part=frm.part.value;
	 var acco_nowPage=frm.acco_nowPage.value;
	 var param={"findStr":findStr,"address1":address1,"address2":address2,"part":part,"acco_nowPage":acco_nowPage};  
	  
	 $.ajax({      
		 type:"POST",  
	     url:url,      
	     data:param,      
	     success:function(args){   
	         $("#list_inner").html(args);      
	     },  
	     error:function(e){  
	         alert(e.responseText);  
	     }  
	 });
}

function go(serial){
	frm.serial.value = serial;
	frm.action = "selectOne.ac";
	frm.submit();
}

function movePage(acco_nowPage){
	frm.acco_nowPage.value = acco_nowPage;
	list_detail();
}
function si2(){
	   frm.address1.value=frm.hiddenAdd1.value;
	   gu();      
	}
function gu2(){
	if(frm.hiddenAdd2.value!=""&& frm.address1.value==frm.hiddenAdd1.value){
		frm.address2.value=frm.hiddenAdd2.value;
	}
}
</script>
</body>
</html>