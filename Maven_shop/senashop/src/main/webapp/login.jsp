<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--
	Binary by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>
<html>
	<head>
		<title>세나샵</title>
		<meta charset="utf-8" />
		<meta name="robots" content="noindex">
		<meta name="googlebot" content="noindex, nofollow">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="assets/css/login.css" />
	</head>
	<body style="background-color: rgb(74, 74, 88);">
		<header id="header">
			<a href="index.jsp" class="logo"><strong>세 나</strong> shop</a>
			<nav>
				<% if(id != null) {%>
				<!--<a href="logout.jsp"> <%= id%> 로그아웃</a>-->
                <a href="LogoutServlet"> <%= id%> 로그아웃</a>
				<% } else { %>
				<a href="login.jsp">로그인</a>
				<% } %>
				<a href="#menu">Menu</a>
			</nav>

		</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="mypage.jsp">마이페이지</a></li>
			<li><a href="productsearch.jsp">상품검색</a></li>
			<li><a href="cart.jsp">장바구니</a></li>
			<li><a href="boardList.jsp">게시판</a></li>
			<li><a href="qna.jsp">Q&A</a></li>
		</ul>
	</nav>
		<!-- Header -->
		<section id="main">

            <form action="LoginServlet" method="post"> 
                <div class="wrap">
                    <div class="login">
                        <h2>Log-in</h2>
                        <div class="login_id">
                            <h4>ID</h4>
                            <input type="text" name="id" placeholder="아이디">
                        </div>
                        <div class="login_pw">
                            <h4>Password</h4>
                            <input type="password" name="pw" placeholder="비밀번호">
                        </div>
                        <div class="join_user">
                            <a href="terms.jsp" sytle="color:white">회원가입 페이지</a>
                        </div>
                        <div class="submit">
                            <button type="submit" value="submit">로그인</button>
                        </div>
                    </div>
                </div>
            </form>
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
