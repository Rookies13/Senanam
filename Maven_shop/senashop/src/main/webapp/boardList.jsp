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
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
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
				<li><a href="boardList.jsp">문의게시판</a></li>
				<li><a href="qna.jsp">Q&A</a></li>
			</ul>
		</nav>

            <section id="main">
                <div class="inner">
                    <h3>게시판</h3>
                    <div class="table-wrapper">
                        <table border="1" align="center" width="100%">
                            <thead>
                                <th width="10%" align="center"><center>번호</center></th>
                                <th width="50%" align="center"><center>제목</center></th>
                                <th width="15%" align="center"><center>글쓴이</center></th>
                                <th width="10%" align="center"><center>파일첨부</center></th>
                                <th width="15%" align="center"><center>시간</center></th>
                            </thead>
                            <%
                            try{
                                Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
                                conn = DriverManager.getConnection("jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl", "admin", "12345678");
                                String sql = "select * from board, attachment where board.board_number=attachment.board_number(+) and board.type='A' order by board.board_number desc"; //DB를 조회할 select문
                                pstmt = conn.prepareStatement(sql); //sql문으로 conn
                                rs = pstmt.executeQuery(); //pstmt 실행 후 결과를 rs에 할당
                                
                                int count = 1;
                                while(rs.next()){
                                    int boardNumber = rs.getInt("board_number");
                                    String link = "boardView.jsp?board_number=" + boardNumber;

                                    out.print("<tr>");
                                    out.print("<td><center>" + count + "</center></td>");
                                    out.print("<td><a href='" + link + "'>" + rs.getString("subject") + "</a></td>");
                                    out.print("<td>" + rs.getString("id") + "</td>");
                                    String file_name = rs.getString("name");
                                    if(file_name == null){
                                        out.print("<td>"+ "</td>");
                                    }
                                    else
                                    {
                                        out.print("<td><center><img src=images/file.png></center></td>");
                                    }

                                    out.print("<td>" + rs.getDate("time") + "</td>");
                                    out.print("</tr>");

                                    count++;
                                }
                                
                                rs.close();
                                pstmt.close();
                                conn.close();
                            }catch(Exception e){
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
                            %>
                        </table>
                    </div>
                    <input type="button" onclick="location.href='boardWrite.jsp'" value="글쓰기"/>
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