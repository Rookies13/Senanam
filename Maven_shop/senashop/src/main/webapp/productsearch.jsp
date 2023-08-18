<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
    String id = (String)session.getAttribute("user_id");
    String name = (String)session.getAttribute("user_name");
%>
<!--
	Binary by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>세나샵</title>
		<meta charset="utf-8" />
		<meta name="robots" content="noindex">
		<meta name="googlebot" content="noindex, nofollow">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
    

		<!-- Header -->
			<header id="header">
				<a href="index.jsp" class="logo"><strong>세 나</strong> shop</a>
				<nav>
					<a href="#menu">Menu</a>
				</nav>

			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="mypage.jsp">마이페이지</a></li>
                    <li><a href="productsearch.jsp">상품검색</a></li>
                    <li><a href="cart.jsp">장바구니</a></li>
                    <li><a href="boardList.jsp">게시판</a></li>
                    <li><a href="qna.jsp">Q&A</a></li>
                  </ul>
			</nav>

		

        <!--검색-->
        <section id="search">
        <div class="container">
        <form action="searchresult.jsp" method="get">
        <div class="row uniform 50%">
        <div class="4u 12u$(xsmall)">
            <input type="text" name="searchKeyword" placeholder="상품명을 입력하세요" size="20">
        </div>
        <div class="6u 12u$(xsmall)">
            <button type="submit" value="search">Search</button>
        </div>
        </form>
        </div>
        </div>
        </section>

        

      
            <%-- 검색 결과를 표시 --%>
       
    <%!
        public class Product {
            private String productName;
            private int price;
            private String description;
            private String image;
            private int productNumber;

            public Product(String productName, int price, String description, String image, int productNumber) {
                this.productName = productName;
                this.price = price;
                this.description = description;
                this.image = image;
                this. productNumber = productNumber;
            }

            public String getProductName() {
                return productName;
            }

            public int getPrice() {
                return price;
            }

            public String getDescription() {
                return description;
            }

            public String getImage() {
                return image;
            }

            public int getProductNumber() {
                return productNumber;
            }
        }
    %>

<%!
        private List<Product> getProducts() {
        List<Product> productList = new ArrayList<>();

        try {
            // Oracle 데이터베이스 연결 정보 설정
            String dbUrl = "jdbc:oracle:thin:@aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com:1521:orcl"; // 데이터베이스 URL
            String dbUsername = "admin"; // 데이터베이스 사용자명
            String dbPassword = "12345678"; // 데이터베이스 비밀번호

            // 데이터베이스 연결
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // SQL 쿼리 실행
            String sql = "SELECT * FROM PRODUCT";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            // 상품 데이터를 리스트에 추가
            while (rs.next()) {
                String productName = rs.getString("PRODUCT_NAME");
                int price = rs.getInt("PRODUCT_PRICE");
                String description = rs.getString("PRODUCT_TEXT");
                String image ="https://senanam.s3.ap-northeast-2.amazonaws.com/"+ rs.getString("PRODUCT_IMAGES");
                int productNumber = rs.getInt("PRODUCT_NUM");

                Product product = new Product(productName, price, description, image, productNumber);
                productList.add(product);
            }

            // 리소스 정리
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }
%>
            <div class="container">
                <table class="alt">
                    <thead>
                        <tr>
                            <th>image</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <% List<Product> productList = getProducts(); %>
                    <tbody>
                    <% for (int i = 0; i < productList.size(); i++) { %>
                        <tr>
                            <td>
                                <div style="text-align : center;">
					<a href ="image_connect.jsp?url=<%= productList.get(i).getImage() %>"><img src="<%= productList.get(i).getImage() %>" height="90"></a>
                                </div>
                            </td>
                            <td><%= productList.get(i).getProductName() %></td>
                            <td><p><%= productList.get(i).getDescription() %></p><a>무료배송</a></td>
                            <td><p class="formattedPrice"><%= productList.get(i).getPrice() %>원</p>
                            <button onclick="handleButtonClick2('<%= productList.get(i).getProductNumber() %>', '<%= productList.get(i).getPrice() %>')">장바구니</button>
                            <select id="myselect<%= i %>">
                                <option value="">개수선택</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

        <script>
            // JavaScript 함수 정의
            function handleButtonClick2(productNum, productPrice) {
                const index = event.target.parentNode.parentNode.rowIndex - 1; // 현재 버튼이 속한 행의 인덱스
                const productCount = document.getElementById("myselect" + index).value;
                const userId = "<%= id %>";

                if (userId == "null") {
                    alert("로그인 후 이용해주세요.");
                    window.location.href = 'login.jsp';
                } else if (productCount == "") {
                    alert("개수를 선택하세요!");
                    window.location.href = 'productsearch.jsp';
                } else {
                    window.location.href = 'cartProcess.jsp?productNum=' + productNum + '&productCount=' + productCount + '&productPrice=' + productPrice + '&userId=' + userId;
                }
            }
        </script>

        <script>
            function addCommasToPrice(price) {
                return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }

            // product.getPrice()의 반환값을 가공하여 표시
            const formattedPriceElements = document.querySelectorAll(".formattedPrice");
            formattedPriceElements.forEach(element => {
                const rawProductPrice = element.textContent;
                const formattedPrice = addCommasToPrice(rawProductPrice);
                element.textContent = formattedPrice;
            });
        </script>

           
    

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
