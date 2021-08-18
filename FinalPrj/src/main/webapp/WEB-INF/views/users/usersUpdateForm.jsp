<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/core.css">
<link
	href="resources/template/assets/nicelabel/css/jquery-nicelabel.css"
	rel="stylesheet">
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
	font-family: 'ONE-Mobile-Regular';
}

h5:hover {
	cursor: pointer;
	color: silver;
}

.navbar-v1 {
	height: auto;
}

.view-wrapper {
	padding: 80px 12px;
}

.navbar-start ul {
	border: none
}

.navbar-start ul li {
	margin-right: 2rem;
	display: inline-block;
	font-size: 1.3rem;
}

.navbar-start ul li:not(.is-active) a {
	border-color: transparent;
	color: #777;
}

.navbar-start ul li.is-active a {
	color: #5596e6;
	border-color: #5596e6
}

.navbar-start ul li a {
	font-family: 'ONE-Mobile-Regular';
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	padding-top: 0;
	padding-bottom: 0;
	height: 70px;
	border-width: 4px
}

.navbar-v1 .navbar-brand {
	height: 55px;
	margin-left: 5px !important;
	margin-right: 50px;
}

.navbar-v1 .navbar-brand .navbar-item .logo {
	max-height: 58px !important;
}

.mobile-navbar .navbar-brand img {
	-webkit-animation: unset;
}

.navbar-item.is-icon .icon-link svg {
	width: 20px;
	height: 20px;
	stroke: #777;
	stroke-width: 2px;
}

.cover-bg .cover-image {
	max-height: 200px;
}

#map {
	height: 200px;
	width: 100%;
}

.menu-badge {
    height: 30px;
    font-size: 1rem;
    font-weight: 500;
    line-height: 30px;
    text-align: center;
    border-radius: 50%;
    background: #e5e5e5;
    color: #393a4f;
    width: 30px;
    display: inline-block;
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

.img-container .flag {
	position: absolute;
	bottom: 0;
	left: inherit;
	height: 30px;
	width: 30px;
	border-radius: 50%;
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	box-shadow: 0 14px 26px -12px rgb(61 112 178/ 42%), 0 4px 23px 0px
		rgb(0 0 0/ 12%), 0 8px 10px -5px rgb(61 112 178/ 20%) !important;
	transform: rotate(0);
	transition: all .3s;
	cursor: pointer;
	z-index: 1;
}

.location-info {
	position: absolute;
	right: 6%;
	top: 75%;
	text-align: right;
	background-color: #797979c4;
	padding: 6px;
	border-radius: 0.5rem;
	color: white;
}

.language_label {
	width: 150px;
	text-align: left;
	font-family: 'Montserrat';
	color: #4a4a4a;
}

.language_label>span {
	letter-spacing: -0.4rem;
}

.profile-subheader .subheader-start, .profile-subheader .subheader-end {
	width: auto;
}

.subheader-end>a {
	font-size: 1rem;
	margin: 0 0.5rem 0 0;
}

.profile-subheader .subheader-start span:nth-child(odd) {
	display: table-cell;
	font-family: "Montserrat", sans-serif;
	text-transform: uppercase;
	font-size: .8rem;
	font-weight: 500;
	color: #999;
}

.profile-subheader .subheader-start span:nth-child(even) {
	display: table-cell;
	font-size: 1.2rem;
	font-family: "Montserrat", sans-serif;
	color: #393a4f;
	padding: 0 1rem 0 0.5rem;
}

.box-heading {
	min-height: 56px;
}

.info-row div {
	display: contents
}

.info {
	font-size: .9rem !important;
	font-weight: 400;
	color: #999 !important;
}

.label-round {
	display: inline-block !important;
	padding: 6px 15px 10px 15px;
	background-color: #EFEFEF;
	border-radius: 2rem;
	margin: 0px 0px 6px 0px;
}

.label-round input {
	width: 5rem;
	font-size: 14px !important;
	border: none;
	outline: none;
	background-color: transparent;
	color: #979797 !important;
	font-family: 'ONE-Mobile-Regular';
}

.view-wrapper {
	padding: 80px 12px;
}

.field label {
	font-size: .9rem;
	font-weight: 500;
	color: #393a4f;
	width: 25%;
}

.field input {
	width: 75%
}

#profile {
	padding: 0;
	width: 600px;
	height: 200px;
	outline: none;
	border: 0;
	resize: none;
}

.button {
	font-family: 'ONE-Mobile-Regular';
}


.upload-button {
    position: absolute;
    top: 0;
    right: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    height: 36px;
    width: 36px;
    border-radius: 50%;
    border: 3px solid #fff;
    background: #cecece;
    -webkit-transition: all .3s;
    transition: all .3s;
    z-index: 2;
    color: #FFF;
}

.upload-button:hover { background-color: #3d70b2; color: #FFF;}

#deleteBtn { display: inline; cursor: pointer;}

#deleteBtn svg { vertical-align: bottom;}

</style>
<script>
// 페이지 로딩시 DB에 입력되어있는 개수 카운트
$(document).ready(function(){
	//관심사 개수
	var topicCnt = $('input:checkbox[name=topics]:checked').length;
	$("#checkedTopicCnt").text(topicCnt);
	//자기소개 글자수
    var content = $('#profile').val();
    $('#contentCnt').text(content.length);
    //이미지 변경 확인
    var currentphoto = $('#upload-preview').attr("src");
    $('#currentPhoto').val(currentphoto);
});

// 이메일 체크
$(function() {
	$('#emailCheck').click(function() {
		if ($('#email').val() == "") {
			alert('<spring:message code="userJoin.email.blank"/>');
			$('#email').focus();
			return false;
		}
		//email 중복확인 ajax
		$.ajax({
			url : '${pageContext.request.contextPath}/userJoin/userEmailCheck.do',
			data : {
				email : $('#email').val()
			},
			type : 'post',
			success : function(data) {
				if (data > 0) {
					alert('<spring:message code="userJoin.email.inuse"/>');
					$('#email').val('');
					$('#email').focus();
				} else {
					$('#email').attr("readonly", true);
					$('#codeCheck').focus();
					$.ajax({ 	//중복확인 통과후 인증코드 메일보내는 ajax
						url : '${pageContext.request.contextPath}/sendEmail.do',
						data : { email : $('#email').val() },
						type : 'post',
						success : function(code) {
							alert('<spring:message code="userJoin.email.sendmail"/>');
							$('#codeCheck').click(function() { // 성공해서 이메일에서 값을 건네받은 경우에, 인증번호 버튼을 클릭 시 값을 검사
								if ($('#inputCode').val() == code) { // 사용자의 입력값과 sendSMS에서 받은 값이 일치하는 경우
									alert('<spring:message code="userJoin.email.checked"/>');
									$('#codeCheck').val("checked");
								} else {
									alert('<spring:message code="userJoin.email.wrong"/>');
								}
							})
						},
						error : function(err) {
							alert('<spring:message code="errormsg"/>');
						}
					}); // end of code check ajax
				} // end of if
			},
			error : function(err) {
				console.log(err);
			}
		}); // end of 중복확인 ajax
	});
});

//----------------------------------언어 레벨-----------------------------------
function levelChange(e) {
	$("#language2_level").val(e);
};

//----------------------------------위치 조회-----------------------------------
function getLocation() {
	$.getJSON("https://api.ipregistry.co/?key=f3cmlbb66kf0ewyi", function(
			json) {
		console.log(json);

		// 변수 담기
		var country = json['location']['country']['name'];
		var city = json['location']['region']['name'];
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

		$("#city2").text(city);
		$("#country2").text(', ' + country);
	});
};
//----------------------------------About Me-----------------------------------
// 글자수 카운트
$('#profile').keyup(function (e){
    var content = $(this).val();
    $('#contentCnt').text(content.length);
    if (content.length > 1000){
        alert('<spring:message code="usersUpdate.max"/>');
        $(this).val(content.substring(0, 1000));
        $('#contentCnt').text(1000);
    }
});

//----------------------------------TOPIC 카운트-----------------------------------
function getCheckedCnt(obj)  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="topics"]:checked';
	  const selectedElements = document.querySelectorAll(query);
	  
	  // 선택된 목록의 갯수 세기
	  const selectedElementsCnt = selectedElements.length;
	  
	  if (selectedElementsCnt <= 30) {
		  document.getElementById('checkedTopicCnt').innerText
		    = selectedElementsCnt;
	  } else {
		  alert('<spring:message code="userJoin.topic.max"/>');
		  obj.checked = false;
		  selectedElementsCnt -= 1;
	  };
	};

//-------------------------------다녀온 나라--------------------------------------

// 더하기 버튼 누르면 추가
$(function() {
	$('#addBtn').click(function() {
		var add = "";
		add += '<div class="label-round">';
		add += '<input type="text" id="user-visited" value="${vo.visited }">';
		add += '<span id="deleteBtn">';
		add += '\<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><circle cx="12" cy="12" r="10"></circle><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>';
		add += '</span>';
		add += '</div>';
		$('.trip-area').append(add);
	});
});	

// x 누르면 삭제
$('body').on('click', '#deleteBtn', function() {
		$(this).parent().remove();
});

//-------------------------------입력된 조건 확인------------------------------------
function beforeSubmit() {
	if ('${profile.email}' == $("#email").val()) {
		$('#codeCheck').val('checked');
	}
	if ($('#codeCheck').val() == 'unchecked') {
		alert('<spring:message code="userJoin.email.entercode"/>');
		return false;
	}
	if ($("#password").val() == "") {
		alert('<spring:message code="userJoin.password.enter"/>');
		$('#password').focus();
		return false;
	}
	if ($("#password").val() != $("#password2").val()) {
		alert('<spring:message code="userJoin.password.notmatch"/>');
		$('#password').focus();
		return false;
	}
	if (Number($("#checkedTopicCnt").text()) < 3) {
		alert('<spring:message code="userJoin.topic.min"/>');
		return false;
	}
	return true;
}

//-------------------------------제출버튼 클릭--------------------------------------
$(function() {
	$('#saveBtn').click(function() { 
		var result = false;
		
		// 이메일 변경되었는지 비교
			result = beforeSubmit();
			if (result == true) {
				// topic 값 넣기
				var topic = "";
				$("input[name=topics]:checked").each(function() {
					topic += $(this).val() + ',';
				});
				topic = topic.substr(0, topic.length -1);
				$('#topic').val(topic);
				
				// 다녀온 나라 값 넣어주기 
				var leng = $("input[id=user-visited").length;
				var visited = "";
				for (var i=0; i<leng; i++) {
					visited += $("input[id=user-visited").eq(i).val() + ',';
				}
				visited = visited.substr(0, visited.length -1);
				$("#visited").val(visited);
				
				console.log('email : ' + $("#email").val());		
				console.log('emailCode : ' + $("#codeCheck").val());		
				console.log('password : ' + $("#password").val());		
				console.log('level : ' + $("#language2_level").val());
				console.log('country : ' + $("#country").val());
				console.log('city : ' + $("#city").val());
				console.log('timezone: ' + $("#timezone").val());
				console.log('lat : ' + $("#lat").val());
				console.log('lon : ' + $("#lon").val());
				console.log('flag : ' + $("#flag").val());
				console.log('profile : ' + $('#profile').val());
				console.log('topic : ' + $('#topic').val());
				console.log('visited : ' + $("#visited").val());
				
				var src = $('#upload-preview').attr("src");
				
				if ($('#currentPhoto').val() == src){
					//프로필사진 변경안된 경우
					alert("사진 변경 없이 프로필 변경 수행");
					$('#profileUpdate').submit();
				} else {
					//프로필 사진 변경된 경우
	 				//$('#base64Photo').val(src);
					const base64 = src;//'data:image/png;base64,....' // Place your base64 url here.
					fetch(base64)
					.then(res => res.blob())
					.then(blob => {
					  const fd = new FormData(document.profileUpdate);
					  const file = new File([blob], "profile.jpeg");
					  fd.append('base64Photo', file)
					  
					 // Let's upload the file
					 // Don't set contentType manually → https://github.com/github/fetch/issues/505#issuecomment-293064470
					 // form에있는 파일 다 묶어서 컨트롤러로 보낸다.
					 const API_URL = '${pageContext.request.contextPath}/usersUpdate.do'
					 fetch(API_URL, {
						 method: 'POST', 
						 body: fd
						 })
					 .then(res => res.json()) 
					 .then(res => console.log(res))
						alert("정보수정완료");
						window.location.reload(true);
					}); 
				}
	}; // 첫번째 if 끝
});	
});

</script>
<form id="profileUpdate" action="${pageContext.request.contextPath}/usersUpdateNoPhoto.do" name="profileUpdate" method="post">
<div style="padding: 0px 12px 0px 12px;">
	<div class="container is-custom">
		<div id="profile-main" class="view-wrap is-headless">
			<div class="columns profile-contents">
				<div id="profile-timeline-widgets" class="column is-5">
					<input type="hidden" id="country" name="country" value="${profile.country}">
					<input type="hidden" id="city" name="city" value="${profile.city}">
					<input type="hidden" id="lat" name="lat" value="${profile.lat}">
					<input type="hidden" id="lon" name="lon" value="${profile.lon}">
					<input type="hidden" id="timezone" name="timezone" value="${profile.timezone}">
					<input type="hidden" id="flag" name="flag" value="${profile.flag}">
					<input type="hidden" id="visited" name="visited">
					<input type="hidden" id="topic" name="topic">
					<input type="hidden" id="language2_level" name="language2_level" value="${profile.language2_level }">
					<input type="hidden" id="currentPhoto" name="currentPhoto">
					
					<!-- Basic Infos widget -->
					<div class="box-heading">
						<h4><spring:message code="usersUpdate.edit"/></h4>
					</div>
					<div class="basic-infos-wrapper">
						<div class="card is-profile-info">
							<div class="info-row">
								<div class="field">
									<label><spring:message code="usersUpdate.email"/></label>
									<div class="control">
										<input type="text" class="input" id="email" name="email"
											value="${profile.email }" style="width: 220px">
										<button class="button is-solid dark-grey-button" type="button"
											id="emailCheck"><spring:message code="userJoin.email.btn"/></button>
									</div>
								</div>
							</div>
							<div class="info-row">
								<div class="field">
									<label><spring:message code="usersUpdate.code"/></label>
									<div class="control">
										<input type="text" class="input" style="width: 220px"
											id="inputCode" name="inputCode">
										<button class="button is-solid dark-grey-button" type="button"
											id="codeCheck" value="unchecked"><spring:message code="userJoin.email.checkbtn"/></button>
									</div>
								</div>
							</div>
							<div class="info-row">
								<div class="field">
									<label><spring:message code="usersUpdate.password"/></label>
									<div class="control">
										<input type="password" class="input" id="password"
											name="password">
									</div>
								</div>
							</div>
							<div class="info-row">
								<div class="field">
									<label><spring:message code="usersUpdate.password2"/></label>
									<div class="control">
										<input type="password" class="input" id="password2"
											name="password2">
									</div>
								</div>
							</div>
							<div class="info-row">
								<div class="field">
									<label><spring:message code="usersUpdate.language"/></label>
									<div class="control">
										<select name="level" id="level" onchange="levelChange(this.options[this.selectedIndex].value)"
											style="width: 75%; font-size: 12pt;">
											<option value="1"
												<c:if test="${profile.language2_level == 1}">selected</c:if>>Beginner</option>
											<option value="2"
												<c:if test="${profile.language2_level == 2}">selected</c:if>>Elementary</option>
											<option value="3"
												<c:if test="${profile.language2_level == 3}">selected</c:if>>Intermediate</option>
											<option value="4"
												<c:if test="${profile.language2_level == 4}">selected</c:if>>Advanced</option>
											<option value="5"
												<c:if test="${profile.language2_level == 5}">selected</c:if>>Proficient</option>
										</select>
									</div>
								</div>
							</div>
							<div class="info-row" style="justify-content: unset;">
								<div class="field">
									<label><spring:message code="usersUpdate.location"/></label>
									<div class="control">
										<button class="button is-solid dark-grey-button" type="button"
											onclick="getLocation()"><spring:message code="userJoin.getlocation"/></button>
										<span id="city2" style="padding-left: 1rem"></span><span
											id="country2"></span>
									</div>
								</div>
							</div>
						</div>
							<div>
							<button class="button" type="button" onclick="location.href='usersDeleteForm.do'"><spring:message code="btn.deleteAccount"/></button>
							</div>
					</div>
				</div>

				<div class="column is-7">
					<!---------------------- 자기소개 -------------------------->
					<div class="box-heading">
						<div class="left">
							<h4><spring:message code="profile.aboutme"/></h4>
						</div>
						<div class="right">
							(<span id="contentCnt">0</span> / 1000)
						</div>
					</div>
					<div class="friend-cards-list">
						<div class="card is-friend-card">
							<div class="friend-item">
								<div class="text-content">
									<textarea id="profile" name="profile">${profile.profile }</textarea>
								</div>
							</div>
						</div>
					</div>
					<!---------------------- 관심사 -------------------------->
					<div class="box-heading">
						<div class="left">
							<h4><spring:message code="topic"/></h4>
						</div>
						<div class="right">
							(<span id="checkedTopicCnt">0</span> / 30)
						</div>
					</div>
					<div class="friend-cards-list">
						<div class="card is-friend-card">
							<div class="friend-item">
								<div class="topic-list">
									<c:set var="userTopic" value="${user.topic}," />
									<c:forEach items="${topiclist }" var="vo">
										<c:set var="topic" value="${vo.topic_id }," />
										<c:if test="${locale eq 'kr'}">
											<input class="text-nicelabel" name="topics" <c:if test='${fn:contains(userTopic,topic)}'>checked="checked"</c:if>
												data-nicelabel='{"checked_text": "${vo.kr }", "unchecked_text": "${vo.kr }"}'
												type="checkbox" value="${vo.topic_id }"
												onclick="getCheckedCnt(this)">
										</c:if>
										<c:if test="${locale eq 'en'}">
											<input class="text-nicelabel" name="topics" <c:if test='${fn:contains(userTopic,topic)}'>checked="checked"</c:if>
												data-nicelabel='{"checked_text": "${vo.en }", "unchecked_text": "${vo.en }"}'
												type="checkbox" value="${vo.topic_id }"
												onclick="getCheckedCnt(this)">
										</c:if>
									</c:forEach>
									<script>
										$('input').nicelabel({});
									</script>
								</div>
							</div>
						</div>
					</div>
					<!---------------------- 방문한 나라 -------------------------->
					<div class="box-heading">
						<h4><spring:message code="profile.trips"/></h4> <a id="addBtn"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg></a>
					</div>
					<div class="trip-cards-list">
						<div class="card is-trip-card">
							<div class="trip-item">
								<div class="text-content trip-area">
									<c:forEach items="${mytrip }" var="vo">
										<div class="label-round">
										<input type="text" id="user-visited" value="${vo.visited }">
										<span id="deleteBtn">
											<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><circle cx="12" cy="12" r="10"></circle><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>
										</span>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
