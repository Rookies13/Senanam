<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Oracle 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@//localhost:1521/xe"; // hostname, port, servicename은 각각 해당하는 Oracle DB 정보로 대체되어야 합니다.
        String dbUser = "c##root";
        String dbPassword = "1234";

        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL 쿼리 실행
        String sqlQuery = "SELECT TITLE, CONTENT FROM SHOPPING_MALL_BOARD"; // your_table_name은 조회하려는 테이블명으로 대체되어야 합니다.
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sqlQuery);

        // 결과 처리
        while (rs.next()) {
            String column1Value = rs.getString("TITLE"); // column1은 조회하려는 테이블의 컬럼명으로 대체되어야 합니다.
            String column2Value = rs.getString("CONTENT"); // column2도 조회하려는 테이블의 컬럼명으로 대체되어야 합니다.
            
            // 가져온 데이터를 원하는 방식으로 출력 또는 활용합니다.
            out.println("TITLE: " + column1Value + ", CONTENT: " + column2Value + "<br>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 연결 및 리소스 해제
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>