$(document).ready(function(){
	//생일
    function setSlide(){// 동작 함수 생성
        var box   = document.getElementById("widget-slide-1");
        var elm   = box.getElementsByTagName( 'li' );
        var max   = elm.length-1;
        var now   = 0;
        var next  = 0;
        var tmr   = null;
        var timr  = 5000;
        function change(){if(next > max) next = 0; else if(next < 0) next = max; for(var i=0; i <= max; i++ )elm[i].className = "";elm[next].className = "on";now = next;}
        function befor(){next--; change();}
        function after(){next++; change();}
        function stop(){ clearInterval(tmr);}
        function start(){tmr = setInterval(function(){after();}, timr); }
        if(max>0){start();}
    }
    setSlide();// 실행
    
	$('.menu').each(function(index){
		$(this).attr('menu-index', index);
	}).click(function(){
		var index = $(this).attr('menu-index');
		$('.menu[menu-index=' + index + ']').addClass('clicked_menu');
		$('.menu[menu-index!=' + index + ']').removeClass('clicked_menu');
	});
	
	//-------공지사항이동---------
	$('.page-block').on('click',function(){
		var noticeId= this.id;
		location.href="${pageContext.request.contextPath}/userSelectNotice.do?notice_id="+noticeId
	});
	
	//-------출석체크-------
	$('#todayCheck').on('click', function() {
		$.ajax({//----------출석 여부 확인----------
			url:'${pageContext.request.contextPath}/stamphLoginCheck.do',
			data:{'user_id':'${user.user_id}'},
			success:function(cnt){
				console.log('cnt:',cnt);
				if(cnt > 0) {
					//alert('하루에 한번만 가능합니다.');
					alert('<spring:message code="feed.check.stamp.today"/>');
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
										//alert('우표 하나 받았어요!');
										alert('<spring:message code="feed.check.stamp.plus"/>');
										$('.checkMsg').children().remove();
										$('.checkMsg').html('<spring:message code="feed.check.done"/>');
									},
									error:function() {
										//alert('관리자에게 문의해주세요');								
										alert('<spring:message code="feed.check.alert.errormsg"/>');		
									}
								});
							}
						},
						error:function() {
							//alert('관리자에게 문의해주세요');
							alert('<spring:message code="feed.check.alert.errormsg"/>');		
						}
					});
				}
			},
			error:function(e) {
				//alert('관리자에게 문의해주세요');
				alert('<spring:message code="feed.check.alert.errormsg"/>');		
			}
		});
	});//출석체크
});




	function loadMore(){
	 //-------load more-------
	  var increment=5;	//---5개씩추가----- 
	  var startFilter=0;
	  var endFilter=increment;
	  var $this = $('.feedContents');						
	  var elementLength = $this.children('#feed-post-1').length;

	  if (elementLength > 5) { 
		  $('#buttonToogle').show();
	  }else{
		  $('#buttonToogle').hide();
	  }
	  $('.feedContents #feed-post-1').slice(startFilter, endFilter).addClass('shown');
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
	
	//-------친구팔로우--------
	function addFriend(id){
		var data = {following : id};
		$.ajax({
			url:"${pageContext.request.contextPath}/follow.do",
			type:"POST",
			data: JSON.stringify(data),
			contentType: 'application/json; charset=utf-8',
			success:function(data){
				sendFollowPush(id);
			},
			error:function(err){
				console.log(err);
			}
		})
	};

	//-------좋아요--------
	function likeIt(feedId,userId){
		var span = $('#recCnt'+feedId);
		var myId= '${user.user_id}';
		$.ajax({
			url:contextpath+"/likeCnt.do",
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
					if(userId != myId ){
						sendLikePush(userId,feedId);						
					}
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
		var div = $("#tdiv"+id);			//div ID
		var lan = div.next().attr('id');	//content

	 	$.ajax({
			url:"${pageContext.request.contextPath}/transContent.do",
			type:"GET",
			data:{	korean: text,
					write_lan: lan},
			success:function(v){
				var json = JSON.parse(v);
				var transval = json.message.result.translatedText;

				if(div.children().length){
					return;
				}else{
					div.append($('<p/>').html(transval));
				}
			},
			error:function(err){
				console.log(err);
			}
		});  
	};
	
	//새 편지 쓰기
	function writePopup(id,name) {
		var winWidth = 860;
	    var winHeight = 580;
	    var popupOption= "width="+winWidth+", height="+winHeight;
		
		var target ='pop';
		var url = '${pageContext.request.contextPath}/writeLetter.do';
		window.open('',target,popupOption);
	
		var letterform = document.letterform;
		letterform.action=url;
		letterform.target=target;
		$('#to_id').val(id);
		$('#to_name').val(name);
		letterform.submit();	
	}

	function feedUpdate(feedId){
		$('.app-overlay').addClass('is-active');
		$('.is-new-content').addClass('is-highlighted');
		$('#publish').focus();
		
		var tags = $('#update'+feedId).find('#update-tag').val();
		var content = $('#update'+feedId).find('#update-content').val();
		var photo = $('#update'+feedId).find('#update-photo').val(); 
		var fphoto = $('#update'+feedId).find('#update-fphoto').val(); 
		var retag = tags.replace(/,/g, "#");	
		var photoChk = $('#photoChk');	//사진 수정시 체크 여부 
		
		$('#feedid').val(feedId);	
		$('#publish').val(content);
		document.getElementById('photo').value = fphoto;
		
		if(retag != ""){
			$('#append_tag').append("#"+retag);			
		}
		
		if(photo != ""){	
		  var deleteIcon = feather.icons.x.toSvg();
		  var template = "\n                <div class=\"upload-wrap\">\n                    <img src=/FinalPrj/resources/upload/" + photo + " alt=\"\">\n                    <span class=\"remove-file\">\n                        " + deleteIcon + "\n                    </span>\n                </div>\n            ";
		  $('#feed-upload').append(template);

		}

	  	$('.remove-file').on('click', function () {
	         $(this).closest('.upload-wrap').remove();
	         photoChk.val(1);
	  	});
	}

	$(function(){
	loadMore();
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
		//피드작성스탬프지급
		if(feedId ==""){
		$.ajax({
			url:"${pageContext.request.contextPath}/stamphFeedChk.do",
			type:"POST",
			success:function(v){
				if(v==0){
					alert('<spring:message code="feed.feed.stamp"/>');				
				}
				$('#feedInsert').submit();		
			},
			error:function(err){
				console.log(err);
			}
		});
		}else{
			$('#feedInsert').submit();	
		}
	});
	
	//-------피드 Reset---------
	$('.close-publish').on('click',function(){
		$('#publish').val('');
		$('#append_tag').text('');
		$('#photoChk').val('');
		$('#feed-upload').empty();
		$('#feedid').val('');
	});  

   //-------태그등록---------
   document.getElementById("activities-autocpl").onkeypress = function() {tagFunction()};
   function tagFunction() {
	  var div= $('#append_tag');
      if(event.keyCode==13){
          var tagval = $('#activities-autocpl').val();
          if(!tagval) {
            alert('<spring:message code="feed.insert.tag"/>');
         }else{
        	 
			if(div.children().length == 5){
				return;
			}else{
				div.append('<span class="tagDelete">#' + tagval+ ' </span>');
			}
            	$('#activities-autocpl').val('');
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
     });
   }

	//-------최신글---------
	$('#allSearch').on('click',function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/feedSelect.do",
			success:function(result){
				$('.feedContents').html(result);
				datePosdst();
				loadMore();
				initPostComments();
				dateCmt();
				$("div[id^='load_'").each(function(i, el){
					var cid = $(this).data('cid');//cc_id.line
					var cdc = $(this).data('cdc');//content
					var cdo = $(this).data('cdo');//origin
					test_diff(cid,cdc,cdo);
				});
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
				initPostComments();
				dateCmt();
				$("div[id^='load_'").each(function(i, el){
					var cid = $(this).data('cid');//cc_id.line
					var cdc = $(this).data('cdc');//content
					var cdo = $(this).data('cdo');//origin
					test_diff(cid,cdc,cdo);
				});
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
				$('.feedContents').html(result);
				datePosdst();
				loadMore();
				initPostComments();
				dateCmt();
				$("div[id^='load_'").each(function(i, el){
					var cid = $(this).data('cid');//cc_id.line
					var cdc = $(this).data('cdc');//content
					var cdo = $(this).data('cdo');//origin
					test_diff(cid,cdc,cdo);
				});
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
				$('.feedContents').html(result);
				datePosdst();
				loadMore();
				initPostComments();
				dateCmt();
				$("div[id^='load_'").each(function(i, el){
					var cid = $(this).data('cid');//cc_id.line
					var cdc = $(this).data('cdc');//content
					var cdo = $(this).data('cdo');//origin
					test_diff(cid,cdc,cdo);
				});
			},
			error:function(err){
				console.log(err);
			}
		});
	});
	
	//-------프로필클릭시---------
	$('.user-info').on('click',function(){
		var userId= this.id;
		location.href="${pageContext.request.contextPath}/profile.do?user_id="+userId
	});
	
	$('.delFeed').on('click',function(){
		var feedId= this.id;
		if(confirm('<spring:message code="feed.confirm.delete"/>')){
		location.href='${pageContext.request.contextPath}/feedDelete.do?feed_id='+feedId			
		}
	})
	
});
	
	$(function(){
	//-------태그자동완성---------
	if ($('#activities-autocpl').length) {
		var data1 = $(this);
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
		
		  	var input = $('#tagInput').attr("class");
		  	if(input=="input is-hidden"){
		  		$('#tagInput').removeClass('is-hidden').addClass('is-active');
		  	}else{
		  		$('#tagInput').removeClass('is-active').addClass('is-hidden');
		  	}
		  	
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
						alert('<spring:message code="feed.insert.tag"/>');
					}else{
						$.ajax({
							url:"${pageContext.request.contextPath}/feedSelect.do",
							data:{tags : tagval },
							success:function(result){
								$('.feedContents').html(result);
								datePosdst();
								loadMore();
								initPostComments();
								dateCmt();
								$('.load-more-wrap.narrow-top.has-text-centered').addClass('is-hidden');
								$("div[id^='load_'").each(function(i, el){
									var cid = $(this).data('cid');//cc_id.line
									var cdc = $(this).data('cdc');//content
									var cdo = $(this).data('cdo');//origin
									test_diff(cid,cdc,cdo);
								});
							},
							error:function(err){
								console.log(err);
							}
						});
					}
				}
			};
	});
	
	//-------태그라벨---------
	$('body').on('click','.tag-label',function(){
		var tagName = this.id;
		$.ajax({
			url:"${pageContext.request.contextPath}/feedSelect.do" ,
			data:{tags : tagName},
			success:function(result){
				$('.feedContents').html(result);
				datePosdst();
				loadMore();
				initPostComments();
				dateCmt();
				$("div[id^='load_'").each(function(i, el){
					var cid = $(this).data('cid');//cc_id.line
					var cdc = $(this).data('cdc');//content
					var cdo = $(this).data('cdo');//origin
					test_diff(cid,cdc,cdo);
				});
			},
			error:function(err){
				console.log(err);
			}
		});
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
		var report = $(this).data('report2');	//name 
		var repo = $(this).data('repo2')			//feed_id
		var radio = $("input:radio[name='"+repo+"']:checked").val(); //선택된값
		var txt = "";
		var chk = $("input:checkbox[data-rfchk='"+repo+"']:checked").val(); //체크된값
		
		if(radio == '기타') {
			txt = $('input[data-rftxt="'+repo+'"]').val();//기타사유
			if(txt=='') {
				alert('<spring:message code="feed.report.blank"/>');
				return;
			}
		} else {
			txt = radio;
		}
		if(txt == null) {//값이 선택되지 않았으면
			alert('<spring:message code="feed.report.text.empty"/>');
			return;
		} 
		
		if(confirm('<spring:message code="feed.confirm.report"/>')) {
			$.ajax({//신고 여부 확인
				url:'${pageContext.request.contextPath}/reportUserCheck.do',
				type:'post',
				data:{content:repo,user_id:'${user.user_id}'},
				success: function(cnt) {
					if(cnt == 0) {
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
								alert('<spring:message code="feed.report.success"/>');
							},
							error: function(err) {
								alert('<spring:message code="feed.alert.errormsg"/>');
							}
						});
					} else {
						alert('<spring:message code="feed.report.did"/>');
					}
				},
				error: function(e) {
					alert('<spring:message code="feed.alert.errormsg"/>');
				}
			});//$.ajax신고 여부 확인
		}
	});//버튼을 누르면
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
				alert('<spring:message code="comment.alert.blank"/>');
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
					alert('<spring:message code="comment.send.success"/>');
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
									$('div[data-card="'+scr+'"]').children().eq(0).html('<spring:message code="comment.h4.title"/>'+' ('+cnt+')');
									span2.html(cnt);
									if(feeduser != '${user.user_id}') {//작성자가 내가 아니라면 알림주기
										sendTextPush(feeduser, feedid);										
									}
								}
							});//댓글수+1
						}
					});
				},
				error: function() {
					alert('<spring:message code="comment.send.fail"/>');
				}
			});//댓글입력

		});//#post
		
		//-------댓글삭제 그룹이벤트-------- 		
		$('body').on('click','#del', function() {
			var delcmt = $(this).data('delcmt');
			var delcmtfeed = $(this).data('delcmtfeed');
			var delidx = $(this).data('idx');
			var del = $('a[data-delcmt="'+delcmt+'"]').parent().parent().parent().parent().parent();
			var span = $('span[data-minicmt="'+delidx+'"]');
			//-------댓글삭제-------
			if(confirm('<spring:message code="comment.confirm.delete"/>')) {
				$.ajax({
					url: '${pageContext.request.contextPath}/commentDelete.do',
					method: 'post',
					data: JSON.stringify({comment_id:delcmt}),
					contentType:'application/json; charset=UTF-8',
					success: function(data) {
						del.remove();
						//-------댓글수-1-------
						$.ajax({
							url: '${pageContext.request.contextPath}/commentCnt.do',
							method: 'post',
							data: {feed_id:delcmtfeed},
							success: function(cnt) {
								var cnt = cnt;
								$('div[data-card="'+delidx+'"]').children().eq(0).html('<spring:message code="comment.h4.title"/>'+' ('+cnt+')');
								span.html(cnt);
							}
						});
					},
					error: function(e) {
						alert('<spring:message code="comment.delete.fail"/>');
					}
				});
			}		
		});
		
	});//end $function
	
//--------신고START--------------------------------
	$(function() {
		
	$('body').on('click','#fr-btn', function() { // 신고버튼을 누르면
		var report = $(this).data('report');//name
		var repo = $(this).data('repo'); 	//comment_id
		
		var sub = $('button[data-report="'+repo+'"]'); //해당버튼 
		var radio = $("input:radio[name='"+repo+"']:checked").val(); //선택된값
		var txt = "";
		if(radio == '기타') {
			txt = $('input[data-rtxt="'+repo+'"]').val();//기타사유
			if(txt=='') {
				alert('<spring:message code="comment.report.text.empty"/>');
				return;
			}
		} else {
			txt = radio;
		}
		if(txt == null) {//값이 선택되지 않았으면
			alert('<spring:message code="comment.report.blank"/>');
			return;
		}
		var chk = $("input:checkbox[data-rchk='"+repo+"']:checked").val(); //체크된값
		console.log(report, repo, radio, chk, txt);
		
		
		if(confirm('<spring:message code="comment.confirm.report"/>')) {
			$.ajax({//신고 여부 확인
				url:'${pageContext.request.contextPath}/reportUserCheck.do',
				type:'post',
				data:{content:repo,user_id:'${user.user_id}'},
				success: function(cnt) {
					if(cnt == 0) {
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
								alert('<spring:message code="comment.report.success"/>');
							},
							error: function(err) {
								alert('<spring:message code="comment.alert.errormsg"/>');
							}
						});
				 } else {
						alert('<spring:message code="letter.report.did"/>');
					}
				},
				error: function(e) {
					alert('<spring:message code="comment.alert.errormsg"/>');
				}
			});//$.ajax신고 여부 확인
		}
	});//신고버튼을 누르면
	
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
			var del = $('a[data-delcmt="'+delcmt+'"]').parent().parent().parent().parent().parent();
			var span = $('span[data-minicmt="'+delidx+'"]');
			//-------댓글삭제-------
			if(confirm('<spring:message code="comment.confirm.delete"/>')) {
				$.ajax({
					url: '${pageContext.request.contextPath}/commentcDelete.do',
					method: 'post',
					data: {cc_id:delcmt},
					success: function(data) {
						del.remove();
						//-------댓글수-1-------
						$.ajax({
							url: '${pageContext.request.contextPath}/commentCnt.do',
							method: 'post',
							data: {feed_id:delcmtfeed},
							success: function(cnt) {
								var cnt = cnt;
								$('div[data-card="'+delidx+'"]').children().eq(0).html('<spring:message code="comment.h4.title"/>'+' ('+cnt+')');
								span.html(cnt);
							}
						});
					},
					error: function(e) {
						alert('<spring:message code="comment.delete.fail"/>');
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
		var tbl = $('<table id="correcting-table">');

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
		var col = $('<td colspan="2" align="right">');
		var submit = $('<button type="button" class="button" id="frmBtn" data-fd="'+fid+'" data-fu="'+fuser+'" data-num="'+num+'" data-frmbtn="'+fidx+'">').text('<spring:message code="comment.btn.send"/>');
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
		 				alert('<spring:message code="comment.send.success"/>');
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
										$('div[data-card="'+idx+'"]').children().eq(0).html('<spring:message code="comment.h4.title"/>'+' ('+cnt+')');
										var span2 = $('span[data-minicmt="'+idx+'"]');
										span2.html(cnt);
										if(feeduser != '${user.user_id}') {//작성자가 내가 아니라면 알림주기
											sendTextPush(feeduser, feedid);										
										}
									}
								});//댓글수+1
							}
						});
		 			},error:function(e){
		 				alert('<spring:message code="comment.send.fail"/>');
		 			}
				});
			},error:function(e){
 				alert('<spring:message code="comment.alert.errormsg"/>');
			}
			
		});
	} //function commentc

//--------교정END----------------------------------------