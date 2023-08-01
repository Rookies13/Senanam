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
            <li><a href="">문의게시판</a></li>
            <li><a href="qna.jsp">Q&A</a></li>
        </ul>
    </nav>

    <div style="padding:60px;">
        <section>
            <h3>문의하기</h3>
            <div class="table-wrapper">
                <table>
                    
<%
    request.setCharacterEncoding("utf-8");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    int qnanumber = Integer.parseInt(request.getParameter("qnanumber")); // Assuming "qnanumber" is an integer.

    // 데이터베이스 연결 정보
    String url = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl";
    String username = "admin";
    String password = "12345678";

    Connection conn = null;
    PreparedStatement pstmtBoard = null;
    ResultSet rsBoard = null;
    PreparedStatement pstmtReply = null;
    ResultSet rsReply = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, username, password);

        // Query to fetch data from board table
        String boardSQL = "SELECT * FROM board WHERE board_number = ?";
        pstmtBoard = conn.prepareStatement(boardSQL);
        pstmtBoard.setInt(1, qnanumber);
        rsBoard = pstmtBoard.executeQuery();

        if (rsBoard.next()) {
            out.print("<h1>" + rsBoard.getString("subject") + "</h1>");
            out.print("<h4>" + "작성자 : " + rsBoard.getString("ID") + "</h4>");
            out.print("<h4>" + "작성일 : " + rsBoard.getDate("time") + "</h4>");
            out.print("<pre><code>" + rsBoard.getString("content") + "</code></pre>");

            // Query to fetch data from reply table
            String replySQL = "SELECT * FROM reply WHERE board_number = ?";
            pstmtReply = conn.prepareStatement(replySQL);
            pstmtReply.setInt(1, qnanumber);
            rsReply = pstmtReply.executeQuery();

            if (rsReply.next()) {
                out.print("<h4>" + "답변" + "</h4>");
                out.print("<pre><code>" + rsReply.getString("content") + "</code></pre>");
            } else {
                out.print("<h4>" + "답변이 아직 등록되지 않았습니다." + "</h4>");
            }

            // Update the count_a value in the board table
            int currentCount = rsBoard.getInt("cnt");
            int newCount = currentCount + 1;
            String updateCountSQL = "UPDATE board SET cnt = ? WHERE board_number = ?";
            pstmtBoard = conn.prepareStatement(updateCountSQL);
            pstmtBoard.setInt(1, newCount);
            pstmtBoard.setInt(2, qnanumber);
            pstmtBoard.executeUpdate();
        } else {
            out.print("<h2>글이 존재하지 않습니다.</h2>");
        }

        // Close the ResultSets and PreparedStatements
        rsBoard.close();
        pstmtBoard.close();

        rsReply.close();
        pstmtReply.close();

        conn.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.print("<h2>데이터베이스 오류 발생</h2>");
    }
%>
                </table>
            </div>
        </section>
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