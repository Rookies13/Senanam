<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="db.QueryDAO" %>
<jsp:useBean id="db" class="db.QueryDAO" scope="page" />
<%@ page import="db.QueryDAO" %>
<%@ page import="db.model.Orders" %>
<%@ page import="db.model.Board" %>
<%@ page import="db.model.Members" %>

<%@page import="java.sql.Connection"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
    
    //SelectDAO selectDAO = new SelectDAO();
    QueryDAO queryDAO = new QueryDAO();

    // Call the DAO method to fetch the data
    String table1 = "MEMBER";
    String table2 = "board";
    String table3 = "ORDERS";
    //회원 조회 
    String pkey = id;
    
    //List<Map<String, Object>> infoData = queryDAO.fetchAllData(table1, pkey);
    List<Members> member = queryDAO.selectUser(pkey);

    //게시글 조회 
    List<Board> boardList_h = queryDAO.selectBoardByUser(pkey, "h");
    List<Board> boardList_q = queryDAO.selectBoardByUser(pkey, "q");
    int tupleCount_h = boardList_h.size();
    int tupleCount_q = boardList_q.size();

    //주문 조회
    List<Orders> orders_c = queryDAO.selectOrderByUser(pkey, "Cart");
    List<Orders> orders_o = queryDAO.selectOrderByUser(pkey, "Order History");
    int tupleCount_c = orders_c.size();
    int tupleCount_o = orders_o.size();
    
    //리소스 해제 
    orders_c.clear();
    orders_o.clear();
%>
<html>
    <head>
		<title>세나샵</title>
    <script>
      if(!<%= session.getAttribute("user_id")%>) {
        alert("로그인 후 이용해주세요.");
        location.href="login.jsp";
      }
    </script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="assets/css/mypage.css" />
        
	</head>
	<body style="background-color: rgb(74, 74, 88);">
		<header id="header">
			<a href="index.jsp" class="logo"><strong>세 나</strong> shop</a>
			<nav>
				<% if(id != null) {%>
				<!--<a href="logout.jsp"> <%= id%> 로그아웃</a>-->
                <a href="LogoutServlet"> <%= id%> 로그아웃</a>
				<% } else { %>
				<a href="login.jsp">로그인</a>
				<% } %>
				<a href="#menu">Menu</a>
			</nav>

		</header>

	<!-- Nav -->
		<nav id="menu">
			<ul class="links">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="mypage.jsp">마이페이지</a></li>
				<li><a href="elements.html">Elements</a></li>
                <li><a href="LoginServlet">Elements</a></li>
			</ul>
		</nav>

    <div class="wrap">
        <div class="greenContainer">
            <% for (Members m : member) { %>
          <div>
            <div class="grade">등급: <%= m.getUserLv() %></div>
            <div class="name"><%= id%></div>
          </div>
          <!--회원정보 평문 전송-->
          <div class="modify">
            <% %>
            <form action ="ModifyServlet" method="GET">
              <input type="hidden" name="id" value="<%= m.getId()%>">
              <input type="hidden" name="name" value="<%= m.getNm()%>">
              <input type="hidden" name="mobile" value="<%= m.getMb()%>">
              <input type="hidden" name="email" value="<%= m.getEm()%>">
              <input type="hidden" name="zipcode" value="<%= m.getZc()%>">
              <input type="hidden" name="address1" value="<%= m.getAd1()%>">
              <input type="hidden" name="address2" value="<%= m.getAd2()%>">
              <input type="submit" value="회원 정보 수정">
            </form>
          </div>
          <% } %>
          <% member = null; %>
        </div>
        <div class="summaryContainer">
          <div class="item">
            <div class="number"><%= tupleCount_q %></div>
            <div>상품문의</div>
          </div>
          <div class="item">
            <div class="number"><%= tupleCount_h %></div>
            <div>상품후기</div>
          </div>
          <div class="item">
            <div class="number">0</div>
            <div>적립금(point)</div>
          </div>
        </div>
        <div class="shippingStatusContainer">
          <div class="title">
            주문/배송조회
          </div>
          <div class="status">
      
            <div class="item">
              <div>
                <div class="green number"><%= tupleCount_c %></div>
                <div class="text">장바구니</div>
              </div>
              <div class="icon"> > </div>
            </div>
            <div class="item">
              <div>
                <div class="number"><%= tupleCount_o %></div>
                <div class="text">결제완료</div>
              </div>
              <div class="icon"> > </div>
            </div>
            <div class="item">
              <div>
                <div class="green number">0</div> <!--기능 미구현-->
                <div class="text">배송중</div>
              </div>
              <div class="icon"> > </div>
            </div>
            <div class="item">
              <div>
                <div class="green number">0</div> <!--기능 미구현-->
                <div class="text">구매확정</div>
              </div>
            </div>
      
          </div>
      
        </div>
        <div class="listContainer">
          <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">주문목록<span class="circle"></span></div>
            <div class="right"> > </div>
          </a>
          <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">상품후기</div>
            <div class="right"> > </div>
          </a>
          <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">상품문의</div>
            <div class="right"> > </div>
          </a>
          <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">단골상점</div>
            <div class="right"> > </div>
          </a>
          <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">찜한상품</div>
            <div class="right"> > </div>
          </a>
        </div>
        <div class="listContainer">
          <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">
              <span>내지갑</span>
              <span class="smallLight">
                <span>|</span>
                <span>보유 적립금</span>
              </span>
            </div>
            <div class="right">
              <span class="blct">0</span> <!--기능 미구현-->
              >
            </div>
          </a>
          <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">알림</div>
            <div class="right"> > </div>
          </a>
          <a href="#" class="item">
            <div class="icon">ii</div>
            <div class="text">회원탈퇴</div>
            <div class="right"> > </div>
          </a>
        </div>
        <div class="infoContainer">
          <a href="#" class="item">
            <div>icon</div>
            <div>공지사항</div>
          </a>
          <a href="#" class="item">
            <div>icos</div>
            <div>이용안내</div>
          </a>
          <a href="#" class="item">
            <div>icon</div>
            <div>고객센터</div>
          </a>
        </div>
      </div>
    
</body>

<footer id="footer">
    <h1>Retrieved Data:</h1>
    <table>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Country</th>
        </tr>
        <%-- Loop through the boardList and display the data --%>
        <% for (Board board : boardList_q) { %>
          <tr>
            <td><%= board.getSubject() %></td>
            <td><%= board.getBoardNumber() %></td>
            <td><%= board.getReply_() %></td>
            <td><%= board.getType() %></td>
          </tr>
        <% } %>
        <% boardList_q.clear(); %>
      </table>

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
</html>
