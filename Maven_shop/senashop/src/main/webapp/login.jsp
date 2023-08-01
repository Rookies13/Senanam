<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
    <body>

<<<<<<< Updated upstream
        <form action="login_ok.jsp" method="post">
            아이디:<input type="text" name="id"><br/>
            비밀번호:<input type="password" name="pw"><br/>
            <input type="submit" value="로그인"><br/>
        </form>
        <a href="회원가입 페이지">회원가입</a>
    </body>
</html>
=======
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
>>>>>>> Stashed changes
