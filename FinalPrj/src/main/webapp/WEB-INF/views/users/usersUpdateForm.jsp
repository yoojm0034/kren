<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/core.css">
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
	margin-left: auto;
	height: 25px;
	font-size: 1rem;
	font-weight: 500;
	padding: 7px;
	line-height: 1.3;
	min-width: 22px;
	text-align: center;
	border-radius: 100px;
	background: #e5e5e5;
	color: #393a4f;
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
	font-size: 14px !important;
	padding: 6px 15px 10px 15px;
	background-color: #EFEFEF;
	color: #979797 !important;
	border-radius: 2rem;
	margin: 0px 0px 6px 0px;
}

.matched {
	background-color: #5596e6 !important;
	color: #FFF !important;
}

.follow-area a {
	font-size: 1rem !important;
}

.view-wrapper {
	padding: 80px 12px;
}

.friends-wrapper {
	position: relative;
	margin: 0 auto;
	top: 0px;
	padding: 0;
	min-height: auto;
}

.friend-name {
	font-size: 1.2rem;
	color: #393a4f !important;
	font-weight: 600;
}

.friend-location {
	color: #9b9b9b;
	font-size: 0.85rem;
}
</style>
<script>
	//팔로우 언팔로우 버튼
	$('body').on('click', '#friend-follow-btn', function() {
		var friend = $(this).val();
		follow(true, friend);
	});

	$('body').on('click', '#friend-unfollow-btn', function() {
		var friend = $(this).val();
		follow(false, friend);
	});

	function follow(check, friend) {
		if (check) {
			$.ajax({
				url : '${pageContext.request.contextPath}/follow.do',
				type : 'post',
				data : JSON.stringify({
					following : friend
				}),
				contentType : "application/json; charset=UTF-8",
				success : function(result) {
					console.log("result : " + result);
					if (result === "FollowOK") {
						console.log(friend);
						// 팔로우버튼 지우고 언팔로우 버튼 달기
						$('.' + friend + '-follow-area').empty();
						$('.' + friend + '-follow-area').html('<button class="button" id="friend-unfollow-btn" value="' + friend + '">Unfollow</button>');
					}
				}
			}); // end of follow ajax
		} else {
			$.ajax({
				url : '${pageContext.request.contextPath}/unfollow.do',
				type : 'post',
				data : JSON.stringify({
					following : friend
				}),
				contentType : "application/json; charset=UTF-8",
				success : function(result) {
					console.log("result : " + result);
					if (result === "UnFollowOK") {
						console.log(friend);
						// 언팔로우 버튼 지우고 팔로우버튼 갈기
						$('.' + friend + '-follow-area').empty();
						$('.' + friend + '-follow-area').html('<button class="button" id="friend-follow-btn" value="' + friend + '">follow</button>');
					}
				}
			}); // end of unfollow ajax
		}
		; // end of if
	};
</script>
<div style="padding: 0px 12px 0px 12px;">
	<div class="container is-custom">
		<div id="profile-main" class="view-wrap is-headless">
			<div class="columns profile-contents">
					<div id="profile-timeline-widgets" class="column is-5">
                        <!-- Basic Infos widget -->
                        <!-- html/partials/pages/profile/timeline/widgets/basic-infos-widget.html -->
                        <div class="box-heading">
                            <h4>Basic Infos</h4>
                        </div>
                        <div class="basic-infos-wrapper">
                            <div class="card is-profile-info">
                                <div class="info-row">
                                    <div>
                                        <span>가입일</span>
                                        <span class="info">2021/08/02</span>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>프로필 수정일</span>
                                        <span class="info">2021/08/02</span>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>생일</span>
                                        <span class="info">1993/08/15</span>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>성별</span>
                                        <span class="info">
	                                        남성
	                                        
	                                        
                                        </span>
                                    </div>
                                </div>
                                <div class="info-row" style="display: block">
                                    <div>
                                        <h4>About me</h4>
										<span class="info" style="color:#6d6d6d !important"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 관심사 -->
                        <div class="box-heading">
                            <h4>Topics of Interest</h4>
                        </div>
                        <div class="friend-cards-list">
                            <div class="card is-friend-card">
                                <div class="friend-item">
                                    <div class="text-content">
		                                
		                            		
				                                
													<span class="label-round">DIY</span>
												
													<span class="label-round">코딩</span>
												
													<span class="label-round">농인</span>
												
													<span class="label-round">SF</span>
												
													<span class="label-round">지속가능성</span>
												
		                            		
		                            		
		                            	
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Trips widget -->
                        <!-- html/partials/pages/profile/timeline/widgets/trips-widget.html -->
                        <div class="box-heading">
                            <h4>Trips</h4>
                        </div>

                        <div class="trip-cards-list">
                            <div class="card is-trip-card">
                                <div class="trip-item">
                                    <div class="text-content">
															
												<span class="label-round">Portland</span>
															
												<span class="label-round">Victoria</span>
															
												<span class="label-round">Seoul</span>
										
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>
</div>
