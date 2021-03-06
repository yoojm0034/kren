<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>


<title>KREN</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/template/assets/img/favicon.png" />
<!-- Core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/core.css">
<link
	href="${pageContext.request.contextPath}/resources/template/assets/nicelabel/css/jquery-nicelabel.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/template/assets/nicelabel/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/assets/nicelabel/js/jquery.nicelabel.js"></script>
</head>
<body>
<script>
	$(function() {
	  $('#loginGo').on("click", function(){
		  location.href = '${pageContext.request.contextPath}/home.do';
	  });
	});
</script>
	<!-- Pageloader -->
    <div class="pageloader"></div>
    <div class="infraloader is-active"></div>
    <div class="signup-wrapper">
		<div class="fake-nav">
			<a href="${pageContext.request.contextPath}/home.do" class="logo"> <img
				src="${pageContext.request.contextPath}/resources/template/assets/img/logo/logo2.png" width="112"
				height="28" alt="">
			</a>
		</div>
        <div class="container">
            <!--Container-->
            <div class="login-container is-centered">
                <div class="columns is-vcentered">
                    <div class="column">

                        <h2 class="form-title has-text-centered"><spring:message code="id.title" /></h2>
                        <h3 class="form-subtitle has-text-centered"><spring:message code="id.title3" /></h3>

                        <!--Form-->
                        <div id="signup-panel-1"
						class="process-panel-wrap is-narrow is-active">
                            <div class="form-panel">
                            	<h2 style="text-align:center"><b>ID : ${id.user_id}</b></h2>
                            </div>
						<br>
                            <div class="buttons">
                                <a class="button is-solid primary-button is-fullwidth raised" type="button" id="loginGo"><spring:message code="go.login.button" /></a>
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
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/touch.js"></script>

	<!-- Components js -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/explorer.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/widgets.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/modal-uploader.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/popovers-users.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/popovers-pages.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/lightbox.js"></script>

	<!-- Signup page js -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/signup.js"></script>
</body>
</html>