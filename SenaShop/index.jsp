<%@ page import="SenaShop.App" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Example</title>
</head>
<body>
    <h1>Hello, JSP and Java on Tomcat!</h1>
    <%!
        String message = SenaShop.App.getMessage();
    %>
    <p><%= message %></p>
</body>
</html>
