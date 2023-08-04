<!DOCTYPE HTML>
<%@ page language="java" contentType="application/octet-stream; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.net.URLDecoder"%>
<%@page import="com.amazonaws.auth.AWSStaticCredentialsProvider"%>
<%@page import="com.amazonaws.auth.BasicAWSCredentials"%>
<%@page import="com.amazonaws.services.s3.AmazonS3"%>
<%@page import="com.amazonaws.services.s3.AmazonS3ClientBuilder"%>
<%@page import="com.amazonaws.services.s3.model.S3Object"%>
<%@page import="com.amazonaws.services.s3.model.S3ObjectInputStream"%>
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
			String awsAccessKey = "";
			String awsSecretKey = ""; 
			String clientRegion = "ap-northeast-2";

			// S3 버킷과 파일명
			String bucketName = "senanam";
            String fileName = request.getParameter("file_name");
			try {
				fileName = URLDecoder.devode(fileName, "UTF-8");
				// AWS 자격증명 생성
				BasicAWSCredentials awsCreds = new BasicAWSCredentials(awsAccessKey, awsSecretKey);
		
				// AmazonS3 클라이언트 생성
				AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
						.withCredentials(new AWSStaticCredentialsProvider(awsCreds))
						.withRegion(clientRegion)
						.build();
		
				// S3 버킷에서 파일 다운로드
				S3Object s3Object = s3Client.getObject(bucketName, fileName);
				S3ObjectInputStream inputStream = s3Object.getObjectContent();
		
				// 파일 다운로드를 위한 헤더 설정
				response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
				response.setContentType("application/octet-stream");
		
				// 파일 스트림을 읽어서 브라우저로 출력
				byte[] buffer = new byte[4096];
				int bytesRead;
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					response.getOutputStream().write(buffer, 0, bytesRead);
				}
				inputStream.close();
			} catch (IOException e) {
				out.println("파일 다운로드 중 오류가 발생했습니다.");
				e.printStackTrace();
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