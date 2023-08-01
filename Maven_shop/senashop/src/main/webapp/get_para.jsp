<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<!--
    Binary by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>세나샵</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>

    <!-- Header -->
    <header id="header">
        <a href="index.html" class="logo"><strong>세 나</strong> shop</a>
        <nav>
            <a href="#menu">Menu</a>
        </nav>
    </header>

    <!-- Nav -->
    <nav id="menu">
        <ul class="links">
            <li><a href="index.html">Home</a></li>
            <li><a href="generic.html">Generic</a></li>
            <li><a href="elements.html">Elements</a></li>
        </ul>
    </nav>

    <!-- 기능구현 -->
    <section>
        <div style="padding: 80px;">
            <h1>결제</h1>
           

            <h3>상품</h3>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>주문번호</th>
                            <th>상품ID</th>
                            <th>상품수량</th>
                            <th>상품가격</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%@ page import="java.sql.*" %>
                        <%!
                            // 데이터베이스 접속 정보 설정
                            String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // 오라클 서버 주소와 포트번호
                            String dbUser = "system"; // 오라클 계정 사용자명
                            String dbPassword = "1234"; // 오라클 계정 비밀번호
                            String odn;
                            int tp;
                        %>
                        <% 