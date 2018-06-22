<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script>
jQuery(document).ready(function(){
    
    var select = $("select#color");
    
    select.change(function(){
        var select_name = $(this).children("option:selected").text();
        $(this).siblings("label").text(select_name);
    });
});
</script>

<style>
 
div#select_box {
    position: relative;
    width: 200px;
    height: 40px;
    background: url(select_arrow.png) 180px center no-repeat; /* 화살표 이미지 */
    border: 1px solid #E9DDDD;
}
div#select_box label {
    position: absolute;
    font-size: 14px;
    color: #a97228;
    top: 13px;
    left: 12px;
    letter-spacing: 1px;
}
div#select_box select#color {
    width: 100%;
    height: 40px;
    min-height: 40px;
    line-height: 40px;
    padding: 0 10px;
    opacity: 0;
    filter: alpha(opacity=0); /* IE 8 */
}
</style>

</head>
<body>
<div id="select_box">
    <label for="color">color</label>
    <select id="color" title="select color">
        <option selected="selected">color</option>
        <option>red</option>
        <option>blue</option>
        <option>yellow</option>
        <option>black</option>
    </select>
</div>
 
</body>
</html>