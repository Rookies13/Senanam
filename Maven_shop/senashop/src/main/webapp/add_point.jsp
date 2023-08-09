<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="db.DatabaseConnectionPool" %>
<%@ page import="java.sql.*" %>

<%
  String ofr_num = request.getParameter("OFFER_NUMBER");
  String dbUrl = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl"; // 오라클 서버 주소와 포트번호
  String dbUser = "admin"; // 오라클 계정 사용자명
  String dbPassword = "12345678"; // 오라클 계정 비밀번호

  // DB 연결
  Connection conn = null;
  PreparedStatement stmt = null;

  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    // 데이터베이스에 접속
    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    
    //
    stmt = conn.prepareStatement("SELECT ID, POINT FROM OFFER_POINT WHERE OFFER_NUMBER = ?");
    stmt.setString(1, ofr_num);
    ResultSet rs = stmt.executeQuery();

    int point = 0;
    String id = "";
    if(rs.next())
    {   
        id = rs.getString("ID");
        point = rs.getInt("POINT");
    }
        
    // Member 테이블에서 포인트 가져오기
    stmt = conn.prepareStatement("SELECT POINT FROM ADMIN.MEMBER WHERE ID = ?");
    stmt.setString(1, id);
    rs = stmt.executeQuery();

    int memberPoint = 0;
    if (rs.next()) {
      memberPoint = rs.getInt("POINT");
    }

    // Member 테이블의 포인트에 Offer 테이블의 포인트 더하기
    int updatedPoint = memberPoint + point;
    stmt = conn.prepareStatement("UPDATE ADMIN.MEMBER SET POINT = ? WHERE ID = ?");
    stmt.setInt(1, updatedPoint);
    stmt.setString(2, id);
    stmt.executeUpdate();
    
    // Offer 테이블에서 해당 레코드 삭제
    stmt = conn.prepareStatement("DELETE FROM OFFER_POINT WHERE OFFER_NUMBER = ?");
    stmt.setString(1, ofr_num);
    stmt.executeUpdate();

    response.sendRedirect("admin_point.jsp"); // table 페이지로 리다이렉트

  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    try {
      if (stmt != null) stmt.close();
      if (conn != null) conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
%>
