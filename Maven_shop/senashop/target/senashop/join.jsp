<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
    <h2>회원가입</h2>
    <form action="register" method="post">
        <label for="username">ID:</label>
        <input type="text" id="username" name="username" required>
        <br>

        <label for="name">닉네임:</label>
        <input type="text" id="name" name="name" required></button><br>

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="confirmPassword">비밀번호 확인:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="mobile">전화번호:</label>
        <input type="tel" id="mobile" name="mobile" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" placeholder="000-0000-0000" required><br>

        <label for="zipcode">우편번호:</label>
        <input type="text" id="zipcode" name="zipcode" required><br>

        <label for="address1">기본주소:</label>
        <input type="text" id="address1" name="address1" required><br>

        <label for="address2">상세주소:</label>
        <input type="text" id="address2" name="address2" required><br>

        <input type="submit" value="가입하기">
    </form>
</body>
</html>