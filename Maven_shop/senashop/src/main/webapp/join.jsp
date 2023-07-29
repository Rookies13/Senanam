<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
    <h2>회원가입</h2>
    <form action="register" method="post">
        <label for="username">ID:</label>
        <input type="text" id="username" name="username" placeholder="원하시는 아이디를 입력해주세요" required>
        <br>

        <label for="name">닉네임:</label>
        <input type="text" id="name" name="name" placeholder="원하시는 닉네임을 입력해주세요" required></button><br>

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" placeholder="최소 8자리 이상으로 영문자와 숫자를 포함해주세요" required><br>

        <label for="confirmPassword">비밀번호 확인:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="입력한 비밀번호를 다시 입력해주세요" required><br>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" placeholder="연락받으실 수 있는 이메일 주소를 입력해주세요" required><br>

        <label for="mobile">전화번호:</label>
        <input type="text" id="mobile" name="mobile" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" placeholder="연락받으실 수 있는 전화번호를 입력해주세요 (예:000-0000-0000)" required><br>

        <label for="zipcode">우편번호:</label>
        <input type="text" id="zipcode" name="zipcode" placeholder="우편번호를 입력해주세요" required><br>

        <label for="address1">기본주소:</label>
        <input type="text" id="address1" name="address1" placeholder="시/구/동 또는 도로명을 입력해주세요 (예:대구시 달서구 진천로 77 계룡리슈빌 아파트)" required><br>

        <label for="address2">상세주소:</label>
        <input type="text" id="address2" name="address2" placeholder="상세 주소를 입력해주세요 (예: 100동 1000호)" required><br>

        <input type="submit" value="가입하기">

        <input type="hidden" id="user_level" name="user_level" value="0"><br>

        <input type="hidden" id="termCheck" name="termCheck" value="<%= session.getAttribute("termCheck") != null ? session.getAttribute("termCheck") : "F" %>"><br>
    </form>
</body>
</html>