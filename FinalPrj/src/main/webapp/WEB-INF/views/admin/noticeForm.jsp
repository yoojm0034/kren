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
                        <a class="close-settings-sidebar is-hidden">
                            <i data-feather="x"></i>
                        </a>
                        <div class="avatar-wrap">
                            <img src="${pageContext.request.contextPath}/resources/upload/photo1.jpg" data-user-popover="0" alt="">
                            <div class="badge">
                            	<i data-feather="check"></i>
                        	</div>
                        </div>
                        <h4>ADMIN</h4>
                        <p>Daegu, KR</p>
                         <div class="user-stats">
                            <div class="stat-block">
                                <span>Followers</span>
                                <span>2.3K</span>
                            </div>
                            <div class="stat-block">
                                <span>Following</span>
                                <span>2.3K</span>
                            </div>
                        </div>
                    </div>
                    <div class="user-menu">
                        <div class="user-menu-inner has-slimscroll">
                            <div class="menu-block">
                                <ul>
                                    <li onclick="location.href='${pageContext.request.contextPath}/admin/admin.do'">
                                        <a>
                                            <span>유저관리</span>
                                        </a>
                                    </li>
                                    <li onclick="location.href='${pageContext.request.contextPath}/admin/userReportList.do'">
                                        <a>
                                            <span>신고내역</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="separator"></div>
                            <div class="menu-block">
                                <ul>
                                    <li onclick="location.href='${pageContext.request.contextPath}/admin/userTopicList.do'">
                                        <a>
                                            <span>관심사관리</span>
                                        </a>
                                    </li>
                                    <li onclick="location.href='${pageContext.request.contextPath}/admin/userTagList.do'">
                                        <a>
                                            <span>태그관리</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="separator"></div>
                            <div class="menu-block">
                                <ul>
                                    <li onclick="location.href='${pageContext.request.contextPath}/admin/userStampList.do'">
                                        <a>
                                            <span>상품목록</span>
                                        </a>
                                    </li>
                                    <li onclick="location.href='${pageContext.request.contextPath}/admin/userPaymentList.do'">
                                        <a>
                                            <span>결제내역</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="separator"></div>
                            <div class="menu-block">
                                <ul>
                                    <li class="is-active" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList.do'">
                                        <a>
                                            <span>공지사항</span>
                                        </a>
                                    </li>
                                    <li onclick="location.href='${pageContext.request.contextPath}/admin/userQnaList.do'">
                                        <a>
                                            <span>문의사항</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="separator"></div>
                            <div class="menu-block">
                                <ul>
                                    <li onclick="location.href='${pageContext.request.contextPath}/admin/statisticsPage.do'">
                                        <a>
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
		<div class="inner-wrapper" style="width:80%">
			<a class="mobile-sidebar-trigger is-home-v2"> <i
				data-feather="menu"></i>
			</a>
			<div class="stories-content">
				<div class="section-title main-section-title">
					<h2>공지사항작성</h2>
				</div>
			</div>

			<div class="stories-container" >
				<form action="${pageContext.request.contextPath}/admin/noticeInsert.do" enctype="multipart/form-data"
					method="post">
					<div>
						<label for="title">글 제목</label> 
						<input type="text" id="title" name="title" placeholder="글 제목" class="input">
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
						<button type="reset" class="button">작성취소</button>
						<button type="submit" class="button">작성하기</button>
						<br>
					</div>
					<div align="right">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList.do'"
							class="button">목록으로</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 컨텐츠 종료 -->


	</div>


</body>
</html>