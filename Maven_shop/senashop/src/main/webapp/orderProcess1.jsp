<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String id = "C##junho";
String pw = "1234";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


try {
    Class.forName(driver);
    con = DriverManager.getConnection(url, id, pw);

    // orderProcess.jsp로부터 전달받은 파라미터들을 가져옵니다.
    String selectedProductNumString = request.getParameter("PRODUCT_NUM");
    String selectedProductCountString = request.getParameter("PRODUCT_COUNT");
    String selectedProductPriceString = request.getParameter("PRODUCT_PRICE");

    // 콤마(,)를 기준으로 파라미터 값을 배열로 분리합니다.
    String[] selectedProductNumArray = selectedProductNumString.split(",");
    String[] selectedProductCountArray = selectedProductCountString.split(",");
    String[] selectedProductPriceArray = selectedProductPriceString.split(",");

    // 데이터베이스에 ORDER 정보를 저장하는 SQL문을 준비합니다.
    String insertOrderSQL = "INSERT INTO ORDER_PRODUCT (ORDER_NUM.NEXTVAL, PRODUCT_NUM, PRODUCT_COUNT, PRODUCT_PRICE) VALUES (ORDER_NUM.NEXTVAL, '%s', %s, %s)";

    // 여러 개의 파라미터를 하나의 데이터로 저장합니다.
    if (selectedProductNumArray != null && selectedProductCountArray != null && selectedProductPriceArray != null) {
        for (int i = 0; i < selectedProductNumArray.length; i++) {
            String productNum = selectedProductNumArray[i];
            int productCount = Integer.parseInt(selectedProductCountArray[i]);
            int productPrice = Integer.parseInt(selectedProductPriceArray[i]);
            
            String insertQuery = String.format(insertOrderSQL, productNum, productCount, productPrice);
            Statement stmt = con.createStatement();
            stmt.executeUpdate(insertQuery);
        }
    }

    // 작업이 완료되면, 성공적으로 주문이 완료되었음을 사용자에게 보여줄 수 있습니다.
    out.print("<h1>주문이 완료되었습니다.</h1>");
    response.sendRedirect("test3.jsp");


} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (con != null) {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
