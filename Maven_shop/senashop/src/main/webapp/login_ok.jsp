<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null; //DBMS와 JAVA연결 객체
	Statement stmt = null;	//SQL구문을 실행
	ResultSet rs = null;	//실행결과를 저장

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String password = "root";
	String driver="oracle.jdbc.driver.OracleDriver";

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String selectQuery = "SELECT * FROM id_pw where u_id = '"+ id+"'" +"and u_pw = '"+pw+"'" ;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement(); // 쿼리 호출받아주고
		rs = stmt.executeQuery(selectQuery); // 쿼리를 집어넣음
				
		if(rs.next()){ // 로그인 성공(인증의 수단 session)
			id = rs.getString("u_id");
			String name = rs.getString("u_pw");
				
			session.setAttribute("user_id", id);
			session.setAttribute("user_name", name);
					
			response.sendRedirect("login_welcome.jsp"); // 페이지이동
					
		} else{ // 로그인 실패
			response.sendRedirect("login_fail.jsp"); // 실패 페이지
		}
	} catch (SQLException se) {
        se.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
    </table>
</body>
</html>