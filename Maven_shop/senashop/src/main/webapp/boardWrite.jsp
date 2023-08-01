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
                                <input type="text" name="subject" id="subject" value placeholder="제목">
                            </div>
							<div>
								첨부파일 : <input type="file">
							</div>
                            <div class="12u$">
                                <textarea name="content" id="content" placeholder="내용" rows="6" style="resize: none;"></textarea>
                            </div>
                            
                            <div class="4u$ 12u$(xsmall)">
                                <input type="submit"/>
                            </div>
                            
                        </div>
                    </form>
                </div>
            </section>

	<%
    if (request.getMethod().equals("POST")) {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##test", "wnsdnr6990");
			
			//DB에 들어갈 index
			String sql = "SELECT MAX(qseq) FROM board";
			int count = 1;
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					count = rs.getInt(1) + 1;
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			sql = "insert into board (qseq, subject, content, type, indate) values (?, ?, ?, '1', ?)";
			pstmt = conn.prepareStatement(sql); 
			request.setCharacterEncoding("utf-8");

			String subject = request.getParameter("subject");
			String content = request.getParameter("content");

			java.util.Date currentDate = new java.util.Date();
        	java.sql.Timestamp date = new java.sql.Timestamp(currentDate.getTime());
			

			pstmt.setInt(1, count);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setTimestamp(4, date);
			pstmt.executeUpdate();
			
			rs.close();
			pstmt.close();
			conn.close();

			out.println("<script>alert('게시글 등록 성공')</script>");
        	out.println("<script>window.location.assign('boardList.jsp')</script>");

		}catch(Exception e){
			out.println("<script>alert('게시글 등록 실패')</script>");
			e.printStackTrace();

		}finally{
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
    }
    %>
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