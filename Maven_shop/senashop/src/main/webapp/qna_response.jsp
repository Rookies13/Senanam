<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>
<%
    request.setCharacterEncoding("utf-8");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");

     if (subject == null || subject.trim().isEmpty() || content == null || content.trim().isEmpty()) {
        // Display an alert using JavaScript
        response.setContentType("text/html");
        out.println("<script type=\"text/javascript\">");
        out.println("alert('제목과 내용중 작성되지 않은 것이 있습니다 작성해 주세요');");
        out.println("window.location.href='qnawrite.jsp';");
        out.println("</script>");
        return; // Return to prevent the rest of the code from executing
    }

    // 데이터베이스 연결 정보
    String url = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl";
    String username = "admin";
    String password = "12345678";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, username, password);

        // Get the current date and time
        java.util.Date currentDate = new java.util.Date();
        java.sql.Timestamp date = new java.sql.Timestamp(currentDate.getTime());

        // Get the count for the new board_number
        String countSQL = "SELECT MAX(board_number) FROM board";
        int count = 1;
        try {
            pstmt = conn.prepareStatement(countSQL);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1) + 1;
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Insert the new record into the board table
        String insertSQL = "INSERT INTO board (board_number, subject, content, reply, reply_ok, type, id, time, cnt, pw) VALUES (?, ?, ?, NULL, NULL, 'B', ?, ?, 0, 0)";
        pstmt = conn.prepareStatement(insertSQL);
        pstmt.setInt(1, count);
        pstmt.setString(2, subject);
        pstmt.setString(3, content);
        pstmt.setString(4, id);
        pstmt.setTimestamp(5, date);
        pstmt.executeUpdate();

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 문의 작성이 완료되면 qna.jsp 페이지로 리다이렉트.
    response.sendRedirect("qna.jsp");
%>
