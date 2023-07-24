<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="SenaShop.SenaShop.src.SenaShop" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <h1>Login</h1>
    <form action="login.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" required>
        <br>
        <label for="password">Password:</label>
        <input type="password" name="password" required>
        <br>
        <input type="submit" value="Login">
    </form>

    <%-- Your Java code to handle login functionality --%>
    <% String username = request.getParameter("username");
       String password = request.getParameter("password");
       if (App.login(username, password)) {
           // Successful login
           out.println("<p>Welcome, " + username + "!</p>");
       } else {
           // Failed login
           out.println("<p>Invalid credentials. Please try again.</p>");
       }
    %>
</body>
</html>