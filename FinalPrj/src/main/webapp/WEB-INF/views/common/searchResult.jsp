<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
</head>
</head>


</head>
<body>
<c:if test="${not empty notices or not empty feeds or not empty commentsList or not empty commentcList or not empty members }">	
	<div class="stories-wrapper is-home">
		<!-- 컨텐츠 시작 -->
	
		<div class="stories-container">
			<div class="settings-wrapper">
				<div class="stories-content">
					<div class="section-title main-section-title">
						<h1><spring:message code="search.result"/></h1>
					</div>
				</div>
				<c:if test="${not empty notices }">
				<!-- /partials/settings/sections/general-settings.html -->
				<div id="general-settings" class="settings-section is-active">
					<div class="settings-panel">
						<div class="title-wrap">
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2><spring:message code="search.notice.title"/></h2>
						</div>
						
						<div class="settings-form-wrapper">
							<div class="illustration">
								<div class="link-content">
								<table class="table">
									<c:forEach items="${notices}" var="list">
										<tr>
											<td>	
												<a class="setting-sublink" href="${pageContext.request.contextPath}/userSelectNotice.do?notice_id=${list.notice_id}">
													${list.title }
												</a>
											</td>	
										</tr>	
									</c:forEach>
								</table>
								</div>
							</div>
							<div class="illustration">
								<img alt="" src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/characters/friends.svg">
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
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2><spring:message code="search.feed.title"/></h2>
						</div>
						<div class="settings-form-wrapper">
							<div class="illustration">
								<div class="link-content">
								<table class="table">							
										<tr>
											<th><spring:message code="search.feed.num"/></th>
											<th><spring:message code="search.feed.tags"/></th>
											<th><spring:message code="search.feed.content"/></th>
										</tr>	
									<c:forEach items="${feeds }" var="list">
										<tr>
											<td><a class="setting-sublink" href="${pageContext.request.contextPath}/feed.do?feed_id=${list.feed_id}">${list.feed_id}</a></td>
											<td>${list.tags}</td>
											<c:set value="${list.content }" var="content"/>
											<td>${fn:substring(content, 0, 30)}...</td>
										</tr>
									</c:forEach>
								</table>
								</div>
							</div>
							<div class="illustration">
								<img alt="" src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/characters/no-stream.svg">
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
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2><spring:message code="search.comment.title"/></h2>
						</div>
						<div class="settings-form-wrapper">
							<div class="illustration">
								<div class="link-content">
								<table class="table">							
										<tr>
											<th><spring:message code="search.feed.num"/></th>
											<th><spring:message code="search.comment.num"/></th>
											<th><spring:message code="search.comment.content"/></th>
										</tr>	
									<c:forEach items="${commentsList }" var="list">
										<tr>
											<td><a class="setting-sublink" href="${pageContext.request.contextPath}/feed.do?feed_id=${list.feed_id}">${list.feed_id}</a></td>
											<td>${list.comment_id }</td>
											<c:set value="${list.content }" var="content"/>
											<td>${fn:substring(content, 0, 20)}...</td>
										</tr>
									</c:forEach>
								</table>
								</div>
							</div>
							<div class="illustration">
								<img alt="" src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/characters/woman-desk.svg">
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
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2><spring:message code="search.commentc.title"/></h2>
						</div>
						<div class="settings-form-wrapper">
							<div class="illustration">
								<div class="link-content">
								<table class="table">							
										<tr>
											<th><spring:message code="search.feed.num"/></th>
											<th><spring:message code="search.commentc.num"/></th>
											<th><spring:message code="search.commentc.origin"/></th>
											<th><spring:message code="search.commentc.correct"/></th>
										</tr>	
									<c:forEach items="${commentcList }" var="list">
										<tr>
											<td><a class="setting-sublink" href="${pageContext.request.contextPath}/feed.do?feed_id=${list.feed_id}">${list.feed_id}</a></td>
											<td>${list.cc_id }</td>
											<c:set value="${list.origin }" var="origin"/>
											<td>${fn:substring(origin, 0, 20)}...</td>
											<c:set value="${list.content }" var="content"/>
											<td>${fn:substring(content, 0, 20)}...</td>
										</tr>
									</c:forEach>
								</table>
								</div>
							</div>
							<div class="illustration">
								<img alt="" src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/characters/man-desk.svg">
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
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2><spring:message code="search.user.id"/></h2>
						</div>
						<div class="settings-form-wrapper">
							<div class="settings-form">
								<div class="columns is-multiline flex-portrait">
									<c:forEach items="${members}" var="list">
										<!--link-->
										<div class="column is-4">
										  	<a class="setting-sublink" href="${pageContext.request.contextPath}/profile.do?user_id=${list.user_id}">
												<div class="link-content">
													<h4>${list.name }</h4>
													<c:set value="${list.profile}" var="profile"/>
													<p>${fn:substring(profile, 0, 100)}...</p>
												</div>
											</a> 
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="illustration">
								<img alt="" src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/characters/crowd.svg">
							</div>
						</div>

					</div>
				</div>
				</c:if>

			</div>
		</div>
	</div>
	<!-- 컨텐츠 종료 -->
</c:if>
<c:if test="${empty notices and empty feeds and empty commentsList and empty commentcList and empty members }">
	<br><br>
	<div align="center">
		<h1><spring:message code="search.no.result"/></h1>
	</div>
	
</c:if>
</body>

</html>