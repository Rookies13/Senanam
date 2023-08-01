<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Cart Data</title>
</head>
<body>
    <h2>여러 개의 CART_NUM을 ","로 구분하여 입력해주세요:</h2>
    <form action="result.jsp" method="post">
        <input type="text" name="cartNums">
        <input type="submit" value="검색">
    </form>
</body>
</html>
