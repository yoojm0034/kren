<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="html1">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">

	<title>KREN</title>
	<link rel="icon" type="image/png" href="${pageContext.request.contentType}/resources/template/assets/img/favicon.png" />

	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/fontisto@v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet">

	<!-- Core CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/core.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/vendor/datatables/dataTables.bootstrap4.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
</head>

<body>
	<div>
		<tiles:insertAttribute name="head">
		</tiles:insertAttribute>
	</div>
	<div class="view-wrapper">
        <!-- Container -->
        
		<tiles:insertAttribute name="content">
		</tiles:insertAttribute>
		
	</div>
	
<!-- Concatenated js plugins and jQuery -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/app.js"></script>
    <script src="https://js.stripe.com/v3/"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/data/tipuedrop_content.js"></script>

    <!-- Core js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/global.js"></script>

    <!-- Navigation options js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-v1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-mobile.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-options.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/sidebar-v1.js"></script>

    <!-- Core instance js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/chat.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/touch.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/tour.js"></script>

    <!-- Components js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/explorer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/widgets.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/modal-uploader.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/popovers-users.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/popovers-pages.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/lightbox.js"></script>

    <!-- Landing page js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/landing.js"></script>
	
	<!--  Feed pages js -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/feed.js"></script>

    <script src="${pageContext.request.contextPath}/resources/template/assets/js/webcam.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/compose.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/autocompletes.js"></script>
	
	<!-- inbox js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/inbox.js"></script>
	 
	<!-- friends js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/friends.js"></script>
	
	<!-- DATATABLES PLUGINS -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/vendor/datatables/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/vendor/datatables/dataTables.bootstrap4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/vendor/datatables/datatables-demo.js"></script>
</body>
</html>