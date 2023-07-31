<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
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
    <style>
        /* 체크박스 스타일 */
        input[type="checkbox"] {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 2px solid #ccc;
            border-radius: 4px;
            vertical-align: middle;
            cursor: pointer;
            margin-right: 5px; /* 체크박스 사이 여백 조절 */
        }

        /* 체크된 상태의 체크박스 스타일 */
        input[type="checkbox"]:checked {
            background-color: #007bff;
            border-color: #007bff;
        }
    </style>
    <%
    String driver="oracle.jdbc.driver.OracleDriver";
    String url="jdbc:oracle:thin:@localhost:1521:xe";
    String id = "C##junho";
    String pw = "1234";
    
    Connection con = null;
    Statement stmt = null;
    ResultSet result = null;
    
    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url, id, pw);
        stmt = con.createStatement();

        String userId = request.getParameter("USER_ID");

        if (userId != null && !userId.isEmpty()) {
            // 사용자 이름이 전달되었을 경우에만 데이터 조회 및 표시
            String sql = "SELECT * FROM CART WHERE USER_ID = '" + userId + "'";
            result = stmt.executeQuery(sql);

        
    %>

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
				</ul>
			</nav>
<!--기능구현-->
    <h1>장바구니</h1>
    <p>사용자 이름: <%= userId %></p>
<div style="padding: 60px";>
    <form action="delete_selected.jsp" method="post">
        <table border="1" style="table-layout: fixed; width: 100%;">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>작성자</th>
                    <th>상품번호</th>
                    <th>수량</th>
                    <th>가격</th>
                    <th>선택</th>
                </tr>
            </thead>
            <tbody>
                <%
                while (result.next()) {
                  out.print("<tr>");
                  out.print("<td>"+result.getString("CART_NUM")+"</td>");
                  out.print("<td>"+result.getString("USER_ID")+"</td>");
                  out.print("<td>"+result.getString("PRODUCT_NUM")+"</td>");
                  out.print("<td>"+result.getString("PRODUCT_COUNT")+"</td>");
                  out.print("<td>"+result.getString("PRODUCT_PRICE")+"</td>");
                  out.print("<td><input type=\"checkbox\" name=\"selectedItems\" value=\"" + result.getString("CART_NUM") + "\"></td>");
                  out.print("</tr>");
                }
                %>
              </tbody>
        </table>


        <input type="submit" value="선택한 항목 삭제">
    </form>

    <form action="purchase.jsp" method="post">
        <!-- 선택한 항목들의 번호를 저장하는 숨은 필드(hidden input) -->
        <input type="hidden" name="selectedItems" id="selectedItems" value="">
        <input type="button" value="구매하기" onclick="purchaseItems()">
    </form>

    <!-- 구매 및 삭제 처리를 위한 JavaScript 코드 -->
    <script>
        function purchaseItems() {
            var checkboxes = document.getElementsByName("selectedItems");
            var selectedItems = [];

            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    selectedItems.push(checkboxes[i].value);
                }
            }

            // 숨은 필드에 선택한 항목들의 번호를 설정합니다.
            document.getElementById("selectedItems").value = selectedItems.join(",");
            // 폼을 submit하여 purchase.jsp로 데이터를 전송합니다.
            document.forms[1].submit();
        }
    </script>

    </div>

    <%	

        } else {
            // 사용자 이름이 전달되지 않은 경우에는 입력 폼 표시

            }	


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }

    %>

		<!-- Footer -->
			<footer id="footer">
			<div class="copyright">
			Made with team 세나남</a>
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