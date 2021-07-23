<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>KREN</title>
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
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
