<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
@font-face {
    font-family: 'ONE-Mobile-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

p {
	font-family: 'ONE-Mobile-Regular' !important;
    font-size: 1.5rem;
    letter-spacing: -0.08rem;
    font-weight: bold;
}

.landing-hero-wrapper .landing-caption .button {
	margin: 10px 10px 10px 0px;
}

.floating {
	position: fixed;
	z-index: 99;
	bottom: 5%;
	right: 2%;
	border: 1px solid #000000;
	color: #333;
	background: #f4f4f4;
	border-radius: 5px;
	padding: 9px;
	font-size: 0.85rem;
	line-height: 1;
	cursor: pointer;
	bottom: 5%;
	right: 2%;
	border: 1px solid #000000;
	color: #333;
	background: #f4f4f4;
	border-radius: 5px;
	padding: 9px;
	font-size: 0.85rem;
	line-height: 1;
	right: 2%;
	border: 1px solid #000000;
	color: #333;
	background: #f4f4f4;
	border-radius: 5px;
	padding: 9px;
	font-size: 0.85rem;
	line-height: 1;
	border: 1px solid #000000;
	color: #333;
	background: #f4f4f4;
	border-radius: 5px;
	padding: 9px;
	font-size: 0.85rem;
	line-height: 1;
}

/* The Modal (background) */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
	background-color: #fefefe;
	position: fixed;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	padding-top: 100px;
	width: 15%; /* Could be more or less, depending on screen size */
	height: 35%;
}

.lang {
	cursor: pointer;
	line-height: 20px;
	vertical-align: top;
}

.x-small {
	font-size: small;
	color: red;
}
</style>
<script>
$(document).ready(function() {
	var uri = window.location.search; 
	
	//파라미터 없으면 모달창 띄우기
	if(!uri.includes("lang")){
		$("#modal").show();
	}
	
	//모달창 닫기
	function closeModal() {
		$('.searchModal').hide();
	};
	
	// 언어 선택
	$(".lang").click(function (){
		var param = $(this).attr('id');
		if(param == 'kr') {
			location.href="?lang=kr"
		} else {
			location.href="?lang=en"
		}
		$('.searchModal').hide(); 
	});
});
</script>
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
													<input class="input email-input" type="text" id="user_id"
														name="user_id" placeholder="ID">
													<div class="input-icon">
														<i data-feather="user"></i>
													</div>
												</div>
											</div>
											<div class="field">
												<div class="control">
													<input class="input password-input" type="password"
														id="password" name="password" placeholder="PASSWORD">
													<div class="input-icon">
														<i data-feather="lock"></i>
													</div>
												</div>
											</div>
											<!--  
											<c:choose>
												<c:when test="${user.status eq '탈퇴회원' }">
													<p style="color: red">존재하지 않는 회원 아이디입니다.</p>
													<c:remove var="user.status" scope="session" />
												</c:when>
												<c:when test="${user.status eq '정지회원' }">
													<p style="color: red">(관리자문의요망)정지된 계정입니다.</p>
													<c:remove var="user.status" scope="session" />
												</c:when>
											</c:choose>
											
											<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
												<p style="color: red">
													에러${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
													<c:remove var="SPRING_SECURITY_LAST_EXCEPTION"
														scope="session" />
											</c:if>
											<c:if test="${not empty errorMsg}">
												<p style="color: red"> Error : <c:out value="${errMsg}"/> </p>
											</c:if>
											<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
												<p style="color: red">
													${LoginFailMessage }</p>
												<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
											</c:if>
											-->
											<p class="x-small">${LoginFailMessage }</p>
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
														type="button"
														onclick="location.href='${pageContext.request.contextPath}/userJoin/userJoinForm.do'">Sign
														Up</button>
													<button
														class="button is-solid primary-button raised is-rounded"
														style="border-color: #fff; background: #ffffff00; color: #fff"
														type="button"
														onclick="location.href='${pageContext.request.contextPath}/find/find.do'">forgot
														ID/password?</button>
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
			<div class="floating" onclick="location.href='userQnaWrite.do'">
				<span style="vertical-align: sub;"><img
					src="${pageContext.request.contextPath}/resources/template/assets/img/contact.png"
					width="20px"></span> <span><spring:message
						code="head.contact" /></span>
			</div>
		</div>
	</div>

	<!-- 모달창 영역 -->
	<div id="modal" class="searchModal">
		<div class="search-modal-content" align="center">
			<div>
				<p>언어를 선택하세요</p>
				<p>Select Language</p>
			</div><br>
			<div style="height: 20px;">
			<img src="https://cdn.ipregistry.co/flags/emojitwo/kr.svg" width="20px"><span class="lang" id="kr">KOREAN</span>&nbsp;&nbsp;
			<img src="https://cdn.ipregistry.co/flags/emojitwo/gb.svg" width="20px"><span class="lang" id="en">ENGLISH</span>
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
