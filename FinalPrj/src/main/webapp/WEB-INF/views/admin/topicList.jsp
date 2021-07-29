<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심사리스트</title>
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
				    readData: {url:'admin/topicList.do',method: 'GET'},
				    updateData: { url: 'admin/topicUpdate.do', method: 'PUT' },
				    createData: { url: 'admin/topicInsert.do', method: 'POST' },
				    deleteData: { url: 'admin/topicDelete.do', method: 'PUT' }
				  }
				};
		console.log(dataSource);
		const Grid = tui.Grid; //인스턴스 객체 생성 
		const recruitGrid = new Grid({
			el : document.getElementById('recruitGrid'), // DOM의 id지정
			data : dataSource,
			columns : [ {
				header : 'NO(desc)',
				name : 'topic_id',
				sortingType : 'desc',
				sortable : true,
				align : 'center'
			}, {
				header : 'KR',
				name : 'kr',
				align : 'center',
				editor: 'text',
				filter : {
					type : 'text',
					showApplyBtn : true,
					showClearBtn : true
				}
			}, {
				header : 'EN',
				name : 'en',
				align : 'center',
				editor: 'text',
				filter : {
					type : 'text',
					showApplyBtn : true,
					showClearBtn : true
					}
			}],
			rowHeaders : [ 'checkbox' ],
			pagination : true,
			pageOptions : {
				useClient : true,
				perPage : 15
			}
		});
		$('#sync').click(function () {
			  recruitGrid.request('updateData', {
			  checkedOnly: true
			  });
			  
		}) ;
		$('#create').click(function () {
			  recruitGrid.request('createData', {
			  checkedOnly: true
			  });
			  
		}) ;
		$('#delete').click(function () {
			  recruitGrid.removeCheckedRows(false);	
			  recruitGrid.request('deleteData', {
			  checkedOnly: true
			  });
			  
		}) ;
		const prependBtn = document.getElementById('prependBtn');
		const appendedData = {
			      kr: '',
			      en: ''
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
                        <a class="close-stories-sidebar is-hidden">
                            <i data-feather="x"></i>
                        </a>
                        <div class="avatar-wrap">
                            <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                        </div>
                        <h4>Jenna Davis</h4>
                        <p>Melbourne, AU</p>
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
                                    <li onclick="location.href='admin/userStampList.do'">
                                        <a>
                                            <span>상품목록</span>
                                        </a>
                                    </li>
                                    <li onclick="location.href='admin/userPaymentList.do'">
                                        <a>
                                            <span>결제내역</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="separator"></div>
                            <div class="menu-block">
                                <ul>
                                    <li onclick="location.href='admin/noticeList.do'">
                                        <a>
                                            <span>공지사항</span>
                                        </a>
                                    </li>
                                    <li onclick="location.href='#'">
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
            <div class="inner-wrapper">
                <a class="mobile-sidebar-trigger is-home-v2">
                    <i data-feather="menu"></i>
                </a>
	            <div class="stories-content">
	                    <div class="section-title main-section-title">
	                        <h2>관심사 관리</h2>
	                    </div>
	            </div>  
	            <div align="right" class="btn-wrapper">
	            	<button id="prependBtn">행추가</button>
	            	<button id="create">추가</button>
					<button id="sync">수정</button>
					<button id="delete">삭제</button>
	            </div>
	            <div class="stories-container">
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