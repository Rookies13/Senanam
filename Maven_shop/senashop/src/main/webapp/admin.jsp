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