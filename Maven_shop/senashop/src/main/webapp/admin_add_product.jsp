<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>쇼핑몰 관리자 페이지 - 상품 추가</title>
</head>
<body>
    <h1>쇼핑몰 관리자 페이지 - 상품 추가</h1>
    <form action="" method="post">
        <label for="productName">상품명:</label>
        <input type="text" id="productName" name="productName" required><br>
        <label for="productPrice">가격:</label>
        <input type="number" id="productPrice" name="productPrice" required><br>
        <label for="productStock">재고:</label>
        <input type="number" id="productStock" name="productStock" required><br>
        <input type="submit" value="추가">
    </form>

    <%-- 상품 추가 처리 시작 --%>
    <%-- Java 코드와 스크립트릿을 사용하여 처리 --%>
    <%
    if (request.getMethod().equals("POST")) {
        String productName = request.getParameter("productName");
        int productPrice = Integer.parseInt(request.getParameter("productPrice"));
        int productStock = Integer.parseInt(request.getParameter("productStock"));

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
            String sqlQuery = "INSERT INTO products (product_name, price, stock) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sqlQuery);
            pstmt.setString(1, productName);
            pstmt.setInt(2, productPrice);
            pstmt.setInt(3, productStock);
            pstmt.executeUpdate();

            // 상품 추가가 성공했을 때, 메시지 출력
            out.println("<p style=\"color: green;\">상품이 성공적으로 추가되었습니다.</p>");
        } catch (Exception e) {
            // 상품 추가가 실패했을 때, 오류 메시지 출력
            out.println("<p style=\"color: red;\">상품 추가에 실패하였습니다.</p>");
        } finally {
            // 연결 및 리소스 해제
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { }
            try { if (conn != null) conn.close(); } catch (Exception e) { }
        }
    }
    %>
    <%-- 상품 추가 처리 끝 --%>
</body>
</html>