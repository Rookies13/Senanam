<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
    
	<h1>쇼핑몰 관리자 페이지</h1>
	

	<ul>
		<li><a href="admin_product.jsp">상품 관리</a></li>
		<li><a href="admin_order.jsp">주문 처리</a></li>
		<li><a href="admin_member.jsp">회원 관리</a></li>
		<li><a href="admin_qna.jsp">문의 관리</a></li>
		<li><a href="admin_point.jsp">포인트 관리</a></li>
	</ul>
	

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>