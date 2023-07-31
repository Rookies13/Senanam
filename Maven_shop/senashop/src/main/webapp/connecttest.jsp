<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
    
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table border="1" align="center" width="100%">
        <thead>
            <th width="10%" align="center"><center>번호</center></th>
            <th width="50%" align="center"><center>제목</center></th>
            <th width="20%" align="center"><center>글쓴이</center></th>
        </thead>
        <%
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##test", "love2468"); //username, password는 개인 Oracle 계정의 것으로 하면 됨
            String sql = "select * from TEST1"; //DB를 조회할 select문
            pstmt = conn.prepareStatement(sql); //sql문으로 conn
            rs = pstmt.executeQuery(); //pstmt 실행 후 결과를 rs에 할당
            
            while(rs.next()){ //조회되는 로우(행) 반복
                out.print("<tr>");
                out.print("<td><center>" + rs.getString("NAME") + "</center></td>");
                out.print("<td>" + rs.getString("ADDRESS") + "</td>");
                out.print("</tr>");
            }
            
            rs.close();
            pstmt.close();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(rs!=null) rs.close();
                if(pstmt!=null) pstmt.close();
                if(conn!=null) conn.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        %>
</body>
</html>