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

    <%-- 상품 추가 처리 시작 --%>
    <% if (request.getMethod().equals("POST")) {
        String PRODUCT_NAME = request.getParameter("PRODUCT_NAME");
        int PRODUCT_PRICE = Integer.parseInt(request.getParameter("PRODUCT_PRICE"));
        String PRODUCT_IMAGES = request.getParameter("PRODUCT_IMAGES"); // 이미지 URL

        // 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@//localhost:1521/xe";
        String dbUser = "c##root";
        String dbPassword = "1234";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스 연결
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL 쿼리 실행 (상품 추가)
            String sqlQuery = "INSERT INTO product (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_IMAGES) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sqlQuery);
            pstmt.setString(1, PRODUCT_NAME);
            pstmt.setInt(2, PRODUCT_PRICE);
            pstmt.setString(3, PRODUCT_IMAGES);
            pstmt.executeUpdate();

            // 상품 추가 성공 메시지 출력
            out.println("<p style=\"color: green;\">상품이 성공적으로 추가되었습니다.</p>");
        } catch (Exception e) {
            // 상품 추가 실패 메시지 출력
            out.println("<p style=\"color: red;\">상품 추가에 실패하였습니다.</p>");
        } finally {
            // 연결 및 리소스 해제
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { }
            try { if (conn != null) conn.close(); } catch (Exception e) { }
        }
    } %>
    <%-- 상품 추가 처리 끝 --%>

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
        String sqlQuery = "SELECT * FROM product";
        pstmt = conn.prepareStatement(sqlQuery);
        rs = pstmt.executeQuery();

        // 상품 목록 테이블 출력
    %>
    <table border="1">
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>이미지</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getString("PRODUCT_NAME") %></td>
            <td><%= rs.getInt("PRODUCT_PRICE") %></td>
            <td><img src="<%= rs.getString("PRODUCT_IMAGES") %>" alt="Product Image" width="100" height="100"></td>
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

    <h2>상품 추가</h2>
    <form action="" method="post">
        <label for="PRODUCT_NAME">상품명:</label>
        <input type="text" id="PRODUCT_NAME" name="PRODUCT_NAME" required><br>
        <label for="PRODUCT_PRICE">가격:</label>
        <input type="number" id="PRODUCT_PRICE" name="PRODUCT_PRICE" required><br>
        <label for="PRODUCT_IMAGES">이미지 URL:</label>
        <input type="text" id="PRODUCT_IMAGES" name="PRODUCT_IMAGES" required><br>
        <input type="submit" value="추가">
    </form>
</body>
</html>
