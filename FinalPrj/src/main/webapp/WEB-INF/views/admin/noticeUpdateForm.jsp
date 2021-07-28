<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		{
			CKEDITOR
					.replace(
							'content',
							{
								filebrowserUploadUrl : '${pageContext.request.contextPath}/ckupload',
								height : '400px',
								width : '100%'
							});
		}
		;
		$('#btnNoticeList').on('click', function() {
			location.href = 'noticeList.do'
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
					<h2>공지사항수정</h2>
				</div>
			</div>

			<div class="stories-container">
				<form id="frm" action="noticeUpdate.do" method="post" enctype="multipart/form-data">
					<div>
						<table class="table">
							<tr>
								<td colspan="4" align="left"><input type="text" style="width:100%"
									class="form-control" id="title" name="title"
									value="${notice.title}">
							</tr>
							<tr>
								<th>작성일</th>
								<td width="70%" align="left">${notice.reg_date}</td>
								<th>조회수</th>
								<td>${notice.hit}</td>
							</tr>
							<tr>
								<td colspan="4" align="left"><textarea id="content"
										name="content">${notice.content}</textarea></td>
							</tr>
							<tr>
								<th>등록된 파일</th>
								<td colspan="4" align="left"><a href="fileDown.do?notice_id=${notice.notice_id}">${notice.fileName}</a>
								</td>
							</tr>
							<tr>
								<th>수정할 파일</th>
								<td colspan="4" align="left"><input type="file" name="file"
									size="50"></td>
							</tr>
						</table>
					</div>
					<div>
						<button type="submit">수정</button>
						<button type="button" id="btnNoticeList">목록</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 컨텐츠 종료 -->


	</div>


</body>
</html>