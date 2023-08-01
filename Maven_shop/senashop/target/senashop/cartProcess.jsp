<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Data</title>
</head>
<body>
    <h1>Insert Data into CART_PRODUCT Table</h1>
    
    <%
        String productNum = request.getParameter("productNum");
        String productCount = request.getParameter("productCount");
        String productPrice = request.getParameter("productPrice");
        String userId = request.getParameter("userId");
    
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String id = "C##junho";
        String pw = "1234";
  
        Connection conn = null;
        Statement stmt = null;
        
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, id, pw);
            stmt = conn.createStatement();
            
            String insertQuery = "INSERT INTO CART " +
                                 "VALUES(CART_NUM.nextval, '" + productNum + "', '" + productCount + "', '" + productPrice + "', '" + userId + "')";
            
            int rowsInserted = stmt.executeUpdate(insertQuery);
            
            if (rowsInserted > 0) {
                out.println("<p>Data inserted successfully into CART_PRODUCT table.</p>");
                
                // 데이터가 성공적으로 삽입되었을 때, 해당 USER_ID 값과 함께 cart.jsp로 이동
                response.sendRedirect("cart.jsp?USER_ID=" + userId);
            } else {
                out.println("<p>Failed to insert data into CART_PRODUCT table.</p>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<p>Oracle JDBC Driver not found.</p>");
        } catch (SQLException e) {
            out.println("<p>Error executing the query: " + e.getMessage() + "</p>");
        } finally {
            // 리소스 해제
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
    
    <p><a href="index.jsp">Go back to home page</a></p>
</body>
</html>
