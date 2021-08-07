<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<style>

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

.cover-bg .avatar .avatar-flag {
    position: absolute;
    bottom: 0;
    left: inherit;
    height: 40px;
    width: 40px;
    border-radius: 50%;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    box-shadow: 0 14px 26px -12px rgb(61 112 178 / 42%), 0 4px 23px 0px rgb(0 0 0 / 12%), 0 8px 10px -5px rgb(61 112 178 / 20%) !important;
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

.language_label > span {
	letter-spacing: -0.4rem;
}

.profile-subheader .subheader-start, .profile-subheader .subheader-end { width: auto; }

.subheader-end > a {
    font-size: 1rem;
    margin: 0 0.5rem 0 0;
}

.profile-subheader .subheader-start span:nth-child(odd) {
	display: table-cell;
    font-family: "Montserrat",sans-serif;
	text-transform: uppercase;
    font-size: .8rem;
    font-weight: 500;
    color: #999;
}

.profile-subheader .subheader-start span:nth-child(even) {
	display: table-cell;
	font-size: 1.2rem;
    font-family: "Montserrat",sans-serif;
    color: #393a4f;
    padding: 0 1rem 0 0.5rem;
}

.box-heading { min-height: 56px; }

.info-row div { display: contents }

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

.follow-area a{
	font-size: 1rem !important;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/template/assets/js/moment.js"></script>
<script src="resources/template/assets/js/moment-timezone-with-data.js"></script>

<script>
$(document).ready(function() {
	initMap();
	//지도 출력
	function initMap() {
		var lat = Number($('#lat').val());
		var lon = Number($('#lon').val());
		const city = { lat: lat, lng: lon};
	    const map = new google.maps.Map(document.getElementById("map"), {
	      zoom: 7,
	      center: city,
	      mapTypeControl: false,
	      streetViewControl: false,
	    });
	    const marker = new google.maps.Marker({
	      position: city,
	      map: map,
	    });
    
		// 시간출력
		var date = new Date();
		var a = moment.tz(date, $('#timezone').val());
		$('#localTime').text(a.format('LT'));

		// 언어 레벨 
		var level = Number($('#level').val());
		var result = "";
			switch(level) {
			  case 1 : 
			    result = "◼◻◻◻◻";
			    break;
			  case 2 :
				result = "◼◼◻◻◻";
			    break;
			  case 3 : 
				result = "◼◼◼◻◻";
			    break;
			  case 4 : 
				result = "◼◼◼◼◻";
			    break;
			  case 5 :
				result = "◼◼◼◼◼";
			    break;
			}
		$('#language2_level').text(result);
		};
});

// 팔로잉 리스트 ajax
$(function(){
	$('#followingList').on('click', function (){
		var user_id = $('#user_id').val();
		$.ajax({
			url: '${pageContext.request.contextPath}/followingList.do',
	    	type:'post',
	    	data:{user_id : user_id},
			success: function(result) {
				$('.profile-contents').html(result);
			}
		});
	});
});

// 팔로워 리스트 ajax
$(function(){
	$('#followerList').on('click', function (){
		var user_id = $('#user_id').val();
		$.ajax({
			url: '${pageContext.request.contextPath}/followerList.do',
	    	type:'post',
	    	data:{user_id : user_id},
			success: function(result) {
				$('.profile-contents').html(result);
			}
		});
	});
});


// 팔로우 언팔로우 버튼
$('body').on('click', '#follow-btn',  function() {
	follow(true);
});

$('body').on('click', '#unfollow-btn',  function() {
	follow(false);
});


let followerCnt = ${followerCnt}
function follow(check) {
	var profile_id = $('#user_id').val();
	if(check) {
    	$.ajax({
	    	url:'${pageContext.request.contextPath}/follow.do',
	    	type:'post',
	    	data:JSON.stringify({following : profile_id}),
		    contentType : "application/json; charset=UTF-8",
	    	success: function(result) {
	    		console.log("result : " + result);
	    		if(result === "FollowOK") {
	    			$(".follow-area").remove("#follow-btn");
	    			$(".follow-area").html('<a class="button" id="unfollow-btn">Unfollow</a>');
	    			followerCnt = followerCnt + 1
	    			$("#followerCnt").html(followerCnt);
	    		}
	    	}
		}); // end of follow ajax
	} else {
    	$.ajax({
	    	url:'${pageContext.request.contextPath}/unfollow.do',
	    	type:'post',
	    	data:JSON.stringify({following : profile_id}),
		    contentType : "application/json; charset=UTF-8",
	    	success: function(result) {
	    		console.log("result : " + result);
	    		if(result === "UnFollowOK") {
	    			$(".follow-area").remove("#unfollow-btn");
	    			$(".follow-area").html('<a class="button" id="follow-btn">Follow</a>');
	    			followerCnt = followerCnt - 1
	    			$("#followerCnt").html(followerCnt);
	    		}
	    	}
		}); // end of unfollow ajax
	}; // end of if
};

</script>
<body>
        <!-- Container -->
        <div class="container is-custom">
            <!-- Profile page main wrapper -->
            <div id="profile-main" class="view-wrap is-headless">
                <div class="columns is-multiline no-margin">
                    <!-- Left side column -->
                    <div class="column is-paddingless">
                        <!-- Timeline Header -->
                        <!-- html/partials/pages/profile/timeline/timeline-header.html -->
                        <div class="cover-bg">
                            <div id="map"></div>
                            <div class="location-info is-hidden-mobile">
                            	<span>${profile.city }, ${profile.country }&nbsp;</span><span id="localTime"></span>
                            </div>
                           	<input type="text" id="lat" value="${profile.lat }" hidden="hidden" />
                            <input type="text" id="lon" value="${profile.lon }" hidden="hidden" />
                            <input type="text" id="timezone" value="${profile.timezone }" hidden="hidden" />
                            <input type="text" id="level" value="${profile.language2_level }" hidden="hidden" />
                            <input type="text" id="user_id" value="${profile.user_id }" hidden="hidden" />
                            <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD523dZdQiMvJDOsNySdn1RdQlA_7g5DM&callback=initMap"></script>
                            <div class="avatar">
                                <img id="user-avatar" class="avatar-image" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="">
                                <div class="avatar-flag">
                                	<img src="${profile.flag}">
                                </div>
                                <div class="pop-button is-far-left has-tooltip modal-trigger" data-modal="change-profile-pic-modal" data-placement="right" data-title="Change profile picture">
                                    <a class="inner">
                                        <i data-feather="camera"></i>
                                    </a>
                                </div>
                                <div id="follow-pop" class="pop-button pop-shift is-left has-tooltip" data-placement="top" data-title="Subscription">
                                    <a class="inner">
                                        <i class="inactive-icon" data-feather="bell"></i>
                                        <i class="active-icon" data-feather="bell-off"></i>
                                    </a>
                                </div>
                                <div id="invite-pop" class="pop-button pop-shift is-center has-tooltip" data-placement="top" data-title="Relationship">
                                    <a href="#" class="inner">
                                        <i class="inactive-icon" data-feather="plus"></i>
                                        <i class="active-icon" data-feather="minus"></i>
                                    </a>
                                </div>
                                <div id="chat-pop" class="pop-button is-right has-tooltip" data-placement="top" data-title="Chat">
                                    <a class="inner">
                                        <i data-feather="message-circle"></i>
                                    </a>
                                </div>
                                <div class="pop-button is-far-right has-tooltip" data-placement="right" data-title="Send message">
                                    <a href="messages-inbox.html" class="inner">
                                        <i data-feather="mail"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
						<div class="box-heading" style="display: block; margin-bottom: 15px;">
                        <div class="profile-menu is-hidden-mobile" style="min-height: 43px;">
                            <div class="menu-start">
                           		<c:if test="${user.user_id eq profile.user_id }">
	                                <a href="profile-main.html" style="color: #999 !important; font-size: 0.85rem;">
	                                	<img src="resources/template/assets/img/logo/stamp.png" style="width:35px; vertical-align: middle">
	                               	 	MY STAMP <span class="menu-badge">${profile.stamp }</span>
	                                </a>
                           		</c:if>
                            </div>
                        </div>
                        
                        <div class="profile-subheader">
                            <div class="subheader-start is-hidden-mobile" style="display: table">
                                <span>Post</span>
                                <span>${postCnt }</span>
                                <a id="followingList">
	                                <span>Following</span>
	                                <span id="followingCnt">${followingCnt }</span>
                                </a>
                                <a id="followerList">
                                	<span>Followers</span>
                                	<span id="followerCnt">${followerCnt }</span>
                                </a>
                            </div>
                            <div class="subheader-middle" style="position: absolute; left: 50%; transform: translate(-50%);">
                                <h2>${profile.name}</h2>
                            </div>
                            <div class="subheader-end is-hidden-mobile" style="display: flex">
                            	<div class="language_label">
	                            	<div>${profile.language1}&nbsp;&nbsp;⇆&nbsp;&nbsp;${profile.language2 }</div>
    	                        	<span>◼◼◼◼◼</span>&nbsp;&nbsp;
    	                        	<span id="language2_level"></span>
                            	</div>
                            	<c:choose>
                            		<c:when test="${user.user_id eq profile.user_id }">
		                                <a class="button is-solid primary-button">✍🏻 Edit Profile</a>
                            		</c:when>
                            		<c:otherwise>
		                                <a class="button is-solid primary-button">✍🏻 Write a letter</a>
		                                <div class="follow-area">
		                                	<c:choose>
			                                	<c:when test="${followCheck > 0}">
				                               		<a class="button" id="unfollow-btn">Unfollow</a>
			                               		</c:when>
		                                		<c:otherwise>
				                               		<a class="button" id="follow-btn">Follow</a>
		                                		</c:otherwise>
		                                	</c:choose>
		                                </div>
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                          </div>
                        </div>
                    </div>
                </div>

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
                                        <span class="info"><fmt:formatDate value="${profile.reg_date }" pattern="YYYY/MM/dd" /></span>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>프로필 수정일</span>
                                        <span class="info"><fmt:formatDate value="${profile.edit_dt }" pattern="YYYY/MM/dd" /></span>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>생일</span>
                                        <span class="info"><fmt:formatDate value="${profile.birth }" pattern="YYYY/MM/dd" /></span>
                                    </div>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>성별</span>
                                        <span class="info">
	                                        <c:if test="${profile.gender eq 'M'}">남성</c:if>
	                                        <c:if test="${profile.gender eq 'W'}">여성</c:if>
	                                        <c:if test="${profile.gender eq 'O'}">기타</c:if>
                                        </span>
                                    </div>
                                </div>
                                <div class="info-row" style="display: block">
                                    <div>
                                        <h4>About me</h4>
										<span class="info" style="color:#6d6d6d !important">${profile.profile }</span>
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
		                                <c:choose>
		                            		<c:when test="${user.user_id eq profile.user_id }">
				                                <c:forEach items="${mytopic }" var="vo">
													<span class="label-round">${vo.kr }</span>
												</c:forEach>
		                            		</c:when>
		                            		<c:otherwise>
												<c:set var="userTopic" value="${user.topic}," />
													<c:forEach items="${mytopic }" var="vo">
														<c:set var="topic" value="${vo.topic_id }," />
															<span class="label-round <c:if test='${fn:contains(userTopic,topic)}'>matched</c:if>">${vo.kr }</span>
													</c:forEach>
		                            		</c:otherwise>
		                            	</c:choose>
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
										<c:forEach items="${mytrip }" var="vo">					
												<span class="label-round">${vo.visited }</span>
										</c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					<!---------------------피드영역--------------------------->
                    <div class="column is-7">
                        <div id="profile-timeline-posts" class="box-heading">
                            <h4>Posts</h4>
                        </div>

                        <div class="profile-timeline">

                            <!-- Timeline post 1 -->
                            <!-- html/partials/pages/profile/posts/timeline-post1.html -->
                            <!-- Timeline POST #1 -->
                            <div class="profile-post">
                                <!-- Post -->
                                <div class="card is-post">
                                    <!-- Main wrap -->
                                    <div class="content-wrap">
                                        <!-- Header -->
                                        <div class="card-heading">
                                            <div class="user-block">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                </div>
                                                <div class="user-info">
                                                    <a href="#">Jenna Davis</a>
                                                    <span class="time">October 17 2018, 11:03am</span>
                                                </div>
                                            </div>

                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                <div>
                                                    <div class="button">
                                                        <i data-feather="more-vertical"></i>
                                                    </div>
                                                </div>
                                                <div class="dropdown-menu" role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bookmark"></i>
                                                                <div class="media-content">
                                                                    <h3>Bookmark</h3>
                                                                    <small>Add this post to your bookmarks.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bell"></i>
                                                                <div class="media-content">
                                                                    <h3>Notify me</h3>
                                                                    <small>Send me the updates.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <hr class="dropdown-divider">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="flag"></i>
                                                                <div class="media-content">
                                                                    <h3>Flag</h3>
                                                                    <small>In case of inappropriate content.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Header -->

                                        <!-- Post body -->
                                        <div class="card-body">
                                            <!-- Post body text -->
                                            <div class="post-text">
                                                <p>Today i visited this amazing little fashion store in Church street. Everything is handmade, from skirts
                                                    to bags. Their products really have an outstanding quality. If you don't know them already, well
                                                    it's time to make your move!
                                                    <p>
                                            </div>
                                            <!-- Featured image -->
                                            <div class="post-image">
                                                <a data-fancybox="profile-post1" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/8.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/8.jpg">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/8.jpg" alt="">
                                                </a>
                                                <!-- Post actions -->
                                                <div class="like-wrapper">
                                                    <a href="javascript:void(0);" class="like-button">
                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
                                                        <span class="like-overlay"></span>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-share">
                                                    <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                        <i data-feather="link-2"></i>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-comment">
                                                    <a href="javascript:void(0);" class="small-fab">
                                                        <i data-feather="message-circle"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post body -->

                                        <!-- Post footer -->
                                        <div class="card-footer">
                                            <!-- Followers -->
                                            <div class="likers-group">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" data-user-popover="7" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="">
                                            </div>
                                            <div class="likers-text">
                                                <p>
                                                    <a href="#">Milly</a>,
                                                    <a href="#">David</a>
                                                </p>
                                                <p>and 1 more liked this</p>
                                            </div>
                                            <!-- Post statistics -->
                                            <div class="social-count">
                                                <div class="likes-count">
                                                    <i data-feather="heart"></i>
                                                    <span>32</span>
                                                </div>
                                                <div class="shares-count">
                                                    <i data-feather="link-2"></i>
                                                    <span>4</span>
                                                </div>
                                                <div class="comments-count">
                                                    <i data-feather="message-circle"></i>
                                                    <span>5</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post footer -->
                                    </div>
                                    <!-- /Main wrap -->

                                    <!-- Comments -->
                                    <div class="comments-wrap is-hidden">
                                        <!-- Header -->
                                        <div class="comments-heading">
                                            <h4>Comments
                                                <small>(5)</small></h4>
                                            <div class="close-comments">
                                                <i data-feather="x"></i>
                                            </div>
                                        </div>
                                        <!-- Header -->

                                        <!-- Comments body -->
                                        <div class="comments-body has-slimscroll">

                                            <!-- Comment -->
                                            <div class="media is-comment">
                                                <!-- User image -->
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/bobby.jpg" data-user-popover="8" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Bobby Brown</a>
                                                    <span class="time">1 hour ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris consequat.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>1</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                    <!-- Nested Comment -->
                                                    <div class="media is-comment">
                                                        <!-- User image -->
                                                        <div class="media-left">
                                                            <div class="image">
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Daniel Wellington</a>
                                                            <span class="time">3 minutes ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>4</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                                <div>
                                                                    <div class="button">
                                                                        <i data-feather="more-vertical"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="dropdown-menu" role="menu">
                                                                    <div class="dropdown-content">
                                                                        <a class="dropdown-item">
                                                                            <div class="media">
                                                                                <i data-feather="x"></i>
                                                                                <div class="media-content">
                                                                                    <h3>Hide</h3>
                                                                                    <small>Hide this comment.</small>
                                                                                </div>
                                                                            </div>
                                                                        </a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a href="#" class="dropdown-item">
                                                                            <div class="media">
                                                                                <i data-feather="flag"></i>
                                                                                <div class="media-content">
                                                                                    <h3>Report</h3>
                                                                                    <small>Report this comment.</small>
                                                                                </div>
                                                                            </div>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /Nested Comment -->
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                        <div>
                                                            <div class="button">
                                                                <i data-feather="more-vertical"></i>
                                                            </div>
                                                        </div>
                                                        <div class="dropdown-menu" role="menu">
                                                            <div class="dropdown-content">
                                                                <a class="dropdown-item">
                                                                    <div class="media">
                                                                        <i data-feather="x"></i>
                                                                        <div class="media-content">
                                                                            <h3>Hide</h3>
                                                                            <small>Hide this comment.</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                                <div class="dropdown-divider"></div>
                                                                <a href="#" class="dropdown-item">
                                                                    <div class="media">
                                                                        <i data-feather="flag"></i>
                                                                        <div class="media-content">
                                                                            <h3>Report</h3>
                                                                            <small>Report this comment.</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Comment -->

                                            <!-- Comment -->
                                            <div class="media is-comment">
                                                <!-- User image -->
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/mike.jpg" data-user-popover="12" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Mike Lasalle</a>
                                                    <span class="time">Yesterday</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>3</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                    <!-- Nested Comment -->
                                                    <div class="media is-comment">
                                                        <!-- User image -->
                                                        <div class="media-left">
                                                            <div class="image">
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/lana.jpeg" data-user-popover="10" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Lana Henrikssen</a>
                                                            <span class="time">3 minutes ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>4</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                                <div>
                                                                    <div class="button">
                                                                        <i data-feather="more-vertical"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="dropdown-menu" role="menu">
                                                                    <div class="dropdown-content">
                                                                        <a class="dropdown-item">
                                                                            <div class="media">
                                                                                <i data-feather="x"></i>
                                                                                <div class="media-content">
                                                                                    <h3>Hide</h3>
                                                                                    <small>Hide this comment.</small>
                                                                                </div>
                                                                            </div>
                                                                        </a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a href="#" class="dropdown-item">
                                                                            <div class="media">
                                                                                <i data-feather="flag"></i>
                                                                                <div class="media-content">
                                                                                    <h3>Report</h3>
                                                                                    <small>Report this comment.</small>
                                                                                </div>
                                                                            </div>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /Nested Comment -->
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                        <div>
                                                            <div class="button">
                                                                <i data-feather="more-vertical"></i>
                                                            </div>
                                                        </div>
                                                        <div class="dropdown-menu" role="menu">
                                                            <div class="dropdown-content">
                                                                <a class="dropdown-item">
                                                                    <div class="media">
                                                                        <i data-feather="x"></i>
                                                                        <div class="media-content">
                                                                            <h3>Hide</h3>
                                                                            <small>Hide this comment.</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                                <div class="dropdown-divider"></div>
                                                                <a href="#" class="dropdown-item">
                                                                    <div class="media">
                                                                        <i data-feather="flag"></i>
                                                                        <div class="media-content">
                                                                            <h3>Report</h3>
                                                                            <small>Report this comment.</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Comment -->

                                            <!-- Comment -->
                                            <div class="media is-comment">
                                                <!-- User image -->
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Nelly Schwartz</a>
                                                    <span class="time">2 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>1</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                        <div>
                                                            <div class="button">
                                                                <i data-feather="more-vertical"></i>
                                                            </div>
                                                        </div>
                                                        <div class="dropdown-menu" role="menu">
                                                            <div class="dropdown-content">
                                                                <a class="dropdown-item">
                                                                    <div class="media">
                                                                        <i data-feather="x"></i>
                                                                        <div class="media-content">
                                                                            <h3>Hide</h3>
                                                                            <small>Hide this comment.</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                                <div class="dropdown-divider"></div>
                                                                <a href="#" class="dropdown-item">
                                                                    <div class="media">
                                                                        <i data-feather="flag"></i>
                                                                        <div class="media-content">
                                                                            <h3>Report</h3>
                                                                            <small>Report this comment.</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Comment -->
                                        </div>
                                        <!-- Comments body -->

                                        <!-- Comments footer -->
                                        <div class="card-footer">
                                            <div class="media post-comment has-emojis">
                                                <!-- Textarea -->
                                                <div class="media-content">
                                                    <div class="field">
                                                        <p class="control">
                                                            <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                        </p>
                                                    </div>
                                                    <!-- Additional actions -->
                                                    <div class="actions">
                                                        <div class="image is-32x32">
                                                            <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                        </div>
                                                        <div class="toolbar">
                                                            <div class="action is-auto">
                                                                <i data-feather="at-sign"></i>
                                                            </div>
                                                            <div class="action is-emoji">
                                                                <i data-feather="smile"></i>
                                                            </div>
                                                            <div class="action is-upload">
                                                                <i data-feather="camera"></i>
                                                                <input type="file">
                                                            </div>
                                                            <a class="button is-solid primary-button raised">Post Comment</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comments footer -->
                                    </div>
                                    <!-- /Comments -->
                                </div>
                                <!-- /Post -->
                            </div>
                            <!-- /Timeline POST #3 -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Profile page main wrapper -->
        </div>
        <!-- /Container -->

        <!-- Change profile pic modal -->
        <!--html/partials/pages/profile/timeline/modals/change-profile-pic-modal.html-->
        <div id="change-profile-pic-modal" class="modal change-profile-pic-modal is-medium has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">

                <div class="card">
                    <div class="card-heading">
                        <h3>Update Profile Picture</h3>
                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- Placeholder -->
                        <div class="selection-placeholder">
                            <div class="columns">
                                <div class="column is-6">
                                    <!-- Selection box -->
                                    <div class="selection-box modal-trigger" data-modal="upload-crop-profile-modal">
                                        <div class="box-content">
                                            <img src="assets/img/illustrations/profile/change-profile.svg" alt="">
                                            <div class="box-text">
                                                <span>Upload</span>
                                                <span>From your computer</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="column is-6">
                                    <!-- Selection box -->
                                    <div class="selection-box modal-trigger" data-modal="user-photos-modal">
                                        <div class="box-content">
                                            <img src="assets/img/illustrations/profile/upload-profile.svg" alt="">
                                            <div class="box-text">
                                                <span>Choose</span>
                                                <span>From your photos</span>
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
        <!-- Profile picture crop modal -->
        <!--html/partials/pages/profile/timeline/modals/upload-crop-profile-modal.html-->
        <div id="upload-crop-profile-modal" class="modal upload-crop-profile-modal is-xsmall has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">

                <div class="card">
                    <div class="card-heading">
                        <h3>Upload Picture</h3>
                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                        </div>
                    </div>
                    <div class="card-body">
                        <label class="profile-uploader-box" for="upload-profile-picture">
                            <span class="inner-content">
                                    <img src="assets/img/illustrations/profile/add-profile.svg" alt="">
                                    <span>Click here to <br>upload a profile picture</span>
                            </span>
                            <input type="file" id="upload-profile-picture" accept="image/*">
                        </label>
                        <div class="upload-demo-wrap is-hidden">
                            <div id="upload-profile"></div>
                            <div class="upload-help">
                                <a id="profile-upload-reset" class="profile-reset is-hidden">Reset Picture</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button id="submit-profile-picture" class="button is-solid accent-button is-fullwidth raised is-disabled">Use Picture</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- Share modal -->
        <!-- /partials/pages/feed/modals/share-modal.html -->
        <div id="share-modal" class="modal share-modal is-xsmall has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">

                <div class="card">
                    <div class="card-heading">
                        <div class="dropdown is-primary share-dropdown">
                            <div>
                                <div class="button">
                                    <i class="mdi mdi-format-float-left"></i> <span>Share in your feed</span> <i
                                            data-feather="chevron-down"></i>
                                </div>
                            </div>
                            <div class="dropdown-menu" role="menu">
                                <div class="dropdown-content">
                                    <div class="dropdown-item" data-target-channel="feed">
                                        <div class="media">
                                            <i class="mdi mdi-format-float-left"></i>
                                            <div class="media-content">
                                                <h3>Share in your feed</h3>
                                                <small>Share this publication on your feed.</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-item" data-target-channel="friend">
                                        <div class="media">
                                            <i class="mdi mdi-account-heart"></i>
                                            <div class="media-content">
                                                <h3>Share in a friend's feed</h3>
                                                <small>Share this publication on a friend's feed.</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-item" data-target-channel="group">
                                        <div class="media">
                                            <i class="mdi mdi-account-group"></i>
                                            <div class="media-content">
                                                <h3>Share in a group</h3>
                                                <small>Share this publication in a group.</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-item" data-target-channel="page">
                                        <div class="media">
                                            <i class="mdi mdi-file-document-box"></i>
                                            <div class="media-content">
                                                <h3>Share in a page</h3>
                                                <small>Share this publication in a page.</small>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="dropdown-divider">
                                    <div class="dropdown-item" data-target-channel="private-message">
                                        <div class="media">
                                            <i class="mdi mdi-email-plus"></i>
                                            <div class="media-content">
                                                <h3>Share in message</h3>
                                                <small>Share this publication in a private message.</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                        </div>
                    </div>
                    <div class="share-inputs">
                        <div class="field is-autocomplete">
                            <div id="share-to-friend" class="control share-channel-control is-hidden">
                                <input id="share-with-friend" type="text" class="input is-sm no-radius share-input simple-users-autocpl" placeholder="Your friend's name">
                                <div class="input-heading">
                                    Friend :
                                </div>
                            </div>
                        </div>

                        <div class="field is-autocomplete">
                            <div id="share-to-group" class="control share-channel-control is-hidden">
                                <input id="share-with-group" type="text" class="input is-sm no-radius share-input simple-groups-autocpl" placeholder="Your group's name">
                                <div class="input-heading">
                                    Group :
                                </div>
                            </div>
                        </div>

                        <div id="share-to-page" class="control share-channel-control no-border is-hidden">
                            <div class="page-controls">
                                <div class="page-selection">

                                    <div class="dropdown is-accent page-dropdown">
                                        <div>
                                            <div class="button page-selector">
                                                <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/hanzo.svg" alt=""> <span>Css Ninja</span> <i
                                                        data-feather="chevron-down"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <div class="dropdown-item">
                                                    <div class="media">
                                                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/hanzo.svg" alt="">
                                                        <div class="media-content">
                                                            <h3>Css Ninja</h3>
                                                            <small>Share on Css Ninja.</small>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="dropdown-item">
                                                    <div class="media">
                                                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/icons/logos/nuclearjs.svg" alt="">
                                                        <div class="media-content">
                                                            <h3>NuclearJs</h3>
                                                            <small>Share on NuclearJs.</small>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="dropdown-item">
                                                    <div class="media">
                                                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/icons/logos/slicer.svg" alt="">
                                                        <div class="media-content">
                                                            <h3>Slicer</h3>
                                                            <small>Share on Slicer.</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="alias">
                                    <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/jenna.png" alt="">
                                </div>
                            </div>
                        </div>

                        <div class="field is-autocomplete">
                            <div id="share-to-private-message" class="control share-channel-control is-hidden">
                                <input id="share-with-private-message" type="text" class="input is-sm no-radius share-input simple-users-autocpl" placeholder="Message a friend">
                                <div class="input-heading">
                                    To :
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="control">
                            <textarea class="textarea comment-textarea" rows="1" placeholder="Say something about this ..."></textarea>
                            <button class="emoji-button">
                                <i data-feather="smile"></i>
                            </button>
                        </div>
                        <div class="shared-publication">
                            <div class="featured-image">
                                <img id="share-modal-image" src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/1.jpg" alt="">
                            </div>
                            <div class="publication-meta">
                                <div class="inner-flex">
                                    <img id="share-modal-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="">
                                    <p id="share-modal-text">Yesterday with <a href="#">@Karen Miller</a> and <a href="#">@Marvin Stemperd</a> at the
                                        <a href="#">#Rock'n'Rolla</a> concert in LA. Was totally fantastic! People were really
                                        excited about this one!</p>
                                </div>
                                <div class="publication-footer">
                                    <div class="stats">
                                        <div class="stat-block">
                                            <i class="mdi mdi-earth"></i>
                                            <small>Public</small>
                                        </div>
                                        <div class="stat-block">
                                            <i class="mdi mdi-eye"></i>
                                            <small>163 views</small>
                                        </div>
                                    </div>
                                    <div class="publication-origin">
                                        <small>Friendkit.io</small>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="bottom-share-inputs">

                        <div id="action-place" class="field is-autocomplete is-dropup is-hidden">
                            <div id="share-place" class="control share-bottom-channel-control">
                                <input type="text" class="input is-sm no-radius share-input simple-locations-autocpl" placeholder="Where are you?">
                                <div class="input-heading">
                                    Location :
                                </div>
                            </div>
                        </div>

                        <div id="action-tag" class="field is-autocomplete is-dropup is-hidden">
                            <div id="share-tags" class="control share-bottom-channel-control">
                                <input id="share-friend-tags-autocpl" type="text" class="input is-sm no-radius share-input" placeholder="Who are you with">
                                <div class="input-heading">
                                    Friends :
                                </div>
                            </div>
                            <div id="share-modal-tag-list" class="tag-list no-margin"></div>
                        </div>

                    </div>
                    <div class="card-footer">
                        <div class="action-wrap">
                            <div class="footer-action" data-target-action="tag">
                                <i class="mdi mdi-account-plus"></i>
                            </div>
                            <div class="footer-action" data-target-action="place">
                                <i class="mdi mdi-map-marker"></i>
                            </div>
                            <div class="footer-action dropdown is-spaced is-neutral dropdown-trigger is-up" data-target-action="permissions">
                                <div>
                                    <i class="mdi mdi-lock-clock"></i>
                                </div>
                                <div class="dropdown-menu" role="menu">
                                    <div class="dropdown-content">
                                        <a href="#" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="globe"></i>
                                                <div class="media-content">
                                                    <h3>Public</h3>
                                                    <small>Anyone can see this publication.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="users"></i>
                                                <div class="media-content">
                                                    <h3>Friends</h3>
                                                    <small>only friends can see this publication.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="user"></i>
                                                <div class="media-content">
                                                    <h3>Specific friends</h3>
                                                    <small>Don't show it to some friends.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <hr class="dropdown-divider">
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="lock"></i>
                                                <div class="media-content">
                                                    <h3>Only me</h3>
                                                    <small>Only me can see this publication.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="button-wrap">
                            <button type="button" class="button is-solid dark-grey-button close-modal">Cancel</button>
                            <button type="button" class="button is-solid primary-button close-modal">Publish</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
</body>
</html>