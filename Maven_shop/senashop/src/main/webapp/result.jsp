<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Result</title>
</head>
<body>
    <%-- 입력 받은 숫자를 ","로 분리하여 리스트로 변환 --%>
    <% 
    String numbers = request.getParameter("CART_NUM");
    List<Integer> list = new ArrayList<>();

    if (numbers != null && !numbers.isEmpty()) {
        String[] elements = numbers.split(",");

        for (String element : elements) {
            try {
                int value = Integer.parseInt(element.trim());
                list.add(value);
            } catch (NumberFormatException e) {
                // 숫자로 변환할 수 없는 경우는 무시하거나 예외 처리할 수 있습니다.
            }
        }
    }
    %>

    <%-- 리스트 출력 --%>
    <h2>입력한 숫자들을 리스트로 변환한 결과:</h2>
    <ul>
        <% for (Integer value : list) { %>
            <li><%= value %></li>
        <% } %>
    </ul>
=======
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Result</title>
</head>
<body>
    <%-- 입력받은 CART_NUM들을 ","로 분리하여 리스트로 저장 --%>
    <%
    String cartNums = request.getParameter("cartNums");
    String[] cartNumArray = cartNums.split(",");
    List<String> cartNumList = new ArrayList<>();
    for (String cartNum : cartNumArray) {
        cartNumList.add(cartNum.trim());
    }
    %>

    <%-- 데이터베이스 연동하여 검색 결과를 ORDER_PRODUCT 테이블에 삽입 --%>
    <h2>검색 결과:</h2>
    <%
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "system";
    String dbPassword = "1234";

    Connection connection = null;
    PreparedStatement selectStatement = null;
    PreparedStatement insertStatement = null;
    ResultSet resultSet = null;
    
    // 현재 시간 정보를 포함한 문자열 생성
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMddHHmmssSSS");
    String timestamp = now.format(formatter);

    // 고유 번호를 위해 유니크한 식별자 (예: 사용자 아이디, 주문번호 등)와 결합하여 생성
    String uniqueId = timestamp;
    try {
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        connection.setAutoCommit(false); // 트랜잭션 시작

        // CART_NUM 리스트를 이용하여 CART 테이블에서 데이터를 검색
        String selectSql = "SELECT PRODUCT_NUM, PRODUCT_COUNT, PRODUCT_PRICE, USER_ID " +
                           "FROM cart WHERE CART_NUM IN (" + String.join(", ", cartNumList) + ")";
        selectStatement = connection.prepareStatement(selectSql);
        resultSet = selectStatement.executeQuery();

        // ORDER_PRODUCT 테이블에 검색 결과를 삽입
        String insertSql = "INSERT INTO ORDER_PRODUCT (ORDER_NUM, PID, PROD_CNT, PROD_PRICE) " +
                           "VALUES (?, ?, ?, ?)";
        insertStatement = connection.prepareStatement(insertSql);

        while (resultSet.next()) {
            String productNum = resultSet.getString("PRODUCT_NUM");
            int productCount = resultSet.getInt("PRODUCT_COUNT");
            int productPrice = resultSet.getInt("PRODUCT_PRICE");
           
           
            String newOrderNumber = uniqueId;
            out.println(productNum);
            insertStatement.setString(1, newOrderNumber);
            insertStatement.setString(2, productNum);
            insertStatement.setInt(3, productCount);
            insertStatement.setInt(4, productPrice);
            insertStatement.executeUpdate();
        }
        connection.commit(); // 트랜잭션 커밋
        out.println("데이터가 성공적으로 ORDER_PRODUCT 테이블에 삽입되었습니다.");
    } catch (Exception e) {
        e.printStackTrace();
        connection.rollback(); // 트랜잭션 롤백
        out.println("데이터베이스 연결 또는 쿼리 실행 중 오류가 발생하였습니다.");
    } finally {
        // 리소스 해제
        try { if (resultSet != null) resultSet.close(); } catch (Exception e) { }
        try { if (selectStatement != null) selectStatement.close(); } catch (Exception e) { }
        try { if (insertStatement != null) insertStatement.close(); } catch (Exception e) { }
        try { if (connection != null) connection.close(); } catch (Exception e) { }
    }
    %>
>>>>>>> eb748b51bd8da2e1c21e2163e798f7e7a120ff52
</body>
</html>
