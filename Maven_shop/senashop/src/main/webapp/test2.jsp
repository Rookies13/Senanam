<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>결제</title>
</head>
<body>
    <h1>결제</h1>
    <h3>상품</h3>
    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>주문번호</th>
                    <th>상품ID</th>
                    <th>상품수량</th>
                    <th>상품가격</th>
                </tr>
            </thead>
            <tbody>
                <%-- 이전 코드를 그대로 사용 --%>
                <%@ page import="java.sql.*" %>
                <%!
                    // 데이터베이스 접속 정보 설정
                    String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // 오라클 서버 주소와 포트번호
                    String dbUser = "system"; // 오라클 계정 사용자명
                    String dbPassword = "1234"; // 오라클 계정 비밀번호
                %>
                <% 
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        // 오라클 JDBC 드라이버 로딩
                        Class.forName("oracle.jdbc.driver.OracleDriver");

                        // 데이터베이스에 접속
                        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                        String orderNumberParam = request.getParameter("order_number");
                        String sqlQuery;
                        if (orderNumberParam != null && !orderNumberParam.isEmpty()) {
                            // 주문번호 파라미터가 있을 경우 해당 주문번호로 검색
                            sqlQuery = "SELECT * FROM order_product WHERE order_num = ?";
                            pstmt = conn.prepareStatement(sqlQuery);
                            pstmt.setString(1, orderNumberParam);
                        } else {
                            // 주문번호 파라미터가 없을 경우 모든 데이터 조회
                            sqlQuery = "SELECT * FROM order_product";
                            pstmt = conn.prepareStatement(sqlQuery);
                        }
                        rs = pstmt.executeQuery();

                        int totalPrice = 0; // 총 가격을 저장할 변수
                        // 결과 처리
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getString("order_num") + "</td>");
                            out.println("<td>" + rs.getString("PID") + "</td>");
                            out.println("<td>" + rs.getString("PROD_CNT") + "</td>");
                            out.println("<td>" + rs.getString("PROD_PRICE") + "</td>");
                            out.println("</tr>");
                            // 상품 수량과 가격을 곱해서 총 가격 계산
                            int prodCnt = rs.getInt("PROD_CNT");
                            int prodPrice = rs.getInt("PROD_PRICE");
                            totalPrice += prodCnt * prodPrice;
                        }
                        // 총 가격 출력
                        out.println("<tr>");
                        out.println("<td colspan='4' align='right'>총 가격: " + totalPrice + "원</td>");
                        out.println("</tr>");

                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // 리소스 해제
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <%-- 주문 정보를 전송하기 위한 폼 --%>
    <form action="addorderlist.jsp" method="post">
        <%-- 숨겨진 입력 필드로 총 가격과 주문번호 전송 --%>
        <input type="hidden" name="total_price" value="<%= totalPrice %>">
        <input type="hidden" name="order_number" value="<%= orderNumberParam %>">

        <h3>배송지</h3>
        <label for="zipcode">우편번호:</label>
        <input type="text" name="zipcode" required><br>
        <label for="address">배달지:</label>
        <input type="text" name="address" required><br>
        <input type="submit" value="결제">
    </form>
</body>
</html>
