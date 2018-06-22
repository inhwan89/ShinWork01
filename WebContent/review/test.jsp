<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="css/magic-check.css" rel="stylesheet">


<!-- summernote CSS/js-->

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<title>Insert title here</title>

<style>
/* 별점 CSS */
input.star { display: none; }
label.star { float: right;padding: 2px;font-size: 16px;color: #444;transition: all .2s;}
input.star:checked ~ label.star:before {content: '\f005';color: #FD4;transition: all .25s;}
input.star-5:checked ~ label.star:before {color: #FE7;text-shadow: 0 0 20px #952;}
input.star-1:checked ~ label.star:before { color: #F62; }
label.star:hover { transform: rotate(-15deg) scale(1.3); }
label.star:before {content: '\f006';font-family: FontAwesome;}

</style>

</head>
<body>

			<div id="service">
				<label class="service">service</label>
				<input class="star star-5" id="star-5" type="radio" name="service" value="5"/>
   				<label class="star star-5" for="star-5"></label>
			    <input class="star star-4" id="star-4" type="radio" name="service" value="4"/>
			    <label class="star star-4" for="star-4"></label>
			    <input class="star star-3" id="star-3" type="radio" name="service" value="3"/>
			    <label class="star star-3" for="star-3"></label>
			    <input class="star star-2" id="star-2" type="radio" name="service" value="2"/>
			    <label class="star star-2" for="star-2"></label>
			    <input class="star star-1" id="star-1" type="radio" name="service" value="1"/>
			    <label class="star star-1" for="star-1"></label>
			</div>
		
</body>
</html>