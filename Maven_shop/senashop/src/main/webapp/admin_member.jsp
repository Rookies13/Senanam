<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>SENASHOP 관리자 페이지 - 회원 관리</title>
</head>
<body>
    <h1>SENASHOP 관리자 페이지 - 회원 관리</h1>

    <%-- 회원 추가 처리 시작 --%>
    <% if (request.getMethod().equals("POST") && request.getParameter("action").equals("add")) {
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        int user_level = Integer.parseInt(request.getParameter("user_level"));

        // 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521/orcl";
        String dbUser = "admin";
        String dbPassword = "12345678";

        Connection conn = null;
        Statement stmt = null;

        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스 연결
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL 쿼리 실행 (회원 추가)
            stmt = conn.createStatement();
            String sqlQuery = "INSERT INTO member (id, email, user_level) VALUES ('" + id + "', '" + email + "', " + user_level + ")";
            stmt.executeUpdate(sqlQuery);

            // 회원 추가 성공 메시지 출력
            out.println("<p style=\"color: green;\">회원이 성공적으로 추가되었습니다.</p>");
        } catch (Exception e) {
            // 회원 추가 실패 메시지 출력
            out.println("<p style=\"color: red;\">회원 추가에 실패하였습니다.</p>");
        } finally {
            // 연결 및 리소스 해제
            try { if (stmt != null) stmt.close(); } catch (Exception e) { }
            try { if (conn != null) conn.close(); } catch (Exception e) { }
        }
    } %>
    <%-- 회원 추가 처리 끝 --%>

    <%-- 회원 목록 조회 시작 --%>
    <%
    // 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521/orcl";
        String dbUser = "admin";
        String dbPassword = "12345678";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL 쿼리 실행 (회원 목록 조회)
        stmt = conn.createStatement();
        String sqlQuery = "SELECT * FROM member";
        rs = stmt.executeQuery(sqlQuery);

        // 회원 목록 테이블 출력
    %>
    <h2>회원 목록</h2>
    <table border="1">
        <tr>
            <th>사용자 ID</th>
            <th>이메일</th>
            <th>권한</th>
            <th>수정</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getInt("user_level") %></td>
            <td><a href="#" onclick="editMember('<%= rs.getString("id") %>', '<%= rs.getString("email") %>', <%= rs.getInt("user_level") %>)">수정</a></td>
        </tr>
        <% } %>
    </table>
    <% } catch (Exception e) {
        // 회원 목록 조회 실패 시, 오류 메시지 출력
        out.println("<p style=\"color: red;\">회원 목록 조회에 실패하였습니다.</p>");
    } finally {
        // 연결 및 리소스 해제
        try { if (rs != null) rs.close(); } catch (Exception e) { }
        try { if (stmt != null) stmt.close(); } catch (Exception e) { }
        try { if (conn != null) conn.close(); } catch (Exception e) { }
    }
    %>
    <%-- 회원 목록 조회 끝 --%>

    <%-- 회원 정보 수정 폼 시작 --%>
    <h2>회원 정보 수정</h2>
    <form action="" method="post" id="editForm" style="display: none;">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" id="editid">
        <label for="editEmail">이메일:</label>
        <input type="email" id="editEmail" name="email" required><br>
        <label for="editMemLevel">권한(사용자: 0, 관리자: 1):</label>
        <input type="number" id="editMemLevel" name="user_level" required><br>
        <input type="submit" value="수정">
    </form>

    <script>
        function editMember(id, email, memLevel) {
            document.getElementById("editid").value = id;
            document.getElementById("editEmail").value = email;
            document.getElementById("editMemLevel").value = memLevel;
            document.getElementById("editForm").style.display = "block";
        }

        // Function to refresh the member list after updating
        function refreshMemberList() {
            // You can use AJAX here to fetch the updated member list and update the table without a full page refresh.
            // For simplicity, we will perform a full page reload for demonstration purposes.
            location.reload();
        }
    </script>
    <%-- 회원 정보 수정 폼 끝 --%>

    <%-- 회원 정보 수정 처리 시작 --%>
    <% if (request.getMethod().equals("POST") && request.getParameter("action").equals("edit")) {
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        int user_level = Integer.parseInt(request.getParameter("user_level"));

        // 데이터베이스 연결 정보 설정
        dbURL = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521/orcl";
        dbUser = "admin";
        dbPassword = "12345678";

        conn = null;
        stmt = null;

        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스 연결
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL 쿼리 실행 (회원 정보 수정)
            stmt = conn.createStatement();
            String sqlQuery = "UPDATE member SET email = '" + email + "', user_level = " + user_level + " WHERE id = '" + id + "'";
            stmt.executeUpdate(sqlQuery);

            // 회원 정보 수정 성공 메시지 출력
            out.println("<p style=\"color: green;\">회원 정보가 성공적으로 수정되었습니다.</p>");
        } catch (Exception e) {
            // 회원 정보 수정 실패 메시지 출력
            out.println("<p style=\"color: red;\">회원 정보 수정에 실패하였습니다.</p>");
        } finally {
            // 연결 및 리소스 해제
            try { if (stmt != null) stmt.close(); } catch (Exception e) { }
            try { if (conn != null) conn.close(); } catch (Exception e) { }
        }
    }
    %>
    <%-- 회원 정보 수정 처리 끝 --%>

    <h2>회원 추가</h2>
    <form action="" method="post">
        <input type="hidden" name="action" value="add">
        <label for="id">사용자 이름:</label>
        <input type="text" id="id" name="id" required><br>
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="user_level">권한(사용자: 0, 관리자: 1):</label>
        <input type="number" id="user_level" name="user_level" required><br>
        <input type="submit" value="추가">
    </form>
    <%-- 회원 추가 폼 끝 --%>

</body>
</html>