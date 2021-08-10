<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KREN</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<c:if test="${not empty user.user_id }">
<script type="text/javascript">
	var sock = null;

	$(document).ready(function() {
		connectWs();

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
	        }else{
	        	$('#replyA').prepend(div);
	        	
	        }
			
			toastr.options.escapeHtml = true;
			toastr.options.closeButton = true;
			toastr.options.newestOnTop = false;
			toastr.options.progressBar = true;
			toastr.info('알림이 도착했습니다.','알림', {timeOut: 6000});
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
</c:if>
</head>
<body>
	<tiles:insertAttribute name="content"></tiles:insertAttribute>	
	

</body>
</html>