<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>KREN</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="icon" type="image/png"
	href="${pageContext.request.contentType}/resources/template/assets/img/favicon.png" />
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500"
	rel="stylesheet">
<!-- Core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/app.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/core.css">
<meta charset="UTF-8">
<style>
.landing-hero-wrapper .landing-caption .button {
	margin: 10px 10px 10px 0px;
}
</style>
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
							<img
								src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/characters/friends.svg"
								alt="">
						</div>
						<div class="column is-5">
							<h2>KREN</h2>
							<br>
							<div class="login-wrapper" style="max-width: 400px;">
								<div class="form-wrapper" style="margin: 0px;">
									<!--Form-->
									<form action="loginCheck.do" method="post">
										<div class="login-form">
											<div class="field">
												<div class="control">
													<input class="input email-input" type="text" id="user_id" name="user_id" placeholder="ID">
													<div class="input-icon">
														<i data-feather="user"></i>
													</div>
												</div>
											</div>
											<div class="field">
												<div class="control">
													<input class="input password-input" type="password"  id="password" name="password" placeholder="PASSWORD">
													<div class="input-icon">
														<i data-feather="lock"></i>
													</div>
												</div>
											</div>
											<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
												<p style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.
													<c:remove var="SPRING_SECURITY_LAST_EXCEPTION"
														scope="session" />
											</c:if>
											<div class="field">
												<div class="control">
													<button
														class="button is-solid dark-grey-button raised is-rounded is-fullwidth"
														style="border-color: #3d70b2; background: #3d70b2; color: #fff"
														type="submit" onclick="loginCheck()">Login</button>
												</div>
												<div class="control" style="display: flex;">
													<button
														class="button is-solid primary-button raised is-rounded"
														style="border-color: #fff; background: #ffffff00; color: #fff"
														type="button" onclick="location.href='userJoinForm.do'">Sign Up</button>
													<button
														class="button is-solid primary-button raised is-rounded"
														style="border-color: #fff; background: #ffffff00; color: #fff"
														type="button" onclick="location.href='find/find.do'">forgot ID/password?</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="buttons" align="center">
				<button id="tour-start" class="button is-hidden-mobile"
					onclick="location.href='test.do'">테스트페이지</button>
				<button id="tour-start" class="button is-hidden-mobile"
					onclick="location.href='feed.do'">피드</button>
				<button id="tour-start" class="button is-hidden-mobile"
					onclick="location.href='admin/admin.do'">관리자</button>
			</div>
		</div>
	</div>
	
	
	<!-- Concatenated js plugins and jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/app.js"></script>
	<script src="https://js.stripe.com/v3/"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/data/tipuedrop_content.js"></script>

	<!-- Core js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/global.js"></script>

	<!-- Navigation options js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-v1.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-v2.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-mobile.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-options.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/sidebar-v1.js"></script>

	<!-- Core instance js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/chat.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/touch.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/tour.js"></script>

	<!-- Components js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/explorer.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/widgets.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/modal-uploader.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/popovers-users.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/popovers-pages.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/lightbox.js"></script>

	<!-- Landing page js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/js/landing.js"></script>

</body>
</html>
