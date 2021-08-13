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
</div>