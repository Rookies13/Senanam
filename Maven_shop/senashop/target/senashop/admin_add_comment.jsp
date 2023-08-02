<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement" %>
<%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>쇼핑몰 관리자 페이지 - 댓글 작성</title>
</head>
<body>
    <% request.setCharacterEncoding("utf-8"); %>
    <h1>쇼핑몰 관리자 페이지 - 댓글 작성</h1>
    
    <%-- 댓글 작성 폼 시작 --%>
    <form action="admin_add_comment.jsp" method="post" accept-charset="UTF-8">
        <input type="hidden" name="BOARD_NUMBER" value="<%= request.getParameter("BOARD_NUMBER") %>">
        <label for="REPLY">댓글:</label>
        <textarea id="REPLY" name="REPLY" rows="4" cols="50" required></textarea><br>
        <input type="submit" value="작성">
    </form>
    <%-- 댓글 작성 폼 끝 --%>

    <%-- 댓글 추가 처리 시작 --%>
    <%
    // 댓글 추가 처리
    if (request.getMethod().equals("POST")) {
        // 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521/orcl";
        String dbUser = "admin";
        String dbPassword = "12345678";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스 연결
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // 전달받은 댓글 정보 가져오기
            //response.setCharacterEncoding("UTF-8");
            int boardNumber = Integer.parseInt(request.getParameter("BOARD_NUMBER"));
            String reply = request.getParameter("REPLY");

            // SQL 쿼리 실행 (댓글 추가)
            String sqlQuery = "UPDATE board SET REPLY = ? WHERE BOARD_NUMBER = ?";
            pstmt = conn.prepareStatement(sqlQuery);
            pstmt.setString(1, reply);
            pstmt.setInt(2, boardNumber);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // 댓글 추가 성공 메시지 출력
                out.println("dfsdf");
                out.println("<p>" + reply + "</p>");
                out.println("<p style=\"color: green;\">댓글이 성공적으로 추가되었습니다.</p>");
            } else {
                // 댓글 추가 실패 메시지 출력
                out.println("<p style=\"color: red;\">댓글 추가에 실패하였습니다.</p>");
            }
        } catch (Exception e) {
            // 댓글 추가 실패 메시지 출력
            out.println("<p style=\"color: red;\">댓글 추가에 실패하였습니다.</p>");
            e.printStackTrace();
        } finally {
            // 연결 및 리소스 해제
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { }
            try { if (conn != null) conn.close(); } catch (Exception e) { }
        }
    }
    %>
    <%-- 댓글 추가 처리 끝 --%>

</body>
</html>