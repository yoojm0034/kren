<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.pagination {
	display: flex;
	padding-left: 0;
	list-style: none;
	border-radius: .35rem;
}

div.dataTables_wrapper div.dataTables_paginate ul.pagination {
	margin: 2px 0;
	white-space: nowrap;
	justify-content: flex-end;
}

.page-link {
	position: relative;
	display: block;
	padding: .5rem .75rem;
	margin-left: -1px;
	line-height: 1.25;
	color: #4e73df;
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
	background-color: silver;
}
</style>
<script>
	$(function() {
		$("#table").DataTable({
			// 표시 건수기능 숨기기
			lengthChange : true,
			lengthMenu : [ 10, 20, 30, 40, 50 ],
			// 검색 기능 숨기기
			searching : true,
			// 정렬 기능 숨기기
			ordering : true,
			// 정보 표시 숨기기
			info : false,
			// 페이징 기능 숨기기
			paging : true
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

			<h1>전체 방문자 수: ${totalCount} / 오늘의 방문자 수: ${todayCount}</h1>
			<button onclick="sendTextPush('admin','feed_2')" type="button">댓글</button>
			<button onclick="sendFollowPush('admin')" type="button">팔로우</button>
			<button onclick="sendLetterPush('admin')" type="button">편지</button>
			<button onclick="sendLikePush('admin','feed_2')" type="button">좋아요</button>

			<!-- 컨텐츠 시작 -->
			<a class="mobile-sidebar-trigger is-home-v2"> <i
				data-feather="menu"></i>
			</a>
			<div class="stories-content">
				<div class="section-title main-section-title">
					<h2>회원관리</h2>
				</div>
			</div>

			<div class="stories-container" id="page-top">
				<form action="">
					<!-- Page Wrapper -->
					<div id="wrapper">
						<!-- Content Wrapper -->
						<div id="content-wrapper" class="d-flex flex-column">
							<!-- Main Content -->
							<div id="content">
								<!-- Begin Page Content -->
								<div class="container-fluid">
									<!-- DataTales Example -->
									<div class="card shadow mb-4">
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-bordered" id="table"
													style="width: 100%; cellspacing: 0;">
													<thead>
														<tr>
															<th>이메일</th>
															<th>아이디</th>
															<th>이름</th>
															<th>생년월일</th>
															<th>성별</th>
															<th>나라</th>
															<th>회원상태</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${userList }" var="vo">
															<tr>
																<td>${vo.email}</td>
																<td>${vo.user_id }</td>
																<td>${vo.name }</td>
																<fmt:formatDate var="birth" value="${vo.birth}"
																	type="DATE" pattern="yyyy/MM/dd" />
																<td>${birth }</td>
																<td>${vo.gender }</td>
																<td>${vo.country }</td>
																<td>${vo.status }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.container-fluid -->

					</div>
					<!-- End of Main Content -->
				</form>
			</div>
		</div>
	</div>
	<!-- 컨텐츠 종료 -->





</body>
</html>