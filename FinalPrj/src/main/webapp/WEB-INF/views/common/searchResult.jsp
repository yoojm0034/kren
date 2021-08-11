<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
						<h1>검색결과</h1>
					</div>
				</div>
				<c:if test="${not empty notices }">
				<!-- /partials/settings/sections/general-settings.html -->
				<div id="general-settings" class="settings-section is-active">
					<div class="settings-panel">
						<div class="title-wrap">
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2>공지사항</h2>
						</div>
						
						<div class="settings-form-wrapper">
							<div class="illustration">
								<c:forEach items="${notices }" var="list">
									<div class="link-content">
											<div class="link-icon">
												<i data-feather="monitor"></i>
											</div>
											<a class="setting-sublink" href="${pageContext.request.contextPath}/userSelectNotice.do?notice_id=${list.notice_id}">
												<h4>${list.title }</h4>
											</a>	
											<hr>
									</div>
								</c:forEach>
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
							<h2>피드</h2>
						</div>
						<div class="settings-form-wrapper">
							<div class="illustration">
								<div class="link-content">
								<table class="table">							
										<tr>
											<th>피드번호</th>
											<th>태그</th>
											<th>피드내용</th>
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
							<h2>댓글</h2>
						</div>
						<div class="settings-form-wrapper">
							<div class="illustration">
								<div class="link-content">
								<table class="table">							
										<tr>
											<th>피드번호</th>
											<th>댓글번호</th>
											<th>댓글내용</th>
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
							<h2>교정댓글</h2>
						</div>
						<div class="settings-form-wrapper">
							<div class="illustration">
								<div class="link-content">
								<table class="table">							
										<tr>
											<th>피드번호</th>
											<th>댓글번호</th>
											<th>원글내용</th>
											<th>교정내용</th>
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
							<h2>유저</h2>
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
		<h1>검색결과 없음.</h1>
	</div>
	
</c:if>
</body>

</html>