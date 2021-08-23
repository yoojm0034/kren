<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- chart.js -->
<!-- include application-chart.min.css -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
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

.sub-title {
	font-weight: 600 !important;
	font-family: 'ONE-Mobile-Regular' !important;
}

.pagination {
	display: flex;
	padding-left: 0;
	list-style: none;
	border-radius: .35rem;
	padding-top: 3%;
}

div.dataTables_wrapper div.dataTables_paginate ul.pagination {
	margin: 2px 0;
	white-space: nowrap;
	justify-content: center;
}

.page-link {
	position: relative;
	display: block;
	padding: .5rem .75rem;
	margin-left: -1px;
	line-height: 1.25;
	color: #959595;
	background-color: #fff;
	border: 1px solid #dddfeb;
}

*, ::after, ::before {
	box-sizing: border-box;
}

div.dataTables_wrapper div.dataTables_paginate {
	margin: 0;
	white-space: nowrap;
	text-align: right;
}

tr:hover {
	cursor: pointer;
	background-color: #ededed;
}

.table th:not([align]) {
	text-align: center
}

.settings-wrapper .settings-section .settings-panel {
	display: flex;
}

.settings-wrapper .settings-section .settings-panel .title-wrap {
	align-items: baseline;
	width: 100px;
}
a { color: #363636; }
</style>
<script>
	$(function() {
		$('#btnHome').on('click', function() {
			location.href = '${pageContext.request.contextPath}/feed.do'
		})
		$('#btnBack').on('click', function() {
			history.back();
		});
	})
</script>
</head>
<body>
	<!-- 컨텐츠 시작 -->
	<div class="inner-wrapper">
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
							<div class="card-body">
								<div style="padding-top: 40px; text-align:center;">
									<span class="title"><spring:message code="search.result" /></span>
									<button type="button" id="btnBack"
										class="button primary-button" style="float: right;">
										<spring:message code="notice.table.back" />
									</button>
								</div>
								<hr>
								<div class="stories-container">
									<div class="settings-wrapper">
										<c:if test="${not empty notices }">
											<!-- /partials/settings/sections/general-settings.html -->
											<div id="general-settings" class="settings-section is-active">
												<div class="settings-panel">
													<div class="title-wrap">
														<a class="mobile-sidebar-trigger"> <i
															data-feather="menu"></i>
														</a>
														<h2 class="sub-title">
															<spring:message code="search.notice.title" />
														</h2>
													</div>

													<div class="settings-form-wrapper">
														<div class="link-content">
															<table class="table">
																<c:forEach items="${notices}" var="list">
																	<tr>
																		<td style="width: 850px;"><a
																			class="setting-sublink"
																			href="${pageContext.request.contextPath}/userSelectNotice.do?notice_id=${list.notice_id}">
																				${list.title } </a></td>
																	</tr>
																</c:forEach>
															</table>
														</div>
													</div>
												</div>
											</div>
										</c:if>
										<br>
										<c:if test="${not empty feeds }">
											<div id="general-settings" class="settings-section is-active">
												<div class="settings-panel">
													<div class="title-wrap">
														<a class="mobile-sidebar-trigger"> <i
															data-feather="menu"></i>
														</a>
														<h2 class="sub-title">
															<spring:message code="search.feed.title" />
														</h2>
													</div>
													<div class="settings-form-wrapper">
														<div class="link-content">
															<table class="table">
																<tr>
																	<th style="width: 150px;"><spring:message
																			code="search.feed.num" /></th>
																	<th style="width: 700px;"><spring:message
																			code="search.feed.content" /></th>
																</tr>
																<c:forEach items="${feeds }" var="list">
																	<tr>
																		<td><a class="setting-sublink"
																			href="${pageContext.request.contextPath}/feed.do?feed_id=${list.feed_id}">${list.feed_id}</a></td>
																		<td><c:choose>
																				<c:when test="${fn:length(list.content) gt 41}">
																					<c:out value="${fn:substring(list.content, 0, 40)}" />...
																		        </c:when>
																				<c:otherwise>
																					<c:out value="${list.content}">
																					</c:out>
																				</c:otherwise>
																			</c:choose></td>
																	</tr>
																</c:forEach>
															</table>
														</div>
													</div>
												</div>
											</div>
										</c:if>
										<br>
										<c:if test="${not empty commentsList}">
											<div id="general-settings" class="settings-section is-active">
												<div class="settings-panel">
													<div class="title-wrap">
														<a class="mobile-sidebar-trigger"> <i
															data-feather="menu"></i>
														</a>
														<h2 class="sub-title">
															<spring:message code="search.comment.title" />
														</h2>
													</div>
													<div class="settings-form-wrapper">
														<div class="link-content">
															<table class="table">
																<tr>
																	<th style="width: 150px;"><spring:message
																			code="search.feed.num" /></th>
																	<th style="width: 700px;"><spring:message
																			code="search.comment.content" /></th>
																</tr>
																<c:forEach items="${commentsList }" var="list">
																	<tr>
																		<td><a class="setting-sublink"
																			href="${pageContext.request.contextPath}/feed.do?feed_id=${list.feed_id}">${list.feed_id}</a></td>
																		<td><c:choose>
																				<c:when test="${fn:length(list.content) gt 41}">
																					<c:out value="${fn:substring(list.content, 0, 40)}" />...
																		        </c:when>
																				<c:otherwise>
																					<c:out value="${list.content}">
																					</c:out>
																				</c:otherwise>
																			</c:choose></td>
																	</tr>
																</c:forEach>
															</table>
														</div>
													</div>
												</div>
											</div>
										</c:if>
										<br>
										<c:if test="${not empty commentcList}">
											<div id="general-settings" class="settings-section is-active">
												<div class="settings-panel">
													<div class="title-wrap">
														<a class="mobile-sidebar-trigger"> <i
															data-feather="menu"></i>
														</a>
														<h2 class="sub-title">
															<spring:message code="search.commentc.title" />
														</h2>
													</div>
													<div class="settings-form-wrapper">
														<div class="link-content">
															<table class="table">
																<tr>
																	<th style="width: 150px;"><spring:message
																			code="search.feed.num" /></th>
																	<th style="width: 350px;"><spring:message
																			code="search.commentc.origin" /></th>
																	<th style="width: 350px;"><spring:message
																			code="search.commentc.correct" /></th>
																</tr>
																<c:forEach items="${commentcList }" var="list">
																	<tr>
																		<td><a class="setting-sublink"
																			href="${pageContext.request.contextPath}/feed.do?feed_id=${list.feed_id}">${list.feed_id}</a></td>
																		<td><c:choose>
																				<c:when test="${fn:length(list.origin) gt 21}">
																					<c:out value="${fn:substring(list.origin, 0, 20)}" />...
																			        </c:when>
																				<c:otherwise>
																					<c:out value="${list.origin}">
																					</c:out>
																				</c:otherwise>
																			</c:choose></td>
																		<td><c:choose>
																				<c:when test="${fn:length(list.content) gt 21}">
																					<c:out value="${fn:substring(list.content, 0, 20)}" />...
																			        </c:when>
																				<c:otherwise>
																					<c:out value="${list.content}">
																					</c:out>
																				</c:otherwise>
																			</c:choose></td>
																	</tr>
																</c:forEach>
															</table>
														</div>
													</div>
												</div>
											</div>
										</c:if>
										<br>
										<c:if test="${not empty members }">
											<div id="general-settings" class="settings-section is-active">
												<div class="settings-panel">
													<div class="title-wrap">
														<a class="mobile-sidebar-trigger"> <i
															data-feather="menu"></i>
														</a>
														<h2 class="sub-title">
															<spring:message code="search.user.id" />
														</h2>
													</div>
													<div class="settings-form-wrapper">
														<div class="settings-form">
															<div class="columns is-multiline flex-portrait">
																<c:forEach items="${members}" var="list">
																	<!--link-->
																	<div class="column is-4">
																		<a class="setting-sublink"
																			href="${pageContext.request.contextPath}/profile.do?user_id=${list.user_id}">
																			<div class="link-content">
																				<h4>${list.name }</h4>
																				<c:set value="${list.profile}" var="profile" />
																				<p>${fn:substring(profile, 0, 100)}...</p>
																			</div>
																		</a>
																	</div>
																</c:forEach>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- End of Main Content -->
	</div>
	<!-- 컨텐츠 종료 -->
	<c:if
		test="${empty notices and empty feeds and empty commentsList and empty commentcList and empty members }">
		<br>
		<br>
		<div align="center">
			<h1>
				<spring:message code="search.no.result" />
			</h1>
		</div>

	</c:if>
</body>

</html>