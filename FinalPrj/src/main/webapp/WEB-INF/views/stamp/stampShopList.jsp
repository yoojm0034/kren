<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>STAMP SHOP</title>
<link rel="icon" type="image/png" href="assets/img/favicon.png" />
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/fontisto@v3.0.4/css/fontisto/fontisto-brands.min.css"
	rel="stylesheet">
<!-- Core CSS -->
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="assets/css/core.css">
</head>

<body>
	<!-- 우표상점 -->
	<div class="view-wrapper">

		<div class="shop-wrapper">
			<div class="cart-container">
				<div class="cart-header">
					<div class="header-inner">
						<h2>STAMP SHOP</h2>
						<div class="header-actions"></div>
					</div>
				</div>

				<div class="cart-content">
					<div class="columns">
						<div class="column is-8">
							<!--Table-->
							<c:forEach items="${ list }" var="vo">
								<div class="flex-table">
									<div class="flex-table-item" data-id="${ vo.stamp_id }">
										<div class="product">
											<img src="template/assets/img/letter/stamp.png"> <span
												class="product-name"></span>
										</div>

										<div class="discount">
											<span class="has-price">X${ vo.cnt }개</span>
										</div>

										<div class="price">
											<span class="has-price">${ vo.pay }</span>
										</div>

										<div class="discount">
											<div class="buttons">
												<a href="#" class="button is-solid accent-button raised">Buy</a>
											</div>
										</div>


									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Concatenated js plugins and jQuery -->
	<script src="assets/js/app.js"></script>
	<script src="https://js.stripe.com/v3/"></script>
	<script src="assets/data/tipuedrop_content.js"></script>

	<!-- Core js -->
	<script src="assets/js/global.js"></script>

	<!-- Navigation options js -->
	<script src="assets/js/navbar-v1.js"></script>
	<script src="assets/js/navbar-v2.js"></script>
	<script src="assets/js/navbar-mobile.js"></script>
	<script src="assets/js/navbar-options.js"></script>
	<script src="assets/js/sidebar-v1.js"></script>

	<!-- Core instance js -->
	<script src="assets/js/main.js"></script>
	<script src="assets/js/chat.js"></script>
	<script src="assets/js/touch.js"></script>
	<script src="assets/js/tour.js"></script>

	<!-- Components js -->
	<script src="assets/js/explorer.js"></script>
	<script src="assets/js/widgets.js"></script>
	<script src="assets/js/modal-uploader.js"></script>
	<script src="assets/js/popovers-users.js"></script>
	<script src="assets/js/popovers-pages.js"></script>
	<script src="assets/js/lightbox.js"></script>

	<!-- Landing page js -->

	<!-- Signup page js -->

	<!-- Feed pages js -->

	<!-- profile js -->

	<!-- stories js -->

	<!-- friends js -->

	<!-- questions js -->

	<!-- video js -->

	<!-- events js -->

	<!-- news js -->

	<!-- shop js -->
	<script src="assets/js/shop.js"></script>

	<!-- inbox js -->

	<!-- settings js -->

	<!-- map page js -->

	<!-- elements page js -->
</body>

</html>