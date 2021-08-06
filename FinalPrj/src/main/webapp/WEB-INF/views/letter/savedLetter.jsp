<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
.inbox-wrapper .inbox-wrapper-inner .inbox-left-sidebar .inbox-left-sidebar-inner
	{
	width: 100%;
	height: 100%;
	padding: 8%;
	overflow: auto;
}

.inbox-wrapper .inbox-wrapper-inner .inbox-center-container .inbox-center-container-inner .messages .action-buttons .button
	{
	max-height: 32px;
	padding: 4px 8px;
	margin-top: 10px;
}

.inbox-wrapper .inbox-wrapper-inner .inbox-message-container .inbox-message-container-inner .message-head .action-buttons .button
	{
	max-height: 32px;
	padding: 4px 8px;
	margin-top: 10px;
}

.inbox-wrapper .inbox-wrapper-inner .inbox-center-container .inbox-center-container-inner .inbox-messages .inbox-messages-inner .card .msg-timestamp,
	.inbox-wrapper .inbox-wrapper-inner .inbox-center-container .inbox-center-container-inner .inbox-messages .inbox-messages-inner .shop-wrapper .cart-container .cart-content .cart-summary .summary-card .msg-timestamp,
	.shop-wrapper .cart-container .cart-content .cart-summary .inbox-wrapper .inbox-wrapper-inner .inbox-center-container .inbox-center-container-inner .inbox-messages .inbox-messages-inner .summary-card .msg-timestamp
	{
	float: right;
	padding: 0px;
	color: #999;
	font-size: .9rem;
}
.content  table {
    table-layout: fixed;
    width: 100%;
    text-align: center;
}

.content  textarea {
    width: -webkit-fill-available;
    border: none;
    resize: none;
    padding: revert;
}
</style>
<script>
$(function() {
	// 친구목록 클릭하면 편지목록들 조회 
	$('a.item').on('click', function() {
	    var aid = $(this).data('id');
	    location.href= '${pageContext.request.contextPath}/'+'selectLetters.do/'+aid;
	});
	
	// 삭제버튼을 누르면 편지목록에서 삭제
	$("body").on('click', '#delbtn',  function() {
	    var delid = $(this).data('delid');	//letter_id
	    console.log(delid);
	    
	    if(confirm("편지를 삭제하시겠습니까?") ) {
		    $.ajax({
		    	url:'deleteLetter.do',
		    	type:'post',
		    	data:JSON.stringify({letter_id:delid}),
			    contentType : "application/json; charset=UTF-8",
		    	success: function(data) {
		    		alert('삭제되었습니다.');
		    		location.reload(true);
		    	},
		    	error: function(e) {
		    		alert('삭제실패');
		    	}
		    });		    	
	    } else {
	    	alert("취소되었습니다.");
	    }
	});
	
	// 편지 입력
	$("body").on('click', '#send', function() {
		var send = $(this).data('send'); //letter_id
		var to = $(this).data('to'); //to_id
		var sendbtn = $('button[data-send="'+send+'"]');
		var txtarea = $('textarea[data-letter="'+send+'"]').val();
		console.log(txtarea);
		
		//우표수량 체크
		$.ajax({
			url : '${pageContext.request.contextPath}/stampLetterCheck.do',
			type : 'post',
			data : JSON.stringify({
				user_id : $('#user_id').val()
			}),
			contentType : "application/json; charset=UTF-8",
			success : function(cnt) {
				if (cnt > 0) { //우표가 있으면
					if(confirm("편지를 전송하시겠습니까?") ) {
					    $.ajax({
					    	url:'${pageContext.request.contextPath}/updateSavedLetter.do',
					    	type:'post',
					    	data:JSON.stringify({
					    		letter_id:send,
					    		to_id:to,
					    		user_id:"${user.user_id}",
					    		content:txtarea,
					    		photo:"",
					    		gubun:'일반'
					    	}),
						    contentType : "application/json; charset=UTF-8",
					    	success: function(data) {
					    		alert('전송되었습니다.');
					    		location.href = '${pageContext.request.contextPath}/selectLetters.do/'+to;
					    		sendLetterPush(to);
					    	},
					    	error: function(e) {
					    		alert('편지전송실패');
					    	}
					    });		    	
				    } else {
				    	if(confirm("편지를 저장하시겠습니까?") ) {
						    $.ajax({
						    	url:'${pageContext.request.contextPath}/updateSavedLetter.do',
						    	type:'post',
						    	data:JSON.stringify({
						    		letter_id:send,
						    		to_id:to,
						    		user_id:"${user.user_id}",
						    		content:txtarea,
						    		photo:"",
						    		gubun:'임시저장'
						    	}),
							    contentType : "application/json; charset=UTF-8",
						    	success: function(data) {
						    		alert('편지가 저장되었습니다.');
						    		location.reload(true);
						    	},
						    	error: function(e) {
						    		alert('저장실패');
						    	}
						    });		    	
					    } else {
					    	alert("편지작성이 취소되었습니다.");
					    }
				    }
				} else { //우표가 없으면
					alert('우표수량을 확인해주세요.');
					if(confirm("편지를 저장하시겠습니까?") ) {
					    $.ajax({
					    	url:'${pageContext.request.contextPath}/updateSavedLetter.do',
					    	type:'post',
					    	data:JSON.stringify({
					    		letter_id:send,
					    		to_id:to,
					    		user_id:"${user.user_id}",
					    		content:txtarea,
					    		photo:"",
					    		gubun:'임시저장'
					    	}),
						    contentType : "application/json; charset=UTF-8",
					    	success: function(data) {
					    		alert('편지가 저장되었습니다.');
					    		location.reload(true);
					    	},
					    	error: function(e) {
					    		alert('저장실패');
					    	}
					    });		    	
				    } else {
				    	alert("편지작성이 취소되었습니다.");
				    }
				}
			},
			error : function(e) {
				alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
			}
		});
	});//편지입력끝
	
	
});//$(function().. end
</script>
</head>
<body>
<input type="hidden" id="user_id" value="${user.user_id }">
	<div class="inbox-wrapper">
		<div class="inbox-wrapper-inner">
			<!-- LEFT SIDEBAR  -->
			<div class="inbox-left-sidebar">
				<div class="inbox-left-sidebar-inner ">
					<div class="compose">
						<a class="button is-fullwidth raised is-bold">Write</a>
					</div>
					<!-- MENU -->
					<div class="left-menu" style="overflow: auto;">
						<a href="${pageContext.request.contextPath}/letterBox.do" class="item">
							<span class="name">New Letters</span>
						</a>
						<a href="${pageContext.request.contextPath}/savedLetter.do" class="item is-active">
							<span class="name">Saved Letters</span>
						</a>
						<c:if test="${!empty friends }">
						<c:forEach items="${friends }" var="vo">						
							<a data-id="${vo.user_id}" class="item">
								<span class="name">${vo.name }</span>
							</a>
						</c:forEach>
						</c:if>						
						
						
					</div>
					<!-- MOBILE ONLY CLOSE -->
					<div class="close-menu is-hidden-desktop is-hidden-landscape">
						<a id="close-compose">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-x">
											<line x1="18" y1="6" x2="6" y2="18"></line>
											<line x1="6" y1="6" x2="18" y2="18"></line>
							</svg>
						Close </a>
					</div>
				</div>
			</div>
			
			<!-- MESSAGES LIST CONTAINER -->
			<div class="inbox-center-container is-both-opened">
				<div class="inbox-center-container-inner">
					<div class="messages">
						<!-- BUTTON GROUP -->
						<div class="action-buttons">
						<div class="control is-grouped is-hidden-desktop is-hidden-landscape">
							<a id="open-compose" class="button is-solo"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round"
									stroke-linejoin="round" class="feather feather-menu">
									<line x1="3" y1="12" x2="21" y2="12"></line>
									<line x1="3" y1="6" x2="21" y2="6"></line>
									<line x1="3" y1="18" x2="21" y2="18"></line>
								</svg>
							</a>
						</div>

						<div class="control is-grouped">
							<div class="control is-grouped">
								<a class="button" href="javascript:location.reload()"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-refresh-cw">
								<polyline points="23 4 23 10 17 10"></polyline>
								<polyline points="1 20 1 14 7 14"></polyline>
								<path
											d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
							</svg>
								</a>
							</div>
						</div>
						<!-- /BUTTON GROUP -->
						</div>

						<!-- MESSAGES LIST -->
						<!-- MESSAGE CARDS -->
						<c:choose>
						<c:when test="${!empty save }">
							<div id="inbox-messages" class="inbox-messages has-slimscroll">
								<div class="inbox-messages-inner">
								<c:forEach items="${save }" var="vo" varStatus="status">
									<div id="msg-card-${status.index }" data-preview-id="${status.index }"
										class="card is-msg has-attachment">
										<div class="card-content">
											<span class="msg-timestamp"> <fmt:formatDate value="${vo.send_date }" pattern="yy/MM/dd"/> <img
												src="resources/template/assets/img/letter/stamp.png">
											</span>
											<div class="msg-header">
												<div class="user-image">
													<img
														style="width: 48px; height: 48px; border-radius: 50%; display: inline-block;"
														src="https://via.placeholder.com/400x400" alt="friends">
													<span class="msg-from"
														style="vertical-align: top; margin-left: 5px;"> <small><a>TO:${vo.name }</a></small>
													</span>
												</div>
											</div>
											<br>
											<div class="msg-snippet">
												<p>${vo.content }</p>
											</div>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<p>임시저장한 편지가 없습니다!</p>
						</c:otherwise>
						</c:choose>
						<!-- /MESSAGE CARDS -->
					</div>
				</div>
			</div>
			<!-- /MESSAGES LIST CONTAINER -->

			<!-- MESSAGES CONTAINER -->
			<div class="inbox-message-container">
				<div class="inbox-message-container-inner">
					<div class="message-head">
						<!-- BUTTON GROUP -->
						<div class="action-buttons">
							<div class="control is-grouped">
								<a class="button"  href="javascript:window.print()"><svg viewBox="0 0 24 24" width="24"
										height="24" stroke="currentColor" stroke-width="2" fill="none"
										stroke-linecap="round" stroke-linejoin="round"
										class="css-i6dzq1">
										<polyline points="6 9 6 2 18 2 18 9"></polyline>
										<path
											d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
										<rect x="6" y="14" width="12" height="8"></rect></svg> </a>
							</div>
							<!-- MOBILE SIDEBARS -->
							<div
								class="control is-grouped is-hidden-desktop is-hidden-landscape">
								<a id="close-inbox-preview" class="button is-solo"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-x">
										<line x1="18" y1="6" x2="6" y2="18"></line>
										<line x1="6" y1="6" x2="18" y2="18"></line>
									</svg>
								</a>
							</div>
						</div>
					</div>

					<!-- MESSAGE PREVIEWS -->
					<c:choose>
					<c:when test="${!empty save }">
					<div class="message-body has-slimscroll">
					<c:forEach items="${save }" var="vo" varStatus="status">
					<div id="message-preview-${status.index }" class="message-body-inner">
						<div class="box message-preview">
							<div class="box-inner">
								<div class="header">
									<div class="avatar">
										<img src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/dan.jpg" alt=""
											data-user-popover="1">
									</div>
									<div class="meta">
										<div class="name">TO:${vo.name }</div>
										<div class="date"><fmt:formatDate value="${vo.send_date }" pattern="yy/MM/dd"/></div>
									</div>
								</div>
	
								<hr>
								<div class="content">
									<table>
									<tr>
									<td>
										<textarea data-letter="${vo.letter_id }" rows="20" cols="20" placeholder="Write your letter">${vo.content }</textarea>
									</td>
									</tr>
									</table>
								</div>
						</div>

						<div class="has-text-right">
							<button type="button" class="button is-solid accent-button is-bold raised send-message" id="send"
							data-send="${vo.letter_id  }" data-to="${vo.to_id }" >Send Letter</button>
							<button class="button is-solid grey-button is-bold raised" id="delbtn" data-delid="${vo.letter_id }">삭제</button>
						</div>

						</div>	
						</div>			
					</c:forEach>
					</div>
					</c:when>
					<c:otherwise>
						<p>목록이 비어있습니다.</p>
					</c:otherwise>
					</c:choose>
					<!-- /MESSAGE PREVIEWS -->
				</div>
			</div>
			<!-- /MESSAGES CONTAINER -->
		</div>
	</div>
</body>
</html>