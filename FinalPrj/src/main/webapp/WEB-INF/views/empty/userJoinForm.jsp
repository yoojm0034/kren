<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<link
	href="resources/template/assets/nicelabel/css/jquery-nicelabel.css"
	rel="stylesheet">
<script src="resources/template/assets/nicelabel/js/jquery.min.js"></script>
<script src="resources/template/assets/nicelabel/js/jquery.nicelabel.js"></script>
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

.block {
	width: 79%;
	display: inline-block;
}

.dark-grey-button {
	margin: 10px 0px 0px 10px
}

.topic-label>.left {
	float: left;
}

.topic-label>.right {
	float: right;
	display: inline-block;
	margin-bottom: 15px;
}

.topic-list {
	display: inline-block
}

.gender {
	margin-left: 10px
}

.signup-wrapper .process-panel-wrap .form-panel .field .gender label {
	font-size: 1rem;
	margin-right: 20px;
}

#city2, #country2 {
	font-size: 20px;
	font-weight: 600;
}

a[href^="http://maps.google.com/maps"] {
	display: none !important
}

a[href^="https://maps.google.com/maps"] {
	display: none !important
}

.gmnoprint a, .gmnoprint span, .gm-style-cc {
	display: none;
}

.gmnoprint div {
	background: none !important;
}
</style>
</head>
<script>
//--------------------아이디체크-----------------------
$(function() {
	$('#idCheck').click(function() {
		//공백체크
		if ($('#user_id').val() == "") {
			alert('아이디를 입력하세요.');
			$('#user_id').focus();
			return;
		}
		//유효성검사
		var re = /^[a-zA-Z0-9]{4,12}$/;
		if (!re.test($('#user_id').val())) {
			alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력하세요.");
			return;
		}
		//중복체크
		$.ajax({
			url : 'userIdCheck.do',
			data : {
				id : $('#user_id').val()
			},
			type : 'post',
			success : function(data) {
				if (data > 0) {
					alert('이미 사용중입니다. 새로 입력해주세요.');
					$('#user_id').val('');
					$('#user_id').focus();
				} else {
					alert('사용가능합니다.');
					$('#idCheck').val("checked");
					$('#user_id').attr("readonly", true);
					$('#name').focus();
				}
			},
			error : function(err) {
				alert('에러가 발생했습니다. 관리자에게 문의해주세요.');
			}
		});
	});
});

//--------------------닉네임 중복체크-----------------------
$(function() {
	$('#nameCheck').click(function() {
		
		var name = $('#name').val();
		var name = $.trim(name);
		console.log(name);
		
		//공백체크
		if (name == "") {
			alert('닉네임을 입력하세요.');
			$('#name').focus();
			return;
		}
		//유효성검사
		var re = /^[가-힣ㄱ-ㅎa-zA-Z0-9._ -]{2,10}$/;
		if (!re.test(name)) {
			alert("영문 혹은 한글로 시작하는 2~10자의 닉네임을 입력하세요.");
			return;
		}
		//중복체크
		$.ajax({
			url : 'userNameCheck.do',
			data : {
				name : name
			},
			type : 'post',
			success : function(data) {
				if (data > 0) {
					alert('이미 사용중입니다. 새로 입력해주세요.');
					$('#name').val('');
					$('#name').focus();
				} else {
					alert('사용가능합니다.');
					$('#name').val(name);
					$('#nameCheck').val("checked");
					$('#name').attr("readonly", true);
					$('#email').focus();
				}
			},
			error : function(err) {
				alert('에러가 발생했습니다. 관리자에게 문의해주세요.');
			}
		});
	});
});

//------------------------이메일 체크------------------------
$(function() {
	$('#emailCheck').click(function() {
		if ($('#email').val() == "") {
			alert('이메일을 입력하세요.');
			$('#email').focus();
			return false;
		}
		//email 중복확인 ajax
		$.ajax({
			url : 'userEmailCheck.do',
			data : {
				email : $('#email').val()
			},
			type : 'post',
			success : function(data) {
				if (data > 0) {
					alert('이미 사용중입니다. 새로 입력해주세요.');
					$('#email').val('');
					$('#email').focus();
				} else {
					$('#email').attr("readonly", true);
					$('#emailCheck').val('checked');
					$('#codeCheck').focus();
					//중복확인 통과후 인증코드 메일보내는 ajax
					$.ajax({
						url : 'sendEmail.do',
						data : {
							email : $('#email').val()
						},
						type : 'post',
						success : function(code) {
							alert('메일이 전송되었습니다.');
							$('#codeCheck').click(function() { // 성공해서 이메일에서 값을 건네받은 경우에, 인증번호 버튼을 클릭 시 값을 검사
								if ($('#inputCode').val() == code) { // 사용자의 입력값과 sendSMS에서 받은 값이 일치하는 경우
									alert('이메일 인증이 완료되었습니다.');
									$('#codeCheck').val("checked");
								} else {
									alert('인증번호가 틀립니다');
								}
							})
						},
						error : function(err) {
							alert('에러가 발생했습니다. 관리자에게 문의해주세요.');
						}
					});
				}
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
});

//--------------------------- 언어체크 -------------------------
function language(e) {
	if (e == 'Korean') {
		$('input[name=language2]').attr('value', 'English');
	} else {
		$('input[name=language2]').attr('value', 'Korean');
	}
};

// ------------------- TOPIC 체크 카운트 계산 ---------------------
function fchk() {
	var chk_obj = document.getElementsByName("topics");
	var chk_leng = chk_obj.length;
	var checked = 0;
	for (i = 0; i < chk_leng; i++) {
		if (chk_obj[i].checked == true) {
			checked += 1;
		}
	}
	if (checked < 3) {
		alert("항목을 3개 선택해주세요.");
		return;
	}
}

// 정해진 개수 이상 체크 불가.
var count = 0;
function check_q1(chk_obj) {
	if (chk_obj.checked == true) {
		count++;
		$("#checked").text(count);
	} else {
		count--;
	}
	if (count <= 30) {
		return true;
	} else {
		count--;
		return false;
	}
}

function check(obj, condition, n) {
	if (condition == false) {
		obj.checked = false;
		alert(n + "개를 초과 선택 불가합니다.");
	}
}

//------------------- 마지막 NEXT 버튼 클릭 ---------------------
$(function() {
$('#step5').click(function() {
	
	// topic 값 넣기
	var topic = "";
	$("input[name=topics]:checked").each(function() {
		topic += $(this).val() + ',';
	});
	topic = topic.substr(0, topic.length -1);
	$('#topic').val(topic);

	console.log('id : ' + $('input[name=user_id]').val());
	console.log('name : ' + $('input[name=name]').val());
	console.log('birth : ' + $('input[name=birth]').val());
	console.log('gender : ' + $('input[name=gender]:checked').val());
	console.log('password : ' + $('input[name=password]').val());
	console.log('email : ' + $('input[name=email]').val());
	console.log('photo : ');
	console.log('country : ' + $('input[name=country]').val());
	console.log('city : ' + $('input[name=city]').val());
	console.log('timezone: ' + $('input[name=timezone]').val());
	console.log('lat : ' + $('input[name=lat]').val());
	console.log('lon : ' + $('input[name=lon]').val());
	console.log('flag : ' + $('input[name=flag]').val());
	console.log('language1 : ' + $('#language1 option:selected').val());
	console.log('language2 : ' + $('#language2').val());
	console.log('language2_level : ' + $('#language2_level option:selected').val());
	console.log('topic : ' + $('#topic').val());								
	
	//frm.submit();
	
	});
});
	
	
</script>
<body>
	<!-- Pageloader -->
	<div class="pageloader"></div>
	<div class="infraloader is-active"></div>
	<div class="signup-wrapper">
		<div class="fake-nav">
			<a href="home.do" class="logo"> <img
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
						<i data-feather="lock"></i>
					</div>
					<div id="step-dot-2" class="dot is-second" data-step="25">
						<i data-feather="map"></i>
					</div>
					<div id="step-dot-3" class="dot is-third" data-step="50">
						<i data-feather="user"></i>
					</div>
					<div id="step-dot-4" class="dot is-fourth" data-step="75">
						<i data-feather="image"></i>
					</div>
					<div id="step-dot-5" class="dot is-fifth" data-step="100">
						<i data-feather="flag"></i>
					</div>
				</div>
			</div>
		</div>
		<!-------------- 페이지별 헤더 ------------------->
		<div class="outer-panel">
			<div class="outer-panel-inner">
				<div class="process-title">
					<h2 id="step-title-1" class="step-title is-active"
						style="margin-top: 5%">시작해볼까요?</h2>
					<h2 id="step-title-2" class="step-title">위치를 공유해주세요.</h2>
					<h2 id="step-title-3" class="step-title" style="margin-top: 5%">관심있는
						언어와 주제를 선택해주세요.</h2>
					<h2 id="step-title-4" class="step-title">당신을 표현할 사진을 골라주세요.</h2>
					<h2 id="step-title-5" class="step-title">환영합니다!</h2>
				</div>

				<form:form id="frm" action="userJoin.do" modelAttribute="UsersVO" method="post">

					<!-------------- 페이지1 아이디/이메일 입력 ------------------->
					<div id="signup-panel-1"
						class="process-panel-wrap is-narrow is-active">
						<div class="form-panel">
							<div style="display: flex">
								<div class="field block">
									<label>ID</label>
									<div class="control">
										<form:input class="input" path="user_id"
											placeholder="아이디를 입력하세요" />
									</div>
								</div>
								<button class="button is-solid dark-grey-button raised"
									id="idCheck" type="button" value="unChecked">중복확인</button>
							</div>
							<div style="display: flex">
								<div class="field block">
									<label>NAME</label>
									<div class="control">
										<form:input class="input" path="name"
											placeholder="사용할 닉네임을 입력하세요" />
									</div>
								</div>
								<button class="button is-solid dark-grey-button raised"
									id="nameCheck" type="button" value="unChecked">중복확인</button>
							</div>
							<div class="field block">
								<label>BIRTH</label>
								<div class="gender">
									<input type="date" id="birth" name="birth">
								</div>
							</div>
							<div class="field block">
								<label>GENDER</label>
								<div class="gender">
									<form:radiobutton path="gender" value="M" label="남" />
									<form:radiobutton path="gender" value="W" label="여" />
									<form:radiobutton path="gender" value="O" label="기타" />
								</div>
							</div>
							<div class="field block">
								<label>PASSWORD</label>
								<div class="control">
									<form:password class="input" path="password"
										placeholder="비밀번호를 입력하세요" />
								</div>
							</div>
							<div class="field block">
								<label>PASSWORD CHECK</label>
								<div class="control">
									<input type="password" class="input" id="pw2" name="pw2"
										placeholder="비밀번호를 재입력하세요">
								</div>
							</div>
							<div style="display: flex">
								<div class="field block">
									<label>EMAIL</label>
									<div class="control">
										<form:input class="input" path="email"
											placeholder="이메일을 입력하세요" />
									</div>
								</div>
								<button class="button is-solid dark-grey-button raised"
									id="emailCheck" type="button" value="unChecked">코드발송</button>
							</div>
							<div>
								<div style="display: flex">
									<div class="field block">
										<div class="control">
											<input type="text" class="input" id="inputCode"
												placeholder="인증코드를 입력하세요">
										</div>
									</div>
									<button class="button is-solid dark-grey-button raised"
										id="codeCheck" type="button" value="unChecked">코드확인</button>
								</div>
							</div>
						</div>
						<div class="buttons">
							<a class="button process-button" href="home.do">Home</a>
							<a class="button process-button is-next" data-step="step-dot-2" id="step2">Next</a>
						</div>
					</div>

					<!-------------- 페이지2 위치 입력 ------------------->
					<script>
						function getLocation() {
							$.getJSON("https://api.ipregistry.co/?key=f3cmlbb66kf0ewyi",function(json) {
								console.log(json);

								// 변수 담기
								var country = json['location']['country']['name'];
								var city = json['location']['region']['name'];
								var time = json['time_zone']['current_time'];
								var timezone = json['time_zone']['id'];
								var lat = json['location']['latitude'];
								var lon = json['location']['longitude'];
								var flag = json['location']['country']['flag']['emojitwo'];

								// input에 값 넣기
								$("#country").val(country);
								$("#city").val(city);
								$("#timezone").val(timezone);
								$("#lat").val(lat);
								$("#lon").val(lon);
								$("#flag").val(flag);

								// 화면에 출력할 시간 계산
								var hour = time.substr(11, 2);
								var min = time.substr(14, 2);
								var time2 = (hour % 12 || 12)
										+ ':'
										+ min.toString()
												.padStart(2,
														'0')
										+ (hour < 12 ? ' A'
												: ' P') + 'M';
								var gmt = time.substr(19, 6);

								$("#city2").text(city);
								$("#country2").text(
										', ' + country);
								$("#time2").text(time2);
								$("#gmt").text(
										' (GMT' + gmt + ')');

								initMap(lat, lon);
							});
						};

						// 지도
						function initMap(lat, lon) {
							const city = {
								lat : lat,
								lng : lon
							};
							const map = new google.maps.Map(document
									.getElementById("map"), {
								zoom : 6,
								center : city,
								mapTypeControl : false,
								streetViewControl : false,
							});
							const marker = new google.maps.Marker({
								position : city,
								map : map,
							});
						};
					</script>

					<div id="signup-panel-2" class="process-panel-wrap is-narrow">
						<div align="center">
							<a class="button is-solid accent-button raised"
								onclick="getLocation()">위치확인</a>
						</div>
						<br>
						<form:hidden path="city" />
						<form:hidden path="country" />
						<form:hidden path="timezone" />
						<form:hidden path="lat" />
						<form:hidden path="lon" />
						<form:hidden path="flag" />
						<div class="form-panel" style="display: flex;">
							<div id="map"></div>
							<script async
								src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD523dZdQiMvJDOsNySdn1RdQlA_7g5DM&callback=initMap"></script>
							<div style="margin: auto 10px auto 10px;">
								<span id="city2"></span><span id="country2"></span><br> <span
									id="time2"></span><span id="gmt"></span>
							</div>
						</div>
						<div class="buttons">
							<a class="button process-button" data-step="step-dot-1">Back</a>
							<a class="button process-button is-next" data-step="step-dot-3" id="step3">Next</a>
						</div>
					</div>

					<!-------------- 페이지3 언어/관심사 입력 ------------------->
					<div id="signup-panel-3" class="process-panel-wrap is-narrow">
						<div class="form-panel">
							<div class="dropbox" style="text-align: center;">
								<div class="control" style="display: inline-grid; margin: 1rem;">
									<b><label>Native</label></b> 
									<select name="language1" id="language1" onchange="language(this.options[this.selectedIndex].text)" style="width: 100px; font-size: 12pt;">
										<option value="" selected hidden="hidden">Native</option>
										<option value="KR">Korean</option>
										<option value="EN">English</option>
									</select>
								</div>
								<div class="control" style="display: inline-grid; margin: 1rem;">
									<b><label>Learn</label></b>
									<form:input path="language2" readonly="true"
										style="font-size: 12pt; width: 100px;" />
									<select name="language2_level" id="language2_level"
										style="width: 100px; font-size: 12pt;">
										<option value="" selected hidden="hidden">Level</option>
										<option value="1">Beginner</option>
										<option value="2">Elementary</option>
										<option value="3">Intermediate</option>
										<option value="4">Advanced</option>
										<option value="5">Proficient</option>
									</select>
								</div>
							</div>
							<div>
								<br>
								<div class="topic-label">
									<div class="left">
										<label><b>Topics of Interest</b></label>
									</div>
									<div class="right">
										( <span id="checked">0</span> / 30)
									</div>
								</div>
								<div class="topic-list">
									<c:forEach items="${topiclist }" var="vo">
										<input class="text-nicelabel" name="topics"
											data-nicelabel='{"checked_text": "${vo.kr }", "unchecked_text": "${vo.kr }"}'
											type="checkbox" value="${vo.topic_id }"
											onclick="check(this,check_q1(this),30);">
									</c:forEach>
									<script>
										$('input').nicelabel({});
									</script>
								</div>
							</div>
						</div>
						<form:hidden path="topic"/>
						<div class="buttons">
							<a class="button process-button" data-step="step-dot-2">Back</a>
							<a class="button process-button is-next" data-step="step-dot-4" id="step4">Next</a>
						</div>
					</div>
				</form:form>
				
				
					<!-------------- 페이지4 사진 입력 ------------------->
					<div id="signup-panel-4" class="process-panel-wrap is-narrow">
                    <div class="form-panel">
                        <div class="photo-upload">
                            <div class="preview">
                                <a class="upload-button">
                                    <i data-feather="plus"></i>
                                </a>
                                <img id="upload-preview" src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/avatar-w.png" alt="">
                                <form id="profile-pic-dz" name="profile-pic-dz" class="dropzone is-hidden" action="/"></form>
                            </div>
                            <div class="limitation">
                                <small>Only images with a size lower than 3MB are allowed.</small>
                            </div>
                        </div>
                    </div>

                    <div class="buttons">
                        <a class="button process-button" data-step="step-dot-3">Back</a>
                        <a class="button process-button is-next" data-step="step-dot-5" id="step5">Next</a>
                    </div>
					</div>				

				<!-------------- 페이지5 완료 ------------------->
				<div id="signup-panel-5" class="process-panel-wrap is-narrow">
					<div class="form-panel">
						<img class="success-image"
							src="resources/template/assets/img/illustrations/signup/mailbox.svg"
							alt="">
						<div class="success-text">
							<h3>계정이 성공적으로 생성되었습니다.</h3>
							<a id="signup-finish" class="button is-fullwidth">HOME</a>
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

	<!-- Signup page js -->
	<script src="resources/template/assets/js/signup.js"></script>

</body>

</html>