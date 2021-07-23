<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>

</head>
<body>
	<div class="is-white">
		<div class="pageloader"></div>
		<div class="infraloader is-active"></div>
		<div
			class="navbar navbar-v1 is-inline-flex is-transparent no-shadow no-background is-landing is-hidden-mobile">
			<div class="container is-desktop">
				<div class="navbar-brand">
					<a href="/" class="navbar-item"> 
					<img class="logo" src="${pageContext.request.contextPath}/resources/template/assets/img/logo/krenlogo.png" alt="">
					</a>
				</div>
				<div class="navbar-menu">
					<div class="navbar-start">
						<div class="navbar-item">
							<a href="#buy">Buy</a>
						</div>
						<div class="navbar-item">
							<a href="#demos-section">Demos</a>
						</div>
						<div class="navbar-item">
							<a href="https://docs.cssninja.io/friendkit" target="_blank">Docs</a>
						</div>
					</div>

					<div class="navbar-end">

						<div class="navbar-item">
							<div class="navbar-item">
								<a href="/login.html">Login</a>
							</div>
							<a id="signup-button" href="/signup.html"
								class="button is-cta is-solid primary-button raised"> Sign
								Up </a>
						</div>
					</div>

				</div>
			</div>
		</div>
	
	</div>

</body>