<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*"%>
<!--
	Binary by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>세나샵</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<a href="index.html" class="logo"><strong>세 나</strong> shop</a>
				<nav>
					<a href="#menu">Menu</a>
				</nav>

			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<li><a href="generic.html">Generic</a></li>
					<li><a href="elements.html">Elements</a></li>
					<li><a href="productsearch.jsp">Search</a></li>
				</ul>
			</nav>

		

        <!--기능구현-->
        <section id="search">
        <div class="container">
        <form action="productsearch.jsp" method="get">
            <input type="text" name="searchKeyword" placeholder="상품명을 입력하세요">
            <button type="submit" value="search">Search</button>
        </form>
        </div>
        </section>

        

      
            <%-- 검색 결과를 표시 --%>
        <%
            String searchKeyword = request.getParameter("searchKeyword");
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                try {
                    // 데이터베이스 연결 정보 설정
                    String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // 데이터베이스 URL
                    String dbUsername = "c##test"; // 데이터베이스 사용자명
                    String dbPassword = "love2468"; // 데이터베이스 비밀번호

                    // 데이터베이스 연결
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

                    // SQL 쿼리 실행
                    String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_NAME LIKE '%" + searchKeyword + "%'";
                    Statement stmt = conn.createStatement();
                    //stmt.setString(1, "%" + searchKeyword + "%");
                    ResultSet rs = stmt.executeQuery(sql);

                    // 검색 결과를 리스트로 만듦
                    while (rs.next()) {
                        String productName = rs.getString("PRODUCT_NAME");
                        String productIamges = rs.getString("PRODUCT_IMAGES");
                        String productText = rs.getString("PRODUCT_TEXT");
                        int productPrice = rs.getInt("PRODUCT_PRICE");
        %>
    <div class="container">
    <table>
                    <tr>
                        <td>
                            <img src="<%= productIamges %>" alt="상품이미지" width=200 height=200>
                        </td>
                        <td>
                            <h3>상품명</h3>
                            <p><%= productName %></p>
                            <h3>상품명</h3>
                            <p><%= productText %></p>
                        </td>
                        <td>
                            <ul>
                                <h3>상품가격</h3>
                                <p><%= productPrice %></p>
                                <li>무료배송</li>
                            </ul>
                        </td>
                        <td>

                             <button onclick="handleButtonClick()">장바구니</button>

                            <script>
                                // JavaScript 함수를 정의합니다.
                                function handleButtonClick() {
                                    // 전달할 파라미터 값을 변수에 저장합니다.
                                    const param1 = "<%= productName %>";
                                    const param2 = "<%= productPrice %>";
                                    const param3 = "<%= productText %>";

                                    // 파라미터 값을 URL에 추가하여 다른 JSP 파일로 리다이렉트
                                    window.location.href = 'cart.jsp?param1=' + param1 + '&param2=' + param2 + '&param3=' + param3;
                                }
                            </script>
                        </td>
                    </tr>
                </table>
      </div>
                        
        <%
                    }

                    // 리소스 정리
                    rs.close();
                    stmt.close();
                    conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
        %>
                <div class="container">
                 <table>
                    <tr>
                        <td>
                            <img src="images/ball.jpg" alt="상품이미지" width=200 height=200>
                        </td>
                        <td>
                            <h3>상품명</h3>
                            <p>ㅁㅁ</p>
                            <h3>상품명</h3>
                            <p>ㅁㅁ</p>
                        </td>
                        <td>
                            <ul>
                                <h3>상품가격</h3>
                                <p>ㅁㅁ</p>
                                <li>무료배송</li>
                            </ul>
                        </td>
                    </tr>
                 </table>
                </div>
                <div class="container">
                 <table>
                    <tr>
                        <td>
                            <img src="images/ball.jpg" alt="상품이미지" width=200 height=200>
                        </td>
                        <td>
                            <h3>상품명</h3>
                            <p>ㅁㅁ</p>
                            <h3>상품명</h3>
                            <p>ㅁㅁ</p>
                        </td>
                        <td>
                            <ul>
                                <h3>상품가격</h3>
                                <p>ㅁㅁ</p>
                                <li>무료배송</li>
                            </ul>
                        </td>
                    </tr>
                 </table>
                </div>
                <div class="container">
                 <table>
                    <tr>
                        <td>
                            <img src="images/ball.jpg" alt="상품이미지" width=200 height=200>
                        </td>
                        <td>
                            <h3>상품명</h3>
                            <p>ㅁㅁ</p>
                            <h3>상품명</h3>
                            <p>ㅁㅁ</p>
                        </td>
                        <td>
                            <ul>
                                <h3>상품가격</h3>
                                <p>ㅁㅁ</p>
                                <li>무료배송</li>
                            </ul>
                        </td>
                    </tr>
                 </table>
                </div>
                <div class="container">
                 <table>
                    <tr>
                        <td>
                            <img src="images/ball.jpg" alt="상품이미지" width=200 height=200>
                        </td>
                        <td>
                            <h3>상품명</h3>
                            <p>ㅁㅁ</p>
                            <h3>상품명</h3>
                            <p>ㅁㅁ</p>
                        </td>
                        <td>
                            <ul>
                                <h3>상품가격</h3>
                                <p>ㅁㅁ</p>
                                <li>무료배송</li>
                            </ul>
                        </td>
                    </tr>
                 </table>
                </div>
        <%
                }
        %>
    

   
        <!-- Footer -->
			<footer id="footer">
			<div class="copyright">
			<a>Made with team 세나남</a>
            </div>
		    </footer>
    	

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	</body>
</html>