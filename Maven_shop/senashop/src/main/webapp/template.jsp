<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
				</ul>
			</nav>
<!--기능구현-->
<section>
	<div style="padding: 80px;">
	<h1>결제</h1>				
					<h3>상품</h3>
					<div class="table-wrapper">
						<table>
							<tbody>
							<tr>
								<td>Item 1</td>
								<td>Ante turpis integer aliquet porttitor.</td>
								<td>29.99</td>
							</tr>
							<tr>
								<td>Item 2</td>
								<td>Vis ac commodo adipiscing arcu aliquet.</td>
								<td>19.99</td>
							</tr>
							<tr>
								<td>Item 3</td>
								<td> Morbi faucibus arcu accumsan lorem.</td>
								<td>29.99</td>
							</tr>
							<tr>
								<td>Item 4</td>
								<td>Vitae integer tempus condimentum.</td>
								<td>19.99</td>
							</tr>
							<tr>
								<td>Item 5</td>
								<td>Ante turpis integer aliquet porttitor.</td>
								<td>29.99</td>
							</tr>
							</tbody>
						</table>
						<h3>배송지</h3>
						<form action="elements.html" method="get">
							우편번호<input type="text" name="zipcode"><br/>
							배달지<input type="text" name="address"><br/>
						
					</div>
					<h3>마일리지</h3>
					<table>
						<tr>
						  <th>결제금액</th>
						  <td><span class="bold txt_blue">65000원</span></td>
						</tr>
						<tr>
						  <th> 포 인 트 </th>
						  <td>
							사용가능 포인트 : <span name="left_pnt">7210</span>p <span><input type="checkbox" id="chk_use" onclick="chkPoint(65000,7210,5000,100)">포인트 전체 사용</span>
							<span style="float:right">포인트는 최소 5000p부터 100p단위로 사용 가능합니다.</span>
						  </td>
						</tr>
						<tr>
						  <td></td>
						  <td>
							<span> <input type="number" name="use_pnt" id="use_pnt" min="5000" max="65000" onchange="changePoint(65000,7210,5000,100)"></span> p 
							<span> ( 남은포인트 : </span><span name="left_pnt" id="left_pnt">7210</span>p )
						  </td>
						</tr>
						<tr>
						  <td></td>
						  <td>
							  <p class="bold txt_red"> 최종 결제 금액 : <span class="bold txt_red" id="result_pnt">65000</span> 원</p>
						  </td>
						</tr>
					</table>
					<div align ="right">
					<input type="submit" value="결제">
					</div>
					
					
						
							
						
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
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>