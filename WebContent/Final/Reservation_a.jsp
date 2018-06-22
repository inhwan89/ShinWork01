<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" method="post">
<label>호텔명</label><br>
<label>체크인</label><input type="date" value="${param.test }" name="test1" required="required"/>
<label>체크아웃</label><input type="date" id="test" name="test"  onchange="test11()" required="required"/>
<input type="text" name="text1" id="text1">
<input type="submit" value="얍얍"/>
</form>
<p>
<hr>
<div id="text2"></div>
<div id="text3"></div>
<script>
var frm=document.frm;
var room1=100000;
var room2=150000;
function test11(){
	 var x = document.getElementById("test").value;
	    document.getElementById("text2").innerHTML = "You selected: " + x;
	    test2(x);
}
function test2(x){
	var newDt1 = new Date(frm.test.value);
	var newDt2 = new Date(frm.test1.value);
	var day= (newDt1-newDt2) /(24 * 60 * 60 * 1000);
    document.getElementById("text1").value = day;
    test3(newDt2,day);
}
function test3(x,day) {
	var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
	var str ="";
	var sum=0;
	for(i=0; i<day ; i++){	
	var today = new Date(x).getDay();
	x.setDate(x.getDate()+1);
		str+= week[today]+"<br>";
		if(week[today]=="금요일"||week[today]=="토요일"){
			sum+=room2;
		}else{
			sum+=room1;
		}
	}
	
	str+= "총가격" +sum;
    document.getElementById("text3").innerHTML = str;
	
} 

</script>
</body>
</html>