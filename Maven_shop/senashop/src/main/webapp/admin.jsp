<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Oracle 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@//localhost:1521/xe"; 
        String dbUser = "c##root";
        String dbPassword = "1234";

        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL 쿼리 실행
        String sqlQuery = "SELECT TITLE, CONTENT FROM SHOPPING_MALL_BOARD"; 
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sqlQuery);

        // 결과 처리
        while (rs.next()) {
            String column1Value = rs.getString("TITLE");
            String column2Value = rs.getString("CONTENT");
            
            // printout
            out.println("TITLE: " + column1Value + ", CONTENT: " + column2Value + "<br>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>

<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
    <header>
        <h1>쇼핑몰 관리자 페이지</h1>
    </header>
    <nav>
        <a href="#">상품 관리</a>
        <a href="#">주문 관리</a>
        <a href="#">고객 관리</a>
        <!-- 기타 관리자 페이지 메뉴 추가 -->
    </nav>
    <div class="container">
        <h2>상품 목록</h2>
        <table>
            <tr>
                <th>상품명</th>
                <th>가격</th>
                <th>재고</th>
            </tr>
            <tr>
                <td>상품 A</td>
                <td>10000</td>
                <td>50</td>
            </tr>
            <!-- 상품 데이터를 반복문으로 표시 -->
        </table>
        <form>
            <h2>새 상품 추가</h2>
            <label for="productName">상품명:</label>
            <input type="text" id="productName" name="productName" required><br>
            <label for="productPrice">가격:</label>
            <input type="number" id="productPrice" name="productPrice" required><br>
            <label for="productStock">재고:</label>
            <input type="number" id="productStock" name="productStock" required><br>
            <input type="submit" value="추가" class="btn">
        </form>
    </div>
</body>
</html>