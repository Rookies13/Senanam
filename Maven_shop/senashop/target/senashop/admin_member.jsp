<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>쇼핑몰 관리자 페이지 - 회원 관리</title>
</head>
<body>
    <h1>쇼핑몰 관리자 페이지 - 회원 관리</h1>

    <%-- 회원 추가 처리 시작 --%>
    <% if (request.getMethod().equals("POST") && request.getParameter("action").equals("add")) {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        int mem_level = Integer.parseInt(request.getParameter("mem_level"));

        // 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@//localhost:1521/xe";
        String dbUser = "c##root";
        String dbPassword = "1234";

        Connection conn = null;
        Statement stmt = null;

        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스 연결
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL 쿼리 실행 (회원 추가)
            stmt = conn.createStatement();
            String sqlQuery = "INSERT INTO reg_members (username, email, mem_level) VALUES ('" + username + "', '" + email + "', " + mem_level + ")";
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

        // SQL 쿼리 실행 (회원 목록 조회)
        stmt = conn.createStatement();
        String sqlQuery = "SELECT * FROM reg_members";
        rs = stmt.executeQuery(sqlQuery);

        // 회원 목록 테이블 출력
    %>
    <h2>회원 목록</h2>
    <table border="1">
        <tr>
            <th>사용자 이름</th>
            <th>이메일</th>
            <th>권한</th>
            <th>수정</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getInt("mem_level") %></td>
            <td><a href="#" onclick="editMember('<%= rs.getString("username") %>', '<%= rs.getString("email") %>', <%= rs.getInt("mem_level") %>)">수정</a></td>
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
        <input type="hidden" name="username" id="editUsername">
        <label for="editEmail">이메일:</label>
        <input type="email" id="editEmail" name="email" required><br>
        <label for="editMemLevel">권한(사용자: 0, 관리자: 1):</label>
        <input type="number" id="editMemLevel" name="mem_level" required><br>
        <input type="submit" value="수정">
    </form>

    <script>
        function editMember(username, email, memLevel) {
            document.getElementById("editUsername").value = username;
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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        int mem_level = Integer.parseInt(request.getParameter("mem_level"));

        // 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@//localhost:1521/xe";
        String dbUser = "c##root";
        String dbPassword = "1234";

        Connection conn = null;
        Statement stmt = null;

        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스 연결
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL 쿼리 실행 (회원 정보 수정)
            stmt = conn.createStatement();
            String sqlQuery = "UPDATE reg_members SET email = '" + email + "', mem_level = " + mem_level + " WHERE username = '" + username + "'";
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
        <label for="username">사용자 이름:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="mem_level">권한(사용자: 0, 관리자: 1):</label>
        <input type="number" id="mem_level" name="mem_level" required><br>
        <input type="submit" value="추가">
    </form>
    <%-- 회원 추가 폼 끝 --%>

</body>
</html>