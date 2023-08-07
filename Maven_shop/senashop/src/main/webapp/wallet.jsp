<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="db.DatabaseConnectionPool" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>

<!--
	Binary by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>
<%
String dbUrl = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl"; // 오라클 서버 주소와 포트번호
String dbUser = "admin"; // 오라클 계정 사용자명
String dbPassword = "12345678"; // 오라클 계정 비밀번호

  int point = 0;
  // ID로 "MEMBER" 테이블 검색
  Connection conn = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;

  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");

    // 데이터베이스에 접속
    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    stmt = conn.prepareStatement("SELECT POINT FROM ADMIN.MEMBER WHERE ID = ?");
    stmt.setString(1, id);
    rs = stmt.executeQuery();
    if (rs.next()) {
      point = rs.getInt("POINT");
    }
	stmt = conn.prepareStatement("SELECT POINT, TIME FROM ADMIN.LOG_POINT WHERE ID = ? ORDER BY TIME DESC");
    stmt.setString(1, id);
	rs = stmt.executeQuery();
%>
<html>
	<head>
		<title>세나샵</title>
		<meta charset="utf-8" />
		<script>
			if(!<%=
			session.getAttribute("user_id")%>) {
			  alert("로그인 후 이용해주세요.");
			  location.href="login.jsp";
			}
		  </script>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style>
			/* CSS 스타일로 레이아웃 조정 */
			.container {
				display: flex;
				justify-content: space-between;
				margin: 50px 50px 150px 50px;
			}

			.left-content {
				flex: 2;
			}

			.right-content {
				flex: 1;
				margin-left: 50px; /* 오른쪽 컨텐츠 간격 조정 */
			}

			.right-content table {
				width: 100%;
				border-collapse: collapse;
			}

			.right-content th, .right-content td {
				border: 1px solid #ddd;
				padding: 8px;
			}

			.right-content th {
				background-color: #f2f2f2;
			}
		</style>
	</head>
	<body>
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
				<li><a href="boardList.jsp">문의게시판</a></li>
				<li><a href="qna.jsp">Q&A</a></li>
			</ul>
		</nav>
		<!-- Header -->
		<div class="container">
			<div class="left-content">
				<h2 style="margin-bottom: 20px;">포인트 사용 내역</h2>
				<table>
					<thead>
						<tr>
							<th> </th>
							<th>시간</th>
							<th>포인트 변동</th>
						</tr>
					</thead>
					<tbody>
						<%
						int i = 0;
							while(rs.next()){
							out.println("<tr>");
							
							i += 1;
							out.println("<td>");
							out.println(i);
							out.println("</td>");

							out.println("<td>");
							java.sql.Timestamp timestamp = rs.getTimestamp("TIME");
        					java.util.Date date = new java.util.Date(timestamp.getTime());
        					 java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
							Calendar cal = Calendar.getInstance();
							cal.setTime(date);
							cal.add(Calendar.HOUR, 9);
        					String formattedDate = sdf.format(cal.getTime());  
        					out.println(formattedDate);
							out.println("</td>");
							
							out.println("<td>");
							out.println(rs.getInt("POINT"));
							out.println("</td>");

							out.println("</tr>");
						  }
						} catch (SQLException e) {
							e.printStackTrace();
						  } finally {
							try {
							  if (rs != null) rs.close();
							  if (stmt != null) stmt.close();
							  if (conn != null) conn.close();
							} catch (SQLException e) {
							  e.printStackTrace();
							}
						  }
						%>

						</tbody>
						</table>
						
						
			</div>
			<div class="right-content">
				<h2 style="margin-bottom: 20px;">내 포인트</h2>
				<table>
					<tr>
						<td  style="width: 60%; text-align: center;"><%=name%>님 현재 포인트</td>
						<td  style="width: 40%; text-align: left;"><%=point%></td>
					</tr>
				</table>
				<h2 style="margin-bottom: 20px;">포인트 충전 요청</h2>
				<form action="offer_point.jsp" method="get" style="display: flex; flex-direction: column; align-items: flex-end;">
					<select name="POINT" id="pointSelect">
						<option value="5000">5000</option>
						<option value="10000">10000</option>
						<option value="30000">30000</option>
						<option value="50000">50000</option>
						<option value="100000">100000</option>
					</select>
					<input type="submit" style="margin-top: 15px;" value="충전">
				</form>
			</div>
		</div>
		<!-- Footer -->
		<footer id="footer">
			<div class="copyright">
				Made with team 세나남
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
