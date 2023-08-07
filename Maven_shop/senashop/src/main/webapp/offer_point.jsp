<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>
<%
LocalDateTime now = LocalDateTime.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYMMddHHmmssSSS");
String timestamp = now.format(formatter);

// Database connection parameters
String dbUrl = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl";
String dbUsername = "admin";
String dbPassword = "12345678";

// Get the parameters from the request
String pointStr = request.getParameter("POINT");
int point = Integer.parseInt(pointStr);

// Database connection and statement initialization
Connection conn = null;
Statement stmt = null;

try {
    // Load the Oracle JDBC driver
    Class.forName("oracle.jdbc.driver.OracleDriver");

    // Create a connection to the database
    conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

    // Create a statement object to execute SQL queries
    stmt = conn.createStatement();

    // Insert data into the table using the provided parameters
    String insertDataQuery = "INSERT INTO \"ADMIN\".\"OFFER_POINT\" " +
    "(\"OFFER_NUMBER\", \"ID\", \"POINT\") VALUES ('" + timestamp + "', '" + id + "', " + point + ")";


    // Execute the SQL query to insert data into the table
    stmt.execute(insertDataQuery);

    out.println("<script>");
    out.println("alert('"+point+"원 요청 완료');");
    out.println("location.href='wallet.jsp';"); // index.jsp로 리다이렉트
    out.println("</script>");

} catch (ClassNotFoundException e) {
    out.println("Error: Oracle JDBC driver not found.");
    e.printStackTrace();
} catch (SQLException e) {
    out.println("Error: SQL Exception occurred.");
    e.printStackTrace();
} finally {
    // Close the resources (statement, connection)
    if (stmt != null) {
        try {
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
