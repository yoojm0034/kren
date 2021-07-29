<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR.replace('content',
						{
							filebrowserUploadUrl : '${pageContext.request.contextPath}/ckupload',
							height : '500px',
							width : '100%'
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
								 <li onclick="location.href='admin/admin.do'">
                                        <a>
                                            <span>유저관리</span>
                                        </a>
                                    </li>
                                    <li onclick="location.href='admin/userReportList.do'">
                                        <a>
                                            <span>신고내역</span>
                                        </a>
                                    </li>
                                    <li onclick="location.href='admin/userQnaList.do'">
                                        <a>
                                            <span>문의사항</span>
                                        </a>
                                    </li>
                                    <li onclick="location.href='admin/userTopicList.do'">
                                        <a>
                                            <span>관심사관리</span>
                                        </a>
                                    </li>
                                     <li onclick="location.href='admin/userTagList.do'">
                                        <a>
                                            <span>태그관리</span>
                                        </a>
                                    </li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li onclick="location.href='admin/userStampList.do'"><a> <span>상품목록</span>
								</a></li>
								<li onclick="location.href='admin/userPaymentList.do'"><a> <span>결제내역</span>
								</a></li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li onclick="location.href='admin/noticeList.do'"><a> <span>공지사항</span>
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
					<h2>공지사항작성</h2>
				</div>
			</div>

			<div class="stories-container">
				<form action="admin/noticeInsert.do" enctype="multipart/form-data"
					method="post">
					<div>
						<label for="title">글 제목</label> 
						<input type="text" id="title" name="title" placeholder="글 제목">
					</div>
					<div>
						<label for="job-title">글 내용</label>
						<textarea id="content" name="content"></textarea>
					</div>
					<div>
						<label for="company-website-tw d-block">파일 첨부</label> <input
							type="file" id="file" name="file">
					</div>

					<div align="center">
						<button type="reset" >작성취소</button>
						<button type="submit">작성하기</button>
						<br>
					</div>
					<div align="right">
						<button type="button" onclick="location.href='admin/noticeList.do'"
							class="btn btn-light">목록으로</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 컨텐츠 종료 -->


	</div>


</body>
</html>