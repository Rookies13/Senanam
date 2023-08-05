<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    String boardNumberParam = request.getParameter("board_number");
    int board_number = Integer.parseInt(boardNumberParam);

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl", "admin", "12345678");
        
        String deleteSql = "DELETE FROM attachment WHERE board_number = ?";
        PreparedStatement pstmt = conn.prepareStatement(deleteSql);
        pstmt.setInt(1, board_number);
        pstmt.executeUpdate();

        deleteSql = "DELETE FROM board WHERE board_number = ?";
        pstmt = conn.prepareStatement(deleteSql);
        pstmt.setInt(1, board_number);
        pstmt.executeUpdate();
        pstmt.close();
        conn.close();

        // 삭제 성공 시, 게시판 목록 페이지로 이동
        out.println("<script>alert('글이 삭제되었습니다.'); window.location.href = 'boardList.jsp';</script>");
    } catch (Exception e) {
        e.printStackTrace();
        // 오류 발생 시, 에러 페이지 또는 오류 처리 로직 추가
    }
%>
