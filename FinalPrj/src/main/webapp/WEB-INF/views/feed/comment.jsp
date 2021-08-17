<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
		<span class="time"><spring:message code="time.1"/>
		<!-- Actions -->
		<div class="controls" style="display: inline-block">
			<div class="edit">
				<a id="del" data-delcmt="${cmt.comment_id }"
					data-delcmtfeed="${cmt.feed_id }" data-idx="${cmt.idx }">
					<svg
						viewBox="0 0 24 24" width="15" height="15" stroke="currentColor"
						stroke-width="2" fill="none" stroke-linecap="round"
						stroke-linejoin="round" class="css-i6dzq1">
						<line x1="18" y1="6" x2="6" y2="18"></line>
						<line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</a>
			</div>
		</div>
		</span>
		<p style="word-wrap:break-word; white-space: pre-line;">${cmt.content }</p>
	</div>
</div>