<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="db.DatabaseConnectionPool" %>
<jsp:useBean id="db" class="db.DatabaseConnectionPool" scope="page" />
<!--
	Binary by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
	Integer userLevel = (Integer) session.getAttribute("user_level");
    
    int level = (userLevel != null) ? userLevel : 0;
%>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("JSESSIONID".equals(cookie.getName())) {
                cookie.setHttpOnly(false); // HttpOnly 속성 비활성화
                response.addCookie(cookie); // 변경된 쿠키를 응답에 추가
            }
        }
    }
%>

<html>
	<head>
		<title>세나샵</title>
		<meta charset="utf-8" />
		<meta name="robots" content="noindex">
		<meta name="googlebot" content="noindex, nofollow">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body style="background-color: rgb(74, 74, 88);">
		<header id="header">
			<a href="index.jsp" class="logo"><strong>세 나</strong> shop</a>
			<nav>
				<% if(id != null) {%>
				<a href="LogoutServlet"><%=id %>님 로그아웃</a>
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
				<% if (level >= 1) {%><li><a href="http://admin-nlb-5ae72bc6d37d4b86.elb.ap-northeast-2.amazonaws.com"> 관리자페이지</a></li> <%}%>
			</ul>
		</nav>
		<!-- Header -->
		<img src="images/img6.jpg" id=mainImage alt="slide" style ="display: block; margin: 0 auto; height:700px"/>

		<script>
			var myImage = document.getElementById("mainImage");
			var imageArray = [ "images/img1.jpg",
					"images/img2.jpg", "images/img3.jpg","images/img4.jpg","images/img5.jpg","images/img6.jpg" ];
			var imageIndex = 0;
		
			function changeImage() {
				myImage.setAttribute("src", imageArray[imageIndex]);
				imageIndex++;
				if (imageIndex >= imageArray.length) {
					imageIndex = 0;
				}
			}
			setInterval(changeImage, 10000);
		</script>


		<!-- Footer -->
			<footer id="footer">
			<div class="copyright">
			Made with team 세나남
			<a href="viewurl.jsp?url=http://10.0.2.185:8081/hello.jsp">인사말</a>
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
