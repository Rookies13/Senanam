<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>
<html>
<head>
    <title>마이페이지</title>
</head>
<body>
    <h1>마이페이지</h1>
    <p>환영합니다, <%=id %>님!</p>
    <a href="LogoutServlet">로그아웃</a>
</body>
</html>
