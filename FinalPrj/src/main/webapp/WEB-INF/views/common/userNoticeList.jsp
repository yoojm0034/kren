<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
<script type="text/javascript">
 $(function(){
	$('#dataTable tbody tr').on('click', function(){
		location.href='${pageContext.request.contextPath}/userSelectNotice.do?notice_id='+$(this).data('id')
	})
	$('#btnHome').on('click', function(){
		location.href='${pageContext.request.contextPath}/feed.do'
	})
 })	
</script>
</head>
<body>
	<div class="stories-wrapper is-home">
		<!-- 컨텐츠 시작 -->
		<div class="inner-wrapper"  style="width:80%">
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
															<th width="50%">제목</th>
															<th>등록일</th>
															<th>작성자</th>
															<th>조회수</th>
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
				</form>
			</div>
			<div>
				<button id="btnHome" class="button grey-button">홈으로</button>
			</div>
		</div>
		<!-- 컨텐츠 종료 -->
	</div>


</body>
</html>