<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
.inbox-wrapper .inbox-wrapper-inner .inbox-left-sidebar .inbox-left-sidebar-inner
	{
	width: 100%;
	height: 100%;
	padding: 8%;
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
</style>
<body>
	<div class="inbox-wrapper">
		<div class="inbox-wrapper-inner">
			<!-- /partials/pages/inbox/inbox-sidebar.html -->
			<!-- Inbox left Sidebar  -->
			<div class="inbox-left-sidebar">
				<div class="inbox-left-sidebar-inner ">
					<!-- Compose button -->
					<div class="compose">
						<a class="button is-fullwidth raised is-bold">Write</a>
					</div>
					<!-- Menu -->
					<div class="left-menu">
						<a href="letterBox.do" class="item is-active"> <i
							data-feather="mail"></i> <span class="name">New Letters</span>
						</a> <a href="arriveLetter.do" class="item"> <i
							data-feather="star"></i> <span class="name">Arrive Letters</span>
						</a> <a href="savedLetter.do" class="item"> <i
							data-feather="folder"></i> <span class="name">Saved
								Letters</span>
						</a>
					</div>
					<!-- Mobile only close -->
					<div class="close-menu is-hidden-desktop is-hidden-landscape">
						<a id="close-compose"><i data-feather="arrow-left"></i> Close</a>
					</div>
				</div>
			</div>
			<!-- Messages list container -->
			<!-- /partials/pages/inbox/inbox-center-container.html -->
			<div class="inbox-center-container is-both-opened">
				<div class="inbox-center-container-inner">
					<div class="messages">
						<!-- Button group -->
						<div class="action-buttons">
							<div
								class="control is-grouped is-hidden-desktop is-hidden-landscape">
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
								<a class="button" href="letterBox.do"> <svg
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
							<div class="control is-grouped">
								<a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-star">
										<polygon
											points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
									</svg>
								</a> <a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-inbox">
										<polyline points="22 12 16 12 14 15 10 15 8 12 2 12"></polyline>
										<path
											d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"></path>
									</svg>
								</a>
							</div>
							<div class="control is-grouped is-arrows">
								<a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-chevron-left">
										<polyline points="15 18 9 12 15 6"></polyline></svg>
								</a> <a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-chevron-right">
										<polyline points="9 18 15 12 9 6"></polyline></svg>
								</a> <span class="message-count" style="vertical-align: bottom;">1-10
									of 123</span>
							</div>
						</div>

						<!-- Messages list -->
						<!-- Message cards -->
						<c:choose>
							<c:when test="${!empty friends }">
								<div id="inbox-messages" class="inbox-messages has-slimscroll">
									<div class="inbox-messages-inner">
									<c:forEach items="${friends }" var="vo" varStatus="status">
										<div id="msg-card-${status.index }" data-preview-id="${status.index }"
											class="card is-msg has-attachment">
											<div class="card-content">
												<span class="msg-timestamp"> ${vo.arrive_date }
												<img src="resources/template/assets/img/letter/stamp.png">
												</span>
												<div class="msg-header">
													<div class="user-image">
														<img
															style="width: 48px; height: 48px; border-radius: 50%; display: inline-block;"
															src="https://via.placeholder.com/400x400" alt="friends">
														<span class="msg-from"
															style="vertical-align: top; margin-left: 5px;"> <small><a>${vo.user_id }</a></small>
														</span>
													</div>
												</div>
												<br>
												<div class="msg-subject" style="text-align: right;">
													<span>letter Status</span>
												</div>

											</div>
										</div>
									</c:forEach>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<p>최근 도착한 편지가 없습니다!</p>
							</c:otherwise>
						</c:choose>
						<!-- /Message cards -->
					</div>
				</div>
			</div>

			<!-- Messages preview -->
			<div class="inbox-message-container">
				<div class="inbox-message-container-inner">
					<div class="message-head">
						<!-- Button group -->
						<div class="action-buttons">
							<div class="control is-grouped">
								<a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-refresh-cw">
										<polyline points="23 4 23 10 17 10"></polyline>
										<polyline points="1 20 1 14 7 14"></polyline>
										<path
											d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
									</svg>
								</a>
							</div>
							<div class="control is-grouped">
								<a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-star">
										<polygon
											points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
									</svg>
								</a> <a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-inbox">
										<polyline points="22 12 16 12 14 15 10 15 8 12 2 12"></polyline>
										<path
											d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"></path>
									</svg>
								</a>
							</div>
							<div class="control is-grouped is-arrows">
								<a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-chevron-left">
										<polyline points="15 18 9 12 15 6"></polyline></svg>
								</a> <a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-chevron-right">
										<polyline points="9 18 15 12 9 6"></polyline></svg>
								</a>
							</div>
							<!-- Hidden on desktop, controls mobile left and right sidebars -->
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

					<!-- Message Previews -->
					<c:choose>
						<c:when test="${!empty newLetter }">
						<div class="message-body has-slimscroll">
						<c:forEach items="${newLetter }" var="vo" varStatus="status">
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
												<div class="name">${vo.user_id }</div>
												<div class="date">${vo.arrive_date }</div>
											</div>
										</div>
	
										<hr>
										<div class="content">
											<p>${vo.content }</p>
										</div>
										<div class="has-text-right">
											<a class="button is-solid grey-button is-bold raised">Reply
												to Message</a>
										</div>
									</div>
								</div>

	
								<div class="reply-wrapper">
									<div class="reply-title">
										Reply to conversation <i data-feather="help-circle"
											class="has-tip"></i>
										<!-- Title Popover -->
										<div class="webui-popover-content">
											<div class="popover-flex-block">
												<div class="icon-block">
													<i data-feather="info"></i>
												</div>
												<div class="content-block">
													<span>Format message, </span> <span>Select the text
														you want to edit to make the toolbar appear.</span>
												</div>
											</div>
										</div>
									</div>
	
									<div class="reply-wrapper-inner">
										<div class="flex-form">
											<img src="https://via.placeholder.com/300x300"
												data-demo-src="assets/img/avatars/jenna.png" alt="">
											<div class="control">
												<div class="reply-textarea"></div>
											</div>
										</div>
										<div class="has-text-right">
											<button type="button"
												class="button is-solid accent-button is-bold raised send-message">Send
												Message</button>
										</div>
									</div>
								</div>
							</div>				
							</c:forEach>
						</div>
						</c:when>
						<c:otherwise>
							<p>해당 편지를 조회할 수 없습니다.</p>
						</c:otherwise>
					</c:choose>

	
					<!-- Msg preview -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>