<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<html>
<head>
<meta charset="UTF-8">
<title>Product Management</title>
    <link rel="stylesheet" href="../assets/css/main.css" />
</head>

<body>
    <div class="container">
        <h2>상품 목록</h2>
        <table>
            <tr>
                <th>상품명</th>
                <th>가격</th>
                <th>재고</th>
            </tr>
            <tr>
                <td>상품 A</td>
                <td>10000</td>
                <td>50</td>
            </tr>
            <!-- 상품 데이터를 반복문으로 표시 -->
        </table>
        <form>
            <h2>새 상품 추가</h2>
            <label for="productName">상품명:</label>
            <input type="text" id="productName" name="productName" required><br>
            <label for="productPrice">가격:</label>
            <input type="number" id="productPrice" name="productPrice" required><br>
            <label for="productStock">재고:</label>
            <input type="number" id="productStock" name="productStock" required><br>
            <input type="submit" value="추가" class="btn">
        </form>
    </div>


</body>

</html>