<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<html>

<head>

<meta charset="UTF-8">

<title>게시판 글쓰기</title>

</head>

<%! String msg; %>

<%
	request.setCharacterEncoding("utf-8");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");

    try{
        Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##test", "wnsdnr6990");
        String sql = "insert into board (qseq, subject, content, reply, type, id, rep, indate) values (?, ?, ?, ?, 1, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql); //sql문으로 conn

        pstmt.setInt(1, 4);
        pstmt.setString(2, subject);
        pstmt.setString(3, content);

        pstmt.executeUpdate();
        
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

<body bgcolor = "<%=color %>">

<b><%=name %>님이 좋아하는 색은 <%=msg %></b>

</body>

</html>