<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
</head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
$(function(){
	var colors = ['red','blue']
	var options = {
		title : '시간대별 접속자수',
		width : 1000,
		height : 500
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	google.setOnLoadCallback(function() {
		//차트에 넣을 data를 ajax 요청해서 가져옴
		$.ajax({
			url : "${pageContext.request.contextPath}/getChartData.do",
			method : "post",
			type : "json",
			success : function(data) {
				//ajax결과를 chart에 맞는 data 형태로 가공
				var chartData = [];
				chartData.push([ '시간대', '접속자수', { role: 'style' } ])
				for (i = 0; i < data.length; i++) {
					var subarr = [ data[i].TIME+" ", parseInt(data[i].CNT) , colors[i%2] ];
					chartData.push(subarr);
				}
				//챠트 그리기
				var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
				chart.draw(google.visualization.arrayToDataTable(chartData),options);
			}
		});
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
							src="${pageContext.request.contextPath}/resources/upload/photo1.jpg"
							data-user-popover="0" alt="">
						<div class="badge">
							<i data-feather="check"></i>
						</div>
					</div>
					<h4>ADMIN</h4>
					<p>Daegu, KR</p>
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
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/admin.do'">
									<a> <span>유저관리</span>
								</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userReportList.do'">
									<a> <span>신고내역</span>
								</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userTopicList.do'">
									<a> <span>관심사관리</span>
								</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userTagList.do'">
									<a> <span>태그관리</span>
								</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userStampList.do'">
									<a> <span>상품목록</span>
								</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userPaymentList.do'">
									<a> <span>결제내역</span>
								</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/noticeList.do'">
									<a> <span>공지사항</span>
								</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userQnaList.do'">
									<a> <span>문의사항</span>
								</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li class="is-active"
									onclick="location.href='${pageContext.request.contextPath}/admin/statisticsPage.do'">
									<a> <span>통계관리</span>
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
		<div class="inner-wrapper" style="width: 80%">

			<div id="chart-area"></div>


		</div>
		<div class="stories-container">
			<div class="settings-wrapper">
				<div class="stories-content">
					<div class="section-title main-section-title">
						<h2>통계페이지</h2>
					</div>
				</div>
				<div id="general-settings" class="settings-section is-active">
					<div class="settings-panel">

						<div class="title-wrap">
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2>전체 방문자 수: ${totalCount}</h2>
						</div>
						<div class="illustration">
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2>오늘의 방문자 수: ${todayCount}</h2>
						</div>
					</div>
				</div>
				<!-- /partials/settings/sections/general-settings.html -->
				<div id="general-settings" class="settings-section is-active">
					<div class="settings-panel">
						<div class="title-wrap">
							<div id="chart_div"></div>
						</div>
					</div>
				</div>
				<br>
				<div id="general-settings" class="settings-section is-active">
					<div class="settings-panel">

						<div class="title-wrap">
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2>General Settings</h2>
						</div>

						<div class="settings-form-wrapper">
							<div class="illustration">
								<p>
									If you'd like to learn more about general settings, you can
									read about it in the <a>user guide</a>.
								</p>
							</div>
						</div>
					</div>
				</div>
			

			</div>
		</div>
	</div>
	<!-- 컨텐츠 종료 -->


</body>

</html>