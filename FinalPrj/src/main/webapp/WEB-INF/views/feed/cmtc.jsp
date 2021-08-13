<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(function() {
$("div[id^='load_'").each(function(i, el){
	var cid = $(this).data('cid');//cc_id.line
	var cdc = $(this).data('cdc');//content
	var cdo = $(this).data('cdo');//origin
	test_diff(cid,cdc,cdo);
});

// 문자열 비교; diffButty.js; String
function test_diff(cid,dif,ori) {
	var original = ori;
	var revised = dif;
	var output = $('<pre>');
	var html = diffButty(original, revised);
	output.html(html);
	var div = $('div[data-cid="'+cid+'"]');
	div.html(output);
} 
});
</script>
<c:if test="${!empty cc }">
<div class="media is-comment">
	<!-- User image -->
	<div class="media-left">
		<div class="image">
			<img src="https://via.placeholder.com/300x300"
				data-demo-src="assets/img/avatars/dan.jpg"
				data-user-popover="1" alt="">
		</div>
	</div>
	<!-- Content -->
	<div class="media-content">
		<a href="${pageContext.request.contextPath}/profile.do?user_id=${user.user_id}">${user.name }</a>
		<span class="time">방금전
		<!-- Actions -->
		<div class="controls" style="display: inline-block">
			<div class="edit">
				<a id="cdel" data-delcmt="${cc.cc_id }" data-delcmtfeed="${cc.feed_id }"
				data-idx="${cc.idx }">
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
		<c:forEach items="${cd }" var="cd">
		<!-- 교정댓글이면, line을 반복 -->
		<div id="load_${cd.cc_id }${cd.line}" data-cid="${cd.cc_id }${cd.line}"
		data-cdc="${cd.content }"
		data-cdo="${cd.origin }">${cd.content }</div>
		</c:forEach>
	</div>
</div>
</c:if>