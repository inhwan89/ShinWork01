<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script>
function a(){
document.join.test.value="영업부";
}
</script>
<body>
<form name="join" method="post">

  <select name=test>

    <option value=1>1</option>

    <option value=2>2</option>

    <option value=3>3</option>

    <option value=4>4</option>

    <option value="영업부">영업부</option>

  </select>
<input type="button" onclick="a()">
</form>
</body>
</html>