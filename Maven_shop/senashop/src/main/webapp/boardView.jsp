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
                    <h3>게시판</h3>
                    <%
                    String qseqParam = request.getParameter("qseq");
                    int qseq = Integer.parseInt(qseqParam);
                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
                        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##test", "wnsdnr6990");
                        
                        String sql = "SELECT * FROM board WHERE qseq = " + qseq;
                        pstmt = conn.prepareStatement(sql); 
                        rs = pstmt.executeQuery();

                        rs.next();
                        %>
                        <div class="table-wrapper">
                            <table class="alt">
                                <tr>
                                    <td width="20%">제목</td>
                                    <td colspan="3"><%=rs.getString("subject") %></td>
                                </tr>
                                <tr>
                                    <td>글쓴이</td>
                                    <td><%=rs.getString("id") %></td>
                                    <td width="20%">글쓴시각</td>
                                    <td><%=rs.getDate("indate") %></td>
                                </tr>
                                
                            </table>
                        </div>
                        <pre><code><%=rs.getString("content") %></code> </pre>

                        <%
                        int boardNumber = rs.getInt("qseq");
                        String link = "boardEdit.jsp?qseq=" + boardNumber;
                        %>
                        <input type='button' onclick='location.href="<%=link%>"' value='수정'>
                        <input type="button" onclick="location.href=''" value="삭제"/>
                        <%
                        rs.close();
                        pstmt.close();
                        conn.close();
                        
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