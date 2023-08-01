<<<<<<< HEAD
<!DOCTYPE HTML>
<!--
	Binary by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Generic - Binary by TEMPLATED</title>
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<!--
    Binary by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>세나샵</title>
>>>>>>> eb748b51bd8da2e1c21e2163e798f7e7a120ff52
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>

<<<<<<< HEAD
<!-- Header -->
<header id="header">
    <a href="index.html" class="logo"><strong>Binary</strong> by TEMPLATED</a>
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
    </ul>
</nav>

<section id="main">
    <div class="inner">
        <div class="image fit">
            <img src="images/pic11.jpg" alt="">
        </div>
        <header>
            <h1>Lorem ipsum dolor sit amet</h1>
            <p class="info">3 days ago by <a href="#">Jane Doe</a></p>
        </header>
        <p>Nullam posuere erat vel placerat rutrum. Praesent ac consectetur dui, et congue quam. Donec aliquam lacinia condimentum. Integer porta massa sapien, commodo sodales diam suscipit vitae. Aliquam quis felis sed urna semper semper. Phasellus eu scelerisque mi. Vivamus aliquam nisl libero, sit amet scelerisque ligula laoreet vel. Nunc ullamcorper ipsum at diam congue luctus. Sed nec sapien blandit, tempor quam non, consectetur turpis. Morbi libero lorem, hendrerit sed metus non, malesuada placerat nulla. Sed nisi turpis, rutrum eget rutrum euismod, consequat ullamcorper eros. Quisque tortor nunc, sodales convallis nisl non, bibendum tincidunt tortor. Etiam pellentesque tincidunt nunc, a dignissim dolor tempus et. Pellentesque in urna ligula. Fusce ligula velit, mollis ac diam non, rutrum fringilla turpis.</p>
        <p>Aliquam consequat, nulla sed sodales convallis, sem odio porttitor justo, non volutpat augue libero eget neque. Nunc consequat arcu nec tortor venenatis tempus a placerat mauris. Nam ultricies consequat ligula, et placerat arcu ultrices a. Sed placerat ipsum lacus, at imperdiet nisi imperdiet at. Vivamus diam dui, accumsan quis lacinia ac, sollicitudin feugiat metus. Vestibulum a velit ac eros blandit molestie non eget erat. Nunc eget odio erat. Nulla sit amet enim pharetra tortor molestie tempor nec sed turpis. Cras eget odio at erat dictum tincidunt. Sed facilisis convallis mi, eget tempor nunc pellentesque pulvinar. Etiam volutpat luctus tristique.</p>
        <p>Aliquam erat eros, pretium non facilisis id, mollis a lacus. Nam nunc nisl, consequat at est vel, ornare feugiat tortor. Phasellus tempor ex vel mi blandit convallis. Sed accumsan sapien quis bibendum posuere. Vivamus convallis mattis ipsum. Suspendisse viverra purus non mi cursus, vitae pulvinar dui condimentum. Donec dui lacus, pretium in neque vitae, laoreet tempus nulla. Maecenas ac augue bibendum, consectetur ante eu, vulputate ipsum.</p>
        <p>Nullam volutpat, sem at hendrerit volutpat, magna orci facilisis purus, et venenatis sapien sapien pretium libero. Duis hendrerit eget metus at molestie. Duis leo lorem, interdum a placerat ut, ullamcorper at eros. Donec convallis auctor cursus. Integer placerat felis mauris, sed cursus diam sodales et. Phasellus mi nibh, scelerisque vulputate viverra ut, dictum vitae mi. In at blandit felis. Aenean id porttitor neque. Nam bibendum a orci non pretium. Pellentesque feugiat erat augue, quis venenatis diam mollis eu.</p>
    </div>
</section>
<!-- Footer -->
<footer id="footer">
    <ul class="icons">
        <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
        <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
        <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
    </ul>
</footer>

<div class="copyright">
    Made with: <a href="https://templated.co/">Templated.co</a>
</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

</body>
</html>
=======
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
        </ul>
    </nav>

    <!-- 기능구현 -->
    <section>
        <div style="padding: 80px;">
            <h1>결제</h1>
           

            <h3>상품</h3>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>주문번호</th>
                            <th>상품ID</th>
                            <th>상품수량</th>
                            <th>상품가격</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%@ page import="java.sql.*" %>
                        <%!
                            // 데이터베이스 접속 정보 설정
                            String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // 오라클 서버 주소와 포트번호
                            String dbUser = "system"; // 오라클 계정 사용자명
                            String dbPassword = "1234"; // 오라클 계정 비밀번호
                            String odn;
                            int tp;
                        %>
                        <% 
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;

                            try {
                                // 오라클 JDBC 드라이버 로딩
                                Class.forName("oracle.jdbc.driver.OracleDriver");

                                // 데이터베이스에 접속
                                conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                                String orderNumberParam = request.getParameter("order_number");
                                String sqlQuery;
                                if (orderNumberParam != null && !orderNumberParam.isEmpty()) {
                                    // 주문번호 파라미터가 있을 경우 해당 주문번호로 검색
                                    odn = orderNumberParam;
                                    sqlQuery = "SELECT * FROM order_product WHERE order_num = ?";
                                    pstmt = conn.prepareStatement(sqlQuery);
                                    pstmt.setString(1, orderNumberParam);
                                } else {
                                    // 주문번호 파라미터가 없을 경우 모든 데이터 조회
                                    sqlQuery = "SELECT * FROM order_product";
                                    pstmt = conn.prepareStatement(sqlQuery);
                                }
                                rs = pstmt.executeQuery();

                                int totalPrice = 0; // 총 가격을 저장할 변수
                                // 결과 처리
                                while (rs.next()) {
                                    out.println("<tr>");
                                    out.println("<td>" + rs.getString("order_num") + "</td>");
                                    out.println("<td>" + rs.getString("PID") + "</td>");
                                    out.println("<td>" + rs.getString("PROD_CNT") + "</td>");
                                    out.println("<td>" + rs.getString("PROD_PRICE") + "</td>");
                                    out.println("</tr>");
                                    // 상품 수량과 가격을 곱해서 총 가격 계산
                                    int prodCnt = rs.getInt("PROD_CNT");
                                    int prodPrice = rs.getInt("PROD_PRICE");
                                    totalPrice += prodCnt * prodPrice;
                                }
                                // 총 가격 출력
                                out.println("<tr>");
                                out.println("<td colspan='4' align='right'>총 가격: " + totalPrice + "원</td>");
                                out.println("</tr>");
                                tp = totalPrice;

                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                // 리소스 해제
                                try {
                                    if (rs != null) rs.close();
                                    if (pstmt != null) pstmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            
                        %>
                    </tbody>
                </table>
            </div>




            <h3>배송지</h3>
            <form action="addorderlist.jsp" method="get">
                
            <input type="hidden" name="total_price" value="<%=tp%>">
            <input type="hidden" name="order_number" value="<%=odn%>">
                우편번호<input type="text" name="zipcode"><br/>
                배달지<input type="text" name="address"><br/>
                <div align="right">
                    <input type="submit" value="결제">
                </div>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <div class="copyright">
            Made with team 세나남</a>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
   
>>>>>>> eb748b51bd8da2e1c21e2163e798f7e7a120ff52
