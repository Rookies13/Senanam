<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Insert Order Data</title>
</head>
<body>

<%
// 파라미터에서 값들을 받아옵니다.
String orderNumber = request.getParameter("order_number");
String ID = request.getParameter("ID");
String totalPrice = request.getParameter("total_price");
String cartOrOrderHistory = "ORDER"; // 이 값은 ORDERLIST 테이블에 맞게 수정해주세요.
String address = request.getParameter("address");
String zipcode = request.getParameter("zipcode");

// 데이터베이스 접속 정보 설정
String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // 오라클 서버 주소와 포트번호
String dbUser = "system"; // 오라클 계정 사용자명
String dbPassword = "1234"; // 오라클 계정 비밀번호

Connection conn = null;
PreparedStatement pstmt = null;

try {
    // 오라클 JDBC 드라이버 로딩
    Class.forName("oracle.jdbc.driver.OracleDriver");

    // 데이터베이스에 접속
    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

    // INSERT 쿼리 작성
    String sqlQuery = "INSERT INTO \"SYSTEM\".\"ORDERLIST\" (\"ORDER_NUM\", \"ID\", \"TOTAL_PRICE\", \"CART_OR_ORDER_HISTORY\", \"ADDRESS\", \"ZIPCODE\") VALUES (?, ?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(sqlQuery);

    // INSERT 쿼리에 값들을 매핑
    pstmt.setInt(1, Integer.parseInt(orderNumber));
    pstmt.setString(2, ID);
    pstmt.setInt(3, Integer.parseInt(totalPrice));
    pstmt.setString(4, cartOrOrderHistory);
    pstmt.setString(5, address);
    pstmt.setInt(6, Integer.parseInt(zipcode));

    // INSERT 쿼리 실행
    int rowsAffected = pstmt.executeUpdate();

    if (rowsAffected > 0) {
        // INSERT 성공 후 "결제 완료" 알림을 띄웁니다.
        out.println("<script>");
        out.println("var totalPrice = '" + totalPrice + "';");
        out.println("alert(totalPrice + '원 결제 완료');");
        out.println("location.href='index.html';"); // index.jsp로 리다이렉트
        out.println("</script>");
    } else {
        out.println("Failed to insert data.");
    }

} catch (Exception e) {
    e.printStackTrace();
} finally {
    // 리소스 해제
    try {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

</body>
</html>
