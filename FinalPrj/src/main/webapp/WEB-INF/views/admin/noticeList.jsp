<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script>
    $(document).ready(function() {
        $('#table_id').DataTable();
    
    } );
</script>
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

			<div class="stories-container">
				<form action="">
					<div>
						<table id="table_id" class="table table-striped table-bordered"
							style="width: 80%">
							<thead>
								<tr>
									<th>NO</th>
									<th>TITLE</th>
									<th>REG_DATE</th>
									<th>HIT</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>notice_1</td>
									<td>System Architect</td>
									<td>2021/07/27</td>
									<td>61</td>
								</tr>
							</tbody>
						</table>
					</div>
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