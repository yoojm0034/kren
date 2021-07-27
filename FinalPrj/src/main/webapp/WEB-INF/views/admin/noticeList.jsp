<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
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
</style>
</head>
<body>
	<div class="stories-wrapper is-home">

		<!-- 사이드바시작 -->
		<div class="stories-sidebar is-active">
			<div class="stories-sidebar-inner">
				<div class="user-block">
					<a class="close-stories-sidebar is-hidden"> <i data-feather="x"></i>
					</a>
					<div class="avatar-wrap">
						<img src="https://via.placeholder.com/150x150"
							data-demo-src="assets/img/avatars/jenna.png"
							data-user-popover="0" alt="">
					</div>
					<h4>Jenna Davis</h4>
					<p>Melbourne, AU</p>
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
								<li onclick="location.href='admin.do'"><a> <span>유저관리</span>
								</a></li>
								<li onclick="location.href='reportList.do'"><a> <span>신고내역</span>
								</a></li>
								<li onclick="location.href='qnaList.do'"><a> <span>문의사항</span>
								</a></li>
								<li onclick="location.href='topicList.do'"><a> <span>관심사관리</span>
								</a></li>
								<li onclick="location.href='tagList.do'"><a> <span>태그관리</span>
								</a></li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li onclick="location.href='stampList.do'"><a> <span>상품목록</span>
								</a></li>
								<li onclick="location.href='paymentList.do'"><a> <span>결제내역</span>
								</a></li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li onclick="location.href='noticeList.do'"><a> <span>공지사항</span>
								</a></li>
								<li onclick="location.href='#'"><a> <span>통계관리</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 사이드바 종료 -->
		<!-- 컨텐츠 시작 -->
		<div class="inner-wrapper">
			<a class="mobile-sidebar-trigger is-home-v2"> <i
				data-feather="menu"></i>
			</a>
			<div class="stories-content">
				<div class="section-title main-section-title">
					<h2>공지사항</h2>
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
												<table class="table table-bordered" id="dataTable" style="width:100%;cellspacing:0;" >
													<thead>
														<tr>
															<th>글번호</th>
															<th>제목</th>
															<th>등록일</th>
															<th>조회수</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${noticeList }" var="vo">
														<tr onclick="">
															<td>${vo.notice_id }</td>
															<td>${vo.title }</td>
															<td>${vo.reg_date }</td>
															<td>${vo.hit }</td>
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
			<div>
				<button onclick="location.href='noticeForm.do'">공지사항작성</button>
			</div>
		</div>
		<!-- 컨텐츠 종료 -->
	</div>


</body>
</html>