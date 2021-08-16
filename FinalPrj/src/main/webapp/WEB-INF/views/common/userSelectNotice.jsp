	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('#btnNoticeList').on('click', function() {
			location.href = '${pageContext.request.contextPath}/userNoticeList.do'
		});
		$('#btnBack').on('click', function() {
			history.back();
		});
	});
</script>
<style>

</style>
</head>
<body>
	<div class="stories-wrapper is-home">
		<!-- 컨텐츠 시작 -->
		<div class="inner-wrapper"  style="width:70%">
			<a class="mobile-sidebar-trigger is-home-v2"> <i
				data-feather="menu"></i>
			</a>
			<div class="stories-content">
				<div class="section-title main-section-title">
					<h2><spring:message code="notice.table.notice"/></h2>
				</div>
			</div>

			<div class="stories-container" >
					<div style="box-shadow: 0 0 19px 4px #b2b2b2;">
						<input type="hidden" name="notice_id" value="${notice.notice_id}">	
						<table class="table">
							<tr>
								<th colspan="4" align="left">${notice.title}</th>
							</tr>
							<tr>
								<th width="10%"><spring:message code="notice.table.title"/></th>
								<td width="82%" align="left">${notice.reg_date}</td>
								<th width="8%"><spring:message code="notice.table.hit"/></th>
								<td>${notice.hit}</td>
							</tr>
							<tr>
								<td colspan="4" align="left">${notice.content}</td>
							</tr>
							<tr>
								<th><spring:message code="notice.table.uploadfile"/></th>
								<td colspan="4" align="left"><a href="${pageContext.request.contextPath}/fileDown.do?notice_id=${notice.notice_id}">${notice.fileName}</a>
									<c:if test="${empty notice.fileName}">
										<spring:message code="notice.table.emptyfile"/>
									</c:if>
								</td>
							</tr>
						</table>
					</div>
					<div>
						<button type="button" id="btnNoticeList" class="button grey-button"><spring:message code="notice.table.list"/></button>
					</div>
			</div>
		</div>
		<!-- 컨텐츠 종료 -->


	</div>


</body>
</html>