<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>KREN</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="icon" type="image/png" href="${pageContext.request.contentType}/resources/template/assets/img/favicon.png" />
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
<!-- Core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/core.css">
<meta charset="UTF-8">
</head>
<body>
	<div class="landing-wrapper">
		<div id="friendkit-demo-landing"
			class="hero is-fullheight landing-hero-wrapper">
			<div id="particles-js"></div>
			<div class="hero-body">
				<div class="container is-desktop">
					<div class="columns landing-caption is-vcentered">
						<div class="column is-7">
							<img src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/characters/friends.svg" alt="">
						</div>
						<div class="column is-5">
							<h2>KREN</h2>
                            <h3>Social Media</h3>
                            <div class="buttons">
                                <a href="#landing-start" class="button">Sign In</a>
                                <button id="tour-start" class="button is-hidden-mobile">Sign Up</button>
                                <button id="tour-start" class="button is-hidden-mobile" onclick="location.href='test.do'">테스트페이지</button>
                                <button id="tour-start" class="button is-hidden-mobile" onclick="location.href='feed.do'">피드</button>
                                <button id="tour-start" class="button is-hidden-mobile" onclick="location.href='admin.do'">관리자</button>                                
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
	
</body>
</html>
