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
            <li><a href="">상품검색</a></li>
            <li><a href="">장바구니</a></li>
            <li><a href="">문의게시판</a></li>
            <li><a href="qna.jsp">Q&A</a></li>
        </ul>
    </nav>

<section id="main">
    <div class="inner">
        <h3>문의하기 글쓰기</h3>
        <form method="post" action="qna_response.jsp"> <!-- 변경된 부분: action을 "qna_response.jsp"로 지정 -->
            <div class="row uniform 50%">
                <div class="6u$ 12u$(xsmall)">
                    <input type="text" name="subject" id="subject" placeholder="제목">
                </div>
                <div class="12u$">
                    <textarea name="content" id="content" placeholder="내용" rows="6" style="resize: none;"></textarea>
                </div>
                <div style="float:right;">
                    <div class="4u$ 12u$(xsmall)">
                        <input type="submit" value="문의 하기" class="button alt small"> <!-- input 타입의 submit 버튼으로 변경 -->
                    </div>
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
