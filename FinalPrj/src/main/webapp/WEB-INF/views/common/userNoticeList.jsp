<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.inner-wrapper {
	width: 60%;
	margin: auto;
	padding-top: 3%;
}

.title {
	font-size:1.5rem;
	font-weight: 600;
	padding-top: 40px;
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

.table th:not([align]){ text-align: center}

</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#table').DataTable({
			columnDefs : [ {
				"targets" : [ 0 ],
				"visible" : false,
				"searchable" : false
			} ],
			order : [ [ 0, 'desc' ] ],
			info : false,
			lengthChange : false
		});
	});

	$(function() {
		$('#table tbody tr')
				.on(
						'click',
						function() {
							location.href = '${pageContext.request.contextPath}/userSelectNotice.do?notice_id='
									+ $(this).data('id')
						})
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
						<div class="card shadow mb-4" style="box-shadow: 0 0 19px 4px #b2b2b2;">
							<div class="card-body">
								<div style="padding-top: 40px;">
								<span class="title">공지사항</span>
								<button type="button" id="btnBack" class="button primary-button" style="float: right;">이전페이지</button>
								</div>
								<hr>
								<div class="table-responsive">
									<table class="table" id="table"
										style="width: 100%; cellspacing: 0;">
										<thead style="background-color: #edeaea">
											<tr>
												<th>글번호</th>
												<th width="60%">제목</th>
												<th width="20%">등록일</th>
												<th width="10%">작성자</th>
												<th width="10%">조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${noticeList }" var="vo">
												<tr data-id="${vo.notice_id}">
													<td>${vo.notice_id }</td>
													<td>${vo.title }</td>
													<td>${vo.reg_date }</td>
													<td>관리자</td>
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
	</div>
	<!-- 컨텐츠 종료 -->
</body>
</html>