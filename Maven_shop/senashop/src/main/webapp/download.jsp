<!DOCTYPE HTML>
<%@ page language="java" contentType="application/octet-stream; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.net.URLDecoder"%>
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
					<li><a href="boardList.jsp">게시판</a></li>
				</ul>
			</nav>

            <%
            // 다운로드할 파일의 경로
            String file_name = request.getParameter("file_name");
            String downloadFilePath = getServletContext().getRealPath("/") + "upload/" + URLDecoder.decode(file_name, "UTF-8");

            File downloadFile = new File(downloadFilePath);
            FileInputStream inStream = new FileInputStream(downloadFile);

            // 다운로드할 파일의 MIME 타입 설정
            response.setContentType("application/octet-stream");
            response.setContentLength((int) downloadFile.length());

            // 파일 다운로드 대화 상자에 표시되는 파일명 설정 (한글 파일명을 위해 UTF-8로 인코딩)
            String headerKey = "Content-Disposition";
            String headerValue = "attachment; filename=\"" + new String(file_name.getBytes("UTF-8"), "ISO-8859-1") + "\"";
            response.setHeader(headerKey, headerValue);

            // 파일 스트림을 읽어서 클라이언트로 전송
            OutputStream outStream = response.getOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }

            inStream.close();
            outStream.close();
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