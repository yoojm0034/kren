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

.inner-wrapper {
	width: 60%;
	margin: auto;
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
	color: #a2a2a5;
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
.table th:not([align]){ text-align: center}
/* The Modal (background) */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
	background-color: #fefefe;
	position: fixed;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	width: 50%; /* Could be more or less, depending on screen size */
	height: 70%;
}
</style>
<script>
	$(function() {
		$("#table").DataTable({
			// 표시 건수기능 숨기기
			lengthChange : false,
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
		$('#table tbody').on('click', 'tr',function(){
			var id = $(this).data('id');
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/userdata.do?data="+id,
				method : "post",
				type : "json",
				success : function(data) {
					var div = '<table class="table"><tr>'
							+ '<th colspan="4" align="left"><h2>'+data.name+'의 상세정보</h2></th></tr>'
							+ '<tr><th>프로필사진</th><td width="10%" align="left" colspan="3"><img src=${pageContext.request.contextPath}/resources/upload/'+data.uuid+' width="100px" height="100px"></td>'
							+ '<tr><th>아이디</th><td width="10%" align="left">'+data.user_id+'</td>'
							+ '<th>이름</th><td>'+data.name+'</td></tr>'
							+ '<tr><th>소개</th><td colspan="4" align="left"><textarea class="textarea comment-textarea" rows="6" id="content" name="content" width="100%" readonly="readonly">'+data.profile+'</textarea></td></tr>'
							+ '<tr><th>이메일</th><td colspan="4" align="left">'+data.email+'</td></tr>'
							+ '<tr><th>모국어</th><td width="10%" align="left">'+data.language1+'</td>'
							+ '<th>배울언어</th><td>'+data.language2+'</td></tr>'
							+ '<tr><th>나라</th><td width="10%" align="left">'+data.country+'</td>'
							+ '<th>도시</th><td>'+data.city+'</td></tr>'
							+ '<tr><th>가입일</th><td width="10%" align="left">'+data.reg_date+'</td>'
							+ '<th>회원상태</th><td>'+data.status+'</td></tr>'
							+ '<tr><th>국기</th><td  align="left"><img src='+data.flag+' width="20px"></td><th>성별</th><td>'+data.gender+'</td></tr>'
							+ '</table>'
							
					$('#modalcontent').prepend(div);		
				}
			});
			$("#modal").show();
		});
		$('#closeModal').click(function() {
			$("#modalcontent").html('');
			$('.searchModal').hide();
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
							src="${pageContext.request.contextPath}/resources/upload/3bb0add0-85b2-4407-832f-ee556d08d585.jpeg"
							data-user-popover="0" alt="">
						<div class="badge">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>
						</div>
					</div>
					<h4>ADMIN</h4>
					<p>Daegu, KR</p>
					<div class="user-stats">
                         <div class="stat-block">
                             <span>KREN</span>
                             <span>관리자 페이지</span>
                         </div>
                   </div>
				</div>
				<div class="user-menu">
					<div class="user-menu-inner has-slimscroll">
						<div class="menu-block">
							<ul>
								<li class="is-active"
									onclick="location.href='${pageContext.request.contextPath}/admin/admin.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
									<span>유저관리</span>
									</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userReportList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
									<span>신고내역</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userTopicList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-life-buoy"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="4"></circle><line x1="4.93" y1="4.93" x2="9.17" y2="9.17"></line><line x1="14.83" y1="14.83" x2="19.07" y2="19.07"></line><line x1="14.83" y1="9.17" x2="19.07" y2="4.93"></line><line x1="14.83" y1="9.17" x2="18.36" y2="5.64"></line><line x1="4.93" y1="19.07" x2="9.17" y2="14.83"></line></svg>
									<span>관심사관리</span>
									</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userTagList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-life-buoy"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="4"></circle><line x1="4.93" y1="4.93" x2="9.17" y2="9.17"></line><line x1="14.83" y1="14.83" x2="19.07" y2="19.07"></line><line x1="14.83" y1="9.17" x2="19.07" y2="4.93"></line><line x1="14.83" y1="9.17" x2="18.36" y2="5.64"></line><line x1="4.93" y1="19.07" x2="9.17" y2="14.83"></line></svg>
									<span>태그관리</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userStampList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
									<span>상품목록</span>
									</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userPaymentList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
									<span>결제내역</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/noticeList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
									<span>공지사항</span>
									</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userQnaList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-send"><line x1="22" y1="2" x2="11" y2="13"></line><polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg>
									<span>문의사항</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/statisticsPage.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
									<span>통계관리</span>
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
		<div class="inner-wrapper" style="width: 85%">
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
									<div class="card shadow mb-4" style="box-shadow: 0 0 19px 4px #b2b2b2;">
										<div class="card-body">
											<div class="table-responsive">
												<table class="table" id="table" 
													style="width: 100%; cellspacing: 0;">
													<thead style="background-color: lightgray;">
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
													<tbody align="center">
														<c:forEach items="${userList }" var="vo">
															<tr data-id="${vo.user_id}">
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
		<!-- 모달창 영역 -->
	<div id="modal" class="searchModal">
		<div class="search-modal-content" align="center">
			<div id="modalcontent" style="width:100%">
			</div>
			<br>
			<button class="button" id="closeModal">close</button>
		</div>
	</div>




</body>
</html>