	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			location.href = '${pageContext.request.contextPath}/admin/noticeList.do'
		});
		$('#btnFileDelete').on('click', function() {
			let result = confirm("삭제하시겠습니까?")
			if(result) {
				window.alert("삭제되었습니다.")
				location.href = '${pageContext.request.contextPath}/admin/noticeFileDelete.do?notice_id='+$(this).data('id')
			}
		});
		$('#btnNoticeDelete').on('click', function() {
			let result = confirm("삭제하시겠습니까?")
			if(result) {
				window.alert("삭제되었습니다.")
				location.href = '${pageContext.request.contextPath}/admin/noticeDelete.do?notice_id='+$(this).data('id')
			}
			
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
		<div class="inner-wrapper"  style="width:80%">
			<a class="mobile-sidebar-trigger is-home-v2"> <i
				data-feather="menu"></i>
			</a>
			<div class="stories-content">
				<div class="section-title main-section-title">
					<h2>공지사항수정</h2>
				</div>
			</div>

			<div class="stories-container">
				<form id="frm" action="${pageContext.request.contextPath}/admin/noticeUpdate.do" method="post" enctype="multipart/form-data">
					<div>
						<input type="hidden" name="notice_id" value="${notice.notice_id}">	
						<table class="table">
							<tr>
								<td colspan="4" align="left"><input class="input" type="text" style="width:100%"
									class="form-control" id="title" name="title"
									value="${notice.title}">
							</tr>
							<tr>
								<th>작성일</th>
								<td width="80%" align="left">${notice.reg_date}</td>
								<th>조회수</th>
								<td>${notice.hit}</td>
							</tr>
							<tr>
								<td colspan="4" align="left"><textarea id="content"
										name="content">${notice.content}</textarea></td>
							</tr>
							<tr>
								<th>등록된 파일</th>
								<td colspan="4" align="left"><a href="${pageContext.request.contextPath}/fileDown.do?notice_id=${notice.notice_id}">${notice.fileName}</a>
									<c:if test="${not empty notice.fileName}">
										<button type="button" id="btnFileDelete" data-id="${notice.notice_id}" class="button grey-button">삭제</button>
									</c:if>
									<c:if test="${empty notice.fileName}">
										등록된 파일 없음
									</c:if>
								</td>
							</tr>
							<tr>
								<th>수정할 파일</th>
								<td colspan="4" align="left">
									<c:if test="${empty notice.fileName}">
										<input type="file" name="file" size="50" >
									</c:if>
									<c:if test="${not empty notice.fileName}">
										기존 파일 삭제 후 업로드 가능합니다.
									</c:if>
								</td>
							</tr>
						</table>
					</div>
					<div>
						<button type="submit" class="button grey-button">수정</button>
						<button type="button" id="btnNoticeList" class="button grey-button">목록</button>
						<button type="button" id="btnNoticeDelete" data-id="${notice.notice_id}" class="button grey-button">삭제</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 컨텐츠 종료 -->


	</div>


</body>
</html>