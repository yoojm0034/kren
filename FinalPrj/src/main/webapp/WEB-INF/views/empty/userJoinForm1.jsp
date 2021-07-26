<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="icon" type="image/png"
	href="resources/template/assets/img/favicon.png" />
<!-- Core CSS -->
<link rel="stylesheet" href="resources/template/assets/css/app.css">
<link rel="stylesheet" href="resources/template/assets/css/core.css">
<style>
@font-face {
	font-family: 'ONE-Mobile-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'ONE-Mobile-Regular'
}

.signup-wrapper .process-title h2 {
	font-family: 'ONE-Mobile-Regular';
}

.fake-nav img {
	padding-top: 5px;
	max-width: none;
}

.signup-wrapper .outer-panel {
	min-height: calc(100vh - 200px);
}

#map {
	height: 250px;
	width: 250px;
}

#city, #country {font-size: 20px; font-weight: 600;}

a[href^="http://maps.google.com/maps"]{display:none !important} a[href^="https://maps.google.com/maps"]{display:none !important} .gmnoprint a, .gmnoprint span, .gm-style-cc { display:none; } .gmnoprint div { background:none !important; }

</style>
</head>

<body>

	<!-- Pageloader -->
	<div class="pageloader"></div>
	<div class="infraloader is-active"></div>
	<div class="signup-wrapper">

		<div class="fake-nav">
			<a href="/" class="logo"> <img
				src="resources/template/assets/img/logo/logo2.png" width="112"
				height="28" alt="">
			</a>
		</div>

		<div class="process-bar-wrap">
			<div class="process-bar">
				<div class="progress-wrap">
					<div class="track"></div>
					<div class="bar"></div>
					<div id="step-dot-1" class="dot is-first is-active is-current"
						data-step="0">
						<i data-feather="smile"></i>
					</div>
					<div id="step-dot-2" class="dot is-second" data-step="25">
						<i data-feather="user"></i>
					</div>
					<div id="step-dot-3" class="dot is-third" data-step="50">
						<i data-feather="image"></i>
					</div>
					<div id="step-dot-4" class="dot is-fourth" data-step="75">
						<i data-feather="lock"></i>
					</div>
					<div id="step-dot-5" class="dot is-fifth" data-step="100">
						<i data-feather="flag"></i>
					</div>
				</div>
			</div>
		</div>

		<div class="outer-panel">
			<div class="outer-panel-inner">
				<div class="process-title">
					<h2 id="step-title-1" class="step-title is-active">시작해볼까요?</h2>
					<h2 id="step-title-2" class="step-title">당신을 표현할 사진을 골라주세요.</h2>
					<h2 id="step-title-3" class="step-title">위치를 공유해주세요.</h2>
					<h2 id="step-title-4" class="step-title">관심있는 언어와 주제를 선택해주세요.</h2>
					<h2 id="step-title-5" class="step-title">You're all set.
						Ready?</h2>
				</div>

				<div id="signup-panel-1"
					class="process-panel-wrap is-narrow is-active">
					<div class="form-panel">
						<div class="field">
							<label>ID</label>
							<div class="control">
								<input type="text" class="input" placeholder="아이디를 입력하세요">
							</div>
						</div>
						<div class="field">
							<label>NAME</label>
							<div class="control">
								<input type="text" class="input" placeholder="사용할 이름을 입력하세요">
							</div>
						</div>
						<div class="field" style="width: 380px; display: inline-block;">
							<label>EMAIL</label>
							<div class="control">
								<input type="text" class="input" placeholder="이메일을 입력하세요">
							</div>
						</div>
						<a class="button is-solid dark-grey-button raised"
							style="vertical-align: -webkit-baseline-middle">코드발송</a>
						<div class="field" style="width: 380px; display: inline-block;">
							<div class="control">
								<input type="text" class="input" placeholder="인증코드를 입력하세요">
							</div>
						</div>
						<a class="button is-solid dark-grey-button raised"
							style="vertical-align: -webkit-baseline-middle">코드확인</a>
					</div>

					<div class="buttons">
						<a class="button process-button" data-step="step-dot-1">Home</a> <a
							class="button process-button is-next" data-step="step-dot-2">Next</a>
					</div>
				</div>

				<div id="signup-panel-2" class="process-panel-wrap is-narrow">
					<div class="form-panel">
						<div class="photo-upload">
							<div class="preview">
								<a class="upload-button"> <i data-feather="plus"></i>
								</a> <img id="upload-preview"
									src="https://via.placeholder.com/150x150"
									data-demo-src="resources/template/assets/img/avatars/avatar-w.png"
									alt="">
								<form id="profile-pic-dz" class="dropzone is-hidden" action="/"></form>
							</div>
							<div class="limitation">
								<small>Only images with a size lower than 3MB are
									allowed.</small>
							</div>
						</div>
					</div>

					<div class="buttons">
						<a class="button process-button" data-step="step-dot-1">Back</a> <a
							class="button process-button is-next" data-step="step-dot-3">Next</a>
					</div>
				</div>

				<script>
					function getLocation() {
						$.getJSON("https://api.ipregistry.co/?key=f3cmlbb66kf0ewyi", function(
								json) {
							console.log(json);
							$("#country").text(', ' + json['location']['country']['name']);
							$("#city").text(json['location']['region']['name']);
							$("#time").text(json['time_zone']['current_time']);
							var lat = json['location']['latitude'];
							var lon = json['location']['longitude'];
							$("#lat").text(lat);
							$("#lon").text(lon);
				
							// 시간계산
							var time = json['time_zone']['current_time'];
							var hour = time.substr(11, 2);
							var min = time.substr(14, 2);
							var time2 = (hour % 12 || 12) + ':'
									+ min.toString().padStart(2, '0')
									+ (hour < 12 ? ' A' : ' P') + 'M';
							$("#time2").text(time2);
							
							var gmt = time.substr(19, 6);
							$("#gmt").text(' (GMT'+gmt+')');
							
							initMap(lat, lon);
						});
					};
					
					// 지도
				    function initMap(lat, lon) {
				        const city = { lat: lat,
				        		lng: lon};
				        const map = new google.maps.Map(document.getElementById("map"), {
				          zoom: 6,
				          center: city,
				          mapTypeControl: false,
				          streetViewControl: false,
				        });
				        const marker = new google.maps.Marker({
				          position: city,
				          map: map,
				        });
					};
				</script>
				
				<div id="signup-panel-3" class="process-panel-wrap is-narrow">
					<div align="center">
						<a class="button is-solid accent-button raised" onclick="getLocation()">위치확인</a>
					</div>
					<br>
					<div class="form-panel" style="display: flex;">
						<div id="map"></div>
						<script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD523dZdQiMvJDOsNySdn1RdQlA_7g5DM&callback=initMap"></script>
						<div style="margin: auto 10px auto 10px;">
							<span id="city"></span><span id="country"></span><br>
							<span id="time2"></span><span id="gmt"></span>
						</div>
					</div>
					<div class="buttons">
						<a class="button process-button" data-step="step-dot-2">Back</a> <a
							class="button process-button is-next" data-step="step-dot-4">Next</a>
					</div>
				</div>

				<div id="signup-panel-4" class="process-panel-wrap is-narrow">
					<div class="form-panel">
						<div class="field">
							<label>Password</label>
							<div class="control">
								<input type="password" class="input"
									placeholder="Choose a password">
							</div>
						</div>
						<div class="field">
							<label>Repeat Password</label>
							<div class="control">
								<input type="password" class="input"
									placeholder="Repeat your password">
							</div>
						</div>
						<div class="field">
							<label>Phone Number</label>
							<div class="control">
								<input type="text" class="input"
									placeholder="Enter your phone number">
							</div>
						</div>
					</div>

					<div class="buttons">
						<a class="button process-button" data-step="step-dot-3">Back</a> <a
							class="button process-button is-next" data-step="step-dot-5">Next</a>
					</div>
				</div>

				<div id="signup-panel-5" class="process-panel-wrap is-narrow">
					<div class="form-panel">
						<img class="success-image"
							src="resources/template/assets/img/illustrations/signup/mailbox.svg"
							alt="">
						<div class="success-text">
							<h3>Congratz, you successfully created your account.</h3>
							<p>We just sent you a confirmation email. PLease confirm your
								account within 24 hours.</p>
							<a id="signup-finish" class="button is-fullwidth">Let Me In</a>
						</div>
					</div>
				</div>
			</div>
		</div>



		<!--Edit Credit card Modal-->
		<div id="crop-modal" class="modal is-small crop-modal is-animated">
			<div class="modal-background"></div>
			<div class="modal-content">
				<div class="modal-card">
					<header class="modal-card-head">
						<h3>Crop your picture</h3>
						<div class="close-wrap">
							<button class="close-modal" aria-label="close">
								<i data-feather="x"></i>
							</button>
						</div>
					</header>
					<div class="modal-card-body">
						<div id="cropper-wrapper" class="cropper-wrapper"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Concatenated js plugins and jQuery -->
	<script src="resources/template/assets/js/app.js"></script>
	<script src="https://js.stripe.com/v3/"></script>
	<script src="resources/template/assets/data/tipuedrop_content.js"></script>

	<!-- Core js -->
	<script src="resources/template/assets/js/global.js"></script>

	<!-- Navigation options js -->
	<script src="resources/template/assets/js/navbar-v1.js"></script>
	<script src="resources/template/assets/js/navbar-v2.js"></script>
	<script src="resources/template/assets/js/navbar-mobile.js"></script>
	<script src="resources/template/assets/js/navbar-options.js"></script>
	<script src="resources/template/assets/js/sidebar-v1.js"></script>

	<!-- Core instance js -->
	<script src="resources/template/assets/js/main.js"></script>
	<script src="resources/template/assets/js/chat.js"></script>
	<script src="resources/template/assets/js/touch.js"></script>
	<script src="resources/template/assets/js/tour.js"></script>

	<!-- Components js -->
	<script src="resources/template/assets/js/explorer.js"></script>
	<script src="resources/template/assets/js/widgets.js"></script>
	<script src="resources/template/assets/js/modal-uploader.js"></script>
	<script src="resources/template/assets/js/popovers-users.js"></script>
	<script src="resources/template/assets/js/popovers-pages.js"></script>
	<script src="resources/template/assets/js/lightbox.js"></script>

	<!-- Landing page js -->

	<!-- Signup page js -->
	<script src="resources/template/assets/js/signup.js"></script>

	<!-- Feed pages js -->

	<!-- profile js -->

	<!-- stories js -->

	<!-- friends js -->

	<!-- questions js -->

	<!-- video js -->

	<!-- events js -->

	<!-- news js -->

	<!-- shop js -->

	<!-- inbox js -->

	<!-- settings js -->

	<!-- map page js -->

	<!-- elements page js -->
</body>

</html>