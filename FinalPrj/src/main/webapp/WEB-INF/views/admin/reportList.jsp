<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript"
	src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<!-- 모달 -->	
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />	


<script type="text/javascript">
	$(document).ready(function() {
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
								filter : {
									type : 'text',
									showApplyBtn : true,
									showClearBtn : true
								},
								align : 'center'
							}, {
								header : 'NAME',
								name : 'name',
								align : 'center',
								sortingType : 'desc',
								sortable : true
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
							alert("회원상태를 수정하였습니다.");
							location.reload();
						});
									
						
	});
	function clickContent(data) {
	
		var w = 860;
	    var h = 580;
	    var popupOption= "width="+w+", height="+h;
	    var popupX = (document.body.offsetWidth/2) - (w/2);
		var popupY= (document.body.offsetHeight/2) - (h/2);
	    var target ='pop';
		window.open('${pageContext.request.contextPath}/admin/reportAdmin.do?data='+data,target,popupOption,'left='+ popupX + ', top='+ popupY);
	};	
	
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
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/admin.do'">
									<a> <span>유저관리</span>
								</a>
								</li>
								<li class="is-active"
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
					<h2>신고현황</h2>
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
												<table class="table table-bordered" id="dataTable"
													style="width: 100%; cellspacing: 0;">
													<thead>
														<tr>
															<th>글번호</th>
															<th width="30%">신고사유</th>
															<th>등록일</th>
															<th>피신고자</th>
															<th>신고컨텐츠</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${reportList}" var="vo">
															<tr>
																<td>${vo.report_id}</td>
																<td>${vo.msg }</td>
																<td>${vo.reg_date }</td>
																<td>${vo.reported }</td>
																<c:set var="content" value="${vo.content}" />
																<%-- <c:if test="${fn:contains(content,'feed')}"> data-modal="share-modal"  class="button modal-trigger" --%>
																<td>
																	<a data-content="${vo.content }" id="clickContent" onclick="clickContent('${vo.content }')">${vo.content }</a>
																</td>
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

		<div class="inner-wrapper" style="width: 80%">
			<a class="mobile-sidebar-trigger is-home-v2"> <i
				data-feather="menu"></i>
			</a>
			<div class="stories-content">
				<div class="section-title main-section-title">
					<h2>피신고자 처리</h2>
				</div>
			</div>
			<div align="right">
				<button id="sync" class="button">수정</button>
			</div>
			<div class="stories-container">
				<div class="container-inner">
					<div align="center">
						<div id="recruitGrid"></div>
					</div>
				</div>
			</div>

		</div>

	</div>
	
	<!-- 컨텐츠 종료 -->
</body>
</html>