<!DOCTYPE HTML>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	templated.co @templatedcodd
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
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
				<li><a href="boardList.jsp">문의게시판</a></li>
				<li><a href="qna.jsp">Q&A</a></li>
			</ul>
		</nav>

		<div style="padding:60px;">
		
        <section>
            <h3>문의하기</h3>
            <div class="table-wrapper">
                <table>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
                    </tr>
                    </thead>
                    <%
					try{
						Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
						conn = DriverManager.getConnection("jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl", "admin", "12345678"); //username, password는 개인 Oracle 계정의 것으로 하면 됨
						String sql = "select * from board where type='B' order by board_number desc"; //DB를 조회할 select문
						pstmt = conn.prepareStatement(sql); //sql문으로 conn
						rs = pstmt.executeQuery(); //pstmt 실행 후 결과를 rs에 할당

						while(rs.next()){ //조회되는 로우(행) 반복.
							out.print("<tr>");
							out.print("<td>" + rs.getInt("board_number") + "</td>"); //DB에서 sabun 컬럼에 해당하는 레코드 값을 불러옴
							out.print("<td><a href=\"qna_whatch.jsp?qnanumber="+rs.getInt("board_number")+"\">" + rs.getString("subject") +"</a></td>");
							out.print("<td>" + rs.getString("ID") + "</td>");
							out.print("<td>" + rs.getDate("time") + "</td>");
							out.print("<td>" + rs.getInt("cnt") + "</td>");
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
				<div style ="float:right;">
			<ul class="actions">
                <li><a href="qnawrite.jsp" class="button alt small">문의 작성</a></li>
            </ul>
			</div>
            </div>
		</div>

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