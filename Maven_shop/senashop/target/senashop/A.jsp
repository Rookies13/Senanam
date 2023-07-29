<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>A.jsp</title>
</head>
<body>
    <h1>Readonly Input Form</h1>
    <form>
        <!-- 세션에서 userInputValue를 읽어와서 readonly로 설정합니다. -->
        <input type="text" name="userInput" value="<%= session.getAttribute("userInputValue") != null ? session.getAttribute("userInputValue") : "" %>" readonly>
        <input type="submit" value="Submit">
    </form>
</body>
</html>