<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // DB 연결 정보
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String id = "C##junho";
    String pw = "1234";

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url, id, pw);

        String selectedItemsStr = request.getParameter("selectedItems");

        if (selectedItemsStr != null && !selectedItemsStr.isEmpty()) {
            // 선택한 항목들을 배열로 변환
            String[] selectedItems = selectedItemsStr.split(",");

            // 선택한 항목들을 구매 처리하는 로직을 여기에 구현합니다.
            // 구매 처리를 위한 쿼리문이나 프로시저를 작성하고 실행합니다.
            // 예를 들어, CART 테이블의 해당 항목들을 다른 테이블로 이동시키거나 구매 완료로 상태를 변경하는 등의 작업을 수행할 수 있습니다.

            // 아래는 예시로 선택한 항목들의 CART_NUM을 출력하는 부분을 보여줍니다.
            for (String cartNum : selectedItems) {
                out.println("구매 처리된 항목 번호: " + cartNum);
            }
        } else {
            out.println("<h3>구매할 항목을 선택해주세요.</h3>");
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