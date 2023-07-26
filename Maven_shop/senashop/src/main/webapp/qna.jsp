<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
</head>
<body>
<center><h2>문의하기</h2></center>
<table width="800" border="1" align="center">
<tr>
<th>번 호</th>
<th>제 목</th>
<th>글쓴이</th>
<th>시 간</th>
<th>조회수</th>
</tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "djdlzndi1"); //username, password는 개인 Oracle 계정의 것으로 하면 됨
	String sql = "select * from sinsang"; //DB를 조회할 select문
	pstmt = conn.prepareStatement(sql); //sql문으로 conn
	rs = pstmt.executeQuery(); //pstmt 실행 후 결과를 rs에 할당
	
	while(rs.next()){ //조회되는 로우(행) 반복
		out.print("<tr>");
		out.print("<td>" + rs.getString("sabun") + "</td>"); //DB에서 sabun 컬럼에 해당하는 레코드 값을 불러옴
		out.print("<td>" + rs.getString("hakkwa") + "</td>");
		out.print("<td>" + rs.getInt("kor") + "</td>");
		out.print("<td>" + rs.getInt("eng") + "</td>");
		out.print("<td>" + rs.getInt("com") + "</td>");
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
</table>
</body>
</html>