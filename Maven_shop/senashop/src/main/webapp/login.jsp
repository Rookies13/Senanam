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
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Noto Sans KR", sans-serif;
        }

        .wrap {
            width: 100%;
            height: 600px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login {
            width: 30%;
            height: 600px;
            background: rgb(0, 0, 0);
            border-radius: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        h2 {
            color: #ffffff;
            font-size: 2em;
        }

        h4 {
            color: #ffffff;
        }

        .login_id {
            margin-top: 20px;
            width: 80%;
        }

        .login_id input {
            width: 100%;
            height: 50px;
            border-radius: 30px;
            margin-top: 10px;
            padding: 0px 20px;
            border: 1px solid white;
            outline: none;
            background-color:#ffffff;
            color:black;
        }

        .login_pw {
            margin-top: 20px;
            width: 80%;
        }

        .login_pw input {
            width: 100%;
            height: 50px;
            border-radius: 30px;
            margin-top: 10px;
            padding: 0px 20px;
            border: 1px solid white;
            outline: none;
            background-color:#ffffff;
            color:black;
        }

        .submit {
            margin-top: 20px;
            width: 80%;
        }
        
        .join_user{
            margin-top: 10px;
            color:white;
        }

        .submit button {
            width: 100%;
            height: 80px;
            border: 0;
            outline: none;
            border-radius: 40px;
            background: linear-gradient(to left, rgb(255, 255, 255), rgb(52, 52, 59));
            color: rgb(0, 0, 0);
            font-size: 1.2em;
            letter-spacing: 2px;
        }
    </style>
	<body style="background-color: rgb(74, 74, 88);">
		<header id="header">
			<a href="index.jsp" class="logo"><strong>세 나</strong> shop</a>
			<nav>
				<% if(id != null) {%>
				<a href="logout.jsp"> <%= id%> 로그아웃</a>
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
				<li><a href="generic.html">Generic</a></li>
				<li><a href="elements.html">Elements</a></li>
                <li><a href="LoginServlet">Elements</a></li>
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
                            <a href="회원가입페이지" sytle="color:white">회원가입 페이지</a>
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