<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="media is-comment">
	<!-- User image -->
	<div class="media-left">
		<div class="image">
			<img src="https://via.placeholder.com/300x300"
				data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1"
				alt="">
		</div>
	</div>

	<!-- Content -->
	<div class="media-content">
		<a href="${pageContext.request.contextPath}/profile.do?user_id=${cmt.user_id }">${cmt.name }</a>
		<span class="time">방금전</span>
		<p>${cmt.content }</p>
		<!-- Actions -->
		<div class="controls">
		<div class="edit">
				<a id="del" data-delcmt="${cmt.comment_id }"
					data-delcmtfeed="${cmt.feed_id }" data-idx="${cmt.idx }">삭제</a>
			</div>
		</div>
	</div>

	<!-- Right side dropdown -->
	<div class="media-right">
		<div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
			<div>
				<div class="button">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-more-vertical">
					<circle cx="12" cy="12" r="1"></circle>
					<circle cx="12" cy="5" r="1"></circle>
					<circle cx="12" cy="19" r="1"></circle></svg>
				</div>
			</div>
			<div class="dropdown-menu" role="menu">
				<div class="dropdown-content">
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item">
						<div class="media">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-flag">
						<path
									d="M4 15s1-1 4-1 5 2 8 2 4-1 4-1V3s-1 1-4 1-5-2-8-2-4 1-4 1z"></path>
						<line x1="4" y1="22" x2="4" y2="15"></line></svg>
							<div class="media-content">
								<h3>Report</h3>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- /Right side dropdown -->
</div>