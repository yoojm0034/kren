<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>태그리스트</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		const dataSource = {
				  contentType: 'application/json',
				  api: {
				    readData: {url:'${pageContext.request.contextPath}/admin/tagList.do',method: 'GET'},
				    createData: { url: '${pageContext.request.contextPath}/admin/tagInsert.do', method: 'POST' },
				    deleteData: { url: '${pageContext.request.contextPath}/admin/tagDelete.do', method: 'PUT' }
				  }
				};
		console.log(dataSource);
		const Grid = tui.Grid; //인스턴스 객체 생성 
		const recruitGrid = new Grid({
			el : document.getElementById('recruitGrid'), // DOM의 id지정
			data : dataSource,
			columns : [ {
				header : 'TAG',
				name : 'tag_name',
				editor: 'text',
				filter : {
					type : 'text',
					showApplyBtn : true,
					showClearBtn : true
					},
				align : 'center'
			}],
			rowHeaders : [ 'checkbox' ],
			pagination : true,
			pageOptions : {
				useClient : true,
				perPage : 15
			}
		});
		$('#create').click(function () {
			  recruitGrid.request('createData', {
			  checkedOnly: true
			  });
			  location.reload();
		}) ;
		$('#delete').click(function () {
			  recruitGrid.removeCheckedRows(false);	
			  recruitGrid.request('deleteData', {
			  checkedOnly: true
			  });
			  location.reload();
		}) ;
		const prependBtn = document.getElementById('prependBtn');
		const appendedData = {
				tag_name: '',
			    };	
		prependBtn.addEventListener('click', () => {
			recruitGrid.prependRow(appendedData);
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
								<li class="is-active"
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
								<li
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
            <div class="inner-wrapper" style="width:85%;">
                <a class="mobile-sidebar-trigger is-home-v2">
                    <i data-feather="menu"></i>
                </a>
	            <div class="stories-content">
	                    <div class="section-title main-section-title">
	                        <h2>태그 관리</h2>
	                    </div>
	            </div>  
		        <div align="right" class="btn-wrapper">
		            <button id="prependBtn" class="button">태그추가</button>
		            <button id="create" class="button">DB입력</button>
					<button id="delete" class="button">삭제</button>
		        </div>
		        <div class="stories-container" >
	                <div class="container-inner">
	                    <div align="center">
	 						<div id="recruitGrid"></div>
						</div>
                    </div>
	            </div>
	         </div>          
            <!-- 컨텐츠 종료 -->
           
            
        </div>
        
					
</body>
</html>