<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/app.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/css/core.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/assets/vendor/datatables/dataTables.bootstrap4.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
</head>
<body>
	<div class="wrap" align="center">
		<div class="contents">
			<table class="table" style="width: 80%">
				<c:forEach items="${content}" var="content">
				<tr>
					<th width="100px">피드번호</th>
					<td>${content.feed_id }</td>
				</tr>
				<tr>
					<th>댓글번호</th>
					<td>${content.cc_id }</td>
				</tr>
				<tr>
					<th>피신고자</th>
					<td>${content.user_id }</td>
				</tr>
				<tr>
					<th>라인</th>
					<td>${content.line }</td>
				</tr>
				<tr>
					<th>댓글내용</th>
					<td>${content.origin }</td>
				</tr>
				<tr>
					<th>교정내용</th>
					<td>${content.content }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<div >
			<button id="reset" onclick='window.close()' class="button">취소</button>
			<button id="del" type="button"
				class="button is-solid primary-button raised">게시물 삭제</button>
			<button id="read" type="button"
				class="button is-solid primary-button raised">게시물 읽음처리</button>	
		</div>
	</div>
</body>
</html>