<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 템플릿 페이지 --%>
<%-- TilesView 기능의 태그를 제공받기 위한 tags-tiles 태그 라이브러리를 JSP 문서에 포함 --%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Dreams CLUB </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    
    <!-- ajax 적용 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/img/sheepDreams.png">
    
    <!-- CSS
	============================================ -->
   
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/icons.min.css">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/boxicons.css" />

    <!-- Core CSS -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/core.css" class="template-customizer-core-css" /> --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/perfect-scrollbar.css" />
	<style type="text/css">

	</style>
</head>
<body>
	<div id="header">
		<%-- insertAttribute 태그 : TilesView 프로그램의 환경설정파일에서 put-attribute 엘리먼트로
		제공된 JSP 문서의 실행결과를 제공받아 삽입하기 위한 태그 --%>
		<tiles:insertAttribute name="header" ignore="true"/>
	</div>

	<div id="content">
		<tiles:insertAttribute name="content" ignore="true"/>
	</div>

	<div id="footer">
		<tiles:insertAttribute name="footer" ignore="true"/>
	</div>
	
		<!-- All JS is here
	============================================ -->
	
	<script src="${pageContext.request.contextPath }/js/vendor/modernizr-3.11.7.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/vendor/jquery-v3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/vendor/jquery-migrate-v3.3.2.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/vendor/popper.min.js"></script>
	
	<script src="${pageContext.request.contextPath }/js/vendor/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/plugins.js"></script>
	<!-- Ajax Mail -->
	<script src="${pageContext.request.contextPath }/js/ajax-mail.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>