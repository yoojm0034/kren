<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm" var="today" />
<style>
@font-face {
    font-family: 'ONE-Mobile-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	font-family:'ONE-Mobile-Regular';
}
h5:hover {
	cursor: pointer;
	color: silver;
}
.navbar-v1{
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

</style>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script type="text/javascript">
	var sock = null;

	$(document).ready(function() {
		connectWs();
		$.ajax({
		    url: '${pageContext.request.contextPath}/pushSelectList.do',
		    type: 'POST',
		    dataType:'json',
		    success: function (data) {
		    	console.log(data)
		    	for(i=0 ; i < data.length ; i++) {
							    		
		    		 if(data[i].type == 'reply') {
					        var rep = "<h5 id='clickUpdatePush' data-id='"+data[i].push_id+"'" +"data-fid='"+data[i].content_id+"'data-type='"+data[i].type+"'>" + data[i].user_id + "님이 " + data[i].content_id + " 번 게시글에 댓글을 남겼습니다.</h5>"
					        var div = $('<div class="media"></div>');
					        var div2 = $('<div class="media-content"></div>');
					        var h3 = $('<h5></h5>');
					        var small = $('<small></small>');
					        var div3 = $('<div class="media-right is-centered"></div>');
					        var div4 = $('<div class="added-icon"></div>');
					        var icon = $('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>'); //아이콘적용이안됨 댓글아이콘
					        div4.append(icon);
					        div3.append(div4);
					        h3.append(rep);
					        small.append(timeForToday(data[i].push_dt));
					        div2.append(h3);
					        div2.append(small);
					        div.append(div2);
					        div.append(div3);
					        $('#replyA').append(div);
				     }
		    		 else if(data[i].type == 'follow') {
					     	var fol = "<h5 id='clickUpdatePush' data-id='"+data[i].push_id+"'" +"data-uid='"+data[i].user_id+"'data-type='"+data[i].type+"'>" + data[i].user_id + "님이 " + data[i].to_id + "님을 팔로우합니다.</h5>"
					     	var div = $('<div class="media"></div>');
					        var div2 = $('<div class="media-content"></div>');
					        var h3 = $('<h5></h5>');
					        var small = $('<small></small>');
					        var div3 = $('<div class="media-right is-centered"></div>');
					        var div4 = $('<div class="added-icon"></div>');
					        var icon = $('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>');
					        div4.append(icon);
					        div3.append(div4);
					        h3.append(fol);
					        small.append(timeForToday(data[i].push_dt));
					        div2.append(h3);
					        div2.append(small);
					        div.append(div2);
					        div.append(div3);
					        $('#replyA').append(div);
					 }
		    		 else if(data[i].type == 'like') {
					     	var lik = "<h5 id='clickUpdatePush' data-id='"+data[i].push_id+"'" +"data-fid='"+data[i].content_id+"'data-type='"+data[i].type+"'>" + data[i].user_id + "님이 " + data[i].content_id + " 번 게시글을 좋아합니다.</h5>"
					     	var div = $('<div class="media"></div>');
					        var div2 = $('<div class="media-content"></div>');
					        var h3 = $('<h5></h5>');
					        var small = $('<small></small>');
					        var div3 = $('<div class="media-right is-centered"></div>');
					        var div4 = $('<div class="added-icon"></div>');
					        var icon = $('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>');
					        div4.append(icon);
					        div3.append(div4);
					        h3.append(lik);
					        small.append(timeForToday(data[i].push_dt))
					        div2.append(h3);
					        div2.append(small);
					        div.append(div2);
					        div.append(div3);
					        $('#replyA').append(div);
					 }
		    		 else if(data[i].type == 'letter') {
					     	var letter = "<h5 id='clickUpdatePush' data-id='"+data[i].push_id+"'" +"data-uid='"+data[i].user_id+"'data-type='"+data[i].type+"'>" + data[i].user_id + "님으로부터 " + data[i].to_id + "님에게 편지가 오고 있습니다.</h5>"
					     	var div = $('<div class="media"></div>');
					        var div2 = $('<div class="media-content"></div>');
					        var h3 = $('<h5></h5>');
					        var small = $('<small></small>');
					        var div3 = $('<div class="media-right is-centered"></div>');
					        var div4 = $('<div class="added-icon"></div>');
					        var icon = $('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>');
					        div4.append(icon);
					        div3.append(div4);
					        h3.append(letter);
					        small.append(timeForToday(data[i].push_dt));
					        div2.append(h3);
					        div2.append(small);
					        div.append(div2);
					        div.append(div3);
					        $('#replyB').append(div);
					 }
		    	}
		        
		    }
		});
		$('body').on('click', '#clickUpdatePush',  function() {
			var id = $(this).data('id');
			var uid = $(this).data('uid');
			var fid = $(this).data('fid');
			var type = $(this).data('type');
			$.ajax({
				url: '${pageContext.request.contextPath}/pushUpdate.do',
			    type: 'POST',
			    data: {'push_id' : id},
			    success: function (data) {
			    		if(data > 0) {
			    			console.log("데이터 전송이 성공적으로 끝났을 때 실행");
			    			if(type == 'follow') {
			    				location.href = "${pageContext.request.contextPath}/profile.do?user_id="+uid
			    			}else if(type == 'reply' || type == 'like') {
			    				location.href = "${pageContext.request.contextPath}/feed.do?feed_id="+fid
			    			}else if(type == 'letter') {
			    				location.href = "${pageContext.request.contextPath}/letterBox.do"
			    			}
				            
			    		}
			            
			        }
			});
		});
	});

	
	function connectWs() {
		sock = new SockJS("${pageContext.request.contextPath}/echo");
		//sock = new SockJS("http://192.168.0.76/FinalPrj/echo");
		
		sock.onopen = function() {
			console.log('info: connection opened.');
			
		};
		sock.onmessage = function(evt) {
			var data = evt.data;
			console.log(data);
			$('#test').html(data);
			var div = $('<div class="media"></div>');
	        var div2 = $('<div class="media-content"></div>');
	        var h3 = $('<h3></h3>');
	        var small = $('<small></small>');
	        var div3 = $('<div class="media-right is-centered"></div>');
	        var div4 = $('<div class="added-icon"></div>');
	        if(data.includes('편지')) {
	        	var icon = $('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>');
	        }else if(data.includes('댓글')) {
	        	var icon = $('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>'); //아이콘적용이안됨 댓글아이콘
	        }else if(data.includes('좋아')) {
	        	var icon = $('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>');
	        }else if(data.includes('팔로우')) {
	        	var icon = $('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>');
	        }
	        div4.append(icon);
	        div3.append(div4);
	        h3.append(data);
	        small.append(timeForToday('${now}'))
	        div2.append(h3);
	        div2.append(small);
	        div.append(div2);
	        div.append(div3);
	        if(data.includes('편지')) {
	        	$('#replyB').prepend(div);
	        	toastr.options.escapeHtml = true;
				toastr.options.closeButton = true;
				toastr.options.newestOnTop = false;
				toastr.options.progressBar = true;
				toastr.info('편지가 오고있습니다.','알림', {timeOut: 6000});
	        }else{
	        	$('#replyA').prepend(div);
	        	toastr.options.escapeHtml = true;
				toastr.options.closeButton = true;
				toastr.options.newestOnTop = false;
				toastr.options.progressBar = true;
				toastr.info('알림을 확인하세요.','알림', {timeOut: 6000});
	        }
			
			
		};

		sock.onclose = function() {
			console.log('connect close');
			/* setTimeout(function(){conntectWs();} , 1000); */
		};

		sock.onerror = function(err) {
			console.log('Errors : ', err);
		};

	}
	function sendTextPush(target, seq) {
		//댓글
		var user = "${user.user_id}";
		var sendData = 'reply,'+user+','+target+','+seq ;
		console.log(sendData)
		sock.send(sendData);
	}
	function sendLetterPush(target) {
		//편지
		var user = "${user.user_id}";
		var sendData = 'letter,'+user+','+target;
		console.log(sendData)
		sock.send(sendData);
	}
	function sendLikePush(target, seq) {
		//좋아요 누를시 작동
		var user = "${user.user_id}";
		var sendData = 'like,'+user+','+target+','+seq ;
		console.log(sendData)
		sock.send(sendData);
	}
	function sendFollowPush(target) {
		var user = "${user.user_id}";
		var sendData = 'follow,'+user+','+target ;
		console.log(sendData)
		sock.send(sendData);
		
	}
	function timeForToday(value) {
        const today = new Date();
        const timeValue = new Date(value);

        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) return '방금전';
        if (betweenTime < 60) {
            return betweenTime+'분전';
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return betweenTimeHour+'시간전';
        }

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return betweenTimeDay+'일전';
        }

        return '방금전';
 	}
</script>
<!-- Pageloader -->
<div class="pageloader"></div>
<div class="infraloader is-active"></div>
<div class="app-overlay"></div>

<div id="main-navbar"
	class="navbar navbar-v1 is-inline-flex is-transparent no-shadow is-hidden-mobile">
	<div class="container is-fluid">
		<div class="navbar-brand">
			<c:if test="${empty user.user_id}">
				<a href="${pageContext.request.contextPath}/home.do" class="navbar-item"> 
					<img class="logo light-image" src="${pageContext.request.contextPath}/resources/template/assets/img/logo/logo2.png"> 
					<img class="logo dark-image" src="${pageContext.request.contextPath}/resources/template/assets/img/logo/logo2.png">
				</a>
			</c:if>
			<c:if test="${not empty user.user_id}">
				<a href="${pageContext.request.contextPath}/feed.do" class="navbar-item"> 
					<img class="logo light-image" src="${pageContext.request.contextPath}/resources/template/assets/img/logo/logo2.png"> 
					<img class="logo dark-image" src="${pageContext.request.contextPath}/resources/template/assets/img/logo/logo2.png">
				</a>
			</c:if>
		</div>
		<div class="navbar-menu">
			<!-- 네비바 왼쪽 -->
			<div class="navbar-start">
				<ul>
					<li class="is-active"><a href="${pageContext.request.contextPath}/feed.do">피드</a></li>
					<li><a href="${pageContext.request.contextPath}/friendSearch.do">친구찾기</a></li>
					<li><a href="${pageContext.request.contextPath}/letterBox.do">편지</a></li>
					<li><a href="${pageContext.request.contextPath}/aboutus.do">ABOUT US</a></li>
				</ul>
			</div>
			<div class="navbar-end">

				<div class="navbar-item">
					<div id="global-search" class="control">
						<input id="tipue_drop_input" class="input is-rounded" type="text"
							placeholder="Search" required> <span id="clear-search"
							class="reset-search"> <i data-feather="x"></i>
						</span> <span class="search-icon"> <i data-feather="search"></i>
						</span>

						<div id="tipue_drop_content" class="tipue-drop-content"></div>
					</div>

				</div>

				<div class="navbar-start">
					<!-- Navbar Search -->
					<!-- 알람아이콘 -->
					<div class="navbar-item is-icon drop-trigger">
						<a class="icon-link" href="javascript:void(0);">
						 <i data-feather="bell"></i> 
						 <span class="indicator"></span>
						</a>

						<div class="nav-drop is-account-dropdown">
							<div class="inner" >
								<div class="nav-drop-header">
									<span>Notifications</span> <a href="#"> <i
										data-feather="bell"></i>
									</a>
								</div>
								<div class="nav-drop-body is-notifications" id="replyA" style="overflow:scroll;height:200px;">
								</div>
								<div class="nav-drop-footer">
									<a href="#">View All</a>
								</div>
							</div>
						</div>
					</div>

					<!-- 메시지 아이콘 -->
					<div class="navbar-item is-icon drop-trigger">
						<a class="icon-link" href="javascript:void(0);"> <i
							data-feather="mail"></i> <span class="indicator"></span>
						</a>
						<div class="nav-drop is-account-dropdown">
							<div class="inner">
								<div class="nav-drop-header">
									<span>Messages</span> <a href="${pageContext.request.contextPath}/letterBox.do">Inbox</a>
								</div>
								<div class="nav-drop-body is-friend-requests" id="replyB" style="overflow:scroll;height:200px;">
								</div>
								<div class="nav-drop-footer">
									<a href="#">Clear All</a>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- 로그인유저 -->
				<div id="account-dropdown"
					class="navbar-item is-account drop-trigger has-caret">
					<div class="user-image">
						<img src="https://via.placeholder.com/400x400"
							data-demo-src="assets/img/avatars/jenna.png" alt="">
					</div>
					<span style="padding-left: 10px; padding-right: 20px;">${user.name }</span>

					<div class="nav-drop is-account-dropdown">
						<div class="inner">
							<div class="nav-drop-header">
								<span class="username">${user.name }</span> <label
									class="theme-toggle"> <input type="checkbox"> <span
									class="toggler"> <span class="dark"> <i
											data-feather="moon"></i>
									</span> <span class="light"> <i data-feather="sun"></i>
									</span>
								</span>
								</label>
							</div>
							<div class="nav-drop-body account-items">
								<c:if test="${user.user_id ne 'admin'}">								
								<a id="profile-link" href="${pageContext.request.contextPath}/profile.do?user_id=${user.user_id}"
									class="account-item">
									<div class="media">
										<div class="media-left">
											<div class="image">
												<img src="https://via.placeholder.com/400x400"
													data-demo-src="assets/img/avatars/jenna.png" alt="">
											</div>
										</div>
										<div class="media-content">
											<h3>${user.name }</h3>
											<small>Main account</small>
										</div>
										<div class="media-right">
											<i data-feather="check"></i>
										</div>
									</div>
								</a>
									<a href="/options-settings.html" class="account-item">
									<div class="media">
										<div class="icon-wrap">
											<i data-feather="settings"></i>
										</div>
										<div class="media-content">
											<small>Access widget settings.</small>
										</div>
									</div>
								</a> 
								<a class="account-item">
									<div class="media">
										<div class="icon-wrap">
											<i data-feather="life-buoy"></i>
										</div>
										<div class="media-content">
											<h3>Help</h3>
											<small>Contact our support.</small>
										</div>
									</div>
								</a> 	
								</c:if>
								<c:if test="${user.user_id eq 'admin'}">
								<a id="profile-link" href="${pageContext.request.contextPath}/admin/admin.do"
									class="account-item">
									<div class="media">
										<div class="media-left">
											<div class="image">
												<img src="https://via.placeholder.com/400x400" alt="">
											</div>
										</div>
										<div class="media-content">
											<h3>${user.name }</h3>
											<small>Admin Page</small>
										</div>
										<div class="media-right">
											<i data-feather="check"></i>
										</div>
									</div>
								</a>
								</c:if>
								<hr class="account-divider">
							
								<a class="account-item">
									<div class="media">
										<div class="icon-wrap">
											<i data-feather="power"></i>
										</div>
										<div class="media-content">
											<a href="${pageContext.request.contextPath}/logout"><h3>Log out</h3></a>
											<small>Log out from your account.</small>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모바일메뉴 -->
<nav class="navbar mobile-navbar is-hidden-desktop" aria-label="main navigation">
	<!-- Brand -->
	<div class="navbar-brand">
		<a class="navbar-item" href="home.do"> 
			<img class="light-image" src="${pageContext.request.contextPath}/resources/template/assets/img/logo/logo2.png" alt="">
			<img class="dark-image" src="${pageContext.request.contextPath}/resources/template/assets/img/logo/logo2.png" alt="">
		</a>
		<div style="position: absolute; right: 3rem; display: inherit;">
		<div id="open-mobile-search" class="navbar-item is-icon">
			<a class="icon-link is-primary" href="javascript:void(0);"> <i
				data-feather="search"></i>
			</a>
		</div>
		<div class="navbar-item is-icon drop-trigger">
			<a class="icon-link" href="javascript:void(0);"> <i
				data-feather="bell"></i> <span class="indicator"></span>
			</a>
			
			<div class="nav-drop">
				<div class="inner">
					<div class="nav-drop-header">
						<span>Notifications</span> <a href="#"> <i data-feather="bell"></i>
						</a>
					</div>
					<div class="nav-drop-body is-notifications">
						<!-- Notification -->
						<div class="media">
							<figure class="media-left">
								<p class="image">
									<img src="https://via.placeholder.com/300x300"
										data-demo-src="assets/img/avatars/david.jpg" alt="">
								</p>
							</figure>
							<div class="media-content">
								<span><a href="#">David Kim</a> commented on <a href="#">your
										post</a>.</span> <span class="time">30 minutes ago</span>
							</div>
							<div class="media-right">
								<div class="added-icon">
									<i data-feather="message-square"></i>
								</div>
							</div>
						</div>
						<!-- Notification -->
						<div class="media">
							<figure class="media-left">
								<p class="image">
									<img src="https://via.placeholder.com/300x300"
										data-demo-src="assets/img/avatars/daniel.jpg" alt="">
								</p>
							</figure>
							<div class="media-content">
								<span><a href="#">Daniel Wellington</a> liked your <a
									href="#">profile.</a></span> <span class="time">43 minutes ago</span>
							</div>
							<div class="media-right">
								<div class="added-icon">
									<i data-feather="heart"></i>
								</div>
							</div>
						</div>
						<!-- Notification -->
						<div class="media">
							<figure class="media-left">
								<p class="image">
									<img src="https://via.placeholder.com/300x300"
										data-demo-src="assets/img/avatars/stella.jpg" alt="">
								</p>
							</figure>
							<div class="media-content">
								<span><a href="#">Stella Bergmann</a> shared a <a
									href="#">New video</a> on your wall.</span> <span class="time">Yesterday</span>
							</div>
							<div class="media-right">
								<div class="added-icon">
									<i data-feather="youtube"></i>
								</div>
							</div>
						</div>
						<!-- Notification -->
						<div class="media">
							<figure class="media-left">
								<p class="image">
									<img src="https://via.placeholder.com/300x300"
										data-demo-src="assets/img/avatars/elise.jpg" alt="">
								</p>
							</figure>
							<div class="media-content">
								<span><a href="#">Elise Walker</a> shared an <a href="#">Image</a>
									with you an 2 other people.</span> <span class="time">2 days
									ago</span>
							</div>
							<div class="media-right">
								<div class="added-icon">
									<i data-feather="image"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="nav-drop-footer">
						<a href="#">View All</a>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar-item is-icon drop-trigger">
			<a class="icon-link" href="javascript:void(0);"> <i
				data-feather="mail"></i> <span class="indicator"></span>
			</a>

			<div class="nav-drop">
				<div class="inner">
					<div class="nav-drop-header">
						<span>Messages</span> <a href="messages-inbox.html">Inbox</a>
					</div>
					<div class="nav-drop-body is-friend-requests">
						<!-- Message -->
						<div class="media">
							<figure class="media-left">
								<p class="image">
									<img src="https://via.placeholder.com/150x150"
										data-demo-src="assets/img/avatars/nelly.png"
										data-user-popover="9" alt="">
								</p>
							</figure>
							<div class="media-content">
								<a href="#">Nelly Schwartz</a> <span>I think we should
									meet near the Starbucks so we can get...</span> <span class="time">Yesterday</span>
							</div>
							<div class="media-right is-centered">
								<div class="added-icon">
									<i data-feather="message-square"></i>
								</div>
							</div>
						</div>
						<!-- Message -->
						<div class="media">
							<figure class="media-left">
								<p class="image">
									<img src="https://via.placeholder.com/150x150"
										data-demo-src="assets/img/avatars/edward.jpeg"
										data-user-popover="5" alt="">
								</p>
							</figure>
							<div class="media-content">
								<a href="#">Edward Mayers</a> <span>That was a real
									pleasure seeing you last time we really should...</span> <span
									class="time">last week</span>
							</div>
							<div class="media-right is-centered">
								<div class="added-icon">
									<i data-feather="message-square"></i>
								</div>
							</div>
						</div>
						<!-- Message -->
						<div class="media">
							<figure class="media-left">
								<p class="image">
									<img src="https://via.placeholder.com/150x150"
										data-demo-src="assets/img/avatars/dan.jpg"
										data-user-popover="1" alt="">
								</p>
							</figure>
							<div class="media-content">
								<a href="#">Dan Walker</a> <span>Hey there, would it be
									possible to borrow your bicycle, i really need...</span> <span
									class="time">Jun 03 2018</span>
							</div>
							<div class="media-right is-centered">
								<div class="added-icon">
									<i data-feather="message-square"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="nav-drop-footer">
						<a href="#">Clear All</a>
					</div>
				</div>
			</div>
		</div>
		</div>
	
		<!-- Mobile menu toggler icon -->
		<div class="navbar-burger">
			<span></span> <span></span> <span></span>
		</div>
	</div>
	<!-- Navbar mobile menu -->
	<div class="navbar-menu">
		<!-- Account -->
		<div class="navbar-item has-dropdown is-active">
			<a href="/navbar-v1-profile-main.html" class="navbar-link"> <img
				src="https://via.placeholder.com/150x150"
				data-demo-src="assets/img/avatars/jenna.png" alt=""> <span
				class="is-heading">Jenna Davis</span>
			</a>

			<!-- Mobile Dropdown -->
			<div class="navbar-dropdown">
				<a href="/navbar-v1-feed.html" class="navbar-item is-flex is-mobile-icon">
					<span><i data-feather="activity"></i>Feed</span> <span class="menu-badge">87</span>
				</a>
				<a href="/navbar-v1-videos-home-v2.html" class="navbar-item is-flex is-mobile-icon">
					<span><i data-feather="icon-users"></i>Friends</span> <span class="menu-badge">21</span>
				</a>
				<a href="/navbar-v1-profile-friends.html" class="navbar-item is-flex is-mobile-icon"> 
					<span><i data-feather="icon-envelope-o"></i>Letter</span> <span class="menu-badge">3</span>
				</a>
				<a href="/navbar-v1-profile-main.html" class="navbar-item is-flex is-mobile-icon"> 
					<span><i data-feather="user"></i>Profile</span>
				</a>
				<a href="/navbar-v1-ecommerce-cart.html" class="navbar-item is-flex is-mobile-icon">
					<span><i data-feather="shopping-cart"></i>Cart</span> <span class="menu-badge">3</span>
				</a>
				<a href="#" class="navbar-item is-flex is-mobile-icon"> 
					<span><i data-feather="bookmark"></i>Bookmarks</span>
				</a>
			</div>
		</div>

		<!-- More -->
		<div class="navbar-item has-dropdown">
			<a href="/navbar-v1-settings.html" class="navbar-link"> <i
				data-feather="user"></i> <span class="is-heading">Account</span>
			</a>

			<!-- Mobile Dropdown -->
			<div class="navbar-dropdown">
				<a href="#" class="navbar-item is-flex is-mobile-icon"> <span><i
						data-feather="life-buoy"></i>Support</span>
				</a> <a href="/navbar-v1-settings.html"
					class="navbar-item is-flex is-mobile-icon"> <span><i
						data-feather="settings"></i>Settings</span>
				</a> <a href="#" class="navbar-item is-flex is-mobile-icon"> <span><i
						data-feather="log-out"></i>Logout</span>
				</a>
			</div>
		</div>
	</div>
	<!--Search-->
	<div class="mobile-search is-hidden">
		<div class="control">
			<input id="tipue_drop_input_mobile" class="input"
				placeholder="Search...">
			<div class="close-icon">
				<i data-feather="x"></i>
			</div>
			<div id="tipue_drop_content_mobile" class="tipue-drop-content"></div>
		</div>
	</div>
</nav>