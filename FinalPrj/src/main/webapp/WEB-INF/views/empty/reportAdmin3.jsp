<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">

	<title>KREN</title>

	<link rel="icon" type="image/png" href="${pageContext.request.contentType}/resources/template/assets/img/favicon.png" />

	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/fontisto@v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet">

	<!-- Core CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/core.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/vendor/datatables/dataTables.bootstrap4.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>



</head>
<script type="text/javascript">
	$(function() {
		$('#del').click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/delContent.do',
				type : 'POST',
				data : {
					content : '${content.comment_id}'
				},
				success : function(data) {
					if (data > 0) {
						console.log("데이터 전송이 성공적으로 끝났을 때 실행");
						alert("게시물이 정상적으로 삭제되었습니다.");
						opener.parent.location.reload();
						window.close();
					}

				},
				error : function(err) {
					console.log(err);
				}
			});

		})
		
		$('#read').click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/readContent.do',
				type : 'POST',
				data : {
					content : '${content.comment_id}'
				},
				success : function(data) {
					if (data > 0) {
						console.log("데이터 전송이 성공적으로 끝났을 때 실행");
						alert(data + "건 읽음");
						opener.parent.location.reload();
						window.close();
					}

				},
				error : function(err) {
					console.log(err);
				}
			});

		})

	})
</script>


<!-- 신고게시물이 댓글인경우 오는 페이지 -->
<body>
	<br>
	<div class="wrap" align="center">
		<div class="contents">
			<table  class="table" style="width:80%">
				<tr>
					<th width="100px">피드번호</th>
					<td>${content.feed_id }</td>
				</tr>
				<tr>
					<th>댓글번호</th>
					<td>${content.comment_id }</td>
				</tr>
				<tr>
					<th>피신고자</th>
					<td>${content.user_id }</td>
				</tr>
				<tr>
					<th>댓글내용</th>
					<td>${content.content }</td>
				</tr>
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
	
	
	
	
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/app.js"></script>
    <script src="https://js.stripe.com/v3/"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/data/tipuedrop_content.js"></script>

    <!-- Core js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/global.js"></script>

    <!-- Navigation options js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-v1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-mobile.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-options.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/sidebar-v1.js"></script>

    <!-- Core instance js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/chat.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/touch.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/tour.js"></script>

    <!-- Components js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/explorer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/widgets.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/modal-uploader.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/popovers-users.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/popovers-pages.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/lightbox.js"></script>

    <!-- Landing page js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/landing.js"></script>
	
	<!--  Feed pages js -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/feed.js"></script>

    <script src="${pageContext.request.contextPath}/resources/template/assets/js/webcam.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/compose.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/autocompletes.js"></script>
	
	<!-- inbox js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/inbox.js"></script>
	 
	<!-- friends js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/js/friends.js"></script>
	
	<!-- DATATABLES PLUGINS -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/vendor/datatables/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/vendor/datatables/dataTables.bootstrap4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/vendor/datatables/datatables-demo.js"></script>
</body>



</html>