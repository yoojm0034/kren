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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/template/assets/js/diffButty.js"></script>
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

.media table {
    table-layout: fixed;
    width: 100%;
    text-align: left;
}

.content-wrap table {
    table-layout: fixed;
    width: 100%;
    text-align: center;
}

.content-wrap table textarea {
    width: -webkit-fill-available;
    border: none;
    resize: none;
    padding: revert;
}
.user-info .time {
	margin-top: 9px;
}

#todayCheck {
	cursor: pointer;
}

</style>
<script>
$(document).ready(function(){
	$('.reportMenu').hide();
	//-------공지사항이동---------
	$('.page-block').on('click',function(){
		var noticeId= this.id;
		location.href="${pageContext.request.contextPath}/userSelectNotice.do?notice_id="+noticeId
	});
	
	//-------출석체크-------
	$('#todayCheck').on('click', function() {
		console.log('출석신청');
		$.ajax({//----------출석 여부 확인----------
			url:'${pageContext.request.contextPath}/stamphLoginCheck.do',
			data:{'user_id':'${user.user_id}'},
			success:function(cnt){
				console.log('cnt:',cnt);
				if(cnt > 0) {
					alert('하루에 한번만 가능합니다.');
				} else {
					$.ajax({//---------유저 우표추가---------
						url: '${pageContext.request.contextPath}/stamphLoginUserPlus.do',
						data:{'user_id':'${user.user_id}'},
						success:function(stamp) {
							if(stamp>0) {
								$.ajax({//---------우표내역 추가---------
									url: '${pageContext.request.contextPath}/stamphLoginInsert.do',
									data:{'user_id':'${user.user_id}'},
									success:function(result) {
										alert('우표 하나 받았어요!');
										$('#todayCheck').children().html('출석완료');
									},
									error:function() {
										alert('관리자에게 문의해주세요');										
									}
								});
							}
						},
						error:function() {
							alert('관리자에게 문의해주세요');
						}
					});
				}
			},
			error:function(e) {
				alert('관리자에게 문의해주세요.');
			}
		});
	});//출석체크
});
</script>
</head>
<body>
<script>
	function loadMore(){
	 // load more
	  var increment=5;	
	  var startFilter=0;
	  var endFilter=increment;
	  
	  var $this = $('.feedContents');						
	  var elementLength = $this.children('#feed-post-1').length;
	  // $('.listLength').text(elementLength);
	  // show/hide the Load More button
	  if (elementLength > 5) { 
		  $('#buttonToogle').show();
	  }else{
		  $('#buttonToogle').hide();
	  }
	  
	  $('.feedContents #feed-post-1').slice(startFilter, endFilter).addClass('shown');
	  //$('.shownLength').text(endFilter);
	  $('.feedContents #feed-post-1').not('.shown').hide();
	  $('body').off('click','.load-more-button');
	  
	  $('body').on('click','.load-more-button',function() {
	  	if (elementLength > endFilter) {
		      startFilter += increment;
		      endFilter += increment;
		      $('.feedContents #feed-post-1').slice(startFilter, endFilter).not('.shown').addClass('shown').toggle(500);
		      $('.shownLength').text((endFilter > elementLength) ? elementLength : endFilter);
		      if (elementLength <= endFilter) {
		          $(this).remove();
		      }
		}
	  });
	} 
	
	//-------친구 추천 팔로우--------
	function addFriend(id){
		var data = {following : id};
		$.ajax({
			url:"${pageContext.request.contextPath}/follow.do",
			type:"POST",
			data: JSON.stringify(data),
			contentType: 'application/json; charset=utf-8',
			success:function(data){
				alert(data);
			},
			error:function(err){
				console.log(err);
			}
		})
	};

	//-------좋아요--------
	function likeIt(feedId){
		var span = $('#recCnt'+feedId);
			
		$.ajax({
			url:"${pageContext.request.contextPath}/likeCnt.do",
			type:"POST",
			data:{feed_id:feedId},
			dataType:"JSON",
			success:function(data){
				var count=data.length;	//새로운 카운트 
				var chk=0;
				
               	$.each(data, function(idx, val) {
               		if('${user.user_id}' == val.user_id){
               			chk = 1; 
               		}
              	});
	               	
				if(chk){
					alert('좋아요!');
				}else{
					alert('좋아요 취소');				
				}
   				span.empty();
   				span.append(count);
			},
			error:function(err){
				console.log(err);
			}
		}) 
	}; 

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
	
	function feedUpdate(feedId){
		var maxCnt = 0;
		$('.app-overlay').addClass('is-active');
		$('.is-new-content').addClass('is-highlighted');
		$('#publish').focus();
		
		var tags = $('#update'+feedId).children(1).children(":eq(0)").val();
		var content = $('#update'+feedId).children(1).children(":eq(1)").val();
		var photo = $('#update'+feedId).children(1).children(":eq(2)").val(); 
		var fphoto = $('#update'+feedId).children(1).children(":eq(3)").val(); 
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
		}

	  	$('.remove-file').on('click', function () {
	         $(this).closest('.upload-wrap').remove();
	         photoChk.val(1);
	         maxCnt--;
	         maxValue--;
	  	});
	}
	
	$(function(){
	loadMore();
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
				datePosdst();
				loadMore();
			},
			error:function(err){
				console.log(err);
			}
		});
	});
	
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
               url: "tagInsert.do" ,
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

	//-------최신글---------
	$('#allSearch').on('click',function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/feedSelect.do",
			success:function(result){
				console.log(result);
				$('.feedContents').html(result);
				datePosdst();
				loadMore();
			},
			error:function(err){
				console.log(err);
			}
		});
	});
	
	
	//-------내근처--------- 
	$('#searchNear').on('click',function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/feedSelect.do",
			data:{location : 'true' },
			success:function(result){
				$('.feedContents').html(result);
				datePosdst();
				loadMore();
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
				datePosdst();
				loadMore();
			},
			error:function(err){
				console.log(err);
			}
		});
	});

	//-------언어별 En---------
	$('#searchEn').on('click',function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/feedSelect.do",
			data:{write_lan : 'en' },
			success:function(result){
				console.log('영어만 나옴');
				$('.feedContents').html(result);
				datePosdst();
				loadMore();
			},
			error:function(err){
				console.log(err);
			}
		});
	});

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

	//-------프로필클릭시---------
	$('.user-info').on('click',function(){
		var userId= this.id;
		location.href="${pageContext.request.contextPath}/profile.do?user_id="+userId
	});
	});
	
	$(function(){
	//-------태그자동완성---------
	if ($('#activities-autocpl').length) {
		var data1 = $(this);
		console.log(data1);
		console.log(this);
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
	    $('#activities-autocpl').easyAutocomplete(activitiesOptions);
	 };

	//-------태그검색---------
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
			    }
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
	
	//---------피드신고---------
	$('body').on('click','#frbtn',function(){
		$('.reportMenu').toggle();
	}); 
	
	$('body').on('click','#fmsg',function(){
		var select = $(this);
		var repo = select.attr('name');
		var msg = $("input:radio[name='"+repo+"']:checked").val();
		if(msg == '기타') {
			$('input[data-rftxt="'+repo+'"]').attr('hidden',false);				
		}else{
			$('input[data-rftxt="'+repo+'"]').attr('hidden',true);				
		}
	});
		
	$('body').on('click','#report-btn',function(){
		var report = $(this).data('report');	//name 
		var repo = $(this).data('repo')			//feed_id
		var radio = $("input:radio[name='"+repo+"']:checked").val(); //선택된값
		var txt = "";
		var chk = $("input:checkbox[data-rfchk='"+repo+"']:checked").val(); //체크된값
		
		if(radio == '기타') {
			txt = $('input[data-rftxt="'+repo+'"]').val();//기타사유
		} else {
			txt = radio;
		}
		if(txt == null) {//값이 선택되지 않았으면
			alert('신고사유를 선택하세요');
			return;
		} 
		
		console.log('신고자 : '+report+" 피드번호 : "+ repo + " 체크된사유 값" + radio +"블락여부 : "  +chk +"체크사유 & 기타사유"+ txt);	
		
 		if(confirm('신고하시겠습니까?')) {
			$.ajax({
				url:'${pageContext.request.contextPath}/reportInsert.do',
				type:'post',
				data:JSON.stringify({
					user_id:'${user.user_id}',	//신고자
					content:repo,				//피드아이디
					msg:txt,					//신고냐용
					reported:report,			//신고당한자
					blocked:chk					//블락체크여부
				}),
				contentType : "application/json; charset=UTF-8",
				success: function(data) {
					alert('신고되었습니다.');
					location.reload(true);
				},
				error: function(err) {
					alert('관리자에게 문의해주세요.');
				}
			})
		} 
	})
	})

	//-------댓글-------- 
	$(function() {
		//-------댓글작성 그룹이벤트-------- 		
		$('body').on('click','#post', function() {
			var feedid = $(this).data('feedid');
			var feeduser = $(this).data('feeduser');
			var scr = $(this).data('scr');//status.index
			var content = $('textarea[data-content="'+feedid+'"]').val();
			var scroll = $('div[data-scroll="'+scr+'"]');
			var span2 = $('span[data-minicmt="'+scr+'"]');
			if(content == "") {
				alert('댓글을 입력해주세요');
				return ;
			}
			//-------댓글입력-------
			$.ajax({
				url: '${pageContext.request.contextPath}/commentInsert.do',
				method: 'post',
				data: JSON.stringify({
					feed_id:feedid,
					content:content,
					user_id:'${user.user_id}'
				}),
				contentType:'application/json; charset=UTF-8',
				success: function() {
					alert('댓글입력성공!');
					//입력된 값 조회 후 jsp
					$.ajax({
						url: '${pageContext.request.contextPath}/commentInsertData.do',
						method: 'post',
						data: {feed_id:feedid,user_id:'${user.user_id}',name:'${user.name}',idx:scr},
						success: function(data) {
							scroll.append(data);
							scroll.scrollTop(scroll.prop('scrollHeight'));
							$('textarea[data-content="'+feedid+'"]').val('');
							//-------댓글수+1-------
							$.ajax({
								url: '${pageContext.request.contextPath}/commentCnt.do',
								method: 'post',
								data: {feed_id:feedid},
								success: function(cnt) {
									var cnt = cnt;
									console.log(cnt);
									$('div[data-card="'+scr+'"]').children().eq(0).html('Comments ('+cnt+')');
									span2.html(cnt);
									sendTextPush(feeduser, feedid);
								}
							});//댓글수+1
						}
					});
				},
				error: function() {
					alert('댓글입력실패!');
				}
			});//댓글입력

		});//#post
		
		//-------댓글삭제 그룹이벤트-------- 		
		$('body').on('click','#del', function() {
			var delcmt = $(this).data('delcmt');
			var delcmtfeed = $(this).data('delcmtfeed');
			var delidx = $(this).data('idx');
			var del = $('a[data-delcmt="'+delcmt+'"]').parent().parent().parent().parent();
			var span = $('span[data-minicmt="'+delidx+'"]');
			//-------댓글삭제-------
			if(confirm('삭제하시겠습니까?')) {
				$.ajax({
					url: '${pageContext.request.contextPath}/commentDelete.do',
					method: 'post',
					data: JSON.stringify({comment_id:delcmt}),
					contentType:'application/json; charset=UTF-8',
					success: function(data) {
						alert('댓글삭제성공!');
						del.remove();
						//-------댓글수-1-------
						$.ajax({
							url: '${pageContext.request.contextPath}/commentCnt.do',
							method: 'post',
							data: {feed_id:delcmtfeed},
							success: function(cnt) {
								var cnt = cnt;
								$('div[data-card="'+delidx+'"]').children().eq(0).html('Comments ('+cnt+')');
								span.html(cnt);
							}
						});
					},
					error: function(e) {
						alert('댓글삭제실패!');
					}
				});
			}		
		});
		
	});//end $function
	
//--------신고START--------------------------------
	$(function() {
		
	$('body').on('click','#rbtn', function() { // 신고버튼을 누르면
		var report = $(this).data('report');//name
		var repo = $(this).data('repo'); 	//comment_id
		
		var sub = $('button[data-report="'+repo+'"]'); //해당버튼 
		var radio = $("input:radio[name='"+repo+"']:checked").val(); //선택된값
		var txt = "";
		if(radio == '기타') {
			txt = $('input[data-rtxt="'+repo+'"]').val();//기타사유
		} else {
			txt = radio;
		}
		if(txt == null) {//값이 선택되지 않았으면
			alert('신고사유를 선택하세요');
			return;
		}
		var chk = $("input:checkbox[data-rchk='"+repo+"']:checked").val(); //체크된값
		console.log(report, repo, radio, chk, txt);
		if(confirm('신고하시겠습니까?')) {
			$.ajax({
				url:'${pageContext.request.contextPath}/reportInsert.do',
				type:'post',
				data:JSON.stringify({
					user_id:'${user.user_id}',
					content:repo,
					msg:txt,
					reported:report,
					blocked:chk
				}),
				contentType : "application/json; charset=UTF-8",
				success: function(data) {
					alert('신고되었습니다.');
					location.reload(true);
				},
				error: function(err) {
					alert('관리자에게 문의해주세요.');
				}
			});
		}
		
	});
	
	$('body').on('click','#msg', function() { //기타를 누르면 값을 입력할 수 있도록
		var select = $(this);
		var repo = select.attr('name');
		console.log(repo);
		var msg = $("input:radio[name='"+repo+"']:checked").val();
		if(msg == '기타') {
			$('input[data-rtxt="'+repo+'"]').attr('hidden',false);				
		} else {
			$('input[data-rtxt="'+repo+'"]').attr('hidden',true);				
		}
	});	
}); //$function
//--------신고END----------------------------------------
//--------교정START--------------------------------------
	$(function() {
		$("div[id^='load_'").each(function(i, el){
			var cid = $(this).data('cid');//cc_id.line
			var cdc = $(this).data('cdc');//content
			var cdo = $(this).data('cdo');//origin
			test_diff(cid,cdc,cdo);
		});
		
		// 문자열 비교; diffButty.js; String
		function test_diff(cid,dif,ori) {
			var original = ori;
			var revised = dif;
			var output = $('<pre>');
			var html = diffButty(original, revised);
			output.html(html);
			var div = $('div[data-cid="'+cid+'"]');
			div.html(output);
		} 
		
		// 교정테이블 추가 그룹 이벤트
		$("body").on('click', '#feedcor',  function() {
		    var fid = $(this).data('fid');		//feed_id;
		    var fidx = $(this).data('fidx');	//status.index;
		    var fuser = $(this).data('fuser');	//feed_user_id;
		    var a = $('div[data-fidx="'+fidx+'"]');
		    add(fid, fidx, fuser);
		    a.remove();
		});
		
		// 전송버튼을 누르면 교정문장 전달
		$("body").on('click', '#frmBtn',  function() {
		    var num = $(this).data('num');			//row
		    var frmbtn = $(this).data('frmbtn');	//idx
		    var fd = $(this).data('fd');	//feed_id
		    var fu = $(this).data('fu');	//feed_user_id
		    commentc(num, frmbtn, fd, fu);
		});
		
		//-------교정댓글삭제 그룹이벤트-------- 		
		$('body').on('click','#cdel', function() {
			var delcmt = $(this).data('delcmt');
			var delcmtfeed = $(this).data('delcmtfeed');
			var delidx = $(this).data('idx');
			var del = $('a[data-delcmt="'+delcmt+'"]').parent().parent().parent().parent();
			var span = $('span[data-minicmt="'+delidx+'"]');
			//-------댓글삭제-------
			if(confirm('삭제하시겠습니까?')) {
				$.ajax({
					url: '${pageContext.request.contextPath}/commentcDelete.do',
					method: 'post',
					data: {cc_id:delcmt},
					success: function(data) {
						alert('댓글삭제성공!');
						del.remove();
						//-------댓글수-1-------
						$.ajax({
							url: '${pageContext.request.contextPath}/commentCnt.do',
							method: 'post',
							data: {feed_id:delcmtfeed},
							success: function(cnt) {
								var cnt = cnt;
								$('div[data-card="'+delidx+'"]').children().eq(0).html('Comments ('+cnt+')');
								span.html(cnt);
							}
						});
					},
					error: function(e) {
						alert('댓글삭제실패!');
					}
				});
			}		
		});
		
	});
	
	//----------교정테이블 추가------------------------------
	function add(fid, fidx, fuser) {
		var p = $('#tdiv'+fid).prev().text();//내용
		
	    var result = p.split(".");
	    console.log(result);

	    var div = $('div[data-table="'+fidx+'"]');//표가 그려질 영역
		var tbl = $('<table>');

 		// 교정 테이블 출력
		var num = 0;
		for(var i=0; i < result.length; i++) {
			if(result[i].length != 0) { // 리스트가 비어있지않으면
				num = i;
				var tr = $('<tr>');
				tr.append($('<td data-cont="'+i+'">').append(result[i]));
				tr.append($('<td>').append($('<textarea id="correcting" data-corr="'+i+'">').val(result[i])));
				tbl.append(tr);			
			}
		}
		var tr2 = $('<tr>');
		var col = $('<td colspan="2">');
		var submit = $('<button type="button" id="frmBtn" data-fd="'+fid+'" data-fu="'+fuser+'" data-num="'+num+'" data-frmbtn="'+fidx+'">').text('전송');
		col.append(submit);
		tr2.append(col);
		tbl.append(tr2)
		div.append(tbl);
	} //function add
	
	function commentc(row, idx, fid, fuser) {
	    var corr = ""; // 교정문장
	    var cont = ""; // 원문장
		for (var i=0; i <= row; i++) {
			if(i == row) {
				corr += $('textarea[data-corr="'+i+'"]').val().replace(/,/g, "");
				cont += $('td[data-cont="'+i+'"]').text().replace(/,/g, "");
			} else {
				corr += $('textarea[data-corr="'+i+'"]').val().replace(/,/g, "")+".,";
				cont += $('td[data-cont="'+i+'"]').text().replace(/,/g, "")+".,";
			}
		}
		
		var rows = ""; // 행숫자만큼 숫자를 리스트에 담아줌
		var feed = "";
		for(var i=0; i<=row; i++) {
			if(i != row) {
				rows += i +",";	
				feed += fid+",";	
			} else {
				rows += i;
				feed += fid;
			}
		}
		
		var Data = {
			"feed_id":feed,
			"line":rows,
			"origin":cont,
			"content":corr
		};
			
		console.log(Data);
		console.log(fid, '${user.user_id}');
		
		$.ajax({//commentC
			url:"${pageContext.request.contextPath}/commentcInsert.do",
			type:"post",
		    data: {"feed_id":fid,"user_id":'${user.user_id}'},
			success:function(data){
				$.ajax({//commentD
					url:"${pageContext.request.contextPath}/insertCommentDetail.do",
		 			type:"post",
		 		    traditional:true,
		 		    data: JSON.stringify(Data),
		 		    contentType : "application/json; charset=UTF-8",
		 			success:function(r){
		 				alert("작성되었습니다!");
		 				$('div[data-table="'+idx+'"]').remove();//교정테이블 삭제
						//입력된 값 조회 후 jsp
						$.ajax({
							url: '${pageContext.request.contextPath}/commentDetailData.do',
							method: 'post',
							data: {feed_id:fid,user_id:'${user.user_id}',name:'${user.name}',idx:idx},
							success: function(data) {
								console.log(data);
								$('div[data-crap="'+idx+'"]').addClass('is-hidden').removeClass('is-active');
								$('div[data-card="'+idx+'"]').parent().addClass('is-active').removeClass('is-hidden');
								var scroll = $('div[data-scroll="'+idx+'"]');
								scroll.append(data);
								scroll.scrollTop(scroll.prop('scrollHeight'));
								
								//-------댓글수+1-------
								$.ajax({
									url: '${pageContext.request.contextPath}/commentCnt.do',
									method: 'post',
									data: {feed_id:fid},
									success: function(cnt) {
										var cnt = cnt;
										console.log(cnt);
										$('div[data-card="'+idx+'"]').children().eq(0).html('Comments ('+cnt+')');
										var span2 = $('span[data-minicmt="'+idx+'"]');
										span2.html(cnt);
										sendTextPush(fuser, fid);
									}
								});//댓글수+1
							}
						});
		 			},error:function(e){
		 				console.log(e);
		 			}
				});
			},error:function(e){
				console.log(e);
			}
			
		});
	} //function commentc

//--------교정END----------------------------------------
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
						<!------------------------ 출석 시작 ------------------------->
						<div id="latest-activity-2" class="card">
							<div class="card-heading is-bordered">
								<h4>출석체크</h4>
							</div>
							<div class="card-body no-padding">
								<div class="add-friend-block" id="todayCheck">
									<c:choose>
									<c:when test="${loginStamp eq 0}">
										<span>여기를 눌러주세요!</span>
									</c:when>
									<c:otherwise>
										<span>출석완료</span>
									</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<!------------------------ 출석 끝 ------------------------->
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
							<c:forEach items="${feedList }" var="vo" varStatus="status">
								<div id="feed-post-1" class="card is-post">
									<!-- Main wrap -->
									<div class="content-wrap" data-crap="${status.index }">
										<!-- Post header -->
										<div class="card-heading">
											<!-- User meta -->
											<div class="user-block">
												<div class="image">
													<img src="https://via.placeholder.com/300x300"
														data-demo-src="assets/img/avatars/dan.jpg"
														data-user-popover="1" alt="">
												</div>
												<div class="user-info" id="${vo.user_id }">
													<a href="#">${vo.name } <svg viewBox="0 0 24 24" width="21" height="15" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M12 19l7-7 3 3-7 7-3-3z"></path><path d="M18 13l-1.5-7.5L2 2l3.5 14.5L13 18l5-5z"></path><path d="M2 2l7.586 7.586"></path><circle cx="11" cy="11" r="2"></circle></svg>
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
																<div class="media-content" id="${vo.content }"
																	onclick="trans('${vo.feed_id }','${vo.content }'); return false;">
																	<h3>번역</h3>
																</div>
															</div>
														</a>
														<c:if test="${vo.user_id ne user.user_id}">
														<a class="dropdown-item">
															<div class="media">
																<div class="media-content" id="feedcor" data-fid="${vo.feed_id }"
																data-fidx="${status.index }" data-fuser="${vo.user_id }" >
																	<h3>교정</h3>
																</div>
															</div>
														</a>
															<hr class="dropdown-divider">
															<a class="dropdown-item">
																<div class="media" >
																	<div class="media-content" id="frbtn" data-repo="${vo.feed_id }" data-report="${vo.user_id }">
																		<h3>신고</h3>
																	</div>
														<div class="dropdown-menu">
	                                                    <div class="dropdown-content reportMenu">
	                                                        <div class="media freport" style="border: 0px;">
	                                                        <table>
								                        	<tr>
							                        		<td>
							                        		<input type="radio" id="fmsg" name="${vo.feed_id }" value="스팸 게시물">스팸 게시물
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="fmsg" name="${vo.feed_id }" value="가짜정보 제공">가짜정보 제공
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="fmsg" name="${vo.feed_id }" value="성적인 내용">성적인 내용
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="fmsg" name="${vo.feed_id }" value="데이트가 목적인 내용">데이트가 목적인 내용
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="fmsg" name="${vo.feed_id }" value="욕설/비방">욕설/비방
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="fmsg" name="${vo.feed_id }" value="기타">기타
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input  placeholder="신고이유" hidden="true"  data-rftxt="${vo.feed_id }"
									                        	   maxlength="30"></input>
							                        		</td>
								                        	</tr>
								                        	</table>
	                                                        </div>
	                                                        <div class="dropdown-divider"></div>
									                        <input type="checkbox" id="feed-blocked" data-rfchk="${vo.feed_id  }" value="${vo.user_id }">${vo.name } 차단
															<button id="report-btn"  data-repo="${vo.feed_id  }" data-report="${vo.user_id }">신고</button>
	                                                    </div>
		                                               </div>
													</div>
												</a>
														</c:if>
														<c:if test="${vo.user_id eq user.user_id}">
															<hr class="dropdown-divider">
															<a class="dropdown-item">
																<div class="media feedUpdate" id="update${vo.feed_id }" onclick="feedUpdate('${vo.feed_id }')">
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
													<span id="minicmt" data-minicmt="${status.index }">
													<c:if test="${vo.cmt eq 0 }">0</c:if>
													<c:if test="${vo.cmt gt 0 }">${vo.cmt }</c:if>
													</span>
												</div>
												<div class="likes-count">
													<svg viewBox="0 0 24 24" width="24" height="24"
														stroke="currentColor" stroke-width="2" fill="none"
														stroke-linecap="round" stroke-linejoin="round"
														class="css-i6dzq1">
														<path
															d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
													<span id="recCnt${vo.feed_id }" >
													 ${vo.like_cnt }
													</span>
												</div>
											</div>
										</div>
										<div data-table="${status.index }"></div>
										<!-- /Post footer -->
									</div>
									<!-- /Main wrap -->
									
									
									<!-- Post #1 Comments -->
									<div class="comments-wrap is-hidden">
										<!-- Header -->
										<div class="comments-heading" data-card="${status.index }">
											<h4>
												Comments
												<small>
												<c:if test="${!empty vo.cmt and vo.cmt eq 0 }">(0)</c:if>
												<c:if test="${!empty vo.cmt and vo.cmt gt 0 }">(${vo.cmt})</c:if>
												</small>
											</h4>
											<div class="close-comments">
												<svg viewBox="0 0 24 24" width="24" height="24"
													stroke="currentColor" stroke-width="2" fill="none"
													stroke-linecap="round" stroke-linejoin="round"
													class="css-i6dzq1">
													<line x1="18" y1="6" x2="6" y2="18"></line>
													<line x1="6" y1="6" x2="18" y2="18"></line></svg>
											</div>
										</div>
										<!-- /Header -->

										<!-- Comments body -->
										<div class="comments-body has-slimscroll" data-scroll="${status.index }">

										<!-- Comment -->
										<c:if test="${!empty vo.cmt and vo.cmt gt 0 }">
											<c:forEach items="${commentList }" var="cmt">
											<!-- 피드번호가 같으면 -->
											<c:if test="${vo.feed_id eq cmt.feed_id }">
											<c:choose>
											<c:when test="${cmt.content ne '-'}">
											<!-- 일반댓글이면 -->
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
													<a href="${pageContext.request.contextPath}/profile.do?user_id=${cmt.user_id }">${cmt.name }</a>
													<span class="time">
													<fmt:formatDate value="${cmt.reg_date }" pattern="yyyy-MM-dd HH:mm:ss" var="rg_dt"/>
													 <script type="text/javascript">														
														document.write(timeForToday('${rg_dt}'));
													</script>
													</span>
													<p>${cmt.content } </p>
													<!-- Actions -->
													<c:if test="${cmt.user_id eq user.user_id }">
													<div class="controls">
														<div class="edit">
															<a id="del" data-delcmt="${cmt.comment_id }" data-delcmtfeed="${cmt.feed_id }"
															data-idx="${status.index }">삭제</a>
														</div>
													</div>
													</c:if>
												</div>
												<c:if test="${user.user_id ne cmt.user_id}">
												<!-- Right side dropdown -->
												<div class="media-right">
													<div
														class="dropdown is-spaced is-right is-neutral dropdown-trigger">
														<div>
															<div class="button">
																<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
							                                    <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
							                                    <line x1="12" y1="9" x2="12" y2="13"></line>
							                                    <line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
															</div>
														</div>
														<div class="dropdown-menu" role="menu">
	                                                    <div class="dropdown-content">
	                                                        <div class="media">
	                                                        <table>
								                        	<tr>
							                        		<td>
							                        		<input type="radio" id="msg" name="${cmt.comment_id }" value="스팸 게시물">스팸 게시물
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="msg" name="${cmt.comment_id }" value="가짜정보 제공">가짜정보 제공
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="msg" name="${cmt.comment_id }" value="성적인 내용">성적인 내용
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="msg" name="${cmt.comment_id }" value="데이트가 목적인 내용">데이트가 목적인 내용
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="msg" name="${cmt.comment_id }" value="욕설/비방">욕설/비방
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="msg" name="${cmt.comment_id }" value="기타">기타
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input data-rtxt="${cmt.comment_id }" placeholder="신고이유" hidden="true"
									                        	   maxlength="30"></input>
							                        		</td>
								                        	</tr>
								                        	</table>
	                                                        </div>
	                                                        <div class="dropdown-divider"></div>
									                        <input type="checkbox" id="blocked" data-rchk="${cmt.comment_id  }" value="${cmt.user_id }">${cmt.name } 차단
															<button id="fr-btn" data-repo="${cmt.comment_id  }" data-report="${cmt.user_id }">신고</button>
	                                                    </div>
		                                               </div>
													</div>
												</div>
												<!-- /Right side dropdown -->
												</c:if>
												</div>
												<!-- /일반댓글이면 -->
											</c:when>
											<c:otherwise>
											<!-- 교정댓글이면 -->
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
													<a href="${pageContext.request.contextPath}/profile.do?user_id=${cmt.user_id }">${cmt.name }</a>
													<span class="time">
													<fmt:formatDate value="${cmt.reg_date }" pattern="yyyy-MM-dd HH:mm:ss" var="rg_dt"/>
													 <script type="text/javascript">														
														document.write(timeForToday('${rg_dt}'));
													</script>
													</span>
													<!-- 교정댓글이면, line을 반복 -->
													<c:forEach items="${cdList }" var="cd">
														<c:if test="${cmt.comment_id eq cd.cc_id }">
														<div id="load_${cd.cc_id }${cd.line}" data-cid="${cd.cc_id }${cd.line}"
														data-cdc="${cd.content }"
														data-cdo="${cd.origin }">${cd.content }</div>
														</c:if>
													</c:forEach>
													<!-- Actions -->
													<c:if test="${cmt.user_id eq user.user_id }">
													<div class="controls">
														<div class="edit">
															<a id="cdel" data-delcmt="${cmt.comment_id }" data-delcmtfeed="${cmt.feed_id }"
															data-idx="${status.index }">삭제</a>
														</div>
													</div>
													</c:if>
												</div>
												<c:if test="${user.user_id ne cmt.user_id}">
												<!-- Right side dropdown -->
												<div class="media-right">
													<div
														class="dropdown is-spaced is-right is-neutral dropdown-trigger">
														<div>
															<div class="button">
																<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
							                                    <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
							                                    <line x1="12" y1="9" x2="12" y2="13"></line>
							                                    <line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
															</div>
														</div>
														<div class="dropdown-menu" role="menu">
	                                                    <div class="dropdown-content">
	                                                        <div class="media">
	                                                        <table>
								                        	<tr>
							                        		<td>
							                        		<input type="radio" id="msg" name="${cmt.comment_id }" value="스팸 게시물">스팸 게시물
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="msg" name="${cmt.comment_id }" value="가짜정보 제공">가짜정보 제공
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="msg" name="${cmt.comment_id }" value="성적인 내용">성적인 내용
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="msg" name="${cmt.comment_id }" value="데이트가 목적인 내용">데이트가 목적인 내용
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="msg" name="${cmt.comment_id }" value="욕설/비방">욕설/비방
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input type="radio" id="msg" name="${cmt.comment_id }" value="기타">기타
							                        		</td>
								                        	</tr>
								                        	<tr>
							                        		<td>
															<input data-rtxt="${cmt.comment_id }" placeholder="신고이유" hidden="true"
									                        	   maxlength="30"></input>
							                        		</td>
								                        	</tr>
								                        	</table>
	                                                        </div>
	                                                        <div class="dropdown-divider"></div>
									                        <input type="checkbox" id="blocked" data-rchk="${cmt.comment_id  }" value="${cmt.user_id }">${cmt.name } 차단
															<button id="rbtn" data-repo="${cmt.comment_id  }" data-report="${cmt.user_id }">신고</button>
	                                                    </div>
		                                               </div>
													</div>
												</div>
												<!-- /Right side dropdown -->
												</c:if>
												</div>
											<!-- /교정댓글이면 -->
											</c:otherwise>
											</c:choose>
												</c:if>
												<!-- /피드번호가 같으면 -->
												</c:forEach>
											</c:if>
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
															<textarea data-content="${vo.feed_id }" class="textarea comment-textarea" rows="5"
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
															<a class="button is-solid primary-button raised" id="post" data-feedid="${vo.feed_id }" data-feeduser="${vo.user_id }" data-scr="${status.index }">Post Comment</a>
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
							<div class=" load-more-wrap narrow-top has-text-centered"  id="buttonToogle">
								<a href="javascript:;" class="load-more-button">Load More</a>
							</div>
						</div>
						<!-- /Load more posts -->
					</div>
					<!-- /Middle column -->
					<!-- Right side column -->
					<div class="column is-3">
					<!------------------------ 친구추천 시작!------------------------->
						<div class="card">
							<div class="card-heading is-bordered">
								<h4>친구 추천</h4>
							</div>
							<div class="card-body no-padding">
								<!-- Suggested friend -->
								<c:forEach items="${sameTopic }" var="vo" end="3">
									<c:if test="${vo.topicCnt ne  0 }">
										<div class="add-friend-block transition-block">
											<img src="https://via.placeholder.com/300x300"
												data-demo-src="assets/img/avatars/nelly.png"
												data-user-popover="9" alt="">
											<div class="page-meta">
												<span>${vo.user_id }</span> <span>나와 일치하는 관심사
													${vo.topicCnt }개</span>
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
</div>
</body>
</html>

