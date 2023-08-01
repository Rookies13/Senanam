<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</body>
</html>
