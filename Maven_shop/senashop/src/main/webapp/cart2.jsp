<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	<h1>장바구니</h1>
    <p>사용자 이름: <%= userId %></p>
	
	<form action="delete_selected.jsp" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>상품번호</th>
					<th>수량</th>
					<th>날짜</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
				<%
				while (result.next()) {
					out.print("<tr>");
					out.print("<td>"+result.getString("CART_NUM")+"</td>");
					out.print("<td>"+result.getString("USER_ID")+"</td>");
					out.print("<td>"+result.getString("PROD_NUM")+"</td>");
					out.print("<td>"+result.getString("QUANTITY")+"</td>");
					out.print("<td>"+result.getString("INDATE")+"</td>");
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
</body>
</html>