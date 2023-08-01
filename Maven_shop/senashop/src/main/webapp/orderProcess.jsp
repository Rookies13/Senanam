<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String id = "C##junho";
String pw = "1234";

Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName(driver);
    con = DriverManager.getConnection(url, id, pw);

    // 시퀀스로부터 ORDER_NUM 값을 얻어옵니다.
    String getOrderNumSQL = "SELECT ORDER_NUM.NEXTVAL FROM DUAL";
    stmt = con.createStatement();
    rs = stmt.executeQuery(getOrderNumSQL);
    int orderNum = 0;
    if (rs.next()) {
        orderNum = rs.getInt(1);
    }

    // orderProcess.jsp로부터 전달받은 파라미터들을 가져옵니다.
    String selectedProductNum = request.getParameter("PRODUCT_NUM");
    String selectedProductCount = request.getParameter("PRODUCT_COUNT");
    String selectedProductPrice = request.getParameter("PRODUCT_PRICE");

    // 데이터베이스에 ORDER 정보를 저장하는 SQL문을 준비합니다.
    String insertOrderSQL = "INSERT INTO ORDER_PRODUCT " +
                            "VALUES (ORDER_NUM.NEXTVAL, '" + selectedProductNum + "', '" + selectedProductCount + "', '" + selectedProductPrice + "')";
    stmt.executeUpdate(insertOrderSQL);

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
    if (stmt != null) {
        try {
            stmt.close();
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