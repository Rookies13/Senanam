<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>주문 요청 조회</title>
</head>
<body>
    <h1>주문 요청 조회</h1>
    <table border="1">
        <tr>
            <th>주문 번호</th>
            <th>총 가격</th>
            <th>주문자</th>
            <th>요청 현황</th>
            <th>변경</th>
        </tr>
        <%
            try {
                // 데이터베이스 연결 설정
                String dbURL = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521/orcl";
                String dbUser = "admin";
                String dbPassword = "12345678";

                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;

                // 데이터베이스 연결 시도
                try {
                    connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                } catch (Exception ex) {
                    out.println("데이터베이스 연결 실패: " + ex.getMessage());
                }

                if (connection != null) {
                    // 쿼리 실행
                    String query = "SELECT * FROM ORDER_TABLE";
                    statement = connection.prepareStatement(query);
                    resultSet = statement.executeQuery();

                    // 데이터 출력
                    while (resultSet.next()) {
                        long orderNumber = resultSet.getLong("order_number");
                        int totalPrice = resultSet.getInt("total_price");
                        String id = resultSet.getString("id");
                        int orderCheck = resultSet.getInt("order_check");

                        // 요청 현황 텍스트 결정
                        String orderStatus = (orderCheck == 0) ? "배송 요청" : "배송중";

                        // 데이터를 테이블에 출력
                        out.println("<tr>");
                        out.println("<td>" + orderNumber + "</td>");
                        out.println("<td>" + totalPrice + "</td>");
                        out.println("<td>" + id + "</td>");
                        out.println("<td>" + orderStatus + "</td>");
                        // 버튼을 클릭하면 order_check 값을 변경하고 페이지를 다시 로드
                        if (orderCheck == 0) {
                            out.println("<td><button onclick=\"location.href='?orderNumber=" + orderNumber + "&newStatus=1'\">배송중</button></td>");
                        } else {
                            out.println("<td></td>");
                        }
                        out.println("</tr>");
                    }

                    // 자원 해제
                    resultSet.close();
                    statement.close();
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            // 배송 상태 변경 처리
            String orderNumberParam = request.getParameter("orderNumber");
            String newStatusParam = request.getParameter("newStatus");
            if (orderNumberParam != null && newStatusParam != null) {
                try {
                    long orderNumber = Long.parseLong(orderNumberParam);
                    int newStatus = Integer.parseInt(newStatusParam);

                    // 데이터베이스 연결 설정
                    String dbURL = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521/orcl";
                    String dbUser = "admin";
                    String dbPassword = "12345678";

                    Connection connection = null;
                    PreparedStatement updateStatement = null;

                    // 데이터베이스 연결 시도
                    try {
                        connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                    } catch (Exception ex) {
                        out.println("데이터베이스 연결 실패: " + ex.getMessage());
                    }

                    if (connection != null) {
                        // 주문 상태 업데이트
                        String updateQuery = "UPDATE ORDER_TABLE SET order_check = ? WHERE order_number = ?";
                        updateStatement = connection.prepareStatement(updateQuery);
                        updateStatement.setInt(1, newStatus);
                        updateStatement.setLong(2, orderNumber);
                        updateStatement.executeUpdate();

                        // 자원 해제
                        updateStatement.close();
                        connection.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
</body>
</html>
