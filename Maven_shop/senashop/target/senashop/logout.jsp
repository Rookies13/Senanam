<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인증정보(세션삭제)
	//리다이렉트
	
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
    <script>
        alert("로그아웃.");
        location.href="index.jsp";
    </script>
	

</body>
</html>