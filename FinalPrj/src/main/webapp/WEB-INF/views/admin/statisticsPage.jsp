<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					chartData.push([ '시간대', '접속자수'])
					for (i = 0; i < data.length; i++) {
						var subarr = [ data[i].TIME+" ", parseInt(data[i].CNT) ];
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
	$('#btnPay').click(function(){
		var options = {
			title : '월별 매출액',
			width : 1200,
			height : 500
		};
		google.load('visualization', '1.0', {
			'packages' : [ 'corechart' ]
		});
		google.setOnLoadCallback(function() {
			//차트에 넣을 data를 ajax 요청해서 가져옴
			$.ajax({
				url : "${pageContext.request.contextPath}/getChartData.do?data=4",
				method : "post",
				type : "json",
				success : function(data) {
					//ajax결과를 chart에 맞는 data 형태로 가공
					var chartData = [];
					chartData.push([ '월별', '매출액'])
					for (i = 0; i < data.length; i++) {
						var subarr = [ data[i].TIME+"월", parseInt(data[i].P)];
						chartData.push(subarr);
					}
					//챠트 그리기
					var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div2'));
					chart.draw(google.visualization.arrayToDataTable(chartData),options);
				}
			});
		});
	});
});	


</script>
<style>
.stories-container {
	width:70%;
	margin: auto;
}
</style>
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
							src="${pageContext.request.contextPath}/resources/upload/3bb0add0-85b2-4407-832f-ee556d08d585.jpeg"
							data-user-popover="0" alt="">
						<div class="badge">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>
						</div>
					</div>
					<h4>ADMIN</h4>
					<p>Daegu, KR</p>
					<div class="user-stats">
                         <div class="stat-block">
                             <span>KREN</span>
                             <span>관리자 페이지</span>
                         </div>
                   </div>
				</div>
				<div class="user-menu">
					<div class="user-menu-inner has-slimscroll">
						<div class="menu-block">
							<ul>
								<li 
									onclick="location.href='${pageContext.request.contextPath}/admin/admin.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
									<span>유저관리</span>
									</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userReportList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
									<span>신고내역</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userTopicList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-life-buoy"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="4"></circle><line x1="4.93" y1="4.93" x2="9.17" y2="9.17"></line><line x1="14.83" y1="14.83" x2="19.07" y2="19.07"></line><line x1="14.83" y1="9.17" x2="19.07" y2="4.93"></line><line x1="14.83" y1="9.17" x2="18.36" y2="5.64"></line><line x1="4.93" y1="19.07" x2="9.17" y2="14.83"></line></svg>
									<span>관심사관리</span>
									</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userTagList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-life-buoy"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="4"></circle><line x1="4.93" y1="4.93" x2="9.17" y2="9.17"></line><line x1="14.83" y1="14.83" x2="19.07" y2="19.07"></line><line x1="14.83" y1="9.17" x2="19.07" y2="4.93"></line><line x1="14.83" y1="9.17" x2="18.36" y2="5.64"></line><line x1="4.93" y1="19.07" x2="9.17" y2="14.83"></line></svg>
									<span>태그관리</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userStampList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
									<span>상품목록</span>
									</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userPaymentList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
									<span>결제내역</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/noticeList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
									<span>공지사항</span>
									</a>
								</li>
								<li
									onclick="location.href='${pageContext.request.contextPath}/admin/userQnaList.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-send"><line x1="22" y1="2" x2="11" y2="13"></line><polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg>
									<span>문의사항</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="separator"></div>
						<div class="menu-block">
							<ul>
								<li class="is-active"
									onclick="location.href='${pageContext.request.contextPath}/admin/statisticsPage.do'">
									<a> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
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
		<div class="inner-wrapper" style="width:100%">
		<div class="stories-content">
	            <div class="section-title main-section-title">
	                <h2>통계 관리</h2>
	            </div>
	    </div> 
	    </div>
		<div class="stories-container" style="box-shadow: 0 0 10px 4px #b2b2b2;">
			<div class="settings-wrapper">
				<div id="general-settings" class="settings-section is-active">
					<div class="settings-panel">

						<div class="title-wrap">
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2>방문자 통계</h2>
						</div>
						<div class="illustration">
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2>누적 방문자 수: ${totalCount}명</h2>
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
		<br>
		<div class="stories-container" style="box-shadow: 0 0 10px 4px #b2b2b2;"> 
			<div class="settings-wrapper">
				<div id="general-settings" class="settings-section is-active">
					<div class="settings-panel">

						<div class="title-wrap">
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2>매출액 통계</h2>
						</div>
						<div class="illustration">
							<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
							</a>
							<h2>누적 매출액 : <fmt:formatNumber value="${all }" pattern="#,###" />원</h2>
						</div>
					</div>
				</div>	
				<!-- /partials/settings/sections/general-settings.html -->
				<div id="general-settings" class="settings-section is-active">
					<div class="settings-panel">
						<div class="title-wrap">
							<button id="btnPay" class="button">월별 매출액</button>
						</div>
					</div>
					<div class="settings-panel">
						<div class="title-wrap">
							<div id="chart_div2"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 컨텐츠 종료 -->


</body>

</html>