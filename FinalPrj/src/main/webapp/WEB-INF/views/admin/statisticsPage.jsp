<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<div class="stories-wrapper is-home">

		<!-- 사이드바시작 -->
		<div class="stories-sidebar is-active">
			<div class="stories-sidebar-inner">
				<div class="user-block">
					<a class="close-settings-sidebar is-hidden"> <i
						data-feather="x"></i>
					</a>
					<div class="avatar-wrap">
						<img
							src="${pageContext.request.contextPath}/resources/upload/photo1.jpg"
							data-user-popover="0" alt="">
						<div class="badge">
							<i data-feather="check"></i>
						</div>
					</div>
					<h4>ADMIN</h4>
					<p>Daegu, KR</p>
					<div class="user-stats">
						<div class="stat-block">
							<span>Followers</span> <span>2.3K</span>
						</div>
						<div class="stat-block">
							<span>Following</span> <span>2.3K</span>
						</div>
					</div>
				</div>
				<div class="user-menu">
					<div class="user-menu-inner has-slimscroll">
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/admin.do'">
									<a> <span>유저관리</span>
								</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userReportList.do'">
									<a> <span>신고내역</span>
								</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userTopicList.do'">
									<a> <span>관심사관리</span>
								</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userTagList.do'">
									<a> <span>태그관리</span>
								</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userStampList.do'">
									<a> <span>상품목록</span>
								</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userPaymentList.do'">
									<a> <span>결제내역</span>
								</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/noticeList.do'">
									<a> <span>공지사항</span>
								</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userQnaList.do'">
									<a> <span>문의사항</span>
								</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li class="is-active"
									onclick="location.href='${pageContext.request.contextPath}/admin/statisticsPage.do'">
									<a> <span>통계관리</span>
								</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 사이드바 종료 -->
		<!-- 컨텐츠 시작 -->
		<div class="inner-wrapper" style="width: 80%">

			<div class="stories-container">
				<div class="settings-wrapper">
					<div class="stories-content">
						<div class="section-title main-section-title">
							<h2>통계페이지</h2>
						</div>
					</div>
					<!-- /partials/settings/sections/general-settings.html -->
					<div id="general-settings" class="settings-section is-active">
						<div class="settings-panel">

							<div class="title-wrap">
								<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
								</a>
								<h2>통계그래프</h2>
							</div>

							<div class="settings-form-wrapper">
								<div class="illustration">

									<p>
										If you'd like to learn more about general settings, you can
										read about it in the <a>user guide</a>.
									</p>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div id="general-settings" class="settings-section is-active">
						<div class="settings-panel">

							<div class="title-wrap">
								<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
								</a>
								<h2>General Settings</h2>
							</div>

							<div class="settings-form-wrapper">
								<div class="illustration">
									<p>
										If you'd like to learn more about general settings, you can
										read about it in the <a>user guide</a>.
									</p>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div id="general-settings" class="settings-section is-active">
						<div class="settings-panel">
							<div class="title-wrap">
								<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
								</a>
								<h2>통계그래프</h2>
							</div>
							<div class="settings-form-wrapper">
								<div class="settings-form">
									<div class="columns is-multiline flex-portrait">
										<!--link-->
										<div class="column is-4">
											<a class="setting-sublink">
												<div class="link-content">
													<div class="link-icon">
														<i data-feather="monitor"></i>
													</div>
													<h4>Devices</h4>
													<p>Manage connected devices</p>
												</div>
											</a>
										</div>
										<!--link-->
										<div class="column is-4">
											<a class="setting-sublink">
												<div class="link-content">
													<div class="link-icon">
														<i data-feather="codesandbox"></i>
													</div>
													<h4>Authentication</h4>
													<p>Authentication settings</p>
												</div>
											</a>
										</div>
										<!--link-->
										<div class="column is-4">
											<a class="setting-sublink">
												<div class="link-content">
													<div class="link-icon">
														<i data-feather="box"></i>
													</div>
													<h4>API</h4>
													<p>API settings</p>
												</div>
											</a>
										</div>
										<!--link-->
										<div class="column is-4">
											<a class="setting-sublink">
												<div class="link-content">
													<div class="link-icon">
														<i data-feather="search"></i>
													</div>
													<h4>Search</h4>
													<p>Search settings</p>
												</div>
											</a>
										</div>
										<!--link-->
										<div class="column is-4">
											<a class="setting-sublink">
												<div class="link-content">
													<div class="link-icon">
														<i data-feather="cloud-snow"></i>
													</div>
													<h4>Cloud Settings</h4>
													<p>Manage storage</p>
												</div>
											</a>
										</div>
										<!--link-->
										<div class="column is-4">
											<a class="setting-sublink">
												<div class="link-content">
													<div class="link-icon">
														<i data-feather="cpu"></i>
													</div>
													<h4>Cache</h4>
													<p>Cache settings</p>
												</div>
											</a>
										</div>
										<!--link-->
										<div class="column is-4">
											<a class="setting-sublink">
												<div class="link-content">
													<div class="link-icon">
														<i data-feather="gift"></i>
													</div>
													<h4>Reedeem</h4>
													<p>Reedeem your points</p>
												</div>
											</a>
										</div>
										<!--link-->
										<div class="column is-4">
											<a class="setting-sublink">
												<div class="link-content">
													<div class="link-icon">
														<i data-feather="command"></i>
													</div>
													<h4>Shortcuts</h4>
													<p>manage shortcuts</p>
												</div>
											</a>
										</div>
										<!--link-->
										<div class="column is-4">
											<a class="setting-sublink">
												<div class="link-content">
													<div class="link-icon">
														<i data-feather="layout"></i>
													</div>
													<h4>Layout</h4>
													<p>Layout settings</p>
												</div>
											</a>
										</div>
									</div>
								</div>

								<div class="illustration">
									<p>
										If you'd like to learn more about preferences settings, you
										can read about it in the <a>user guide</a>.
									</p>
								</div>
							</div>

						</div>
					</div>



				</div>
			</div>
		</div>
		<!-- 컨텐츠 종료 -->


	</div>
</body>
</html>