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
			location.href = '${pageContext.request.contextPath}/userNoticeList.do'
		});
		$('#btnBack').on('click', function() {
			history.back();
		});
	});
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
					<h2>공지사항수정</h2>
				</div>
			</div>

			<div class="stories-container">
					<div>
						<input type="hidden" name="notice_id" value="${notice.notice_id}">	
						<table class="table">
							<tr>
								<td colspan="4" align="left"><input class="input" type="text" style="width:100%"
									class="form-control" id="title" name="title"
									value="${notice.title}" readonly="readonly">
							</tr>
							<tr>
								<th>작성일</th>
								<td width="80%" align="left">${notice.reg_date}</td>
								<th>조회수</th>
								<td>${notice.hit}</td>
							</tr>
							<tr>
								<td colspan="4" align="left"><textarea id="content"
										name="content" readonly="readonly">${notice.content}</textarea></td>
							</tr>
							<tr>
								<th>등록된 파일</th>
								<td colspan="4" align="left"><a href="${pageContext.request.contextPath}/fileDown.do?notice_id=${notice.notice_id}">${notice.fileName}</a>
									<c:if test="${empty notice.fileName}">
										등록된 파일 없음
									</c:if>
								</td>
							</tr>
						</table>
					</div>
					<div>
						<button type="button" id="btnNoticeList" class="button grey-button">목록</button>
					</div>
			</div>
		</div>
		<!-- 컨텐츠 종료 -->


	</div>


</body>
</html>