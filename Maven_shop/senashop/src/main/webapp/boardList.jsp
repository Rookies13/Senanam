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
					<li><a href="board.jsp">게시판</a></li>
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
                                <th width="20%" align="center"><center>글쓴이</center></th>
                                <th width="20%" align="center"><center>시간</center></th>
                            </thead>
                            <%
                            try{
                                Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
                                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##test", "wnsdnr6990");
                                String sql = "select * from board"; //DB를 조회할 select문
                                pstmt = conn.prepareStatement(sql); //sql문으로 conn
                                rs = pstmt.executeQuery(); //pstmt 실행 후 결과를 rs에 할당
                                
                                while(rs.next()){ //조회되는 로우(행) 반복
                                    out.print("<tr>");
                                    out.print("<td><center>" + rs.getString("qseq") + "</center></td>");
                                    out.print("<td>" + rs.getString("subject") + "</td>");
                                    out.print("<td>" + rs.getString("id") + "</td>");
                                    out.print("<td>" + rs.getDate("indate") + "</td>");
                                    out.print("</tr>");
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