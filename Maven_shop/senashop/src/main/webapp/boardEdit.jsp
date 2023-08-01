<!DOCTYPE HTML>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
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
					<li><a href="boardList.jsp">게시판</a></li>
				</ul>
			</nav>

            <section id="main">
                <div class="inner">
                    <h3>게시판 글쓰기</h3>
                    <form method="post" action="">
                        <div class="row uniform 50%">
                            <div class="6u$ 12u$(xsmall)">
                                <input type="text" name="subject" id="subject" placeholder="제목" value="">
                            </div>
							<div class="6u$ 12u$(xsamll)">
								첨부파일 : <input type="file">
							</div>
                            <div class="12u$">
                                <textarea name="content" id="content" placeholder="내용" rows="6" style="resize: none;" value=""></textarea>
                            </div>
                            
                            <div class="4u$ 12u$(xsmall)">
                                <input type="submit"/>
                            </div>
                            
                        </div>
                    </form>
                </div>
            </section>

	
		<!-- Footer -->
			<footer id="footer">
			<div class="copyright">
			Made with team 세나남</a>
		</div>
			</footer>
		

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>