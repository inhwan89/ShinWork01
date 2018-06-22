<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>intro</title>
</head>
<body>
	<div class="visual-holder">
		<div class="js-video-holder"
			style="background-image: url('./video/trip.png'); width: 2000px; height: 1000px; margin-top: -5%;">
			<video loop autoplay muted playsinline width="100%">
				<source type="video/mp4" src="./video/trip.mp4">
			</video>
		</div>
	</div>
	<div class="container">
		<div class="visual-text w3-center" style = 'z-index: 4'>
			<h1
				style="background-image: url('./imgs/full_course.svg'); margin-top: -5%;">Full
				Course Trip</h1>
			<div style = "margin-top: -5%">
			<div class="w3-row"
				style='width: 60%; margin-right: 20%; margin-left: 20%;'>
				<div class="w3-half" id="result1"></div>
				<div class="w3-half" id="result2"></div>
			</div>
			<div class="w3-row search"
				style='width: 60%; margin-right: 20%; margin-left: 20%;'>
				<input type="text" placeholder="검색할 도시명이나 호텔 및 레스토랑명 입력.."
					name="search"
					style="border: 0px; border-radius: 3px; padding-left: 16px; z-index: 3;">
				<button type="submit" class="w3-teal">
					<i class="fa fa-search"></i>
				</button>
			</div>
			</div>
			<input type="hidden" name="serial" value='${vo.serial}'>
		</div>
	</div>
	<br><br><br>
	<section class="about-section">
	    <div class="about-holder">
	         <div class="container">
	              <div class="holder"><spanclass="decor1" style = "z-index:1;"></span><span class="decor2"></span>
	                   <div class="about-right-side image-holder">
	                        <picture>
	                             <source srcset="./imgs/329.jpg, ./imgs/658.jpg 2x"><img src="./imgs/329.jpg" alt="image description">
	                        </picture>
	                        <div class="about-decor-wrap">
	                        <picture>
	                              <source srcset="https://boldearth.com/wp-content/themes/boldearth/images/img1.png, https://boldearth.com/wp-content/themes/boldearth/images/img1-2x.png 2x"><img src="img1.png" alt="image description">
	                        </picture>
	                        </div>
	                    </div>
		                <div class="about-text-holder">
			                <h2>Unforgettable trips.<br />
							Incredible Teens.</h2>
							<p>If our more than 40 years of teen summer adventures have taught us anything, it’s that every teenager has a unique greatness already inside of them. Join Bold Earth Adventure Camps as we journey to the most awe-inspiring places on earth to unleash your bold.</p>
		                </div>
	              </div>
	         </div>
	    </div>
	</section>
<script>
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
				str1 += "<select class= 'form-control' id = 'address1' name  = 'address1' id = 'address1' onchange = 'gu()' style = 'width:100%'>";
				str1 += "<option value = '' selected = 'selected'>전체</option>";
			for(var i=0; i<data1[0].location1.length; i++){
				str1 += "<option>" +data1[0].location1[i]+ "</option>";
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
			
			var str2 = "<select class= 'form-control' id = 'address2' name  = 'address2' id = 'address2'>";
			str2 += "<option value = '' selected = 'selected'>전체</option>";
			str2 += "</select>";
			rs2.innerHTML = str2;
			
		}
	}
}

function gu(){
	var add = document.getElementById("address1");
	var add2 = document.getElementById("address2");
	add.className = "form-control";
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
				str += "<select class= 'form-control' id = 'address2' name  = 'address2'>";
				str += "<option value = '' selected = 'selected'>전체</option>";
			for(i=0; i<data[index].district.length; i++){
				str += "<option >" +data[index].district[i]+ "</option>";
					}
				str += "</select>";
			rs.innerHTML = str;
		}
	}
}

window.onscroll = function() {myFunction()};
function myFunction() {
    var navbar = document.getElementById("myNavbar");
    var holder = document.getElementById("holder");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
        holder.className = "nav-holder" + " w3-padding-large" + " nav_small";
        $(".default").css("display","none");
        $(".scrolled").css("display","block");

    } else {
        navbar.className = navbar.className.replace(" w3-card w3-animate-top w3-white", " logo-masked");
        holder.className = holder.className.replace("nav-holder w3-padding-large nav_small", "nav-holder w3-padding-large");
        $(".default").css("display","block");
        $(".scrolled").css("display","none");
    }
}
</script>
</body>
</html>