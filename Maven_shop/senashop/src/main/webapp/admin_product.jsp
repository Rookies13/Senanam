<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>SENASHOP 관리자 페이지 - 상품 목록</title>
</head>
<body>
    <h1>SENASHOP 관리자 페이지 - 상품 목록</h1>

    <%-- 상품 추가 처리 시작 --%>
    <% String filename=null;
    if (request.getMethod().equals("POST")) {
        String directory = getServletContext().getRealPath("/") + "upload";	//파일 업로드 위치 : C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/webapp/upload

        int sizeLimit = 100*1024*1024;		//100MB 제한
        
        MultipartRequest multi = new MultipartRequest(request, directory, sizeLimit,"UTF-8",new DefaultFileRenamePolicy() );
        request.setCharacterEncoding("utf-8");

        String PRODUCT_NAME = multi.getParameter("PRODUCT_NAME");
        int PRODUCT_PRICE = Integer.parseInt(multi.getParameter("PRODUCT_PRICE"));
        String PRODUCT_TEXT = multi.getParameter("PRODUCT_TEXT");
        

        // 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521/orcl";
        String dbUser = "admin";
        String dbPassword = "12345678";

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Enumeration<?> files = multi.getFileNames();

			if (files.hasMoreElements()) { // 첨부파일이 있다면
				String element = (String)files.nextElement(); // file을 반환
				filename=multi.getFilesystemName(element);
			}
            

            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스 연결
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL 쿼리 실행 (상품 추가)
            String sqlQuery = "INSERT INTO product (PRODUCT_NUM, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_TEXT, PRODUCT_IMAGES) VALUES (PRODUCT_NUM.nextval, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sqlQuery);
            pstmt.setString(1, PRODUCT_NAME);
            pstmt.setInt(2, PRODUCT_PRICE);
            pstmt.setString(3, PRODUCT_TEXT);
            pstmt.setString(4, filename);
            pstmt.executeUpdate();

            // 상품 추가 성공 메시지 출력
            out.println("<p style=\"color: green;\">상품이 성공적으로 추가되었습니다.</p>");
            if (filename != null) {
                response.sendRedirect("s3upload_admin?filename=" + filename);
            }
        } catch (Exception e) {
            // 상품 추가 실패 메시지 출력
            e.printStackTrace();
            out.println("<p style=\"color: red;\">상품 추가에 실패하였습니다.</p>");
        } finally {
            // 연결 및 리소스 해제
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { }
            try { if (conn != null) conn.close(); } catch (Exception e) { }
        }
    } %>
    <%-- 상품 추가 처리 끝 --%>

    <%-- 상품 목록 조회 시작 --%>
    <%
    // 데이터베이스 연결 정보 설정
        String dbURL = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521/orcl";
        String dbUser = "admin";
        String dbPassword = "12345678";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL 쿼리 실행 (상품 목록 조회)
        String sqlQuery = "SELECT * FROM product";
        pstmt = conn.prepareStatement(sqlQuery);
        rs = pstmt.executeQuery();

        // 상품 목록 테이블 출력
    %>
    <table border="1">
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>이미지</th>
        </tr>

        <% 
        while(rs.next()){
            String product_images= "https://senanam.s3.ap-northeast-2.amazonaws.com/"+ rs.getString("PRODUCT_IMAGES");
            out.println("<tr>");
            out.println("<td>" + rs.getString("PRODUCT_NAME") + "</td>");
            out.println("<td>" + rs.getInt("PRODUCT_PRICE") + "</td>");
            out.println("<td><img src='"+product_images+"' style='width: 150px; height: 150px;'></td>");
            out.println("</td>");
        }
        %>
    </table>
    <% } catch (Exception e) {
        // 상품 목록 조회 실패 시, 오류 메시지 출력
        e.printStackTrace();
        out.println("<p style=\"color: red;\">상품 목록 조회에 실패하였습니다.</p>");
    } finally {
        // 연결 및 리소스 해제
        try { if (rs != null) rs.close(); } catch (Exception e) { }
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { }
        try { if (conn != null) conn.close(); } catch (Exception e) { }
    }
    %>
    <%-- 상품 목록 조회 끝 --%>

    <h2>상품 추가</h2>
    <form action="" method="post" enctype="multipart/form-data">
        <label for="PRODUCT_NAME">상품명:</label>
        <input type="text" id="PRODUCT_NAME" name="PRODUCT_NAME" required><br>
        <label for="PRODUCT_PRICE">가격:</label>
        <input type="number" id="PRODUCT_PRICE" name="PRODUCT_PRICE" required><br>
        <label for="PRODUCT_IMAGES">이미지 URL:</label>
        <input type="file" id="file" name="file" required><br>
        <label for="PRODUCT_TEXT">설명:</label>
        <input type="text" id="text" name="PRODUCT_TEXT"><br>
        <input type="submit" value="추가">
    </form>
</body>
</html>