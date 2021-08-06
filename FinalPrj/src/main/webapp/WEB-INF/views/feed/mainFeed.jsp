<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm" var="today" />
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="icon" type="image/png"
	href="resources/template/assets/img/favicon.png" />
<link
	href="resources/template/assets/nicelabel/css/jquery-nicelabel.css"
	rel="stylesheet">
<script src="resources/template/assets/nicelabel/js/jquery.nicelabel.js"></script>
<meta charset="UTF-8">
<title>Main Feed</title>
<style>
article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

body {
	line-height: 1;
}

ol, ul {
	list-style: none;
}

blockquote, q {
	quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}
/* 자동완성 css */
.notice {
	width: 100%;
	height: 340px;
	overflow: hidden;
	margin-bottom: 24px;
	border-radius: 6px;
}

.rolling {
	position: relative;
	width: 100%;
	height: auto;
}

.rolling li {
	width: 100%;
	height: 340px;
	line-height: 50px;
}

.tag-label {
	display: inline-block;
	font-size: 14px;
	padding: 6px 15px 10px 15px;
	border-radius: 2rem;
	cursor: pointer;
	position: relative;
	overflow: hidden;
	transition: all 0.2s;
	-moz-user-select: none;
	-webkit-user-select: none;
	background-color: #EFEFEF;
	color: #979797;
	margin-left: 10px;
	margin-top: 6px;
	margin-bottom: 5px;
}

.view-wrapper {
	padding: 40px 12px;
}

.search-label {
	display: inline-block;
	font-size: 14px;
	padding: 6px 15px 10px 15px;
	border-radius: 2rem;
	cursor: pointer;
	position: relative;
	overflow: hidden;
	transition: all 0.2s;
	-moz-user-select: none;
	-webkit-user-select: none;
	background-color: #6ba4e9;
	color: white;
	margin-left: 10px;
	margin-bottom: 15px;
}

.tdiv {
	font-weight: bold;
	text-shadow: 0 0 black;
	margin-top: 20px;
	margin-bottom: 20px;
}

.card.is-post .content-wrap .post-image .fab-wrapper.is-comment,
	.shop-wrapper .cart-container .cart-content .cart-summary .is-post.summary-card .content-wrap .post-image .fab-wrapper.is-comment
	{
	right: 60px;
}

</style>
<script>
$(document).ready(function(){

	//-------생일롤링---------
	var height =  $(".notice").height();
	var num = $(".rolling li").length;
	var max = height * num;
	var move = 0;
	
	function noticeRolling() {
		move += height;
		$(".rolling").animate({"top":-move},600,function(){
			if( move >= max ){
				$(this).css("top",0);
				move = 0;
			};
		});
	};
	
	noticeRollingOff = setInterval(noticeRolling,3000);
	$(".rolling").append($(".rolling li").first().clone());
	$(".notice").mouseover(function(){
		clearInterval(noticeRollingOff);
		$(this).css("cursor", "pointer");
	});
	$(".notice").mouseout(function(){
		noticeRollingOff = setInterval(noticeRolling,5000);
		$(this).css("cursor", "default");
	});
	
	//-------피드 수정----------
	var maxCnt = 0;
	$('.feedUpdate').on('click',function(){
		$('.app-overlay').addClass('is-active');
		$('.is-new-content').addClass('is-highlighted');
		$('#publish').focus();
		
		var feedId = this.id;
		var tags = $('#'+feedId).children(1).children(":eq(0)").val();
		var content = $('#'+feedId).children(1).children(":eq(1)").val();
		var photo = $('#'+feedId).children(1).children(":eq(2)").val(); 
		var fphoto = $('#'+feedId).children(1).children(":eq(3)").val(); 
		var retag = tags.replace(/,/g, "#");	
		var photoChk = $('#photoChk');	//사진 수정시 체크 여부 
		
		$('#feedid').val(feedId);	
		$('#publish').val(content);
		document.getElementById('photo').value = fphoto;
		if(retag != ""){
			$('#append_tag').append("#"+retag);			
		}
		
		if(photo != ""){	
		  if(maxCnt >= 1 ) return;
		  var deleteIcon = feather.icons.x.toSvg();
		  var template = "\n                <div class=\"upload-wrap\">\n                    <img src=/FinalPrj/resources/upload/" + photo + " alt=\"\">\n                    <span class=\"remove-file\">\n                        " + deleteIcon + "\n                    </span>\n                </div>\n            ";
		  $('#feed-upload').append(template);
		  maxCnt++;
		  maxValue++;
		 
		  $('.remove-file').on('click', function () {
		         $(this).closest('.upload-wrap').remove();
		         photoChk.val(1);
		         maxCnt--;
		         maxValue--;
		       });
		}
	});


	//-------태그자동완성---------
	if ($('#activities-autocpl').length) {
	    var html = '';
	    var activitiesOptions = {
	      url: "${pageContext.request.contextPath}/autocpl.do",
	      getValue: "tag_name",
 	      template: {
	        type: "custom",
	        method: function method(value) {
	          return "<div class=" + 'template-wrapper' + "><div class=" + 'avatar-wrapper' + ">" + "</div><div class=" + 'entry-text' + ">#" + value + "<br>" + "</div></div>";
	        }
	      }, 
	      highlightPhrase: false,
	      list: {
	        maxNumberOfElements: 5,
	        showAnimation: {
	          type: "slide",
	          time: 400,
	          callback: function callback() {}
	        },
	        match: {
	          enabled: true
	        }
	      }
	    };
	    $("#activities-autocpl").easyAutocomplete(activitiesOptions);
	  };
	  

	//-------피드 등록---------
	$('#publish-button').on('click', function(){
		var feedId = $('#feedid').val();
		var tagval = $('#append_tag').text();
		
		if(tagval == ""){
		}else{
			tagval= tagval.replace("#","");
			tagval= tagval.replace(/#/g,",");
		}
		
		document.getElementById('tags').value = tagval;					
		$('#feedInsert').submit();
	});
	
	//-------피드 Reset---------
	$('.close-publish').on('click',function(){
		$('#publish').val('');
		$('#append_tag').text('');
		$('#photoChk').val('');
		$('#feed-upload').empty();
		$('#feedid').val('');
	}); 
	
	//-------최신글---------
	$('#allSearch').on('click',function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/feedSelect.do",
			success:function(result){
				console.log(result);
				$('.feedContents').html(result);
			},
			error:function(err){
				console.log(err);
			}
		});
	});

	//-------언어별 Ko---------
	$('#searchKo').on('click',function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/feedSelect.do",
			data:{write_lan : 'ko' },
			success:function(result){
				console.log('한국어만 나옴');
				$('.feedContents').html(result);
			},
			error:function(err){
				console.log(err);
			}
		});
	});
	
	//-------공지사항이동---------
	$('.page-block').on('click',function(){
		var noticeId= this.id;
		location.href="${pageContext.request.contextPath}/userSelectNotice.do?notice_id="+noticeId
			
	});
	
});
</script>
</head>
<body>
<script>

	$(function(){
		//-------태그---------
		$('#searchTag').on('click',function(){
			var display = $("#SearchDiv").css('display');
			if(display == "none"){
				$("#SearchDiv").css('display', 'block'); 
				
				if ($('#tagInput').length) {
				    var html = '';
				    var activitiesOptions = {
				      url: "${pageContext.request.contextPath}/autocpl.do",
				      getValue: "tag_name",
			 	      template: {
				        type: "custom",
				        method: function method(value) {
				          return "<div class=" + 'template-wrapper' + "><div class=" + 'avatar-wrapper' + ">" + "</div><div class=" + 'entry-text' + ">#" + value + "<br>" + "</div></div>";
				        }
				      }, 
				      highlightPhrase: false,
				      list: {
				        maxNumberOfElements: 5,
				        showAnimation: {
				          type: "slide",
				          time: 400,
				          callback: function callback() {}
				        },
				        match: {
				          enabled: true
				        }
				      }
				    };
				    $("#tagInput").easyAutocomplete(activitiesOptions);
				  };
				  
				document.getElementById("tagInput").onkeypress = function() {tagsFunction()};
					function tagsFunction() {
						if(event.keyCode==13){
					    	var tagval=$('#tagInput').val();
					    	if(!tagval) {
								alert('태그를 입력해 주세요!');
							}else{
								$.ajax({
									url:"${pageContext.request.contextPath}/feedSelect.do",
									data:{tags : tagval },
									success:function(result){
										console.log('태그검색결과');
										$('.feedContents').html(result);
									},
									error:function(err){
										console.log(err);
									}
								});
							}
						}
					};
			}else{
				$("#SearchDiv").css('display', 'none'); 
			}
		});
	});

	$(function(){
	//-------태그등록---------
		var maxAppend = 0;
		document.getElementById("activities-autocpl").onkeypress = function() {tagFunction()};
		function tagFunction() {
			if(event.keyCode==13){
		    	var tagval = $('#activities-autocpl').val();
		    	if(!tagval) {
					alert('태그를 입력해 주세요!');
				}else{
					if (maxAppend >= 5) return; 
					$('#append_tag').append('<span class="tagDelete">#' + tagval+ ' </span>');
					$('#activities-autocpl').val('');
					maxAppend++;
					$.ajax({
						url: "${pageContext.request.contextPath}/tagInsert.do" ,
						type: "POST",
						data:{ tag_name : tagval } ,
						success: function(data){
						},
						error: function(err){
						}
					}); 
				}
			}else if(event.keyCode==35){
				event.preventDefault();
				event.returnValue = false;
			}else if(event.keyCode==44){
				event.preventDefault();
				event.returnValue = false;
			}
			
		  $('.tagDelete').on('click', function () {
		  	$( this ).remove(); 
		  	maxAppend--;
		  });
		}
	});


	$(function(){
		//-------언어별 En---------
		$('#searchEn').on('click',function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/feedSelect.do",
				data:{write_lan : 'en' },
				success:function(result){
					console.log('영어만 나옴');
					$('.feedContents').html(result);
				},
				error:function(err){
					console.log(err);
				}
			});
		});
	});
	$(function(){
		//-------내근처--------- 
		$('#searchNear').on('click',function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/feedSelect.do",
				data:{location : 'true' },
				success:function(result){
					$('.feedContents').html(result);
				},
				error:function(err){
					console.log(err);
				}
			});
		});
	});

	$(function(){
		//-------프로필클릭시---------
		$('.user-info').on('click',function(){
			var userId= this.id;
			location.href="${pageContext.request.contextPath}/profile.do?user_id="+userId
				
		});
	});
	
	$(function(){
		//-------태그라벨---------
		$('.tag-label').on('click',function(){
			var tagName = this.id;
			console.log(tagName);
			console.log('왜');
			$.ajax({
				url:"${pageContext.request.contextPath}/feedSelect.do" ,
				data:{tags : tagName},
				success:function(result){
					$('.feedContents').html(result);
				},
				error:function(err){
					console.log(err);
				}
			});
		});
	});
	$(function(){
			//-------좋아요--------
			function likeIt(feedId){
			$.ajax({
				url:"${pageContext.request.contextPath}/likeCnt.do",
				type:"POST",
				data:{feed_id:feedId},
				success:function(result){
					if(result==0){
						alert('좋아요!');
					}else{
						alert('좋아요 취소');
					}
					recCount(feedId);
				},
				error:function(err){
					console.log(err);
				}
			}) 
		}; 
	});	
	
	$(function(){
		//-------좋아요 카운트--------
		function recCount(feedId){
			var span = $('#recCnt'+feedId);
			$.ajax({
				url: "${pageContext.request.contextPath}/likeSelectList.do",
		           type: "POST",
		           data: {feed_id:feedId},
		           dataType:"JSON",
		           success: function(data) {
		               	var cnt =data.length;
		               	if(cnt<1){
		               		span.empty();
		               		span.append(0);
		               	}else{
			               	$.each(data, function(idx, val) {
		    	   				span.empty();
			       				span.append(cnt);   		
		               	});
		               	}
		           },error:function(err){
		           	console.log(err);
		           }
			}) 
		 }; 
	});	
	
	$(function(){
		//-------번역---------
		function trans(id, text){
			var div = $("#tdiv"+id);
			var lan = div.next().attr('id');
		 	$.ajax({
				url:"${pageContext.request.contextPath}/transContent.do",
				type:"GET",
				data:{	korean: text,
						write_lan: lan},
				success:function(v){
					var json = JSON.parse(v);
					var transval = json.message.result.translatedText;
					div.append($('<p/>').html(transval));
				},
				error:function(err){
					console.log(err);
				}
			});  
		};
	});	
	
	//-------친구 추천 팔로우--------	 안됨 
	function addFriend(id){
		$.ajax({
			url:"${pageContext.request.contextPath}/follow.do",
			type:"POST",
			data:{following : id },
			dataType:"JSON",
			success:function(){
				alert(userId+'친구로 추가 되었습니다');
			},
			error:function(err){
				console.log(err);
			}
		})
	};
</script>
	<!-- Pageloader -->
	<div class="infraloader is-active"></div>
	<div class="app-overlay"></div>
	<div class="view-wrapper">
		<!-- Container -->
		<div id="main-feed" class="container">
			<!-- Content placeholders at page load -->
			<!-- this holds the animated content placeholders that show up before content -->
			<div id="shadow-dom" class="view-wrap">
				<div class="columns">
					<div class="column is-3">
						<!-- Placeload element -->
						<div class="placeload weather-widget-placeload">
							<div class="header">
								<div class="inner-wrap">
									<div class="img loads"></div>
									<div class="content-shape loads"></div>
									<div class="content-shape loads"></div>
								</div>
							</div>
							<div class="body">
								<div class="inner-wrap">
									<div class="rect loads"></div>
									<div class="content-shape loads"></div>
									<div class="content-shape loads"></div>
								</div>
							</div>
						</div>
						<!-- Placeload element -->
						<div class="placeload list-placeload">
							<div class="header">
								<div class="content-shape loads"></div>
							</div>
							<div class="body">
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="column is-6">
						<!-- Placeload element -->
						<div class="placeload compose-placeload">
							<div class="header">
								<div class="content-shape is-lg loads"></div>
								<div class="content-shape is-lg loads"></div>
								<div class="content-shape is-lg loads"></div>
							</div>
							<div class="body">
								<div class="img loads"></div>
								<div class="inner-wrap">
									<div class="content-shape loads"></div>
									<div class="content-shape loads"></div>
								</div>
							</div>
						</div>
						<!-- Placeload element -->
						<div class="placeload post-placeload">
							<div class="header">
								<div class="img loads"></div>
								<div class="header-content">
									<div class="content-shape loads"></div>
									<div class="content-shape loads"></div>
								</div>
							</div>
							<div class="image-placeholder loads"></div>
							<div class="placeholder-footer">
								<div class="footer-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- Placeload element -->
						<div class="placeload post-placeload">
							<div class="header">
								<div class="img loads"></div>
								<div class="header-content">
									<div class="content-shape loads"></div>
									<div class="content-shape loads"></div>
								</div>
							</div>
							<div class="image-placeholder loads"></div>
							<div class="placeholder-footer">
								<div class="footer-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- Placeload element -->
						<div class="placeload post-placeload">
							<div class="header">
								<div class="img loads"></div>
								<div class="header-content">
									<div class="content-shape loads"></div>
									<div class="content-shape loads"></div>
								</div>
							</div>
							<div class="image-placeholder loads"></div>
							<div class="placeholder-footer">
								<div class="footer-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- Placeload element -->
						<div class="placeload post-placeload">
							<div class="header">
								<div class="img loads"></div>
								<div class="header-content">
									<div class="content-shape loads"></div>
									<div class="content-shape loads"></div>
								</div>
							</div>
							<div class="image-placeholder loads"></div>
							<div class="placeholder-footer">
								<div class="footer-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="column is-3">
						<!-- Placeload element -->
						<div class="placeload stories-placeload">
							<div class="header">
								<div class="content-shape loads"></div>
							</div>
							<div class="body">
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- Placeload element -->
						<div class="placeload mini-widget-placeload">
							<div class="body">
								<div class="inner-wrap">
									<div class="img loads"></div>
									<div class="content-shape loads"></div>
									<div class="content-shape loads"></div>
									<div class="content-shape loads"></div>
									<div class="button-shape loads"></div>
								</div>
							</div>
						</div>
						<!-- Placeload element -->
						<div class="placeload list-placeload">
							<div class="header">
								<div class="content-shape loads"></div>
							</div>
							<div class="body">
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
								<div class="flex-block">
									<div class="img loads"></div>
									<div class="inner-wrap">
										<div class="content-shape loads"></div>
										<div class="content-shape loads"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-------------------------------- 왼쪽사이드바 시작 --------------------------------------->
			<div id="activity-feed" class="view-wrap true-dom is-hidden">
				<div class="columns">
					<div class="column is-3 is-hidden-mobile">
						<div class="card">
							<div class="card-heading is-bordered">
								<h4>지금 인기있는 주제</h4>
							</div>
							<div class="card-body no-padding">
								<c:forEach var="vo" items="${likeTag }" end="9">
									<!-- Recommended Page -->
									<label class="nicelabel-default-position"> <span
										class="tag-label" id="${vo.tag_name }">#${vo.tag_name }</span>
									</label>
								</c:forEach>
							</div>
						</div>

						<!------------------------ 공지사항 시작 ------------------------->
						<div id="latest-activity-1" class="card">
							<div class="card-heading is-bordered">
								<h4>운영자부터로의 편지</h4>
							</div>
							<div class="card-body no-padding">
								<c:forEach items="${noticeList }" var="vo" end="3">
									<div class="page-block" id="${vo.notice_id }">
										<div class="page-meta">
											<a href="#"><span>${vo.title }</span></a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!------------------------ 공지사항 끝 ------------------------->
					</div>
					<!--------------------------- 왼쪽사이드바 끝 ------------------------------>

					<!-- Middle column -->
					<div class="column is-6">
						<form action="feedInsert.do" id="feedInsert" method="post"
							enctype="multipart/form-data">
							<input type="hidden" id="tags" name="tags"> <input
								type="hidden" id="feedid" name="feedid"> <input
								type="hidden" id="photo" name="photo"> <input
								type="hidden" id="photoChk" name="photoChk">
							<!-- Publishing Area -->
							<!-- /partials/pages/feed/compose-card.html -->
							<div id="compose-card" class="card is-new-content">
								<!-- Top tabs -->
								<div class="tabs-wrapper">
									<div class="tabs is-boxed is-fullwidth">
										<ul>
											<li class="is-active"><a> <span
													class="icon is-small"><i data-feather="edit-3"></i></span>
													<span>Publish</span>
											</a></li>
											<!-- Close X button -->
											<li class="close-wrap"><span class="close-publish">
													<svg viewBox="0 0 24 24" width="24" height="24"
														stroke="currentColor" stroke-width="2" fill="none"
														stroke-linecap="round" stroke-linejoin="round"
														class="css-i6dzq1">
														<line x1="18" y1="6" x2="6" y2="18"></line>
														<line x1="6" y1="6" x2="18" y2="18"></line></svg>
											</span></li>
										</ul>
									</div>
									<!-- Tab content -->
									<!-- ----------글쓰는 부분 --------------->
									<div class="tab-content">
										<div class="compose">
											<div class="compose-form">
												<img src="https://via.placeholder.com/300x300"
													data-demo-src="assets/img/avatars/jenna.png" alt="">
												<div class="control">
													<textarea id="publish" name="content" class="textarea"
														rows="3" placeholder="Write something about you..."></textarea>
												</div>
											</div>
											<div id="feed-upload" class="feed-upload"></div>
											<div id="append_tag"></div>
											<div id="options-summary" class="options-summary"></div>
											<div id="tag-suboption"
												class="is-autocomplete is-suboption is-hidden">
												<!-- Tag friends suboption -->
												<div id="tag-list" class="tag-list"></div>
												<div class="control">
													<input id="tags-autocpl" type="text" class="input"
														placeholder="Who are you with?">
													<div class="icon">
														<i data-feather="search"></i>
													</div>
													<div class="close-icon is-main">
														<i data-feather="x"></i>
													</div>
												</div>
											</div>
											<!-- /Tag friends suboption -->

											<!-- Activities suboption -->
											<div id="activities-suboption"
												class="is-autocomplete is-suboption is-hidden">
												<div id="activities-autocpl-wrapper"
													class="control has-margin">
													<input id="activities-autocpl" type="text" class="input"
														placeholder="태그를 입력해 주세요">
													<div class="icon">
														<i data-feather="search"></i>
													</div>
													<div class="close-icon is-main">
														<i data-feather="x"></i>
													</div>
												</div>

												<!-- Mood suboption -->
												<div id="mood-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="mood-autocpl" type="text"
															class="input is-subactivity"
															placeholder="How do you feel?">
														<div class="input-block">Feels</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

												<!-- Drinking suboption child -->
												<div id="drinking-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="drinking-autocpl" type="text"
															class="input is-subactivity"
															placeholder="What are you drinking?">
														<div class="input-block">Drinks</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

												<!-- Eating suboption child -->
												<div id="eating-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="eating-autocpl" type="text"
															class="input is-subactivity"
															placeholder="What are you eating?">
														<div class="input-block">Eats</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

												<!-- Reading suboption child -->
												<div id="reading-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="reading-autocpl" type="text"
															class="input is-subactivity"
															placeholder="What are you reading?">
														<div class="input-block">Reads</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

												<!-- Watching suboption child -->
												<div id="watching-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="watching-autocpl" type="text"
															class="input is-subactivity"
															placeholder="What are you watching?">
														<div class="input-block">Watches</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

												<!-- Travel suboption child -->
												<div id="travel-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="travel-autocpl" type="text"
															class="input is-subactivity"
															placeholder="Where are you going?">
														<div class="input-block">Travels</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

											</div>
											<!-- /Activities suboption -->

											<!-- Location suboption -->
											<div id="location-suboption"
												class="is-autocomplete is-suboption is-hidden">
												<div id="location-autocpl-wrapper"
													class="control is-location-wrapper has-margin">
													<input id="location-autocpl" type="text" class="input"
														placeholder="Where are you now?">
													<div class="icon">
														<i data-feather="map-pin"></i>
													</div>
													<div class="close-icon is-main">
														<i data-feather="x"></i>
													</div>
												</div>
											</div>

											<!-- Link suboption -->
											<div id="link-suboption"
												class="is-autocomplete is-suboption is-hidden">
												<div id="link-autocpl-wrapper"
													class="control is-location-wrapper has-margin">
													<input id="link-autocpl" type="text" class="input"
														placeholder="Enter the link URL">
													<div class="icon">
														<i data-feather="link-2"></i>
													</div>
													<div class="close-icon is-main">
														<i data-feather="x"></i>
													</div>
												</div>
											</div>

											<!-- GIF suboption -->
											<div id="gif-suboption"
												class="is-autocomplete is-suboption is-hidden">
												<div id="gif-autocpl-wrapper"
													class="control is-gif-wrapper has-margin">
													<input id="gif-autocpl" type="text" class="input"
														placeholder="Search a GIF to add" autofocus>
													<div class="icon">
														<i data-feather="search"></i>
													</div>
													<div class="close-icon is-main">
														<i data-feather="x"></i>
													</div>
													<div class="gif-dropdown">
														<div class="inner">
															<div class="gif-block">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/1.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/2.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/3.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/4.gif" alt="">
															</div>
															<div class="gif-block">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/5.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/6.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/7.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/8.gif" alt="">
															</div>
															<div class="gif-block">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/9.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/10.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/11.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/12.gif" alt="">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- /Compose form -->

										<!-- General basic options -->
										<div id="basic-options" class="compose-options">
											<!-- Upload action -->
											<div class="compose-option">
												<i data-feather="camera"></i> <span>Media</span> <input
													id="feed-upload-input-2" name="file" type="file"
													accept=".png, .jpg, .jpeg" onchange="readURL(this)">
											</div>
											<!-- Tag action -->
											<div id="show-activities" class="compose-option">
												<img
													src="resources/template/assets/img/icons/emoji/emoji-1.svg"
													alt=""> <span>Tag</span>
											</div>
										</div>
										<!-- /General basic options -->

										<!-- Footer buttons -->
										<div class="more-wrap">

											<!-- Publish button -->
											<button id="publish-button" type="button"
												class="button is-solid accent-button is-fullwidth is-disabled">Publish</button>
										</div>
									</div>
								</div>
							</div>
						</form>

						<!-------------- 검색 태그 부분------------ -->
						<label class="nicelabel-default-position"> <span
							class="search-label" id="allSearch">최신글</span> <span
							class="search-label" id="searchNear">내 근처</span> <span
							class="search-label" id="searchTag">태그</span> <span
							class="search-label" id="searchKo">한국어</span> <span
							class="search-label" id="searchEn">영어</span>
						</label>

						<div id="SearchDiv" class="control has-margin"
							style="display: none;">
							<input type="text" id="tagInput" class="input"
								placeholder="태그를 입력해 주세요">
							<div class="icon">
								<i data-feather="search"></i>
							</div>
							<div class="close-icon is-main">
								<i data-feather="x"></i>
							</div>
						</div>

						<div class="feedContents">
							<!------------------------ 포스트 시작 ------------------------->
							<c:forEach items="${feedList }" var="vo">
								<div id="feed-post-1" class="card is-post">
									<!-- Main wrap -->
									<div class="content-wrap">
										<!-- Post header -->
										<div class="card-heading">
											<!-- User meta -->
											<div class="user-block">
												<div class="image">
													<img src="https://via.placeholder.com/300x300"
														data-demo-src="assets/img/avatars/dan.jpg"
														data-user-popover="1" alt="">
												</div>
												<div class="user-info" id="${vo.feed_id }">
													<a href="#">${vo.feed_id } : ${vo.name } :
														${vo.write_lan } </a> <span class="time"> <script
															type="text/javascript">														
														document.write(timeForToday('${vo.reg_date}'));
												</script>
													</span>
												</div>
											</div>
											<!-- Right side dropdown -->
											<!-- /partials/pages/feed/dropdowns/feed-post-dropdown.html -->
											<div
												class="dropdown is-spaced is-right is-neutral dropdown-trigger">
												<div>
													<div class="button">
														<svg viewBox="0 0 24 24" width="24" height="24"
															stroke="currentColor" stroke-width="2" fill="none"
															stroke-linecap="round" stroke-linejoin="round"
															class="css-i6dzq1">
															<line x1="8" y1="6" x2="21" y2="6"></line>
															<line x1="8" y1="12" x2="21" y2="12"></line>
															<line x1="8" y1="18" x2="21" y2="18"></line>
															<line x1="3" y1="6" x2="3.01" y2="6"></line>
															<line x1="3" y1="12" x2="3.01" y2="12"></line>
															<line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
													</div>
												</div>
												<div class="dropdown-menu" role="menu">
													<div class="dropdown-content">
														<a href="#" class="dropdown-item">
															<div class="media">
																<i data-feather="bookmark"></i>
																<div class="media-content" id="${vo.content }"
																	onclick="trans('${vo.feed_id }','${vo.content }'); return false;">
																	<h3>번역</h3>
																</div>
															</div>
														</a> <a class="dropdown-item">
															<div class="media">
																<i data-feather="bell"></i>
																<div class="media-content">
																	<h3>교정</h3>
																</div>
															</div>
														</a>
														<c:if test="${vo.user_id ne user.user_id}">
															<hr class="dropdown-divider">
															<a class="dropdown-item">
																<div class="media">
																	<i data-feather="bell"></i>
																	<div class="media-content">
																		<h3>신고</h3>
																	</div>
																</div>
															</a>
														</c:if>
														<c:if test="${vo.user_id eq user.user_id}">
															<hr class="dropdown-divider">
															<a class="dropdown-item">
																<div class="media feedUpdate" id="update${vo.feed_id }">
																	<i data-feather="bell"></i>
																	<div class="media-content">
																		<input type="hidden" id="update-tag" name="update-tag"
																			value="${vo.tags }"> <input type="hidden"
																			id="update-content" name="update-content"
																			value="${vo.content }"> <input type="hidden"
																			id="update-photo" name="update-photo"
																			value="${vo.uuid }"> <input type="hidden"
																			id="update-fphoto" name="update-fphoto"
																			value="${vo.fphoto }">
																		<h3>수정</h3>
																	</div>
																</div> <a href="#" class="dropdown-item">
																	<div class="media">
																		<i data-feather="flag"></i>
																		<div class="media-content"
																			onclick="location.href='feedDelete.do?feed_id=${vo.feed_id }'">
																			<h3>삭제</h3>
																		</div>
																	</div>
															</a>
														</c:if>
													</div>
												</div>
											</div>
										</div>
										<!-- /Post header -->
										<!-- Post body -->
										<div class="card-body">
											<!-- Post body text -->
											<div class="post-text">
												<p>${vo.content }</p>
												<div class="tdiv" id="tdiv${vo.feed_id }"></div>
												<div class="twdiv" id="${vo.write_lan }"></div>
											</div>
											<!-- Featured image -->
											<c:if test="${empty vo.fphoto}">
												<div class="post-image"
													style="margin-bottom: 50px; margin-top: 30px">
													<!-- Action buttons -->
													<!-- /partials/pages/feed/buttons/feed-post-actions.html -->
													<div class="like-wrapper">
														<a class="like-button"
															onclick="likeIt('${vo.feed_id}'); return false;"> <i
															class="mdi mdi-heart not-liked bouncy"></i> <i
															class="mdi mdi-heart is-liked bouncy"></i> <span
															class="like-overlay"></span>
														</a>
													</div>
													<div class="fab-wrapper is-comment">
														<a href="javascript:void(0);" class="small-fab"> <svg
																viewBox="0 0 24 24" width="24" height="24"
																stroke="currentColor" stroke-width="2" fill="none"
																stroke-linecap="round" stroke-linejoin="round"
																class="css-i6dzq1">
																<path
																	d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
														</a>
													</div>
												</div>
											</c:if>
											<c:if test="${not empty vo.fphoto}">
												<div class="post-image">
													<img
														src='${pageContext.request.contextPath}/resources/upload/${vo.uuid}'
														alt="" />
													<!-- Action buttons -->
													<!-- /partials/pages/feed/buttons/feed-post-actions.html -->
													<div class="like-wrapper">
														<a class="like-button"
															onclick="likeIt('${vo.feed_id}'); return false;"> <i
															class="mdi mdi-heart not-liked bouncy"></i> <i
															class="mdi mdi-heart is-liked bouncy"></i> <span
															class="like-overlay"></span>
														</a>
													</div>
													<div class="fab-wrapper is-comment">
														<a href="javascript:void(0);" class="small-fab"> <svg
																viewBox="0 0 24 24" width="24" height="24"
																stroke="currentColor" stroke-width="2" fill="none"
																stroke-linecap="round" stroke-linejoin="round"
																class="css-i6dzq1">
																<path
																	d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
														</a>
													</div>
												</div>
											</c:if>
											<div>
												<p>
													<c:if test="${not empty vo.tags }">
														<a>#${fn:replace(vo.tags,',','#')}</a>
													</c:if>
												</p>
											</div>
										</div>
										<!-- /Post body -->

										<!-- Post footer -->
										<div class="card-footer">
											<!-- Followers avatars -->
											<div class="likers-group">
												<img src="https://via.placeholder.com/300x300"
													data-demo-src="assets/img/avatars/dan.jpg"
													data-user-popover="1" alt=""> <img
													src="https://via.placeholder.com/300x300"
													data-demo-src="assets/img/avatars/david.jpg"
													data-user-popover="4" alt=""> <img
													src="https://via.placeholder.com/300x300"
													data-demo-src="assets/img/avatars/edward.jpeg"
													data-user-popover="5" alt=""> <img
													src="https://via.placeholder.com/300x300"
													data-demo-src="assets/img/avatars/milly.jpg"
													data-user-popover="7" alt="">
											</div>

											<!-- Followers text -->
											<div class="likers-text">
												<p></p>
											</div>

											<!-- Post statistics -->
											<div class="social-count">
												<div class="comments-count">
													<svg viewBox="0 0 24 24" width="24" height="24"
														stroke="currentColor" stroke-width="2" fill="none"
														stroke-linecap="round" stroke-linejoin="round"
														class="css-i6dzq1">
														<path
															d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
													<span>3</span>
												</div>
												<div class="likes-count" id="like-count${vo.feed_id }">
													<svg viewBox="0 0 24 24" width="24" height="24"
														stroke="currentColor" stroke-width="2" fill="none"
														stroke-linecap="round" stroke-linejoin="round"
														class="css-i6dzq1">
														<path
															d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
													<span id="recCnt${vo.feed_id }"> <script
															type="text/javascript">														
														recCount('${vo.feed_id}');
												</script>
													</span>
												</div>
											</div>
										</div>
										<!-- /Post footer -->
									</div>
									<!-- /Main wrap -->

									<!-- Post #1 Comments -->
									<div class="comments-wrap is-hidden">
										<!-- Header -->
										<div class="comments-heading">
											<h4>
												Comments <small>(8)</small>
											</h4>
											<div class="close-comments">
												<svg viewBox="0 0 24 24" width="24" height="24"
													stroke="currentColor" stroke-width="2" fill="none"
													stroke-linecap="round" stroke-linejoin="round"
													class="css-i6dzq1">
													<line x1="18" y1="6" x2="6" y2="18"></line>
													<line x1="6" y1="6" x2="18" y2="18"></line></svg>
												</i>
											</div>
										</div>
										<!-- /Header -->

										<!-- Comments body -->
										<div class="comments-body has-slimscroll">

											<!-- Comment -->
											<div class="media is-comment">
												<!-- User image -->
												<div class="media-left">
													<div class="image">
														<img src="https://via.placeholder.com/300x300"
															data-demo-src="assets/img/avatars/dan.jpg"
															data-user-popover="1" alt="">
													</div>
												</div>
												<!-- Content -->
												<div class="media-content">
													<a href="#">Dan Walker</a> <span class="time">28
														minutes ago</span>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit, sed do eiusmod tempo incididunt ut labore et dolore
														magna aliqua. Ut enim ad minim veniam, quis nostrud
														exercitation ullamco laboris consequat.</p>
													<!-- Actions -->
													<div class="controls">
														<div class="like-count">
															<i data-feather="thumbs-up"></i> <span>4</span>
														</div>
														<div class="reply">
															<a href="#">Reply</a>
														</div>
														<div class="edit">
															<a href="#">Edit</a>
														</div>
													</div>

													<!-- Nested Comment -->
													<div class="media is-comment">
														<!-- User image -->
														<div class="media-left">
															<div class="image">
																<img src="https://via.placeholder.com/300x300"
																	data-demo-src="assets/img/avatars/david.jpg"
																	data-user-popover="4" alt="">
															</div>
														</div>
														<!-- Content -->
														<div class="media-content">
															<a href="#">David Kim</a> <span class="time">15
																minutes ago</span>
															<p>Lorem ipsum dolor sit amet, consectetur
																adipisicing elit, sed do eiusmod tempo incididunt ut
																labore et dolore magna aliqua.</p>
															<!-- Actions -->
															<div class="controls">
																<div class="like-count">
																	<i data-feather="thumbs-up"></i> <span>0</span>
																</div>
																<div class="reply">
																	<a href="#">Reply</a>
																</div>
															</div>
														</div>
														<!-- Right side dropdown -->
														<div class="media-right">
															<div
																class="dropdown is-spaced is-right is-neutral dropdown-trigger">
																<div>
																	<div class="button">
																		<i data-feather="more-vertical"></i>
																	</div>
																</div>
																<div class="dropdown-menu" role="menu">
																	<div class="dropdown-content">
																		<a class="dropdown-item">
																			<div class="media">
																				<i data-feather="x"></i>
																				<div class="media-content">
																					<h3>Hide</h3>
																					<small>Hide this comment.</small>
																				</div>
																			</div>
																		</a>
																		<div class="dropdown-divider"></div>
																		<a href="#" class="dropdown-item">
																			<div class="media">
																				<i data-feather="flag"></i>
																				<div class="media-content">
																					<h3>Report</h3>
																					<small>Report this comment.</small>
																				</div>
																			</div>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!-- /Nested Comment -->

												</div>
												<!-- Right side dropdown -->
												<div class="media-right">
													<!-- /partials/pages/feed/dropdowns/comment-dropdown.html -->
													<div
														class="dropdown is-spaced is-right is-neutral dropdown-trigger">
														<div>
															<div class="button">
																<i data-feather="more-vertical"></i>
															</div>
														</div>
														<div class="dropdown-menu" role="menu">
															<div class="dropdown-content">
																<a class="dropdown-item">
																	<div class="media">
																		<i data-feather="x"></i>
																		<div class="media-content">
																			<h3>Hide</h3>
																			<small>Hide this comment.</small>
																		</div>
																	</div>
																</a>
																<div class="dropdown-divider"></div>
																<a href="#" class="dropdown-item">
																	<div class="media">
																		<i data-feather="flag"></i>
																		<div class="media-content">
																			<h3>Report</h3>
																			<small>Report this comment.</small>
																		</div>
																	</div>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /Comment -->

											<!-- Comment -->
											<div class="media is-comment">
												<!-- User image -->
												<div class="media-left">
													<div class="image">
														<img src="https://via.placeholder.com/300x300"
															data-demo-src="assets/img/avatars/rolf.jpg"
															data-user-popover="13" alt="">
													</div>
												</div>
												<!-- Content -->
												<div class="media-content">
													<a href="#">Rolf Krupp</a> <span class="time">9
														hours ago</span>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit, sed do eiusmod tempo incididunt ut labore et dolore
														magna aliqua. Exercitation ullamco laboris consequat.</p>
													<!-- Actions -->
													<div class="controls">
														<div class="like-count">
															<i data-feather="thumbs-up"></i> <span>2</span>
														</div>
														<div class="reply">
															<a href="#">Reply</a>
														</div>
													</div>

													<!-- Nested Comment -->
													<div class="media is-comment">
														<!-- User image -->
														<div class="media-left">
															<div class="image">
																<img src="https://via.placeholder.com/300x300"
																	data-demo-src="assets/img/avatars/elise.jpg"
																	data-user-popover="6" alt="">
															</div>
														</div>
														<!-- Content -->
														<div class="media-content">
															<a href="#">Elise Walker</a> <span class="time">8
																hours ago</span>
															<p>Lorem ipsum dolor sit amet, consectetur
																adipisicing elit, sed do eiusmod tempo incididunt ut
																labore et dolore magna aliqua.</p>
															<!-- Actions -->
															<div class="controls">
																<div class="like-count">
																	<i data-feather="thumbs-up"></i> <span>0</span>
																</div>
																<div class="reply">
																	<a href="#">Reply</a>
																</div>
															</div>
														</div>
														<!-- Right side dropdown -->
														<div class="media-right">
															<div
																class="dropdown is-spaced is-right is-neutral dropdown-trigger">
																<div>
																	<div class="button">
																		<i data-feather="more-vertical"></i>
																	</div>
																</div>
																<div class="dropdown-menu" role="menu">
																	<div class="dropdown-content">
																		<a class="dropdown-item">
																			<div class="media">
																				<i data-feather="x"></i>
																				<div class="media-content">
																					<h3>Hide</h3>
																					<small>Hide this comment.</small>
																				</div>
																			</div>
																		</a>
																		<div class="dropdown-divider"></div>
																		<a href="#" class="dropdown-item">
																			<div class="media">
																				<i data-feather="flag"></i>
																				<div class="media-content">
																					<h3>Report</h3>
																					<small>Report this comment.</small>
																				</div>
																			</div>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!-- /Nested Comment -->

													<!-- Nested Comment -->
													<div class="media is-comment">
														<!-- User image -->
														<div class="media-left">
															<div class="image">
																<img src="https://via.placeholder.com/300x300"
																	data-demo-src="assets/img/avatars/rolf.jpg"
																	data-user-popover="13" alt="">
															</div>
														</div>
														<!-- Content -->
														<div class="media-content">
															<a href="#">Rolf Krupp</a> <span class="time">7
																hours ago</span>
															<p>Lorem ipsum dolor sit amet, consectetur
																adipisicing elit, sed do eiusmod tempo incididunt ut
																labore et dolore magna aliqua.</p>
															<!-- Actions -->
															<div class="controls">
																<div class="like-count">
																	<i data-feather="thumbs-up"></i> <span>1</span>
																</div>
																<div class="reply">
																	<a href="#">Reply</a>
																</div>
															</div>
														</div>
														<!-- Right side dropdown -->
														<div class="media-right">
															<div
																class="dropdown is-spaced is-right is-neutral dropdown-trigger">
																<div>
																	<div class="button">
																		<i data-feather="more-vertical"></i>
																	</div>
																</div>
																<div class="dropdown-menu" role="menu">
																	<div class="dropdown-content">
																		<a class="dropdown-item">
																			<div class="media">
																				<i data-feather="x"></i>
																				<div class="media-content">
																					<h3>Hide</h3>
																					<small>Hide this comment.</small>
																				</div>
																			</div>
																		</a>
																		<div class="dropdown-divider"></div>
																		<a href="#" class="dropdown-item">
																			<div class="media">
																				<i data-feather="flag"></i>
																				<div class="media-content">
																					<h3>Report</h3>
																					<small>Report this comment.</small>
																				</div>
																			</div>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!-- /Nested Comment -->

													<!-- Nested Comment -->
													<div class="media is-comment">
														<!-- User image -->
														<div class="media-left">
															<div class="image">
																<img src="https://via.placeholder.com/300x300"
																	data-demo-src="assets/img/avatars/elise.jpg"
																	data-user-popover="6" alt="">
															</div>
														</div>
														<!-- Content -->
														<div class="media-content">
															<a href="#">Elise Walker</a> <span class="time">6
																hours ago</span>
															<p>Lorem ipsum dolor sit amet, consectetur
																adipisicing elit, sed do eiusmod tempo incididunt ut
																labore et dolore magna aliqua.</p>
															<!-- Actions -->
															<div class="controls">
																<div class="like-count">
																	<i data-feather="thumbs-up"></i> <span>0</span>
																</div>
																<div class="reply">
																	<a href="#">Reply</a>
																</div>
															</div>
														</div>
														<!-- Right side dropdown -->
														<div class="media-right">
															<div
																class="dropdown is-spaced is-right is-neutral dropdown-trigger">
																<div>
																	<div class="button">
																		<i data-feather="more-vertical"></i>
																	</div>
																</div>
																<div class="dropdown-menu" role="menu">
																	<div class="dropdown-content">
																		<a class="dropdown-item">
																			<div class="media">
																				<i data-feather="x"></i>
																				<div class="media-content">
																					<h3>Hide</h3>
																					<small>Hide this comment.</small>
																				</div>
																			</div>
																		</a>
																		<div class="dropdown-divider"></div>
																		<a href="#" class="dropdown-item">
																			<div class="media">
																				<i data-feather="flag"></i>
																				<div class="media-content">
																					<h3>Report</h3>
																					<small>Report this comment.</small>
																				</div>
																			</div>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!-- /Nested Comment -->

												</div>
												<!-- Right side dropdown -->
												<div class="media-right">
													<div
														class="dropdown is-spaced is-right is-neutral dropdown-trigger">
														<div>
															<div class="button">
																<i data-feather="more-vertical"></i>
															</div>
														</div>
														<div class="dropdown-menu" role="menu">
															<div class="dropdown-content">
																<a class="dropdown-item">
																	<div class="media">
																		<i data-feather="x"></i>
																		<div class="media-content">
																			<h3>Hide</h3>
																			<small>Hide this comment.</small>
																		</div>
																	</div>
																</a>
																<div class="dropdown-divider"></div>
																<a href="#" class="dropdown-item">
																	<div class="media">
																		<i data-feather="flag"></i>
																		<div class="media-content">
																			<h3>Report</h3>
																			<small>Report this comment.</small>
																		</div>
																	</div>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /Comment -->

											<!-- Comment -->
											<div class="media is-comment">
												<!-- User image -->
												<div class="media-left">
													<div class="image">
														<img src="https://via.placeholder.com/300x300"
															data-demo-src="assets/img/avatars/lana.jpeg"
															data-user-popover="10" alt="">
													</div>
												</div>
												<!-- Content -->
												<div class="media-content">
													<a href="#">Lana Henrikssen</a> <span class="time">10
														hours ago</span>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit, sed do eiusmod tempo incididunt ut labore et dolore
														magna aliqua.</p>
													<!-- Comment actions -->
													<div class="controls">
														<div class="like-count">
															<i data-feather="thumbs-up"></i> <span>5</span>
														</div>
														<div class="reply">
															<a href="#">Reply</a>
														</div>
													</div>
												</div>
												<!-- Right side dropdown -->
												<div class="media-right">
													<div
														class="dropdown is-spaced is-right is-neutral dropdown-trigger">
														<div>
															<div class="button">
																<i data-feather="more-vertical"></i>
															</div>
														</div>
														<div class="dropdown-menu" role="menu">
															<div class="dropdown-content">
																<a class="dropdown-item">
																	<div class="media">
																		<i data-feather="x"></i>
																		<div class="media-content">
																			<h3>Hide</h3>
																			<small>Hide this comment.</small>
																		</div>
																	</div>
																</a>
																<div class="dropdown-divider"></div>
																<a href="#" class="dropdown-item">
																	<div class="media">
																		<i data-feather="flag"></i>
																		<div class="media-content">
																			<h3>Report</h3>
																			<small>Report this comment.</small>
																		</div>
																	</div>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /Comment -->

										</div>
										<!-- /Comments body -->

										<!-- Comments footer -->
										<div class="card-footer">
											<div class="media post-comment has-emojis">
												<!-- Comment Textarea -->
												<div class="media-content">
													<div class="field">
														<p class="control">
															<textarea class="textarea comment-textarea" rows="5"
																placeholder="Write a comment..."></textarea>
														</p>
													</div>
													<!-- Additional actions -->
													<div class="actions">
														<div class="image is-32x32">
															<img class="is-rounded"
																src="https://via.placeholder.com/300x300"
																data-demo-src="assets/img/avatars/jenna.png"
																data-user-popover="0" alt="">
														</div>
														<div class="toolbar">
															<div class="action is-auto">
																<i data-feather="at-sign"></i>
															</div>
															<div class="action is-emoji">
																<i data-feather="smile"></i>
															</div>
															<div class="action is-upload">
																<i data-feather="camera"></i>
															</div>
															<a class="button is-solid primary-button raised">Post
																Comment</a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- Comments footer -->
									</div>
									<!-- /Post #1 Comments -->
								</div>
							</c:forEach>
							<!------------------------ 포스트 끝 ------------------------->
						</div>
						<div class=" load-more-wrap narrow-top has-text-centered">
							<a href="#" class="load-more-button">Load More</a>
						</div>
						<!-- /Load more posts -->

					</div>
					<!-- /Middle column -->

					<!-- Right side column -->

					<div class="column is-3">
						<!------------------------ 친구추천 시작 ------------------------->
						<div class="card">
							<div class="card-heading is-bordered">
								<h4>
									친구 추천
									<button onclick="location.href='friendSearch1.do'">친구
										찾으러 가쟝</button>
								</h4>
								<div class="dropdown is-spaced is-right dropdown-trigger">
									<div>
										<div class="button">
											<svg viewBox="0 0 24 24" width="24" height="24"
												stroke="currentColor" stroke-width="2" fill="none"
												stroke-linecap="round" stroke-linejoin="round"
												class="css-i6dzq1">
												<line x1="8" y1="6" x2="21" y2="6"></line>
												<line x1="8" y1="12" x2="21" y2="12"></line>
												<line x1="8" y1="18" x2="21" y2="18"></line>
												<line x1="3" y1="6" x2="3.01" y2="6"></line>
												<line x1="3" y1="12" x2="3.01" y2="12"></line>
												<line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="users"></i>
													<div class="media-content">
														<h3>All Suggestions</h3>
														<small>View all friend suggestions.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="settings"></i>
													<div class="media-content">
														<h3>Settings</h3>
														<small>Access widget settings.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="trash-2"></i>
													<div class="media-content">
														<h3>Remove</h3>
														<small>Removes this widget from your feed.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body no-padding">
								<!-- Suggested friend -->
								<c:forEach items="${sameTopic }" var="vo" end="10">
									<c:if test="${vo.count ne  0 }">
										<div class="add-friend-block transition-block">
											<img src="https://via.placeholder.com/300x300"
												data-demo-src="assets/img/avatars/nelly.png"
												data-user-popover="9" alt="">
											<div class="page-meta">
												<span>${vo.user_id }</span> <span>나와 일치하는 관심사
													${vo.count }개</span>
											</div>
											<div class="add-friend add-transition" id="${vo.user_id }"
												onclick="addFriend('${vo.user_id }')">
												<svg viewBox="0 0 24 24" width="24" height="24"
													stroke="currentColor" stroke-width="2" fill="none"
													stroke-linecap="round" stroke-linejoin="round"
													class="css-i6dzq1">
													<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
													<circle cx="8.5" cy="7" r="4"></circle>
													<line x1="20" y1="8" x2="20" y2="14"></line>
													<line x1="23" y1="11" x2="17" y2="11"></line></svg>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<!------------------------ 친구추천 끝 ------------------------->
						<!------------------------ 생일 시작 ------------------------->
						<div class="notice">
							<c:forEach items="${birthUser }" var="vo" varStatus="status">
								<ul class="rolling">
									<li>
										<div class="card is-birthday-card has-background-image"
											data-background="resource/template/assets/img/illustrations/cards/birthday-bg.svg">
											<div class="card-heading" style="border-collapse: collapse;">
												<div
													class="dropdown is-spaced is-right dropdown-trigger is-light">
													<div>
														<div class="button"></div>
													</div>
												</div>
											</div>
											<div class="card-body">
												<div>
													<div class="birthday-avatar">
														<img src="https://via.placeholder.com/300x300"
															data-demo-src="assets/img/avatars/dan.jpg" alt="">
														<div class="birthday-indicator">${vo.age }</div>
													</div>
													<div class="birthday-content">
														<h4>${vo.following }님의${vo.age }번째생일!</h4>
														<p>편지를 보내 생일을 축하해 주세요!</p>
														<button type="button" class="button light-button">편지쓰러가기</button>
														<p></p>
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</c:forEach>
						</div>
						<!------------------------ 생일 끝 ------------------------->

					</div>
					<!-- /Right side column -->
				</div>
			</div>
			<!-- /Feed page main wrapper -->
		</div>
		<!-- /Container -->

		<!-- Create group modal in compose card -->
		<!-- /partials/pages/feed/modals/create-group-modal.html -->
		<div id="create-group-modal"
			class="modal create-group-modal is-light-bg">
			<div class="modal-background"></div>
			<div class="modal-content">

				<div class="card">
					<div class="card-heading">
						<h3>Create group</h3>
						<!-- Close X button -->
						<div class="close-wrap">
							<span class="close-modal"> <i data-feather="x"></i>
							</span>
						</div>
					</div>
					<!-- Modal subheading -->
					<div class="subheading">
						<!-- Group avatar -->
						<div class="group-avatar">
							<input id="group-avatar-upload">
							<div class="add-photo">
								<i data-feather="plus"></i>
							</div>
						</div>
						<!-- Group name -->
						<div class="control">
							<input type="text" class="input"
								placeholder="Give the group a name">
						</div>
					</div>
					<div class="card-body">
						<div class="inner">
							<div class="left-section">
								<div class="search-subheader">
									<div class="control">
										<input type="text" class="input"
											placeholder="Search for friends to add"> <span
											class="icon"> <i data-feather="search"></i>
										</span>
									</div>
								</div>
								<div id="new-group-list" class="user-list has-slimscroll">

									<!-- Friend -->
									<div class="friend-block" data-ref="ref-1">
										<img class="friend-avatar"
											src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/dan.jpg" alt="">
										<div class="friend-name">Dan Walker</div>
										<div class="round-checkbox is-small">
											<div>
												<input type="checkbox" id="checkbox-group-1"> <label
													for="checkbox-group-1"></label>
											</div>
										</div>
									</div>
									<!-- Friend -->
									<div class="friend-block" data-ref="ref-2">
										<img class="friend-avatar"
											src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/daniel.jpg" alt="">
										<div class="friend-name">Daniel Wellington</div>
										<div class="round-checkbox is-small">
											<div>
												<input type="checkbox" id="checkbox-group-2"> <label
													for="checkbox-group-2"></label>
											</div>
										</div>
									</div>
									<!-- Friend -->
									<div class="friend-block" data-ref="ref-3">
										<img class="friend-avatar"
											src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/stella.jpg" alt="">
										<div class="friend-name">Stella Bergmann</div>
										<div class="round-checkbox is-small">
											<div>
												<input type="checkbox" id="checkbox-group-3"> <label
													for="checkbox-group-3"></label>
											</div>
										</div>
									</div>
									<!-- Friend -->
									<div class="friend-block" data-ref="ref-4">
										<img class="friend-avatar"
											src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/david.jpg" alt="">
										<div class="friend-name">David Kim</div>
										<div class="round-checkbox is-small">
											<div>
												<input type="checkbox" id="checkbox-group-4"> <label
													for="checkbox-group-4"></label>
											</div>
										</div>
									</div>
									<!-- Friend -->
									<div class="friend-block" data-ref="ref-5">
										<img class="friend-avatar"
											src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/nelly.png" alt="">
										<div class="friend-name">Nelly Schwartz</div>
										<div class="round-checkbox is-small">
											<div>
												<input type="checkbox" id="checkbox-group-5"> <label
													for="checkbox-group-5"></label>
											</div>
										</div>
									</div>
									<!-- Friend -->
									<div class="friend-block" data-ref="ref-6">
										<img class="friend-avatar"
											src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/elise.jpg" alt="">
										<div class="friend-name">Elise Walker</div>
										<div class="round-checkbox is-small">
											<div>
												<input type="checkbox" id="checkbox-group-6"> <label
													for="checkbox-group-6"></label>
											</div>
										</div>
									</div>
									<!-- Friend -->
									<div class="friend-block" data-ref="ref-7">
										<img class="friend-avatar"
											src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/bobby.jpg" alt="">
										<div class="friend-name">Bobby Brown</div>
										<div class="round-checkbox is-small">
											<div>
												<input type="checkbox" id="checkbox-group-7"> <label
													for="checkbox-group-7"></label>
											</div>
										</div>
									</div>
									<!-- Friend -->
									<div class="friend-block" data-ref="ref-8">
										<img class="friend-avatar"
											src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/lana.jpeg" alt="">
										<div class="friend-name">Lana Henrikssen</div>
										<div class="round-checkbox is-small">
											<div>
												<input type="checkbox" id="checkbox-group-8"> <label
													for="checkbox-group-8"></label>
											</div>
										</div>
									</div>
									<!-- Friend -->
									<div class="friend-block" data-ref="ref-9">
										<img class="friend-avatar"
											src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/gaelle.jpeg" alt="">
										<div class="friend-name">Gaelle Morris</div>
										<div class="round-checkbox is-small">
											<div>
												<input type="checkbox" id="checkbox-group-9"> <label
													for="checkbox-group-9"></label>
											</div>
										</div>
									</div>
									<!-- Friend -->
									<div class="friend-block" data-ref="ref-10">
										<img class="friend-avatar"
											src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/mike.jpg" alt="">
										<div class="friend-name">Mike Lasalle</div>
										<div class="round-checkbox is-small">
											<div>
												<input type="checkbox" id="checkbox-group-10"> <label
													for="checkbox-group-10"></label>
											</div>
										</div>
									</div>

								</div>
							</div>
							<div class="right-section has-slimscroll">
								<div class="selected-count">
									<span>Selected</span> <span id="selected-friends-count">0</span>
								</div>

								<div id="selected-list" class="selected-list"></div>

							</div>
						</div>
					</div>
					<div class="card-footer">
						<button type="button"
							class="button is-solid grey-button close-modal">Cancel</button>
						<button type="button"
							class="button is-solid accent-button close-modal">Create
							a Group</button>
					</div>
				</div>

			</div>
		</div>
		<!-- Albums onboarding modal -->
		<!-- /partials/pages/feed/modals/albums-help-modal.html -->
		<div id="albums-help-modal"
			class="modal albums-help-modal is-xsmall has-light-bg">
			<div class="modal-background"></div>
			<div class="modal-content">

				<div class="card">
					<div class="card-heading">
						<h3>Add Photos</h3>
						<!-- Close X button -->
						<div class="close-wrap">
							<span class="close-modal"> <i data-feather="x"></i>
							</span>
						</div>
					</div>
					<div class="card-body">
						<div class="content-block is-active">
							<img
								src="resources/template/assets/img/illustrations/cards/albums.svg"
								alt="">
							<div class="help-text">
								<h3>Manage your photos</h3>
								<p>Lorem ipsum sit dolor amet is a dummy text used by the
									typography industry and the web industry.</p>
							</div>
						</div>

						<div class="content-block">
							<img
								src="resources/template/assets/img/illustrations/cards/upload.svg"
								alt="">
							<div class="help-text">
								<h3>Upload your photos</h3>
								<p>Lorem ipsum sit dolor amet is a dummy text used by the
									typography industry and the web industry.</p>
							</div>
						</div>

						<div class="slide-dots">
							<div class="dot is-active"></div>
							<div class="dot"></div>
						</div>
						<div class="action">
							<button type="button"
								class="button is-solid accent-button next-modal raised"
								data-modal="albums-modal">Next</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Album upload modal -->
		<!-- /partials/pages/feed/modals/albums-modal.html -->
		<div id="albums-modal" class="modal albums-modal is-xxl has-light-bg">
			<div class="modal-background"></div>
			<div class="modal-content">

				<div class="card">
					<div class="card-heading">
						<h3>New album</h3>
						<div class="button is-solid accent-button fileinput-button">
							<i class="mdi mdi-plus"></i> Add pictures/videos
						</div>

						<!-- Close X button -->
						<div class="close-wrap">
							<span class="close-modal"> <i data-feather="x"></i>
							</span>
						</div>
					</div>
					<div class="card-body">
						<div class="left-section">
							<div class="album-form">
								<div class="control">
									<input type="text" class="input is-sm no-radius is-fade"
										placeholder="Album name">
									<div class="icon">
										<i data-feather="camera"></i>
									</div>
								</div>
								<div class="control">
									<textarea class="textarea is-fade no-radius is-sm" rows="3"
										placeholder="describe your album ..."></textarea>
								</div>
								<div class="control">
									<input type="text" class="input is-sm no-radius is-fade"
										placeholder="Place">
									<div class="icon">
										<i data-feather="map-pin"></i>
									</div>
								</div>
							</div>

							<div id="album-date" class="album-date">
								<div class="head">
									<h4>Change the date</h4>
									<button type="button"
										class="button is-solid dark-grey-button icon-button">
										<i data-feather="plus"></i>
									</button>
								</div>

								<p>Set a date for your album. You can always change it
									later.</p>
								<div class="control is-hidden">
									<input id="album-datepicker" type="text"
										class="input is-sm is-fade" placeholder="Select a date">
									<div class="icon">
										<i data-feather="calendar"></i>
									</div>
								</div>
							</div>

							<div id="tagged-in-album" class="tagged-in-album">
								<div class="head">
									<h4>Tag friends in this album</h4>
									<button type="button"
										class="button is-solid dark-grey-button icon-button">
										<i data-feather="plus"></i>
									</button>
								</div>

								<p>Tag friends in this album. Tagged friends can see photos
									they are tagged in.</p>
								<div class="field is-autocomplete is-hidden">
									<div class="control">
										<input id="create-album-friends-autocpl" type="text"
											class="input is-sm is-fade" placeholder="Search for friends">
										<div class="icon">
											<i data-feather="search"></i>
										</div>
									</div>
								</div>

								<div id="album-tag-list" class="album-tag-list"></div>

							</div>

							<div class="shared-album">
								<div class="head">
									<h4>Allow friends to add photos</h4>
									<div class="basic-checkbox">
										<input class="styled-checkbox" id="styled-checkbox-1"
											type="checkbox" value="value1"> <label
											for="styled-checkbox-1"></label>
									</div>
								</div>

								<p>Tagged friends will be able to share content inside this
									album.</p>
							</div>

						</div>
						<div class="right-section has-slimscroll">

							<div class="modal-uploader">
								<div id="actions" class="columns is-multiline no-mb">
									<div class="column is-12">
										<span
											class="button has-icon is-solid grey-button fileinput-button">
											<i data-feather="plus"></i>
										</span>
										<button type="submit" class="button start is-hidden">
											<span>Upload</span>
										</button>
										<button type="reset"
											class="button is-solid grey-button cancel">
											<span>Clear all</span>
										</button>
										<span class="file-count"> <span
											id="modal-uploader-file-count">0</span> file(s) selected
										</span>
									</div>

									<div class="column is-12 is-hidden">
										<!-- The global file processing state -->
										<div class="fileupload-process">
											<div id="total-progress"
												class="progress progress-striped active" role="progressbar"
												aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
												<div class="progress-bar progress-bar-success"
													style="width: 0%;" data-dz-uploadprogress></div>
											</div>
										</div>
									</div>

								</div>


								<div class="columns is-multiline" id="previews">

									<div id="template" class="column is-4 is-template">
										<div class="preview-box">
											<!-- This is used as the file preview template -->
											<div class="remove-button" data-dz-remove>
												<i class="mdi mdi-close"></i>
											</div>
											<div>
												<span class="preview"><img
													src="https://via.placeholder.com/120x120" data-dz-thumbnail
													alt="" /></span>
											</div>
											<div class="preview-body">
												<div class="item-meta">
													<div>
														<p class="name" data-dz-name></p>
														<strong class="error text-danger" data-dz-errormessage></strong>
													</div>
													<small class="size" data-dz-size></small>
												</div>
												<div class="upload-item-progress">
													<div class="progress active" role="progressbar"
														aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
														<div class="progress-bar progress-bar-success"
															data-dz-uploadprogress></div>
													</div>
												</div>
												<div class="upload-item-description">
													<div class="control">
														<textarea class="textarea is-small is-fade no-radius"
															rows="4" placeholder="Describe this photo ..."></textarea>
													</div>
												</div>
												<div class="upload-item-actions is-hidden">
													<button class="button start is-hidden">
														<span>Start</span>
													</button>
													<button data-dz-remove class="button cancel is-hidden">
														<span>Cancel</span>
													</button>
													<button data-dz-remove class="button delete is-hidden">
														<span>Delete</span>
													</button>
												</div>
											</div>

										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<!-- Dropdown menu -->
						<div
							class="dropdown is-up is-spaced is-modern is-neutral is-right dropdown-trigger">
							<div>
								<button class="button" aria-haspopup="true">
									<i class="main-icon" data-feather="smile"></i> <span>Friends</span>
									<i class="caret" data-feather="chevron-down"></i>
								</button>
							</div>
							<div class="dropdown-menu" role="menu">
								<div class="dropdown-content">
									<a href="#" class="dropdown-item">
										<div class="media">
											<i data-feather="globe"></i>
											<div class="media-content">
												<h3>Public</h3>
												<small>Anyone can see this publication.</small>
											</div>
										</div>
									</a> <a class="dropdown-item">
										<div class="media">
											<i data-feather="users"></i>
											<div class="media-content">
												<h3>Friends</h3>
												<small>only friends can see this publication.</small>
											</div>
										</div>
									</a> <a class="dropdown-item">
										<div class="media">
											<i data-feather="user"></i>
											<div class="media-content">
												<h3>Specific friends</h3>
												<small>Don't show it to some friends.</small>
											</div>
										</div>
									</a>
									<hr class="dropdown-divider">
									<a class="dropdown-item">
										<div class="media">
											<i data-feather="lock"></i>
											<div class="media-content">
												<h3>Only me</h3>
												<small>Only me can see this publication.</small>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
						<button type="button"
							class="button is-solid accent-button close-modal">Create
							album</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Live video onboarding modal -->
		<!-- /partials/pages/feed/modals/videos-help-modal.html -->
		<div id="videos-help-modal"
			class="modal videos-help-modal is-xsmall has-light-bg">
			<div class="modal-background"></div>
			<div class="modal-content">

				<div class="card">
					<div class="card-heading">
						<h3>Add Photos</h3>
						<!-- Close X button -->
						<div class="close-wrap">
							<span class="close-modal"> <i data-feather="x"></i>
							</span>
						</div>
					</div>
					<div class="card-body">
						<div class="content-block is-active">
							<img
								src="resources/template/assets/img/illustrations/cards/videotrip.svg"
								alt="">
							<div class="help-text">
								<h3>Share live videos</h3>
								<p>Lorem ipsum sit dolor amet is a dummy text used by the
									typography industry and the web industry.</p>
							</div>
						</div>

						<div class="content-block">
							<img
								src="resources/template/assets/img/illustrations/cards/videocall.svg"
								alt="">
							<div class="help-text">
								<h3>To build your audience</h3>
								<p>Lorem ipsum sit dolor amet is a dummy text used by the
									typography industry and the web industry.</p>
							</div>
						</div>

						<div class="slide-dots">
							<div class="dot is-active"></div>
							<div class="dot"></div>
						</div>
						<div class="action">
							<button type="button"
								class="button is-solid accent-button next-modal raised"
								data-modal="videos-modal">Next</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Live video modal -->
		<!-- /partials/pages/feed/modals/videos-modal.html -->
		<div id="videos-modal" class="modal videos-modal is-xxl has-light-bg">
			<div class="modal-background"></div>
			<div class="modal-content">

				<div class="card">
					<div class="card-heading">
						<h3>Go live</h3>
						<div id="stop-stream"
							class="button is-solid accent-button is-hidden"
							onclick="stopWebcam();">
							<i class="mdi mdi-video-off"></i> Stop stream
						</div>
						<div id="start-stream" class="button is-solid accent-button"
							onclick="startWebcam();">
							<i class="mdi mdi-video"></i> Start stream
						</div>


						<!-- Close X button -->
						<div class="close-wrap">
							<span class="close-modal"> <i data-feather="x"></i>
							</span>
						</div>
					</div>
					<div class="card-body">
						<div class="inner">
							<div class="left-section">
								<div class="video-wrapper">
									<div class="video-wrap">
										<div id="live-indicator" class="live is-vhidden">Live</div>
										<video id="video" width="400" height="240" controls autoplay></video>
									</div>
								</div>
							</div>
							<div class="right-section">
								<div class="header">
									<img src="https://via.placeholder.com/300x300"
										data-demo-src="resources/template/assets/img/avatars/jenna.png"
										alt="">
									<div class="user-meta">
										<span>Jenna Davis <small>is live</small></span> <span><small>right
												now</small></span>
									</div>
									<button type="button" class="button">Follow</button>
									<div class="dropdown is-spaced is-right dropdown-trigger">
										<div>
											<div class="button">
												<i data-feather="more-vertical"></i>
											</div>
										</div>
										<div class="dropdown-menu" role="menu">
											<div class="dropdown-content">
												<div class="dropdown-item is-title">Who can see this ?
												</div>
												<a href="#" class="dropdown-item">
													<div class="media">
														<i data-feather="globe"></i>
														<div class="media-content">
															<h3>Public</h3>
															<small>Anyone can see this publication.</small>
														</div>
													</div>
												</a> <a class="dropdown-item">
													<div class="media">
														<i data-feather="users"></i>
														<div class="media-content">
															<h3>Friends</h3>
															<small>only friends can see this publication.</small>
														</div>
													</div>
												</a> <a class="dropdown-item">
													<div class="media">
														<i data-feather="user"></i>
														<div class="media-content">
															<h3>Specific friends</h3>
															<small>Don't show it to some friends.</small>
														</div>
													</div>
												</a>
												<hr class="dropdown-divider">
												<a class="dropdown-item">
													<div class="media">
														<i data-feather="lock"></i>
														<div class="media-content">
															<h3>Only me</h3>
															<small>Only me can see this publication.</small>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>

								<div class="inner-content">
									<div class="control">
										<input type="text" class="input is-sm is-fade"
											placeholder="What is this live about?">
										<div class="icon">
											<i data-feather="activity"></i>
										</div>
									</div>
									<div class="live-stats">
										<div class="social-count">
											<div class="likes-count">
												<i data-feather="heart"></i> <span>0</span>
											</div>
											<div class="shares-count">
												<i data-feather="link-2"></i> <span>0</span>
											</div>
											<div class="comments-count">
												<i data-feather="message-circle"></i> <span>0</span>
											</div>
										</div>
										<div class="social-count ml-auto">
											<div class="views-count">
												<i data-feather="eye"></i> <span>0</span> <span
													class="views"><small>views</small></span>
											</div>
										</div>
									</div>
									<div class="actions">
										<div class="action">
											<i data-feather="thumbs-up"></i> <span>Like</span>
										</div>
										<div class="action">
											<i data-feather="message-circle"></i> <span>Comment</span>
										</div>
										<div class="action">
											<i data-feather="link-2"></i> <span>Share</span>
										</div>
										<div class="dropdown is-spaced is-right dropdown-trigger">
											<div>
												<div class="avatar-button">
													<img src="https://via.placeholder.com/300x300"
														data-demo-src="resources/template/assets/img/avatars/jenna.png"
														alt=""> <i data-feather="triangle"></i>
												</div>
											</div>
											<div class="dropdown-menu has-margin" role="menu">
												<div class="dropdown-content">
													<a href="#" class="dropdown-item is-selected">
														<div class="media">
															<img src="https://via.placeholder.com/300x300"
																data-demo-src="resources/template/assets/img/avatars/jenna.png"
																alt="">
															<div class="media-content">
																<h3>Jenna Davis</h3>
																<small>Interact as Jenna Davis.</small>
															</div>
															<div class="checkmark">
																<i data-feather="check"></i>
															</div>
														</div>
													</a>
													<hr class="dropdown-divider">
													<a href="#" class="dropdown-item">
														<div class="media">
															<img src="https://via.placeholder.com/478x344"
																data-demo-src="resources/template/assets/img/avatars/hanzo.svg"
																alt="">
															<div class="media-content">
																<h3>Css Ninja</h3>
																<small>Interact as Css Ninja.</small>
															</div>
															<div class="checkmark">
																<i data-feather="check"></i>
															</div>
														</div>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="tabs-wrapper">
									<div class="tabs is-fullwidth">
										<ul>
											<li class="is-active"><a>Comments</a></li>
											<li><a>Upcoming</a></li>
										</ul>
									</div>
									<div class="tab-content has-slimscroll">
										<div class="media is-comment">
											<figure class="media-left">
												<p class="image is-32x32">
													<img src="https://via.placeholder.com/300x300"
														data-demo-src="resources/template/assets/img/avatars/dan.jpg"
														alt="" data-user-popover="1">
												</p>
											</figure>
											<div class="media-content">
												<div class="username">Dan Walker</div>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit. Proin ornare magna eros.</p>
												<div class="comment-actions">
													<a href="javascript:void(0);" class="is-inverted">Like</a>
													<span>3h</span>
												</div>
											</div>
										</div>

										<div class="media is-comment">
											<figure class="media-left">
												<p class="image is-32x32">
													<img src="https://via.placeholder.com/300x300"
														data-demo-src="resources/template/assets/img/avatars/david.jpg"
														alt="" data-user-popover="4">
												</p>
											</figure>
											<div class="media-content">
												<div class="username">David Kim</div>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
												<div class="comment-actions">
													<a href="javascript:void(0);" class="is-inverted">Like</a>
													<span>4h</span>
												</div>
											</div>
										</div>

										<div class="media is-comment">
											<figure class="media-left">
												<p class="image is-32x32">
													<img src="https://via.placeholder.com/300x300"
														data-demo-src="resources/template/assets/img/avatars/rolf.jpg"
														alt="" data-user-popover="17">
												</p>
											</figure>
											<div class="media-content">
												<div class="username">Rolf Krupp</div>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit. Proin ornare magna eros. Consectetur adipiscing elit.
													Proin ornare magna eros.</p>
												<div class="comment-actions">
													<a href="javascript:void(0);" class="is-inverted">Like</a>
													<span>4h</span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="comment-controls">
									<div class="controls-inner">
										<img src="https://via.placeholder.com/300x300"
											data-demo-src="resources/template/assets/img/avatars/jenna.png"
											alt="">
										<div class="control">
											<textarea class="textarea comment-textarea is-rounded"
												rows="1"></textarea>
											<button class="emoji-button">
												<i data-feather="smile"></i>
											</button>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- Share from feed modal -->
		<!-- /partials/pages/feed/modals/share-modal.html -->
		<div id="share-modal" class="modal share-modal is-xsmall has-light-bg">
			<div class="modal-background"></div>
			<div class="modal-content">

				<div class="card">
					<div class="card-heading">
						<div class="dropdown is-primary share-dropdown">
							<div>
								<div class="button">
									<i class="mdi mdi-format-float-left"></i> <span>Share in
										your feed</span> <i data-feather="chevron-down"></i>
								</div>
							</div>
							<div class="dropdown-menu" role="menu">
								<div class="dropdown-content">
									<div class="dropdown-item" data-target-channel="feed">
										<div class="media">
											<i class="mdi mdi-format-float-left"></i>
											<div class="media-content">
												<h3>Share in your feed</h3>
												<small>Share this publication on your feed.</small>
											</div>
										</div>
									</div>
									<div class="dropdown-item" data-target-channel="friend">
										<div class="media">
											<i class="mdi mdi-account-heart"></i>
											<div class="media-content">
												<h3>Share in a friend's feed</h3>
												<small>Share this publication on a friend's feed.</small>
											</div>
										</div>
									</div>
									<div class="dropdown-item" data-target-channel="group">
										<div class="media">
											<i class="mdi mdi-account-group"></i>
											<div class="media-content">
												<h3>Share in a group</h3>
												<small>Share this publication in a group.</small>
											</div>
										</div>
									</div>
									<div class="dropdown-item" data-target-channel="page">
										<div class="media">
											<i class="mdi mdi-file-document-box"></i>
											<div class="media-content">
												<h3>Share in a page</h3>
												<small>Share this publication in a page.</small>
											</div>
										</div>
									</div>
									<hr class="dropdown-divider">
									<div class="dropdown-item"
										data-target-channel="private-message">
										<div class="media">
											<i class="mdi mdi-email-plus"></i>
											<div class="media-content">
												<h3>Share in message</h3>
												<small>Share this publication in a private message.</small>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Close X button -->
						<div class="close-wrap">
							<span class="close-modal"> <i data-feather="x"></i>
							</span>
						</div>
					</div>
					<div class="share-inputs">
						<div class="field is-autocomplete">
							<div id="share-to-friend"
								class="control share-channel-control is-hidden">
								<input id="share-with-friend" type="text"
									class="input is-sm no-radius share-input simple-users-autocpl"
									placeholder="Your friend's name">
								<div class="input-heading">Friend :</div>
							</div>
						</div>

						<div class="field is-autocomplete">
							<div id="share-to-group"
								class="control share-channel-control is-hidden">
								<input id="share-with-group" type="text"
									class="input is-sm no-radius share-input simple-groups-autocpl"
									placeholder="Your group's name">
								<div class="input-heading">Group :</div>
							</div>
						</div>

						<div id="share-to-page"
							class="control share-channel-control no-border is-hidden">
							<div class="page-controls">
								<div class="page-selection">

									<div class="dropdown is-accent page-dropdown">
										<div>
											<div class="button page-selector">
												<img src="https://via.placeholder.com/150x150"
													data-demo-src="resources/template/assets/img/avatars/hanzo.svg"
													alt=""> <span>Css Ninja</span> <i
													data-feather="chevron-down"></i>
											</div>
										</div>
										<div class="dropdown-menu" role="menu">
											<div class="dropdown-content">
												<div class="dropdown-item">
													<div class="media">
														<img src="https://via.placeholder.com/150x150"
															data-demo-src="resources/template/assets/img/avatars/hanzo.svg"
															alt="">
														<div class="media-content">
															<h3>Css Ninja</h3>
															<small>Share on Css Ninja.</small>
														</div>
													</div>
												</div>

												<div class="dropdown-item">
													<div class="media">
														<img src="https://via.placeholder.com/150x150"
															data-demo-src="resources/template/assets/img/icons/logos/nuclearjs.svg"
															alt="">
														<div class="media-content">
															<h3>NuclearJs</h3>
															<small>Share on NuclearJs.</small>
														</div>
													</div>
												</div>

												<div class="dropdown-item">
													<div class="media">
														<img src="https://via.placeholder.com/150x150"
															data-demo-src="resources/template/assets/img/icons/logos/slicer.svg"
															alt="">
														<div class="media-content">
															<h3>Slicer</h3>
															<small>Share on Slicer.</small>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>

								<div class="alias">
									<img src="https://via.placeholder.com/150x150"
										data-demo-src="resources/template/assets/img/avatars/jenna.png"
										alt="">
								</div>
							</div>
						</div>

						<div class="field is-autocomplete">
							<div id="share-to-private-message"
								class="control share-channel-control is-hidden">
								<input id="share-with-private-message" type="text"
									class="input is-sm no-radius share-input simple-users-autocpl"
									placeholder="Message a friend">
								<div class="input-heading">To :</div>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="control">
							<textarea class="textarea comment-textarea" rows="1"
								placeholder="Say something about this ..."></textarea>
							<button class="emoji-button">
								<i data-feather="smile"></i>
							</button>
						</div>
						<div class="shared-publication">
							<div class="featured-image">
								<img id="share-modal-image"
									src="https://via.placeholder.com/1600x900"
									data-demo-src="resources/template/assets/img/demo/unsplash/1.jpg"
									alt="">
							</div>
							<div class="publication-meta">
								<div class="inner-flex">
									<img id="share-modal-avatar"
										src="https://via.placeholder.com/300x300"
										data-demo-src="resources/template/assets/img/avatars/dan.jpg"
										data-user-popover="1" alt="">
									<p id="share-modal-text">
										Yesterday with <a href="#">@Karen Miller</a> and <a href="#">@Marvin
											Stemperd</a> at the <a href="#">#Rock'n'Rolla</a> concert in LA.
										Was totally fantastic! People were really excited about this
										one!
									</p>
								</div>
								<div class="publication-footer">
									<div class="stats">
										<div class="stat-block">
											<i class="mdi mdi-earth"></i> <small>Public</small>
										</div>
										<div class="stat-block">
											<i class="mdi mdi-eye"></i> <small>163 views</small>
										</div>
									</div>
									<div class="publication-origin">
										<small>Friendkit.io</small>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="bottom-share-inputs">

						<div id="action-place"
							class="field is-autocomplete is-dropup is-hidden">
							<div id="share-place"
								class="control share-bottom-channel-control">
								<input type="text"
									class="input is-sm no-radius share-input simple-locations-autocpl"
									placeholder="Where are you?">
								<div class="input-heading">Location :</div>
							</div>
						</div>

						<div id="action-tag"
							class="field is-autocomplete is-dropup is-hidden">
							<div id="share-tags" class="control share-bottom-channel-control">
								<input id="share-friend-tags-autocpl" type="text"
									class="input is-sm no-radius share-input"
									placeholder="Who are you with">
								<div class="input-heading">Friends :</div>
							</div>
							<div id="share-modal-tag-list" class="tag-list no-margin"></div>
						</div>

					</div>
					<div class="card-footer">
						<div class="action-wrap">
							<div class="footer-action" data-target-action="tag">
								<i class="mdi mdi-account-plus"></i>
							</div>
							<div class="footer-action" data-target-action="place">
								<i class="mdi mdi-map-marker"></i>
							</div>
							<div
								class="footer-action dropdown is-spaced is-neutral dropdown-trigger is-up"
								data-target-action="permissions">
								<div>
									<i class="mdi mdi-lock-clock"></i>
								</div>
								<div class="dropdown-menu" role="menu">
									<div class="dropdown-content">
										<a href="#" class="dropdown-item">
											<div class="media">
												<i data-feather="globe"></i>
												<div class="media-content">
													<h3>Public</h3>
													<small>Anyone can see this publication.</small>
												</div>
											</div>
										</a> <a class="dropdown-item">
											<div class="media">
												<i data-feather="users"></i>
												<div class="media-content">
													<h3>Friends</h3>
													<small>only friends can see this publication.</small>
												</div>
											</div>
										</a> <a class="dropdown-item">
											<div class="media">
												<i data-feather="user"></i>
												<div class="media-content">
													<h3>Specific friends</h3>
													<small>Don't show it to some friends.</small>
												</div>
											</div>
										</a>
										<hr class="dropdown-divider">
										<a class="dropdown-item">
											<div class="media">
												<i data-feather="lock"></i>
												<div class="media-content">
													<h3>Only me</h3>
													<small>Only me can see this publication.</small>
												</div>
											</div>
										</a>
									</div>
								</div>

							</div>
						</div>
						<div class="button-wrap">
							<button type="button"
								class="button is-solid dark-grey-button close-modal">Cancel</button>
							<button type="button"
								class="button is-solid primary-button close-modal">Publish</button>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- No Stream modal -->
		<!-- /partials/pages/feed/modals/no-stream-modal.html -->
		<div id="no-stream-modal"
			class="modal no-stream-modal is-xsmall has-light-bg">
			<div class="modal-background"></div>
			<div class="modal-content">

				<div class="card">
					<div class="card-heading">
						<h3></h3>
						<!-- Close X button -->
						<div class="close-wrap">
							<span class="close-modal"> <i data-feather="x"></i>
							</span>
						</div>
					</div>
					<div class="card-body has-text-centered">

						<div class="image-wrap">
							<img
								src="resources/template/assets/img/illustrations/characters/no-stream.svg"
								alt="">
						</div>

						<h3>Streaming Disabled</h3>
						<p>Streaming is not allowed from mobile web. Please use our
							mobile apps for mobile streaming.</p>

						<div class="action">
							<a href="/#demos-section"
								class="button is-solid accent-button raised is-fullwidth">Got
								It</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Google places Lib -->
		<script
			src="https://maps.google.com/maps/api/js?key=AIzaSyAGLO_M5VT7BsVdjMjciKoH1fFJWWdhDPU&libraries=places"></script>
	</div>

	<div class="chat-wrapper">
		<div class="chat-inner">

			<!-- Chat top navigation -->
			<div class="chat-nav">
				<div class="nav-start">
					<div class="recipient-block">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/dan.jpg"
								alt="">
						</div>
						<div class="username">
							<span>Dan Walker</span> <span><i data-feather="star"></i>
								<span>| Online</span></span>
						</div>
					</div>
				</div>
				<div class="nav-end">

					<!-- Settings icon dropdown -->
					<div
						class="dropdown is-spaced is-neutral is-right dropdown-trigger">
						<div>
							<a class="chat-nav-item is-icon"> <i data-feather="settings"></i>
							</a>
						</div>
						<div class="dropdown-menu" role="menu">
							<div class="dropdown-content">
								<a href="#" class="dropdown-item">
									<div class="media">
										<i data-feather="message-square"></i>
										<div class="media-content">
											<h3>Details</h3>
											<small>View this conversation's details.</small>
										</div>
									</div>
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="settings"></i>
										<div class="media-content">
											<h3>Preferences</h3>
											<small>Define your preferences.</small>
										</div>
									</div>
								</a>
								<hr class="dropdown-divider">
								<a class="dropdown-item">
									<div class="media">
										<i data-feather="bell"></i>
										<div class="media-content">
											<h3>Notifications</h3>
											<small>Set notifications settings.</small>
										</div>
									</div>
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="bell-off"></i>
										<div class="media-content">
											<h3>Silence</h3>
											<small>Disable notifications.</small>
										</div>
									</div>
								</a>
								<hr class="dropdown-divider">
								<a class="dropdown-item">
									<div class="media">
										<i data-feather="box"></i>
										<div class="media-content">
											<h3>Archive</h3>
											<small>Archive this conversation.</small>
										</div>
									</div>
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="trash-2"></i>
										<div class="media-content">
											<h3>Delete</h3>
											<small>Delete this conversation.</small>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="chat-search">
						<div class="control has-icon">
							<input type="text" class="input" placeholder="Search messages">
							<div class="form-icon">
								<i data-feather="search"></i>
							</div>
						</div>
					</div>
					<a class="chat-nav-item is-icon is-hidden-mobile"> <i
						data-feather="at-sign"></i>
					</a> <a class="chat-nav-item is-icon is-hidden-mobile"> <i
						data-feather="star"></i>
					</a>

					<!-- More dropdown -->
					<div
						class="dropdown is-spaced is-neutral is-right dropdown-trigger">
						<div>
							<a class="chat-nav-item is-icon no-margin"> <i
								data-feather="more-vertical"></i>
							</a>
						</div>
						<div class="dropdown-menu" role="menu">
							<div class="dropdown-content">
								<a href="#" class="dropdown-item">
									<div class="media">
										<i data-feather="file-text"></i>
										<div class="media-content">
											<h3>Files</h3>
											<small>View all your files.</small>
										</div>
									</div>
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="users"></i>
										<div class="media-content">
											<h3>Users</h3>
											<small>View all users you're talking to.</small>
										</div>
									</div>
								</a>
								<hr class="dropdown-divider">
								<a class="dropdown-item">
									<div class="media">
										<i data-feather="gift"></i>
										<div class="media-content">
											<h3>Daily bonus</h3>
											<small>Get your daily bonus.</small>
										</div>
									</div>
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="download-cloud"></i>
										<div class="media-content">
											<h3>Downloads</h3>
											<small>See all your downloads.</small>
										</div>
									</div>
								</a>
								<hr class="dropdown-divider">
								<a class="dropdown-item">
									<div class="media">
										<i data-feather="life-buoy"></i>
										<div class="media-content">
											<h3>Support</h3>
											<small>Reach our support team.</small>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<a class="chat-nav-item is-icon close-chat"> <i
						data-feather="x"></i>
					</a>
				</div>
			</div>
			<!-- Chat sidebar -->
			<div id="chat-sidebar" class="users-sidebar">
				<!-- Header -->
				<div class="header-item">
					<img class="light-image"
						src="resources/template/assets/img/logo/friendkit-bold.svg" alt="">
					<img class="dark-image"
						src="resources/template/assets/img/logo/friendkit-white.svg"
						alt="">
				</div>
				<!-- User list -->
				<div class="conversations-list has-slimscroll-xs">
					<!-- User -->
					<div class="user-item is-active" data-chat-user="dan"
						data-full-name="Dan Walker" data-status="Online">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="assets/img/avatars/dan.jpg" alt="">
							<div class="user-status is-online"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="stella"
						data-full-name="Stella Bergmann" data-status="Busy">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/stella.jpg"
								alt="">
							<div class="user-status is-busy"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="daniel"
						data-full-name="Daniel Wellington" data-status="Away">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/daniel.jpg"
								alt="">
							<div class="user-status is-away"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="david"
						data-full-name="David Kim" data-status="Busy">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/david.jpg"
								alt="">
							<div class="user-status is-busy"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="edward"
						data-full-name="Edward Mayers" data-status="Online">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
								alt="">
							<div class="user-status is-online"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="elise"
						data-full-name="Elise Walker" data-status="Away">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/elise.jpg"
								alt="">
							<div class="user-status is-away"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="nelly"
						data-full-name="Nelly Schwartz" data-status="Busy">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/nelly.png"
								alt="">
							<div class="user-status is-busy"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="milly"
						data-full-name="Milly Augustine" data-status="Busy">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/milly.jpg"
								alt="">
							<div class="user-status is-busy"></div>
						</div>
					</div>
				</div>
				<!-- Add Conversation -->
				<div class="footer-item">
					<div class="add-button modal-trigger"
						data-modal="add-conversation-modal">
						<i data-feather="user"></i>
					</div>
				</div>
			</div>

			<!-- Chat body -->
			<div id="chat-body" class="chat-body is-opened">
				<!-- Conversation with Dan -->
				<div id="dan-conversation" class="chat-body-inner has-slimscroll">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Today</span>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/dan.jpg"
							alt="">
						<div class="message-block">
							<span>8:03am</span>
							<div class="message-text">Hi Jenna! I made a new design,
								and i wanted to show it to you.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/dan.jpg"
							alt="">
						<div class="message-block">
							<span>8:03am</span>
							<div class="message-text">It's quite clean and it's
								inspired from Bulkit.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>8:12am</span>
							<div class="message-text">Oh really??! I want to see that.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/dan.jpg"
							alt="">
						<div class="message-block">
							<span>8:13am</span>
							<div class="message-text">FYI it was done in less than a
								day.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>8:17am</span>
							<div class="message-text">Great to hear it. Just send me
								the PSD files so i can have a look at it.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>8:18am</span>
							<div class="message-text">And if you have a prototype, you
								can also send me the link to it.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Stella -->
				<div id="stella-conversation"
					class="chat-body-inner has-slimscroll is-hidden">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Today</span>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>10:34am</span>
							<div class="message-text">Hey Stella! Aren't we supposed to
								go the theatre after work?.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>10:37am</span>
							<div class="message-text">Just remembered it.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/stella.jpg"
							alt="">
						<div class="message-block">
							<span>11:22am</span>
							<div class="message-text">Yeah you always do that, forget
								about everything.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Daniel -->
				<div id="daniel-conversation"
					class="chat-body-inner has-slimscroll is-hidden">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Yesterday</span>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>3:24pm</span>
							<div class="message-text">Daniel, Amanda told me about your
								issue, how can I help?</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/daniel.jpg"
							alt="">
						<div class="message-block">
							<span>3:42pm</span>
							<div class="message-text">Hey Jenna, thanks for answering
								so quickly. Iam stuck, i need a car.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/daniel.jpg"
							alt="">
						<div class="message-block">
							<span>3:43pm</span>
							<div class="message-text">Can i borrow your car for a quick
								ride to San Fransisco? Iam running behind and there' no train in
								sight.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with David -->
				<div id="david-conversation"
					class="chat-body-inner has-slimscroll is-hidden">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Today</span>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>12:34pm</span>
							<div class="message-text">Damn you! Why would you even
								implement this in the game?.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>12:32pm</span>
							<div class="message-text">I just HATE aliens.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/david.jpg"
							alt="">
						<div class="message-block">
							<span>13:09pm</span>
							<div class="message-text">C'mon, you just gotta learn the
								tricks. You can't expect aliens to behave like humans. I mean
								that's how the mechanics are.</div>
						</div>
					</div>
					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/david.jpg"
							alt="">
						<div class="message-block">
							<span>13:11pm</span>
							<div class="message-text">I checked the replay and for
								example, you always get supply blocked. That's not the right
								thing to do.</div>
						</div>
					</div>
					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>13:12pm</span>
							<div class="message-text">I know but i struggle when i have
								to decide what to make from larvas.</div>
						</div>
					</div>
					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/david.jpg"
							alt="">
						<div class="message-block">
							<span>13:17pm</span>
							<div class="message-text">Join me in game, i'll show you.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Edward -->
				<div id="edward-conversation" class="chat-body-inner has-slimscroll">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Monday</span>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
							alt="">
						<div class="message-block">
							<span>4:55pm</span>
							<div class="message-text">Hey Jenna, what's up?</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
							alt="">
						<div class="message-block">
							<span>4:56pm</span>
							<div class="message-text">Iam coming to LA tomorrow.
								Interested in having lunch?</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>5:21pm</span>
							<div class="message-text">Hey mate, it's been a while. Sure
								I would love to.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
							alt="">
						<div class="message-block">
							<span>5:27pm</span>
							<div class="message-text">Ok. Let's say i pick you up at
								12:30 at work, works?</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>5:43pm</span>
							<div class="message-text">Yup, that works great.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>5:44pm</span>
							<div class="message-text">And yeah, don't forget to bring
								some of my favourite cheese cake.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
							alt="">
						<div class="message-block">
							<span>5:27pm</span>
							<div class="message-text">No worries</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Edward -->
				<div id="elise-conversation"
					class="chat-body-inner has-slimscroll is-hidden">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">September 28</span>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>11:53am</span>
							<div class="message-text">Elise, i forgot my folder at your
								place yesterday.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>11:53am</span>
							<div class="message-text">I need it badly, it's work stuff.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/elise.jpg"
							alt="">
						<div class="message-block">
							<span>12:19pm</span>
							<div class="message-text">Yeah i noticed. I'll drop it in
								half an hour at your office.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Nelly -->
				<div id="nelly-conversation"
					class="chat-body-inner has-slimscroll is-hidden">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">September 17</span>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>8:22pm</span>
							<div class="message-text">So you watched the movie?</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>8:22pm</span>
							<div class="message-text">Was it scary?</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/nelly.png"
							alt="">
						<div class="message-block">
							<span>9:03pm</span>
							<div class="message-text">It was so frightening, i felt my
								heart was about to blow inside my chest.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Milly -->
				<div id="milly-conversation" class="chat-body-inner has-slimscroll">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Today</span>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/milly.jpg"
							alt="">
						<div class="message-block">
							<span>2:01pm</span>
							<div class="message-text">Hello Jenna, did you read my
								proposal?</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/milly.jpg"
							alt="">
						<div class="message-block">
							<span>2:01pm</span>
							<div class="message-text">Didn't hear from you since i sent
								it.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>2:02pm</span>
							<div class="message-text">Hello Milly, Iam really sorry,
								Iam so busy recently, but i had the time to read it.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/milly.jpg"
							alt="">
						<div class="message-block">
							<span>2:04pm</span>
							<div class="message-text">And what did you think about it?</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>2:05pm</span>
							<div class="message-text">Actually it's quite good, there
								might be some small changes but overall it's great.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>2:07pm</span>
							<div class="message-text">I think that i can give it to my
								boss at this stage.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/milly.jpg"
							alt="">
						<div class="message-block">
							<span>2:09pm</span>
							<div class="message-text">Crossing fingers then</div>
						</div>
					</div>
				</div>
				<!-- Compose message area -->
				<div class="chat-action">
					<div class="chat-action-inner">
						<div class="control">
							<textarea class="textarea comment-textarea" rows="1"></textarea>
							<div
								class="dropdown compose-dropdown is-spaced is-accent is-up dropdown-trigger">
								<div>
									<div class="add-button">
										<div class="button-inner">
											<i data-feather="plus"></i>
										</div>
									</div>
								</div>
								<div class="dropdown-menu" role="menu">
									<div class="dropdown-content">
										<a href="#" class="dropdown-item">
											<div class="media">
												<i data-feather="code"></i>
												<div class="media-content">
													<h3>Code snippet</h3>
													<small>Add and paste a code snippet.</small>
												</div>
											</div>
										</a> <a class="dropdown-item">
											<div class="media">
												<i data-feather="file-text"></i>
												<div class="media-content">
													<h3>Note</h3>
													<small>Add and paste a note.</small>
												</div>
											</div>
										</a>
										<hr class="dropdown-divider">
										<a class="dropdown-item">
											<div class="media">
												<i data-feather="server"></i>
												<div class="media-content">
													<h3>Remote file</h3>
													<small>Add a file from a remote drive.</small>
												</div>
											</div>
										</a> <a class="dropdown-item">
											<div class="media">
												<i data-feather="monitor"></i>
												<div class="media-content">
													<h3>Local file</h3>
													<small>Add a file from your computer.</small>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div id="chat-panel" class="chat-panel is-opened">
				<div class="panel-inner">
					<div class="panel-header">
						<h3>Details</h3>
						<div class="panel-close">
							<i data-feather="x"></i>
						</div>
					</div>

					<!-- Dan details -->
					<div id="dan-details" class="panel-body is-user-details">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="assets/img/avatars/dan.jpg" alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Dan Walker</h3>
								<h4>IOS Developer</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-green">
									<div>
										<i class="mdi mdi-dog"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
								<div class="hexagon is-blue">
									<div>
										<i class="mdi mdi-briefcase"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">WebSmash Inc.</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-school"></i>
									<div class="about-text">
										<span>Studied at</span> <span><a class="is-inverted"
											href="#">Riverdale University</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Stella details -->
					<div id="stella-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="assets/img/avatars/stella.jpg" alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Stella Bergmann</h3>
								<h4>Shop Owner</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-purple">
									<div>
										<i class="mdi mdi-bomb"></i>
									</div>
								</div>
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-check-decagram"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Trending Fashions</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Oklahoma
												City</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Daniel details -->
					<div id="daniel-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="assets/img/avatars/daniel.jpg" alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Daniel Wellington</h3>
								<h4>Senior Executive</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-google-cardboard"></i>
									</div>
								</div>
								<div class="hexagon is-blue">
									<div>
										<i class="mdi mdi-pizza"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-linux"></i>
									</div>
								</div>
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-puzzle"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Peelman & Sons</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Los
												Angeles</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- David details -->
					<div id="david-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="assets/img/avatars/david.jpg" alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>David Kim</h3>
								<h4>Senior Developer</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-green">
									<div>
										<i class="mdi mdi-dog"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
								<div class="hexagon is-blue">
									<div>
										<i class="mdi mdi-briefcase"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Frost Entertainment</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Chicago</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Edward details -->
					<div id="edward-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="assets/img/avatars/edward.jpeg" alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Edward Mayers</h3>
								<h4>Financial analyst</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-green">
									<div>
										<i class="mdi mdi-dog"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Brettmann Bank</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Santa
												Fe</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Elise details -->
					<div id="elise-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="assets/img/avatars/elise.jpg" alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Elise Walker</h3>
								<h4>Social influencer</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Social Media</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">London</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Nelly details -->
					<div id="nelly-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="assets/img/avatars/nelly.png" alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Nelly Schwartz</h3>
								<h4>HR Manager</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-green">
									<div>
										<i class="mdi mdi-dog"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
								<div class="hexagon is-blue">
									<div>
										<i class="mdi mdi-briefcase"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Carrefour</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Melbourne</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Milly details -->
					<div id="milly-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="resources/template/assets/img/avatars/milly.jpg"
									alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Milly Augustine</h3>
								<h4>Sales Manager</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-green">
									<div>
										<i class="mdi mdi-dog"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
								<div class="hexagon is-blue">
									<div>
										<i class="mdi mdi-briefcase"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Salesforce</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Seattle</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="add-conversation-modal"
		class="modal add-conversation-modal is-xsmall has-light-bg">
		<div class="modal-background"></div>
		<div class="modal-content">

			<div class="card">
				<div class="card-heading">
					<h3>New Conversation</h3>
					<!-- Close X button -->
					<div class="close-wrap">
						<span class="close-modal"> <i data-feather="x"></i>
						</span>
					</div>
				</div>
				<div class="card-body">

					<img src="resources/template/assets/img/icons/chat/bubbles.svg"
						alt="">

					<div class="field is-autocomplete">
						<div class="control has-icon">
							<input type="text" class="input simple-users-autocpl"
								placeholder="Search a user">
							<div class="form-icon">
								<i data-feather="search"></i>
							</div>
						</div>
					</div>

					<div class="help-text">Select a user to start a new
						conversation. You'll be able to add other users later.</div>

					<div class="action has-text-centered">
						<button type="button" class="button is-solid accent-button raised">Start
							conversation</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="explorer-menu">
		<div class="explorer-inner">
			<div class="explorer-container">
				<!--Header-->
				<div class="explorer-header">
					<h3>Explore</h3>
					<div class="control">
						<input type="text" class="input is-rounded is-fade"
							placeholder="Filter">
						<div class="form-icon">
							<i data-feather="filter"></i>
						</div>
					</div>
				</div>
				<!--List-->
				<div class="explore-list has-slimscroll">
					<!--item-->
					<a href="/navbar-v1-feed.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/clover.svg"
						alt="">
						<h4>Feed</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-profile-friends.html" class="explore-item">
						<img src="resources/template/assets/img/icons/explore/friends.svg"
						alt="">
						<h4>Friends</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-videos-home.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/videos.svg"
						alt="">
						<h4>Videos</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-pages-main.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/tag-euro.svg"
						alt="">
						<h4>Pages</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-ecommerce-products.html" class="explore-item">
						<img src="resources/template/assets/img/icons/explore/cart.svg"
						alt="">
						<h4>Commerce</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-groups.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/house.svg" alt="">
						<h4>Interests</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-stories-main.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/chrono.svg"
						alt="">
						<h4>Stories</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-questions-home.html" class="explore-item">
						<img
						src="resources/template/assets/img/icons/explore/question.svg"
						alt="">
						<h4>Questions</h4>
					</a>
					<!--item-->
					<a href="news.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/news.svg" alt="">
						<h4>News</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-groups.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/cake.svg" alt="">
						<h4>Groups</h4>
					</a>
					<!--item-->
					<a href="https://envato.com" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/envato.svg"
						alt="">
						<h4>Envato</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-events.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/calendar.svg"
						alt="">
						<h4>Events</h4>
					</a>
					<!--item-->
					<a href="https://cssninja.io" target="_blank" class="explore-item">
						<img src="resources/template/assets/img/icons/explore/pin.svg"
						alt="">
						<h4>Css Ninja</h4>
					</a>
					<!--item-->
					<a href="/elements.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/idea.svg" alt="">
						<h4>Elements</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-settings.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/settings.svg"
						alt="">
						<h4>Settings</h4>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div id="end-tour-modal"
		class="modal end-tour-modal is-xsmall has-light-bg">
		<div class="modal-background"></div>
		<div class="modal-content">

			<div class="card">
				<div class="card-heading">
					<h3></h3>
					<!-- Close X button -->
					<div class="close-wrap">
						<span class="close-modal"> <i data-feather="x"></i>
						</span>
					</div>
				</div>
				<div class="card-body has-text-centered">

					<div class="image-wrap">
						<img src="resources/template/assets/img/logo/friendkit.svg" alt="">
					</div>

					<h3>That's all folks!</h3>
					<p>Thanks for taking the friendkit tour. There are still tons
						of other features for you to discover!</p>

					<div class="action">
						<a href="/#demos-section"
							class="button is-solid accent-button raised is-fullwidth">Explore</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

