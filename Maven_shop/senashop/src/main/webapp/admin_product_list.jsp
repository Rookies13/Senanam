<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>쇼핑몰 관리자 페이지 - 상품 목록</title>
</head>
<body>
    <h1>쇼핑몰 관리자 페이지 - 상품 목록</h1>

    <%-- 상품 목록 조회 시작 --%>
    <%
    // 데이터베이스 연결 정보 설정
    String dbURL = "jdbc:oracle:thin:@//localhost:1521/xe";
        String dbUser = "c##root";
        String dbPassword = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL 쿼리 실행 (상품 목록 조회)
        String sqlQuery = "SELECT * FROM products";
        pstmt = conn.prepareStatement(sqlQuery);
        rs = pstmt.executeQuery();

        // 상품 목록 테이블 출력
    %>
    <table border="1">
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>재고</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getString("product_name") %></td>
            <td><%= rs.getInt("price") %></td>
            <td><%= rs.getInt("stock") %></td>
        </tr>
        <% } %>
    </table>
    <% } catch (Exception e) {
        // 상품 목록 조회 실패 시, 오류 메시지 출력
        out.println("<p style=\"color: red;\">상품 목록 조회에 실패하였습니다.</p>");
    } finally {
        // 연결 및 리소스 해제
        try { if (rs != null) rs.close(); } catch (Exception e) { }
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { }
        try { if (conn != null) conn.close(); } catch (Exception e) { }
    }
    %>
    <%-- 상품 목록 조회 끝 --%>
</body>
</html>
