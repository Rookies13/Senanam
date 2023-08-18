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

        <script>
            function deletePost(board_number) {
                if (confirm('정말로 삭제하시겠습니까?')) {
                    // 삭제 처리를 위한 form 생성
                    var form = document.createElement("form");
                    form.method = "post";
                    form.action = "deletePost.jsp";
                    
                    // board_number 전달하기 위한 input hidden 추가
                    var input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "board_number";
                    input.value = board_number;
                    form.appendChild(input);
        
                    // form을 바로 body에 추가하고 전송
                    document.body.appendChild(form);
                    form.submit();
                }
            }
        </script>

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
                    <%
                    String boardNumberParam = request.getParameter("board_number");
                    int board_number = Integer.parseInt(boardNumberParam);
                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
                        conn = DriverManager.getConnection("jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl", "admin", "12345678");
                        
                        String sql = "select * from board, attachment where board.board_number=attachment.board_number(+) and board.board_number = " + board_number;
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
                                    <td><%=rs.getDate("time") %></td>
                                </tr>
                                <%
                                String file_name = rs.getString("name");
                                if( file_name != null){
                                    out.print("<tr><td width='20%'>첨부파일</td>");
                                    String fileDownloadLink = "https://senanam.s3.ap-northeast-2.amazonaws.com/" + java.net.URLEncoder.encode(file_name, "UTF-8");
                                    out.print("<td colspan='3'><a href='" + fileDownloadLink + "'>" + file_name + "</a></td>");
                                    out.print("</tr>");
                                }
                                %>
                            </table>
                        </div>
                        <pre><code><%=rs.getString("content") %></code> </pre>

                        <%
                        int boardNumber = rs.getInt("board_number");
                        String link = "boardEdit.jsp?board_number=" + boardNumber;
                        if (rs.getString("id").equals(id)){
                        %>
                        <input type="button" onclick="location.href='<%=link%>'" value="수정">
                        <input type="button" onclick="deletePost('<%=board_number%>')" value="삭제">
                        <%
                        }
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
