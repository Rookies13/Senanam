<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
    %>
<!DOCTYPE HTML>
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
<style>
    /* 체크박스 스타일 */
    input[type="radio"] {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        display: inline-block;
        width: 20px;
        height: 20px;
        border: 2px solid #ccc;
        border-radius: 4px;
        vertical-align: middle;
        cursor: pointer;
        opacity: 1;
        margin-right: 5px; /* 체크박스 사이 여백 조절 */
    }

    /* 체크된 상태의 체크박스 스타일 */
    input[type="radio"]:checked {
        background-color: #007bff;
        border-color: #007bff;
    }
</style>

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

    <!-- 기능구현 -->
    <section>
        <div style="padding: 80px;">
            <h1>포인트 충전 요청</h1>
            <form action="add_point.jsp" method="get" >
                <table>
                    <thead>
                        <tr>
                            <th>요청번호</th>
                            <th>ID</th>
                            <th>POINT</th>
                            <th>선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%@ page import="java.sql.*" %>
                        <%!
                            // 데이터베이스 접속 정보 설정
                            String dbUrl = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl"; // 오라클 서버 주소와 포트번호
                            String dbUser = "admin"; // 오라클 계정 사용자명
                            String dbPassword = "12345678"; // 오라클 계정 비밀번호
                        %>
                        <% 
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;
                            String tmp="";
                            try {
                                // 오라클 JDBC 드라이버 로딩
                                Class.forName("oracle.jdbc.driver.OracleDriver");

                                // 데이터베이스에 접속
                                conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);                          
                                String sqlQuery;

                                    sqlQuery = "SELECT * FROM OFFER_POINT";
                                    pstmt = conn.prepareStatement(sqlQuery);

                                rs = pstmt.executeQuery();

                                // 결과 처리
                                while (rs.next()) {
                                    tmp = rs.getString("OFFER_NUMBER");
                                    out.println("<tr>");
                                    out.println("<td>" + rs.getString("OFFER_NUMBER") + "</td>");
                                    out.println("<td>" + rs.getString("ID") + "</td>");
                                    out.println("<td>" + rs.getInt("POINT") + "</td>");
                                    out.print("<td><input type=\"radio\" name=\"OFFER_NUMBER\" value=\"" + tmp + "\"></td>");
                                    out.println("</tr>");
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                // 리소스 해제
                                try {
                                    if (rs != null) rs.close();
                                    if (pstmt != null) pstmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                        
                    </tbody>
                </table>
                <input type="submit" value="확인">
                </form>
            </div>
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
    <script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
   
</body>

</html>
