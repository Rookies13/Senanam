<!DOCTYPE html>
<html>
<head>
    <title>Test Page</title>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>This is a test page using JSP.</p>
    <%-- JSP 태그를 사용하여 Java 코드를 삽입합니다. --%>
    <% 
        // Java 코드로 현재 시간을 구하고 출력합니다.
        java.util.Date currentDate = new java.util.Date();
    %>
    <p>Current Date: <%= currentDate %></p>
</body>
</html>
