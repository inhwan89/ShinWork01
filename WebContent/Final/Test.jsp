<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Map<String,String> map = new HashMap<String,String>();
map.put("attfile2", "3파일");
map.put("attfile0", "첫파일");
map.put("attfile3", "4파일");
map.put("attfile4", "5파일");
map.put("attfile1", "2파일");
map.put("attfile5", "6파일");
List<String> list = new ArrayList<String>();

int cnt=0;
for(int i=0; i<map.size();i++){
	String temp=map.get("attfile"+cnt);
	list.add(i, temp);
	cnt++;
}
request.setAttribute("list", list);
%>
<c:set var="cnt" value="1"></c:set>
<c:set var="cnt2" value="3"></c:set>
<c:forEach begin="${cnt}" end="${cnt2}">
	${list[cnt]}	
	<c:set var="cnt" value="${cnt+1}"></c:set>
</c:forEach>
</body>
</html>