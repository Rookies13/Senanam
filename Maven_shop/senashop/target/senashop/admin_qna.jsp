<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>쇼핑몰 관리자 페이지 - 문의 게시글 조회</title>
</head>
<body>
    <h1>쇼핑몰 관리자 페이지 - 문의 게시글 조회</h1>

    <%-- 문의 게시글 조회 및 댓글 작성 시작 --%>
    <section>
        <%!
        // HTML 특수 문자를 이스케이프하는 헬퍼 함수
        public String escapeHTML(String str) {
            if (str == null) {
                return "";
            }
            return str.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
        }
        %>

        <%
        // 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@//localhost:1521/xe";
        String dbUser = "c##root";
        String dbPassword = "1234";

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스 연결
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL 쿼리 실행 (문의 게시글 조회 - type이 2인 경우)
            stmt = conn.createStatement();
            String sqlQuery = "SELECT BOARD_NUMBER, SUBJECT, REPLY FROM board WHERE TYPE = 2";
            rs = stmt.executeQuery(sqlQuery);

            // 문의 게시글 테이블 출력
            %>
            <table border="1">
                <tr>
                    <th>게시글 번호</th>
                    <th>제목</th>
                    <th>댓글</th>
                    <th>댓글 작성</th>
                </tr>
                <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("BOARD_NUMBER") %></td>
                    <td><%= escapeHTML(rs.getString("SUBJECT")) %></td>
                    <td><%= escapeHTML(rs.getString("REPLY")) %></td>
                    <td>
                        <% if (rs.getString("REPLY") == null || rs.getString("REPLY").isEmpty()) { %>
                            <a href="admin_add_comment.jsp?BOARD_NUMBER=<%= rs.getInt("BOARD_NUMBER") %>">댓글 작성</a>
                        <% } else { %>
                            이미 작성된 댓글
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </table>
        <% } catch (Exception e) {
            // 문의 게시글 조회 실패 시, 오류 메시지 출력
            out.println("<p style=\"color: red;\">문의 게시글 조회에 실패하였습니다.</p>");
            e.printStackTrace();
        } finally {
            // 연결 및 리소스 해제
            try { if (rs != null) rs.close(); } catch (Exception e) { }
            try { if (stmt != null) stmt.close(); } catch (Exception e) { }
            try { if (conn != null) conn.close(); } catch (Exception e) { }
        }
        %>
    </section>
    <%-- 문의 게시글 조회 및 댓글 작성 끝 --%>

</body>
</html>
