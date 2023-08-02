<!DOCTYPE HTML>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>
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
		<script>
			if(!<%=
			session.getAttribute("user_id")%>) {
			  alert("로그인 후 이용해주세요.");
			  location.href="login.jsp";
			}
		  </script>
		<title>세나샵</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>

		<!-- Header -->
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
				<li><a href="">상품검색</a></li>
				<li><a href="">장바구니</a></li>
				<li><a href="boardList.jsp">문의게시판</a></li>
				<li><a href="qna.jsp">Q&A</a></li>
			</ul>
		</nav>

            <section id="main">
                <div class="inner">
                    <h3>게시판 글 수정하기</h3>
					<%
					request.setCharacterEncoding("utf-8");
					String boardNumberParam = request.getParameter("board_number");
                    int board_number = Integer.parseInt(boardNumberParam);

					try{
                        Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
                        conn = DriverManager.getConnection("jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl", "admin", "12345678");
                        
                        String sql = "SELECT * FROM board WHERE board_number = " + board_number;
                        pstmt = conn.prepareStatement(sql); 
                        rs = pstmt.executeQuery();

                        rs.next();

					%>
                    <form method="post" action="">
                        <div class="row uniform 50%">
                            <div class="6u$ 12u$(xsmall)">
                                <input type="text" name="subject" id="subject" placeholder="제목" value="<%= rs.getString("subject") %>">
                            </div>
							<div class="6u$ 12u$(xsamll)">
								첨부파일 : <input type="file">
							</div>
                            <div class="12u$">
                                <textarea name="content" id="content" placeholder="내용" rows="6" style="resize: none;"><%= rs.getString("content") %></textarea>
                            </div>
                            
                            <div class="4u$ 12u$(xsmall)">
                                <input type="submit"/>
                            </div>
                            
                        </div>
                    </form>
					<%
					if (request.getMethod().equals("POST")) {
						try{
							
							sql = "UPDATE board SET subject = ?, content = ? WHERE board_number = ?";
											
							pstmt = conn.prepareStatement(sql); 
				
							String subject = request.getParameter("subject");
							String content = request.getParameter("content");
				
							pstmt.setString(1, subject);
							pstmt.setString(2, content);
							pstmt.setInt(3, board_number);
							pstmt.executeUpdate();
							
							rs.close();
							pstmt.close();
							conn.close();
				
							out.println("<script>alert('게시글 수정 성공')</script>");
							out.println("<script>window.location.assign('boardList.jsp')</script>");
				
						}catch(Exception e){
							out.println("<script>alert('게시글 수정 실패')</script>");
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


					<%
					
					}catch(Exception e){
						e.printStackTrace();
					}
					%>
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