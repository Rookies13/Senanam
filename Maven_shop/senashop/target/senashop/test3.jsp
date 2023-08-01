<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Data Input Page</title>
</head>
<body>
    <h1>Insert Data Input Page</h1>
    
    <%-- 데이터 입력을 위한 폼 --%>
    <form action="cartProcess.jsp" method="post">
        <label for="productNum">Product Number:</label>
        <input type="text" name="productNum" id="productNum"><br>
        
        <label for="productCount">Product Count:</label>
        <input type="text" name="productCount" id="productCount"><br>
        
        <label for="productPrice">Product Price:</label>
        <input type="text" name="productPrice" id="productPrice"><br>
        
        <label for="userId">User ID:</label>
        <input type="text" name="userId" id="userId"><br>
        
        <input type="submit" value="Insert Data">
    </form>
    
    <p><a href="index.jsp">Go back to home page</a></p>
</body>
</html>
