<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
#clearA:hover {
	cursor: pointer;
	color: silver;
}
#clearB:hover {
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

.dot {
    position: absolute;
    top: 0;
    right: 0;
    height: 12px;
    min-width: 12px;
    background: #3d70b2;
    border: 2px solid #fff;
    border-radius: 100px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
}

#clickUpdatePush { font-size: 0.9rem; }

.media-content > small { font-size: 0.7rem; color:#cccccc;}

.floating {
	position: fixed;
    z-index: 99;
    bottom: 5%;
    right: 2%;
    border: 1px solid #000000;
    color: #333;
    background: #f4f4f4;
    border-radius: 5px;
    padding: 9px;
    font-size: 0.85rem;
    line-height: 1;
    cursor: pointer;
}

.lang {
	color:#727272;
	cursor: pointer;
}


</style>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script type="text/javascript">
	var sock = null;

	$(document).ready(function() {
		
		//선택된 메뉴 activie 하기 
		var uri = window.location.pathname;
		console.log(uri);
		$("ul").removeClass("*");
		if(uri.includes("feed")){
			$("ul").children().eq(0).addClass("is-active");
		}
		if(uri.includes("friend")){
			$("ul").children().eq(1).addClass("is-active");
		}
		if(uri.includes("letter")){
			$("ul").children().eq(2).addClass("is-active");
		}
		if(uri.includes("about")){
			$("ul").children().eq(3).addClass("is-active");
		}
		if(uri.includes("about")){
			$("ul").children().eq(3).addClass("is-active");
		}
		if(uri.includes("admin")){
			$("ul").children().eq(4).addClass("is-active");
		}
		
		connectWs();
		$.ajax({
		    url: '${pageContext.request.contextPath}/pushSelectList.do',
		    type: 'POST',
		    dataType:'json',
		    success: function (data) {
		    	console.log(data)
		    	for(i=0 ; i < data.length ; i++) {
							    		
		    		 if(data[i].type == 'reply') {
					        var rep = "<h5 id='clickUpdatePush' data-id='"+data[i].push_id+"'" +"data-fid='"+data[i].content_id+"'data-type='"+data[i].type+"'>" + data[i].name + " <spring:message code="push.comment"/></h5>"
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
					     	var fol = "<h5 id='clickUpdatePush' data-id='"+data[i].push_id+"'" +"data-uid='"+data[i].user_id+"'data-type='"+data[i].type+"'>" + data[i].name + " <spring:message code="push.follow"/></h5>"
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
					     	var lik = "<h5 id='clickUpdatePush' data-id='"+data[i].push_id+"'" +"data-fid='"+data[i].content_id+"'data-type='"+data[i].type+"'>" + data[i].name + " <spring:message code="push.like"/></h5>"
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
		    			 	var userid = data[i].name;
					     	var letter = "<h5 id='clickUpdatePush' data-id='"+data[i].push_id+"'" +"data-uid='"+data[i].user_id+"'data-type='"+data[i].type+"'><spring:message code="push.letter" arguments="###"/></h5>"
					     	letter = letter.replace('###',userid);
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
		    	if ($('#replyA').children().html() != null){
		    		$('#clearA').parent().parent().parent().parent().children().eq(0).children().eq(1).addClass("dot");
		    	 }
		    	if ($('#replyB').children().html() != null){
		    		$('#clearB').parent().parent().parent().parent().children().eq(0).children().eq(1).addClass("dot");
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
		
		//push clear 
		$('#clearA').click(function() {
			$.ajax({
				url:'${pageContext.request.contextPath}/deletePushAll.do',
				success: function(data) {
					//인디케이터 지우기
					$('#replyA').children().remove();
					$('#clearA').parent().parent().parent().parent().children().eq(0).children().eq(1).removeClass("dot");
				}
			});
		});
		//push letter clear 
		$('#clearB').click(function() {
			$.ajax({
				url:'${pageContext.request.contextPath}/deleteLetterPushAll.do',
				success: function(data) {
					//인디케이터 지우기
					$('#replyB').children().remove();
					$('#clearB').parent().parent().parent().parent().children().eq(0).children().eq(1).removeClass("dot");
				}
			});
		});
		$('#search').keydown(function() {
			 if (event.keyCode === 13) {
				 if($('#search').val() != '') {
					 searchForm.submit();
				 }
			 };
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
	        	$('#clearB').parent().parent().parent().parent().children().eq(0).children().eq(1).addClass("dot");
	        	toastr.options.escapeHtml = true;
				toastr.options.closeButton = true;
				toastr.options.newestOnTop = false;
				toastr.options.progressBar = true;
				toastr.info('<spring:message code="push.comming"/>','<spring:message code="push.noti"/>', {timeOut: 6000});
	        }else{
	        	$('#replyA').prepend(div);
	        	$('#clearA').parent().parent().parent().parent().children().eq(0).children().eq(1).addClass("dot");
	        	toastr.options.escapeHtml = true;
				toastr.options.closeButton = true;
				toastr.options.newestOnTop = false;
				toastr.options.progressBar = true;
				toastr.info('<spring:message code="push.alert"/>','<spring:message code="push.noti"/>', {timeOut: 6000});
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
        if (betweenTime < 1) return '<spring:message code="time.1"/>';
        if (betweenTime < 60) {
            return betweenTime+'<spring:message code="time.2"/>';
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return betweenTimeHour+'<spring:message code="time.3"/>';
        }

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return betweenTimeDay+'<spring:message code="time.4"/>';
        }

        return '<spring:message code="time.1"/>';
 	}
	
	// 언어 선택
	$('body').on('click', '.lang',  function() {
		var search = window.location.search;	// 파라미터 값
		var param = $(this).attr('id');
		// 파라미터 값 없다면
		if (search == "") {
			if(param == 'kr') {
				location.href="?lang=kr"
			} else {
				location.href="?lang=en"
			}
		}
		
		// 이미 lang 값 있을때 바꿔주기
		if (search.includes("lang")){
			if(param == 'kr') {
				location.href=search.replace(search.substr(search.length-2,2),'kr');
			} else {
				location.href=search.replace(search.substr(search.length-2,2),'en');
			}
		}
		
		// id파라미터 값 있고 lang값은 없을때
		if (search.includes("id") && !search.includes("lang")){
			if(param == 'kr') {
				location.href=search+"&lang=kr"
			} else {
				location.href=search+"&lang=en"
			}
		}
	});
</script>
<!-- Pageloader -->
<div class="pageloader"></div>
<div class="infraloader is-active"></div>
<div class="app-overlay"></div>
	<c:if test="${user.user_id ne 'admin' }">
		<div class="floating" onclick="location.href='${pageContext.request.contextPath}/userQnaWrite.do'">
			<span style="vertical-align: sub;"><img src="${pageContext.request.contextPath}/resources/template/assets/img/contact.png" width="20px"></span>
			<span><spring:message code="head.contact"/></span>
		</div>
	</c:if>
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
					<li><a href="${pageContext.request.contextPath}/feed.do"><spring:message code="head.feed"/></a></li>
					<li><a href="${pageContext.request.contextPath}/friendSearch.do"><spring:message code="head.friends"/></a></li>
					<li><a href="${pageContext.request.contextPath}/letterBox.do"><spring:message code="head.letter"/></a></li>
					<li><a href="${pageContext.request.contextPath}/userNoticeList.do"><spring:message code="head.notice"/></a></li>
					<c:if test="${user.user_id eq 'admin' }">
						<li><a href="${pageContext.request.contextPath}/admin/admin.do">관리자</a></li>
					</c:if>
				</ul>
			</div>
			<div class="navbar-end">
				<form id="searchForm" action="${pageContext.request.contextPath}/allSearch.do" method="POST">
					<div class="navbar-item" style="padding-top:5%">
						<div id="global-search" class="control">
							<input id="search" name="search" class="input is-rounded" type="text"
								placeholder="Search" required> <span id="clear-search"
								class="reset-search"> <i data-feather="x"></i>
							</span> <span class="search-icon"> <i data-feather="search"></i>
							</span>
	
							<div id="tipue_drop_content" class="tipue-drop-content"></div>
						</div>
	
					</div>
				</form>
				<div class="navbar-start">
					<!-- Navbar Search -->
					<!-- 언어선택 -->
					<div class="navbar-item is-icon drop-trigger">
						<a class="icon-link" href="javascript:void(0);">
						 <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
						</a>
						<div class="nav-drop is-account-dropdown" style="width:150px">
							<div class="inner" >
								<div class="nav-drop-header">
									<span><spring:message code="push.lang"/></span>
								</div>
								<div class="nav-drop-body is-notifications" style="line-height: 2;">	
									<span class="lang" id="kr">KOREAN</span>
									<span class="lang" id="en">ENGLISH</span>
								</div>
							</div>
						</div>
					</div>
					</div>
					
					<!-- 알람아이콘 -->
					<div class="navbar-item is-icon drop-trigger">
						<a class="icon-link" href="javascript:void(0);">
						 <i data-feather="bell"></i> 
						 <span class="indicator"></span>
						</a>

						<div class="nav-drop is-account-dropdown">
							<div class="inner" >
								<div class="nav-drop-header">
									<span><spring:message code="push.noti"/></span> <a href="#"> <i
										data-feather="bell"></i>
									</a>
								</div>
								<div class="nav-drop-body is-notifications" id="replyA" style="overflow:scroll;height:200px;">
								</div>
								<div class="nav-drop-footer">
									<small id="clearA"><spring:message code="push.clear"/></small>
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
									<span><spring:message code="push.letters"/></span> <a href="${pageContext.request.contextPath}/letterBox.do">Inbox</a>
								</div>
								<div class="nav-drop-body is-friend-requests" id="replyB" style="overflow:scroll;height:200px;">
								</div>
								<div class="nav-drop-footer">
									<small id="clearB"><spring:message code="push.clear"/></small>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- 로그인유저 -->
				<div id="account-dropdown"
					class="navbar-item is-account drop-trigger has-caret">
					<div class="user-image">
						<img src="${pageContext.request.contextPath}/resources/upload/${photo.uuid }"  alt="">
					</div>
					<span style="padding-left: 10px; padding-right: 20px;">${user.name }</span>

					<div class="nav-drop is-account-dropdown">
						<div class="inner">
							<div class="nav-drop-header">
								<a id="profile-link" href="${pageContext.request.contextPath}/profile.do?user_id=${user.user_id}">
								<span class="username" style="font-size:1rem; color:#393a4f;"><spring:message code="head.mypage"/></span></a>
								<label class="theme-toggle"> <input type="checkbox"> 
								<span class="toggler"> 
									<span class="dark"><i data-feather="moon"></i></span> 
									<span class="light"> <i data-feather="sun"></i></span>
								</span>
								</label>
							</div>
							<div class="nav-drop-body account-items">
									<div class="media">
								<a class="account-item" href="${pageContext.request.contextPath}/logout" style="display: flex;">
										<div class="icon-wrap">
											<i data-feather="power"></i>
										</div>
										<div class="media-content" style="margin-left: 15px;">
											<h3><spring:message code="head.logout"/></h3>
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
		
		<!-- 알람 -->
		<div class="navbar-item is-icon drop-trigger">
			<a class="icon-link" href="javascript:void(0);"> <i
				data-feather="bell"></i> <span class="indicator"></span>
			</a>
			
			<div class="nav-drop">
				<div class="inner">
					<div class="nav-drop-header">
						<span><spring:message code="push.noti"/></span> <a href="#"> <i
							data-feather="bell"></i>
						</a>
					</div>
					<div class="nav-drop-body is-notifications" id="replyC" style="overflow:scroll;height:200px;">
					</div>
					<div class="nav-drop-footer">
						<small id="clearC"><spring:message code="push.clear"/></small>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 메시지 아이콘 -->
		<div class="navbar-item is-icon drop-trigger">
			<a class="icon-link" href="javascript:void(0);"> <i
				data-feather="mail"></i> <span class="indicator"></span>
			</a>

			<div class="nav-drop">
				<div class="inner">
					<div class="nav-drop-header">
						<span><spring:message code="push.letters"/></span> <a href="${pageContext.request.contextPath}/letterBox.do">Inbox</a>
					</div>
					<div class="nav-drop-body is-friend-requests" id="replyD" style="overflow:scroll;height:200px;">
					</div>
					<div class="nav-drop-footer">
						<small id="clearD"><spring:message code="push.clear"/></small>
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
			<a href="${pageContext.request.contextPath}/profile.do?user_id=${user.user_id}" class="navbar-link"> <img
				src="${pageContext.request.contextPath}/resources/upload/${photo.uuid }"
				data-demo-src="assets/img/avatars/jenna.png" alt=""> <span
				class="is-heading">${user.name }</span>
			</a>

			<!-- Mobile Dropdown -->
			<div class="navbar-dropdown">
				<a href="${pageContext.request.contextPath}/feed.do" class="navbar-item is-flex is-mobile-icon">
					<span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
					<spring:message code="head.feed"/></span>
				</a>
				<a href="${pageContext.request.contextPath}/friendSearch.do" class="navbar-item is-flex is-mobile-icon">
					<span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
					<spring:message code="head.friends"/></span>
				</a>
				<a href="${pageContext.request.contextPath}/letterBox.do" class="navbar-item is-flex is-mobile-icon"> 
					<span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
					<spring:message code="head.letter"/></span>
				</a>
				<a href="${pageContext.request.contextPath}/userNoticeList.do" class="navbar-item is-flex is-mobile-icon"> 
					<span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg>
					<spring:message code="head.notice"/></span>
				</a>
				<c:if test="${user.user_id eq 'admin' }">
				<a href="${pageContext.request.contextPath}/admin/admin.do" class="navbar-item is-flex is-mobile-icon">
					<span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path></svg>
					관리자</span> <span class="menu-badge">3</span>
				</a>
				</c:if>
			</div>
		</div>

		<!-- More -->
		<div class="navbar-item has-dropdown">
			<!-- Mobile Dropdown -->
			<div class="navbar-dropdown">
				<a href="${pageContext.request.contextPath}/logout" class="navbar-item is-flex is-mobile-icon">
				<span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-power"><path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path><line x1="12" y1="2" x2="12" y2="12"></line></svg>
				<spring:message code="head.logout"/></span>
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