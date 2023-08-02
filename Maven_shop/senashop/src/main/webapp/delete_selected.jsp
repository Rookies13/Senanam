<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // DB 연결 정보
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url="jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl";
    String id = "admin";
    String pw = "12345678";
    

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url, id, pw);

        // 선택된 항목들을 배열로 받아옴
        String[] selectedItems = request.getParameterValues("selectedItems");

        if (selectedItems != null && selectedItems.length > 0) {
            // 선택된 항목들 삭제 쿼리
            String deleteQuery = "DELETE FROM CART_PRODUCT WHERE CART_NUMBER IN (";
            for (int i = 0; i < selectedItems.length; i++) {
                deleteQuery += (i == 0 ? "?" : ", ?");
            }
            deleteQuery += ")";

            pstmt = con.prepareStatement(deleteQuery);

            // 선택된 항목들의 CART_NUM을 설정
            for (int i = 0; i < selectedItems.length; i++) {
                pstmt.setString(i + 1, selectedItems[i]);
            }

            // 쿼리 실행
            int deletedRows = pstmt.executeUpdate();

            out.println("<h3>" + deletedRows + "개의 항목이 삭제되었습니다.</h3>");
            out.print("<script>location.href='cart.jsp';</script>");
            
        } else {
            out.println("<h3>삭제할 항목을 선택해주세요.</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>