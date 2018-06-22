<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>

/* json으로 시 목록 나타내기 */
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
			for(var i=0; i<data2[0].district.length; i++){
			str2 += "<option>" + data2[0].district[i] + "</option>";
			}
			str2 += "</select>";
			rs2.innerHTML = str2;
			
		}
	}
}

/* json으로 구 목록 나타내기 */
	function gu(){
		
		var add = document.getElementById("address1");
		var rs2 = document.getElementById("result2");
		var index= add.selectedIndex;

		var xhr = new XMLHttpRequest();
		var url = './location/location2.txt';
		xhr.open('get', url);
		xhr.send();

		xhr.onreadystatechange = function(){
			if(xhr.status == 200 && xhr.readyState==4){
				var temp = xhr.responseText;
				var data = JSON.parse(temp);
				
				var str = "";
					str += "<select class= 'selectpicker form-control' name  = 'address2'>";
					
				for(i=0; i<data[index].district.length; i++){
					str += "<option >" +data[index].district[i]+ "</option>";
						}
					str += "</select>";
				rs2.innerHTML = str;
			}
		}
	}
</script>


<div class="container">
<form name = "frm_modify" method = "post" enctype = "multipart/form-data">
<input type = "hidden" name = "worker" value = "park">
<input type = "text" id  = "serial" name = "serial" value = "${vo.serial}">
<div id = "rserial_list"></div>
<div class="container-fluid">
  <div class="row content">
   <div class="col-sm-6">
    <br/>
	<div class = "file_input">
	<label class = "accommodation_img" style = "width:100%">
	<div class="accommodation_img change_background" style = "background-image: url('./accommodation_album/${vo.attfileshow}');">
	<input type="file" name = "attfile0" onchange="readURL(this)">
	<input type = "hidden" value = "${vo.attfileshow}">
	</div>
	</label>
	</div>

   </div>
    <div class="col-sm-6">
    <br/>
  <!-- One "tab" for each step in the form: -->
      <!-- One "tab" for each step in the form: -->
  <div class="tab">업체이름, 위치:
  <div class="input-group">
  <span class="input-group-addon">숙박종류</span>
  <select class= 'selectpicker form-control' name  = 'part'>
  	  <option ${(vo.freeparking eq '리조트')?'selected': ''}>리조트</option>
	  <option ${(vo.freeparking eq '호텔')?'selected': ''}>호텔</option>
	  <option ${(vo.freeparking eq '모텔')?'selected': ''}>모텔</option>
	  <option ${(vo.freeparking eq '게스트하우스')?'selected': ''}>게스트하우스</option>
	  <option ${(vo.freeparking eq '캠핑장')?'selected': ''}>캠핑장</option>
  </select>
  </div>
  
    <div class="input-group">
	    <span class="input-group-addon">업체이름</span>
	    <input type="text" class="form-control" name="aname"  value = "${vo.aname}"oninput="this.className = 'form-control'">
  	</div>
  	<div class="input-group">
	<span class="input-group-addon">위&ensp;&ensp;&ensp;&ensp;치</span>
	<div class = "form-inline">
	<span id = "result1">
	</span>
	<span id = "result2">
	</span>
	</div>
	</div>
	<div class="input-group">
	    <span class="input-group-addon">상세주소</span>
	    <input type="text" class="form-control" name="address3" value = "${vo.address3}" oninput="this.className = 'form-control'">
  	</div>
  </div>
  
  <div class="tab">선택하세요:
    <div id = "text-center">
	<label class="checkbox-inline">
	   <input type="checkbox" name = "freeparking" ${(vo.freeparking eq 'O')?'checked': ''} value = "O">무료주차
	</label>
	<label class="checkbox-inline">
	   <input type="checkbox" name = "freewifi" ${(vo.freewifi eq 'O')?'checked': ''} value = "O">와이파이
	</label>
	<label class="checkbox-inline">
	   <input type="checkbox" name = "freemeal" ${(vo.freemeal eq 'O')?'checked': ''} value = "O">아침식사
	</label>
	<label class="checkbox-inline">
	   <input type="checkbox" name = "pool" ${(vo.pool eq 'O')?'checked': ''} value = "O">풀장
	</label>
 	<label class="checkbox-inline">
	   <input type="checkbox" name = "nosmoking" ${(vo.nosmoking eq 'O')?'checked': ''} value = "O">금연방
	</label>   
 	<label class="checkbox-inline">
	   <input type="checkbox" name = "restaurant" ${(vo.restaurant eq 'O')?'checked': ''} value = "O">식당가
	</label>   
 	<label class="checkbox-inline">
	   <input type="checkbox" name = "fitness" ${(vo.fitness eq 'O')?'checked': ''} value = "O">헬스장
	</label>
	<label class="checkbox-inline">
	   <input type="checkbox" name = "aircondition" ${(vo.aircondition eq 'O')?'checked': ''} value = "O">냉난방
	</label>  
   	</div>
  </div>
  <div class="tab">입력해주세요:
  	<div class="input-group">
	    <span class="input-group-addon" >주차공간</span>
	    <input class="form-control" name ="parkingspace" oninput="this.className = 'form-control'" value = "${vo.parkingspace}">
  	</div> 
  	<div class="input-group">
	    <span class="input-group-addon" >업체설명</span>
	    <textarea class="form-control" rows="3" name ="content" oninput="this.className = 'form-control'">${vo.content}</textarea>
  	</div>
  	<div id = "text-center">
	  	<input type="radio" name="privacy" ${(vo.privacy eq 'private')?'checked': ''} value = "private">비공개
  		<input type="radio" name="privacy" ${(vo.privacy eq 'private')?'checked': 'checked'} value = "public">공개
	</div>
  </div>
  <div style="overflow:auto;">
  	  <button class = "button_insert" type="button" id="nextBtn" onclick="nextPrev(1)" style="float:right;">Next</button>
      <button class = "button_insert" type="button" id="prevBtn" onclick="nextPrev(-1)" style="float:right;">Previous</button>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:10px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
  </div>
  <button type="button" class="btn btn-primary btn-block" name = "addition" onclick = 'add(this)'>추가</button>
</div>
</div>
</div>
<br/>
<br/>


<c:set var="cntpb" value="1"></c:set>
<c:set var="cntpe" value="5"></c:set>
<c:set var="cntb" value="0"></c:set>

<c:set var="cntbb" value="1"></c:set>
<c:set var="cntbe" value="5"></c:set>

<c:set var="cntnum" value = "-1"></c:set>

<div id = "deleteAtt"></div>


<div id = "room_zone">
<c:forEach var = "vo" items = '${list}'>
<c:set var="cntb" value="${cntb+1}"></c:set>
<div class="container-fluid">
<input type = "text" name = "pserial" value = "${vo.pserial}">
  <div class="row content">
    <div class="col-sm-6">
    <input type = "hidden" name = "cntn">
	<div id="myCarousel${cntb}" class="carousel slide" data-interval="0">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	    <c:forEach begin="${cntbb}" end="${cntbe}">
	    <c:if test = "${cntbe-cntbb == 4 and picList[cntbb]!=null}">
	    <c:set var="cntnum" value = "${cntnum+1}"></c:set>
	   	<li data-target="#myCarousel${cntb}" data-slide-to="${cntnum}" class="active"></li>
	    </c:if>
	    <c:if test = "${cntbe-cntbb != 4 and picList[cntbb]!=null}">
	    <c:set var="cntnum" value = "${cntnum+1}"></c:set>
	    <li data-target="#myCarousel${cntb}" data-slide-to="${cntnum}"></li>
	    </c:if>
	    <c:set var="cntbb" value="${cntbb+1}"></c:set>
	    </c:forEach>
	    <c:set var="cntbe" value="${cntbe+5}"></c:set>
	    <c:set var="cntnum" value = "-1"></c:set>
	    </ol>
		<div class="carousel-inner" role="listbox">
		<c:forEach begin="${cntpb}" end="${cntpe}">
		<input type = "hidden" name = "cnt">	
				<c:if test = "${cntpe-cntpb == 4}">
				    <div class="item active">
				    <div class = "file_input">
			 		<label class = "accommodation_img" style = "width:100%">
					 <div class="accommodation_img change_background" style = "background-image: url('./accommodation_album/${picList[cntpb]}');">
					 <input type="file" name = "attfile${cntpb}" onchange="readURL(this)">
					 <input type ="hidden" class = "deleteAtt" value = "${picList[cntpb]}">		
					 </div>
					</label>
					</div>
			      </div>
			     </c:if>
			     <c:if test = "${cntpe-cntpb != 4 && picList[cntpb]!=null}">
			     	<div class="item">
			     	<div class = "file_input">
			 		<label class = "accommodation_img" style = "width:100%">
					<div class="accommodation_img change_background" style = "background-image: url('./accommodation_album/${picList[cntpb]}');"}>
					<input type="file" name = "attfile${cntpb}" onchange="readURL(this)">
					<input type = "hidden" class = "deleteAtt" value = "${picList[cntpb]}">
					</div>
					</label>
					</div>
			      </div>
			     </c:if>
			     
				<c:set var="cntpb" value="${cntpb+1 }"></c:set>
		</c:forEach>
		</div>
		<c:set var="cntpe" value="${cntpe+5 }"></c:set>
	
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel${cntb}" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel${cntb}" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
	</div>
	<br>
	</div>
	
	<div class="col-sm-6" id = "col_imgs">
	<br/>
	
	<div class="input-group">
		<span class="input-group-addon">방종류</span>
		<input type="text" class="form-control text-center" name="room" value = '${vo.room}' >
	</div>
	<div class="input-group">
		<span class="input-group-addon">방개수</span>
		<input type="text" class="form-control text-center" name="room_num" value = '${vo.room_num}' >
	</div>
		  	
	<div class="input-group">
		<span class="input-group-addon">평일가</span>
		<input  type="text" class="form-control text-center" name="weekdays" value = '${vo.weekdays}' >
	</div>
	<div class="input-group">
		<span class="input-group-addon">주말가</span>
	<input  type="text" class="form-control text-center" name="weekends" value = '${vo.weekends}' >
	</div>
	<button type="button" class="btn btn-primary btn-block" name = "addition" onclick = 'add(this)'>추가</button>
	<button type='button' class='btn btn-primary btn-block' name = 'deletion' onclick = 'del(this)'>삭제</button>
	</div>
	</div>
</div>
</c:forEach>
</div>

<button type="button" class="btn btn-primary btn-block" onclick = "modify()">수정</button>
<button type="button" class="btn btn-primary btn-block" onclick = "cancel()">취소</button>
</form>
</div>


<div id = "sample"><p>Do you know me?</p></div>
<script>
/* window.onload = function(){
	 var x = document.getElementsByClassName("deleteAtt");
	 alert(x[1].outerHTML);
	 var i;
	 for (i = 0; i < x.length; i++) {
		 alert(x[i].outerHTML);
	     }
} */



var frm  = document.frm_modify;
function modify(){
	frm.action = "modify.ac";
	frm.submit();
	
}

function cancel(){
	frm.action = "selectOne.ac";
	frm.submit();
}

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    $(input).next().attr('name', "deleteAtt");
    
	 var parent = input.parentNode;
    reader.onload = function (e) {
            $(parent).attr('style', "background-image: url(" + e.target.result + ")");
            }
      reader.readAsDataURL(input.files[0]);
      }
   }


var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the crurrent tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").style.display = "none";
  } else {
    document.getElementById("nextBtn").style.display = "block";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
	    document.getElementsByClassName("step")[currentTab].className += " finish";
	  }
	  return valid; // return the valid status
	}

	function fixStepIndicator(n) {
	  // This function removes the "active" class of all steps...
	  var i, x = document.getElementsByClassName("step");
	  for (i = 0; i < x.length; i++) {
	    x[i].className = x[i].className.replace(" active", "");
	  }
	  //... and adds the "active" class on the current step:
	  x[n].className += " active";
	}
	
	function add(addition){
		var size_cnt = document.getElementsByName("cnt").length;
		var size_cntn = document.getElementsByName("cntn").length;
		var serial = document.getElementById("serial");
		serial = serial.value;
		var cnt = size_cnt+1;
		var cntn = size_cntn+1;
		$(addition).attr('style', "display:none");
		var room_zone = document.getElementById("room_zone");
		var div = document.createElement("div");
		
		
		var str = ""
		str += "<div class='container-fluid'>"
		  +"<input type = 'text' name = 'pserial' value = "+serial+">"
		  +"<div class='row content'>"
		  +"<div class='col-sm-6'>"
		  + "<input type = 'hidden' name = 'cntn'>"
		  +"<div id='myCarousel"+cntn+"' class='carousel slide' data-interval='0'>"
		  +"<ol class='carousel-indicators'>"
		  	+"<li data-target='#myCarousel"+cntn+"' data-slide-to='0' class='active'></li>"
		  	+"<li data-target='#myCarousel"+cntn+"' data-slide-to='1'></li>"
			+"<li data-target='#myCarousel"+cntn+"' data-slide-to='2'></li>"
			+"<li data-target='#myCarousel"+cntn+"' data-slide-to='3'></li>"
			+"<li data-target='#myCarousel"+cntn+"' data-slide-to='4'></li>"
			+"</ol>"

			+"<div class='carousel-inner' role='listbox'>"
				+"<div class='item active'>"
					+"<div class = 'file_input'>"
					+"<label class = 'accommodation_img' style = 'width:100%'>"
						+"<div class='accommodation_img change_background' style = 'background-image: url(./imgs/upload_pic.png);'>"
						+"<input type='file' name = 'attfile"+(cnt++)+"' onchange='readURL(this)'>"
						+"<input type = 'text' name = 'cnt'>"
					+"</div>"
					+"</label>"
					+"</div>"
				+"</div>"
			
				+"<div class='item'>"
					+"<div class = 'file_input'>"
					+"<label class = 'accommodation_img' style = 'width:100%'>"
						+"<div class='accommodation_img change_background' style = 'background-image: url(./imgs/upload_pic.png);'>"
						+"<input type='file' name = 'attfile"+(cnt++)+"' onchange='readURL(this)'>"
						+"<input type = 'text' name = 'cnt'>"
					+"</div>"
					+"</label>"
					+"</div>"
				+"</div>"
			    
				+"<div class='item'>"
					+"<div class = 'file_input'>"
					+"<label class = 'accommodation_img' style = 'width:100%'>"
						+"<div class='accommodation_img change_background' style = 'background-image: url(./imgs/upload_pic.png);'>"
						+"<input type='file' name = 'attfile"+(cnt++)+"' onchange='readURL(this)'>"
						+"<input type = 'text' name = 'cnt'>"
					+"</div>"
					+"</label>"
					+"</div>"
				+"</div>"
			      
				+"<div class='item'>"
					+"<div class = 'file_input'>"
					+"<label class = 'accommodation_img' style = 'width:100%'>"
						+"<div class='accommodation_img change_background' style = 'background-image: url(./imgs/upload_pic.png);'>"
						+"<input type='file' name = 'attfile"+(cnt++)+"' onchange='readURL(this)'>"
						+"<input type = 'text' name = 'cnt'>"
					+"</div>"
					+"</label>"
					+"</div>"
				+"</div>"
			      
				+"<div class='item'>"
					+"<div class = 'file_input'>"
					+"<label class = 'accommodation_img' style = 'width:100%'>"
						+"<div class='accommodation_img change_background' style = 'background-image: url(./imgs/upload_pic.png);'>"
						+"<input type='file' name = 'attfile"+(cnt++)+"' onchange='readURL(this)'>"
						+"<input type = 'text' name = 'cnt'>"
					+"</div>"
					+"</label>"
					+"</div>"  
				+"</div>"
			      
				+"</div>"

			    +"<a class='left carousel-control' href='#myCarousel"+cntn+"' role='button' data-slide='prev'>"
			    +"<span class='glyphicon glyphicon-chevron-left' aria-hidden='true'></span>"
			    +"<span class='sr-only'>Previous</span>"
			    +"</a>"
			    +"<a class='right carousel-control' href='#myCarousel"+cntn+"' role='button' data-slide='next'>"
			    	+"<span class='glyphicon glyphicon-chevron-right' aria-hidden='true'></span>"
			    	+"<span class='sr-only'>Next</span>"
			    +"</a>"
			+"</div>"
			+"<br>"
			+"</div>"
			
			+"<div class='col-sm-6' id = 'col_imgs'>"
			+"<br/>"
			
			+"<span id = 'h3'> 객실 등록하기:</span>"
			
			+"<div class='input-group'>"
				+"<span class='input-group-addon'>방종류</span>"
				+"<input type='text' class='form-control' name='room'>"
			+"</div>"
			+"<div class='input-group'>"
				+"<span class='input-group-addon'>방개수</span>"
				+"<input type='text' class='form-control' name='room_num'>"
			+"</div>"
	  	
			+"<div class='input-group'>"
				+"<span class='input-group-addon'>평일가</span>"
				+"<input type='text' class='form-control' name='weekdays'>"
			+"</div>"
			+"<div class='input-group'>"
				+"<span class='input-group-addon'>주말가</span>"
			+"<input type='text' class='form-control' name='weekends'>"
			+"</div>"
				+"<button type='button' class='btn btn-primary btn-block' name = 'addition' onclick = 'add(this)'>추가</button>"
				+"<button type='button' class='btn btn-primary btn-block' name = 'deletion' onclick = 'del(this)'>삭제</button>"
			+"</div>"
			+"</div>"
		+"</div>";
		div.innerHTML = str;
		room_zone.appendChild(div);
		
	}
	
	function del(deletion){
		 console.log($(deletion).parent().parent().parent().prop("outerHTML"));
		 var room_zone = document.getElementById("room_zone");
		 var size_cntn = document.getElementsByName("cntn").length;
		 var rserial_list = document.getElementById("rserial_list");
		 var div = document.createElement("div");
		 str = "<input type = 'text' name = 'rserial' value ='"+size_cntn+"'>";
		 div.innerHTML = str;
		 rserial_list.appendChild(div);

		 
		 $(deletion).parent().parent().parent().remove();
		 
		 
		 
		 
	}
</script>


</body>
</html>