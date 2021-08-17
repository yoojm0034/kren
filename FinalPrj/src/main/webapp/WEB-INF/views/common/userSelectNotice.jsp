
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

		$('#btnNoticeList')
				.on(
						'click',
						function() {
							location.href = '${pageContext.request.contextPath}/userNoticeList.do'
						});
		$('#btnBack').on('click', function() {
			history.back();
		});
	});
</script>
<style>
.inner-wrapper {
	width: 60%;
	margin: auto;
	padding-top: 3%;
}

.title {
	font-size: 1.5rem;
	font-weight: 600;
	padding-top: 40px;
}
</style>
</head>
<body>
	<!-- 컨텐츠 시작 -->
	<div class="inner-wrapper">
		<a class="mobile-sidebar-trigger is-home-v2"> <i
			data-feather="menu"></i>
		</a>
		<!-- Page Wrapper -->
		<div id="wrapper">
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
				<!-- Main Content -->
				<div id="content">
					<!-- Begin Page Content -->
					<div class="container-fluid">
						<!-- DataTales Example -->
						<div class="card shadow mb-4"
							style="box-shadow: 0 0 19px 4px #b2b2b2;">
							<div class="card-body" style="padding-top: 40px;">
								<input type="hidden" name="notice_id"
									value="${notice.notice_id}">
								<div>
									<table class="table">
										<tr>
											<th colspan="3" align="left"><span class="title">${notice.title}</span></th>
											<td style="display: flex;">
												<button type="button" id="btnBack"
													class="button primary-button" style="float: right;">
													<spring:message code="notice.table.back" />
												</button>
												&nbsp;&nbsp;
												<button type="button" id="btnNoticeList"
													class="button grey-button">
													<spring:message code="notice.table.list" />
												</button>
											</td>
										</tr>
										<tr>
											<th width="12%"><spring:message
													code="notice.table.regdate" /></th>
											<td width="80%" align="left">${notice.reg_date}</td>
											<th width="8%"><spring:message code="notice.table.hit" /></th>
											<td>${notice.hit}</td>
										</tr>
										<tr>
											<td colspan="4" align="left">${notice.content}</td>
										</tr>
										<tr>
											<th><spring:message code="notice.table.uploadfile" /></th>
											<td colspan="4" align="left"><a
												href="${pageContext.request.contextPath}/fileDown.do?notice_id=${notice.notice_id}">${notice.fileName}</a>
												<c:if test="${empty notice.fileName}">
													<spring:message code="notice.table.emptyfile" />
												</c:if></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- 컨텐츠 종료 -->

				</div>
			</div>
		</div>
	</div>

</body>
</html>