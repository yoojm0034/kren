<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript"
	src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						const dataSource = {
							contentType : 'application/json',
							api : {
								readData : {
									url : '${pageContext.request.contextPath}/admin/usersList.do',
									method : 'GET'
								},
								updateData : {
									url : '${pageContext.request.contextPath}/admin/usersUpdate.do',
									method : 'PUT'
								}
							}
						};
						console.log(dataSource);
						const Grid = tui.Grid; //인스턴스 객체 생성 
						const recruitGrid = new Grid({
							el : document.getElementById('recruitGrid'), // DOM의 id지정
							data : dataSource,
							columns : [ {
								header : 'USERS(desc)',
								name : 'user_id',
								sortingType : 'desc',
								sortable : true,
								align : 'center'
							}, {
								header : 'NAME',
								name : 'name',
								align : 'center',
								filter : {
									type : 'text',
									showApplyBtn : true,
									showClearBtn : true
								}
							}, {
								header : 'EMAIL',
								name : 'email',
								align : 'center'
							}, {
								header : 'CONUTRY',
								name : 'country',
								align : 'center'
							}, {
								header : 'REPORTED',
								name : 'report_cnt',
								align : 'center'
							}, {
								header : 'STATUS',
								name : 'status',
								editor : {
									type : 'select',
									options : {
										listItems : [ {
											text : '일반회원',
											value : '일반회원'
										}, {
											text : '정지회원',
											value : '정지회원'
										} ]
									}
								},
								align : 'center'
							} ],
							rowHeaders : [ 'checkbox' ],
							pagination : true,
							pageOptions : {
								useClient : true,
								perPage : 10
							}
						});
						$('#sync').click(function() {
							recruitGrid.request('updateData', {
								checkedOnly : true
							});

						});

					});
</script>
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
								<li class="is-active"
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
								<li
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
			<a class="mobile-sidebar-trigger is-home-v2"> <i
				data-feather="menu"></i>
			</a>
			<div class="stories-content">
				<div class="section-title main-section-title">
					<h2>유저관리</h2>
				</div>
			</div>
			<div align="right">
				<button
					onclick="location.href='${pageContext.request.contextPath}/home.do'"
					class="button">홈으로</button>
				<button id="sync" class="button">수정</button>
			</div>
			<div class="stories-container">
				<div class="container-inner">
					<div align="center">
						<div id="recruitGrid"></div>
					</div>
				</div>
			</div>
			전체 방문자 수: ${totalCount} 오늘의 방문자 수: ${todayCount}
			<button id="btnPushTest" onclick="sendText()" type="button">test</button>
			<div id="test"></div>
			
		</div>
		<!-- 컨텐츠 종료 -->


	</div>




</body>
</html>