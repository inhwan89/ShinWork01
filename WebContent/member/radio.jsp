<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
#radioBtn .radio {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Hide the browser's default radio button */
#radioBtn .radio input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom radio button */
#radioBtn .checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #eee;
    border-radius: 50%;
}

/* On mouse-over, add a grey background color */
#radioBtn .radio:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
#radioBtn .radio input:checked ~ .checkmark {
    background-color: #474544;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
#radioBtn .checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the indicator (dot/circle) when checked */
#radioBtn .radio input:checked ~ .checkmark:after {
    display: block;
}

/* Style the indicator (dot/circle) */
#radioBtn .radio .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
</style>

</head>
<body>
 <div id="radioBtn">
  <label class="radio">One
  <input type="radio" checked="checked" name="radio">
  <span class="checkmark"></span>
</label>

<label class="radio">Two
  <input type="radio" name="radio">
  <span class="checkmark"></span>
</label>
</div>

</body>
</html>