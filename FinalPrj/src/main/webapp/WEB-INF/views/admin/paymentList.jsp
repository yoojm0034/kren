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
				    readData: {url:'${pageContext.request.contextPath}/admin/paymentList.do',method: 'GET'},
				  }
				};
		console.log(dataSource);
		const Grid = tui.Grid; //인스턴스 객체 생성 
		const recruitGrid = new Grid({
			el : document.getElementById('recruitGrid'), // DOM의 id지정
			data : dataSource,
			columns : [ {
				header : 'pay_id',
				name : 'pay_id',
				sortingType : 'desc',
				sortable : true,
				align : 'center'
			}, {
				header : 'USER',
				name : 'user_id',
				align : 'center',
				filter : {
					type : 'text',
					showApplyBtn : true,
					showClearBtn : true
				}
			}, {
				header : '가격',
				name : 'price',
				align : 'center'
			},{
				header : '결제일',
				name : 'pay_dt',
				align : 'center'
			}],
		/* 	summary: {
			    height: 15,
			    position: 'bottom', 
			    columnContent:{
			    	price: {
			            template: function(valueMap) {
			              return `합계 : ` +valueMap.sum+`원`;
			       		}
			        }
			    }
			}, */
			rowHeaders : [ 'rowNum' ],
			pagination : true,
			pageOptions : {
				useClient : true,
				perPage : 15
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
                        <a class="close-stories-sidebar is-hidden">
                            <i data-feather="x"></i>
                        </a>
                        <div class="avatar-wrap">
                            <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                        </div>
                        <h4>Admin</h4>
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
                                    <li onclick="location.href='${pageContext.request.contextPath}/admin/userQnaList.do'">
                                        <a>
                                            <span>문의사항</span>
                                        </a>
                                    </li>
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
                                    <li onclick="location.href='${pageContext.request.contextPath}/admin/noticeList.do'">
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
	                        <h2>결제내역 관리</h2>
	                    </div>
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