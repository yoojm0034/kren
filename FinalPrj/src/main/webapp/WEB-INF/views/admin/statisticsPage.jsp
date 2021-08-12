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
	$('#btnDay').click(function(){
		var colors = ['red','blue'];
		var options = {
			title : '시간대별 접속자수',
			width : 1200,
			height : 500
		};
		google.load('visualization', '1.0', {
			'packages' : [ 'corechart' ]
		});
		google.setOnLoadCallback(function() {
			//차트에 넣을 data를 ajax 요청해서 가져옴
			$.ajax({
				url : "${pageContext.request.contextPath}/getChartData.do?data=0",
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
	$('#btnWeek').click(function(){
		console.log(1)
		var options = {
			title : '일별 접속자수',
			width : 1200,
			height : 500
		};
		google.load('visualization', '1.0', {
			'packages' : [ 'corechart' ]
		});
		google.setOnLoadCallback(function() {
			//차트에 넣을 data를 ajax 요청해서 가져옴
			$.ajax({
				url : "${pageContext.request.contextPath}/getChartData.do?data=1",
				method : "post",
				type : "json",
				success : function(data) {
					//ajax결과를 chart에 맞는 data 형태로 가공
					var chartData = [];
					chartData.push([ '일별', '접속자수'])
					for (i = 0; i < data.length; i++) {
						var subarr = [ data[i].TIME+"일", parseInt(data[i].CNT)];
						chartData.push(subarr);
					}
					//챠트 그리기
					var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
					chart.draw(google.visualization.arrayToDataTable(chartData),options);
				}
			});
		});

	});
	$('#btnYear').click(function(){
		console.log(1)
		var options = {
			title : '월별 접속자수',
			width : 1200,
			height : 500
		};
		google.load('visualization', '1.0', {
			'packages' : [ 'corechart' ]
		});
		google.setOnLoadCallback(function() {
			//차트에 넣을 data를 ajax 요청해서 가져옴
			$.ajax({
				url : "${pageContext.request.contextPath}/getChartData.do?data=3",
				method : "post",
				type : "json",
				success : function(data) {
					//ajax결과를 chart에 맞는 data 형태로 가공
					var chartData = [];
					chartData.push([ '월별', '접속자수'])
					for (i = 0; i < data.length; i++) {
						var subarr = [ data[i].TIME+"월", parseInt(data[i].CNT)];
						chartData.push(subarr);
					}
					//챠트 그리기
					var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
					chart.draw(google.visualization.arrayToDataTable(chartData),options);
				}
			});
		});

	});
	$('#btnMonth').click(function(){
		if($('#month').val() == '') {
			alert('조회를 원하는 월을 선택하세요.')
			return false;
		}
		var value = $('#month').val();
		console.log(value)
		var options = {
			title : '주별 접속자수',
			width : 1200,
			height : 500
		};
		google.load('visualization', '1.0', {
			'packages' : [ 'corechart' ]
		});
		google.setOnLoadCallback(function() {
			//차트에 넣을 data를 ajax 요청해서 가져옴
			$.ajax({
				url : "${pageContext.request.contextPath}/getChartData.do?data="+value,
				method : "post",
				type : "json",
				success : function(data) {
					//ajax결과를 chart에 맞는 data 형태로 가공
					var chartData = [];
					chartData.push([ '주별', '접속자수'])
					for (i = 0; i < data.length; i++) {
						var subarr = [ data[i].W+"주", parseInt(data[i].CNT)];
						chartData.push(subarr);
					}
					//챠트 그리기
					var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
					chart.draw(google.visualization.arrayToDataTable(chartData),options);
				}
			});
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
							<button id="btnDay" class="button">시간대별</button>
							<button id="btnWeek" class="button">일별</button>
							<select id="month" name="month" size="1" class="select">
								<option value="" selected>선택하세요.</option>
								<option value="202101">1월</option>
								<option value="202102">2월</option>
								<option value="202103">3월</option>
								<option value="202104">4월</option>
								<option value="202105">5월</option>
								<option value="202106">6월</option>
								<option value="202107">7월</option>
								<option value="202108">8월</option>
								<option value="202109">9월</option>
								<option value="202110">10월</option>
								<option value="202111">11월</option>
								<option value="202112">12월</option>
							</select>
							<button id="btnMonth" class="button">월별</button>
							<button id="btnYear" class="button">연별</button>
						</div>
					</div>
					<div class="settings-panel">
						<div class="title-wrap">
							<div id="chart_div"></div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	<!-- 컨텐츠 종료 -->


</body>

</html>