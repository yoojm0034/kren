<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<style>
.inbox-wrapper .inbox-wrapper-inner .inbox-left-sidebar .inbox-left-sidebar-inner
	{
	width: 100%;
	height: 100%;
	padding: 8%;
	overflow: auto;
}

.inbox-wrapper .inbox-wrapper-inner .inbox-center-container .inbox-center-container-inner .messages .action-buttons .button
	{
	max-height: 32px;
	padding: 4px 8px;
	margin-top: 10px;
}

.inbox-wrapper .inbox-wrapper-inner .inbox-message-container .inbox-message-container-inner .message-head .action-buttons .button
	{
	max-height: 32px;
	padding: 4px 8px;
	margin-top: 10px;
}

.inbox-wrapper .inbox-wrapper-inner .inbox-center-container .inbox-center-container-inner .inbox-messages .inbox-messages-inner .card .msg-timestamp,
	.inbox-wrapper .inbox-wrapper-inner .inbox-center-container .inbox-center-container-inner .inbox-messages .inbox-messages-inner .shop-wrapper .cart-container .cart-content .cart-summary .summary-card .msg-timestamp,
	.shop-wrapper .cart-container .cart-content .cart-summary .inbox-wrapper .inbox-wrapper-inner .inbox-center-container .inbox-center-container-inner .inbox-messages .inbox-messages-inner .summary-card .msg-timestamp
	{
	float: right;
	padding: 0px;
	color: #999;
	font-size: .9rem;
}

.select {
    background-color: #f7f7f7;
    border: none;
}

.content table {
    table-layout: fixed;
    width: 100%;
    text-align: center;
}

.content table td {
	text-align: left;
}

.content table textarea {
	width: 100%;
    height: 100%;
    overflow-y: hidden;
}

.control  table {
    table-layout: fixed;
    width: 100%;
    text-align: center;
}

.control  textarea {
    width: -webkit-fill-available;
    border: none;
    resize: none;
    padding: revert;
}

</style>
<script>
	// 영어 -> 한국어
	function tokr(index){
		var en = $("#trans"+index).val();
		var Data = {english:en};
		var div = $("#tdiv"+index);
		var opt = $("select[data-transopt="+index+"]");
		console.log(en);
		console.log(div);			
			$.ajax({
				url:"korean",
				type:"GET",
				data: Data,
			    contentType : "application/json; charset:UTF-8",
				success:function(v){
					var json = JSON.parse(v);
					var korean=json.message.result.translatedText;
					console.log(korean);
					div.append($('<p/>').html(korean));
					opt.prop('disabled',true);
				},
				error:function(e){
					console.log(e);
				}
			});
	}
		
	// 한국어 -> 영어
	function toen(index){
		var ko = $("#trans"+index).val();
		var Data = {korean:ko};
		var div = $("#tdiv"+index);
		var opt = $("select[data-transopt="+index+"]");
		console.log(ko);
		$.ajax({
			url:"english",
			type:"GET",
			data: Data,
		    contentType : "application/json; charset:UTF-8",
			success:function(v){
				var json = JSON.parse(v);
				var english=json.message.result.translatedText;
				console.log(english);
				div.append($('<p/>').html(english));
				opt.prop('disabled',true);
			},error:function(e){
				console.log(e);
			}
		});
	}
	
	$(function() {
		// 친구목록 클릭하면 편지목록들 조회 
		$('a.item').on('click', function() {
		    var aid = $(this).data('id');
		    location.href='selectLetters.do?user_id='+aid;
		});		

		// 번역 그룹 이벤트
		$('body').on('change', '#transOpt',  function() {
		    var transOpt = $(this).data('transopt');
			var opt = $("select[data-transopt="+transOpt+"] option:selected").val();
			console.log(opt);
			
			if(opt == 'KR') {
				tokr(transOpt);
			} else {
				toen(transOpt);
			}
		});		
		
		// 교정테이블 행 삭제 그룹 이벤트
		$("body").on('click', '#btnd',  function() {
		    var btnd = $(this).data('btnd');
			var trDel = $("button[data-btnd="+btnd+"]").parent().parent();
			trDel.remove();
		});

// 		// 교정테이블 td에 textarea 추가 그룹 이벤트
// 		$("body").on('click', '#btnc',  function() {
// 		    var btnc = $(this).data('btnc');
// 			var textRoad = $("button[data-btnc="+btnc+"]").parent().prev().text();
// 			var tdRoad = $("button[data-btnc="+btnc+"]").parent();
// 		    console.log(btnc, textRoad);
// 			tdRoad.append($('<textarea id="correcting" data-corr="'+btnc+'">').val(textRoad));
// 			$("button[data-btnc="+btnc+"]").remove(); // 교정 행 추가 버튼 삭제
// 		});
		
		// 교정테이블 추가 그룹 이벤트
		$("body").on('click', '#corbtn',  function() {
		    var corid = $(this).data('corid');		//letter_id; id
		    var coridx = $(this).data('coridx');	//idx
		    add(corid, coridx);
		});
		
		// 전송버튼을 누르면 교정문장 전달
		$("body").on('click', '#frmBtn',  function() {
		    var num = $(this).data('num');			//row
		    var frmbtn = $(this).data('frmbtn');	//idx
		    letterc(num, frmbtn);
		});
		
		// 삭제버튼을 누르면 편지목록에서 삭제
		$("body").on('click', '#delbtn',  function() {
		    var delid = $(this).data('delid');	//letter_id
		    console.log(delid);
		    
		    if(confirm("편지를 삭제하시겠습니까?") ) {
			    $.ajax({
			    	url:'deleteLetter.do',
			    	type:'post',
			    	data:JSON.stringify({letter_id:delid}),
				    contentType : "application/json; charset=UTF-8",
			    	success: function(data) {
			    		alert('삭제되었습니다.');
			    		location.reload(true);
			    	},
			    	error: function(e) {
			    		alert('삭제실패');
			    	}
			    });		    	
		    } else {
		    	alert("취소되었습니다.");
		    }
		});
		
		// 편지 입력
		$("body").on('click', '#send', function() {
			var send = $(this).data('send'); //letter_id
			var to = $(this).data('to'); //to_id
			var sendbtn = $('button[data-send="'+send+'"]');
			var txtarea = $('textarea[data-letter="'+send+'"]').val();
			console.log(txtarea);
			
			if(confirm("편지를 전송하시겠습니까?") ) {
			    $.ajax({
			    	url:'insertLetter.do',
			    	type:'post',
			    	data:JSON.stringify({
			    		letter_id:send,
			    		to_id:to,
			    		content:txtarea,
			    		gubun:'일반'
			    	}),
				    contentType : "application/json; charset=UTF-8",
			    	success: function(data) {
			    		alert('전송되었습니다.');
			    		location.reload(true);
			    	},
			    	error: function(e) {
			    		alert('편지전송실패');
			    	}
			    });		    	
		    } else {
		    	if(confirm("편지를 저장하시겠습니까?") ) {
				    $.ajax({
				    	url:'insertLetter.do',
				    	type:'post',
				    	data:JSON.stringify({
				    		letter_id:send,
				    		to_id:to,
				    		content:txtarea,
				    		gubun:'임시저장'
				    	}),
					    contentType : "application/json; charset=UTF-8",
				    	success: function(data) {
				    		alert('편지가 저장되었습니다.');
				    		location.reload(true);
				    	},
				    	error: function(e) {
				    		alert('저장실패');
				    	}
				    });		    	
			    } else {
			    	alert("편지작성이 취소되었습니다.");
			    }
		    }
		});
		
	});

	// 교정테이블 추가
	function add(id, idx) {
		var lid = $("#letter"+id).val();
	    var result = lid.split(".");
	    console.log(result);
		
		var div = $('#tbl'+id);
		var tbl = $('<table>');

		// 테이블 행제목
		let thead = ['','']
		var head = $('<tr>');
		for (var field in thead) {
			var name = $('<td>').text(thead[field].trim());
			head.append(name);
		}
		tbl.append(head);
		div.append(tbl);
		
		// 교정 테이블 출력
		var rownum = 1;
		var num = 0;
		for(var i=0; i < result.length; i++) {
			if(result[i].length != 0) { // 리스트가 비어있지않으면
				num = i;
				var tr = $('<tr>');
// 				tr.append($('<td>').append(rownum+i)); //행번호
				tr.append($('<td data-cont="'+i+'">').append(result[i]));
// 				tr.append($('<td>').append($('<button type="button" id="btnc" data-btnc="'+i+'">').text('교정')));
				tr.append($('<td>').append($('<textarea id="correcting" data-corr="'+i+'">').val(result[i])));
				tbl.append(tr);			
			}
		}
		console.log('rnum:',rownum);
		var tr2 = $('<tr>');
		var col = $('<td colspan="3">');
		var submit = $('<button type="button" id="frmBtn" data-num="'+num+'" data-frmbtn="'+idx+'">').text('전송');
		col.append(submit);
		tr2.append(col);
		tbl.append(tr2)
		div.append(tbl);
		var tblBtn = $('button[data-coridx="'+idx+'"]'); // 교정테이블 추가 버튼 삭제
		tblBtn.remove();
	} //function add
	
	function letterc(row, idx) {
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
		var letter = $('input[data-leid="'+idx+'"]').val(); //편지번호
		
		var rows = ""; // 행숫자만큼 숫자를 리스트에 담아줌
		for(var i=0; i<=row; i++) {
			if(i != row) {
				rows += i +",";	
			} else {
				rows += i;
			}
		}

		var Data = {
			"letter_id":letter,
			"line":rows,
			"origin":cont,
			"correcting":corr
		};
			
		console.log(Data);
		
		
		$.ajax({
			url:"insertCorLetter.do",
			type:"post",
		    data: JSON.stringify(Data),
		    contentType : "application/json; charset=UTF-8",
			success:function(v){
				alert("작성되었습니다!");
				$('#tbl'+letter).remove(); // 교정 테이블 삭제
				location.reload(true);
			},error:function(e){
				console.log(e);
			}
		});
	} //function letterc
</script>
</head>
<body>
<form id="hfrm" action="selectLetters.do" method="post">
	<input type="hidden" id="user_id">
</form>
	<div class="inbox-wrapper">
		<div class="inbox-wrapper-inner">
			<!-- LEFT SIDEBAR  -->
			<div class="inbox-left-sidebar">
				<div class="inbox-left-sidebar-inner ">
					<div class="compose">
						<a class="button is-fullwidth raised is-bold">Write</a>
					</div>
					<!-- MENU -->
					<div class="left-menu" style="overflow: auto;">
						<a href="letterBox.do" class="item">
							<span class="name">New Letters</span>
						</a>
						<a href="savedLetter.do" class="item">
							<span class="name">Saved Letters</span>
						</a>
						<c:if test="${!empty friends }">
						<c:forEach items="${friends }" var="vo">
							<c:choose>
							<c:when test="${param.user_id eq vo.user_id }">
								<a data-id="${vo.user_id}" class="item is-active">
									<span class="name">${vo.name }</span>
									<c:if test="${!empty replyLetter }">
										<span>↙</span>									
										<span>↗</span>									
									</c:if>
								</a>
							</c:when>
							<c:otherwise>
								<a data-id="${vo.user_id}" class="item">
									<span class="name">${vo.name }</span>
								</a>							
							</c:otherwise>
							</c:choose>
						</c:forEach>
						</c:if>						
					</div>
					
					<!-- MOBILE ONLY CLOSE -->
					<div class="close-menu is-hidden-desktop is-hidden-landscape">
						<a id="close-compose">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-x">
											<line x1="18" y1="6" x2="6" y2="18"></line>
											<line x1="6" y1="6" x2="18" y2="18"></line>
							</svg>
						Close </a>
					</div>
				</div>
			</div>
			
			<!-- MESSAGES LIST CONTAINER -->
			<div class="inbox-center-container is-both-opened">
				<div class="inbox-center-container-inner">
					<div class="messages">
					<!-- BUTTON GROUP -->
					<div class="action-buttons">
						<div class="control is-grouped is-hidden-desktop is-hidden-landscape">
							<a id="open-compose" class="button is-solo"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round"
									stroke-linejoin="round" class="feather feather-menu">
									<line x1="3" y1="12" x2="21" y2="12"></line>
									<line x1="3" y1="6" x2="21" y2="6"></line>
									<line x1="3" y1="18" x2="21" y2="18"></line>
								</svg>
							</a>
						</div>

						<div class="control is-grouped">
							<a class="button" href="letterBox.do"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round"
									stroke-linejoin="round" class="feather feather-refresh-cw">
									<polyline points="23 4 23 10 17 10"></polyline>
									<polyline points="1 20 1 14 7 14"></polyline>
									<path
										d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
								</svg>
							</a>
							
							<!--BASIC DROPDOWN-->
							<div class="dropdown is-spaced is-accent dropdown-trigger">
								<div>
									<div class="button">
										<svg xmlns="http://www.w3.org/2000/svg" width="24"
											height="24" viewBox="0 0 24 24" fill="none"
											stroke="currentColor" stroke-width="2"
											stroke-linecap="round" stroke-linejoin="round"
											class="feather feather-more-horizontal">
											<circle cx="12" cy="12" r="1"></circle>
											<circle cx="19" cy="12" r="1"></circle>
											<circle cx="5" cy="12" r="1"></circle></svg>
									</div>
								</div>
							</div>
						</div>
						<!-- /BUTTON GROUP -->
					</div>

						<!-- MESSAGES LIST -->
						<!-- MESSAGE CARDS -->
						<c:choose>
						<c:when test="${!empty friendLetter }">
							<div id="inbox-messages" class="inbox-messages has-slimscroll">
								<div class="inbox-messages-inner">
								<c:forEach items="${friendLetter }" var="vo" varStatus="status">
								
									<div id="msg-card-${status.index }" data-preview-id="${status.index }"
										class="card is-msg has-attachment">
										<div class="card-content">
											<c:if test="${!empty vo.arrive_date }">
											<span class="msg-timestamp"><fmt:formatDate value="${vo.arrive_date }" pattern="yy/MM/dd HH:mm"/>  <img
												src="resources/template/assets/img/letter/stamp.png">
											</span>
											</c:if>
											<c:if test="${empty vo.arrive_date }">
											<span class="msg-timestamp"> 시간계산중
											  <img src="resources/template/assets/img/letter/stamp.png">
											</span>
											</c:if>
											<div class="msg-header">
												<div class="user-image">
													<img
														style="width: 48px; height: 48px; border-radius: 50%; display: inline-block;"
														src="https://via.placeholder.com/400x400" alt="friends">
													<span class="msg-from"
														style="vertical-align: top; margin-left: 5px;"> <small><a>${vo.name }</a></small>
													</span>
												</div>
											</div>
											<br>
											<div class="msg-snippet">
											<c:if test="${!empty vo.arrive_date }">
												<p>${vo.content }</p>
											</c:if>
											<c:if test="${empty vo.arrive_date }">
												<p>편지가 오고있어요. 조금만 기다려주세요. 편지가 배달오고 있습니다.</p>
											</c:if>											
											</div>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<p>최근 도착한 편지가 없습니다!</p>
						</c:otherwise>
						</c:choose>
						<!-- /MESSAGE CARDS -->
					</div>
				</div>
			</div>
			<!-- /MESSAGES LIST CONTAINER -->

			<!-- MESSAGES CONTAINER -->
			<div class="inbox-message-container">
				<div class="inbox-message-container-inner">
					<div class="message-head">
						<!-- BUTTON GROUP -->
						<div class="action-buttons">
							<div class="control is-grouped">
								<a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-refresh-cw">
										<polyline points="23 4 23 10 17 10"></polyline>
										<polyline points="1 20 1 14 7 14"></polyline>
										<path
											d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
									</svg>
								</a>
							</div>
							<div class="control is-grouped">
								<a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-star">
										<polygon
											points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
									</svg>
								</a> <a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-inbox">
										<polyline points="22 12 16 12 14 15 10 15 8 12 2 12"></polyline>
										<path
											d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"></path>
									</svg>
								</a>
							</div>
							<div class="control is-grouped is-arrows">
								<a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-chevron-left">
										<polyline points="15 18 9 12 15 6"></polyline></svg>
								</a> <a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-chevron-right">
										<polyline points="9 18 15 12 9 6"></polyline></svg>
								</a>
							</div>
							<!-- MOBILE SIDEBARS -->
							<div
								class="control is-grouped is-hidden-desktop is-hidden-landscape">
								<a id="close-inbox-preview" class="button is-solo"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-x">
										<line x1="18" y1="6" x2="6" y2="18"></line>
										<line x1="6" y1="6" x2="18" y2="18"></line>
									</svg>
								</a>
							</div>
						</div>
					</div>

					<!-- MESSAGE PREVIEWS -->
					<c:choose>
					<c:when test="${!empty friendLetter }">
					<div class="message-body has-slimscroll">
					<c:forEach items="${friendLetter }" var="vo" varStatus="status">
					<div id="message-preview-${status.index }" class="message-body-inner">
						<c:if test="${!empty vo.arrive_date }">
						<div class="box message-preview">
							<div class="box-inner">
								<div class="header">
									<div class="avatar">
										<img src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/dan.jpg" alt=""
											data-user-popover="1">
									</div>
									<div class="meta">
										<div class="name">${vo.name }</div>
										<div class="date"><fmt:formatDate value="${vo.arrive_date }" pattern="yy/MM/dd HH:mm"/> </div>
									</div>
								</div>
	
								<hr>
								<div class="content">
									<p>${vo.content }</p>
									<input type="hidden" id="trans${status.index }" value="${vo.content }">
									<input type="hidden" id="letter${vo.letter_id }" value="${vo.content }">
									<div id="tdiv${status.index }"></div>
									<input type="hidden" data-leid="${status.index}" value="${vo.letter_id }">
									<div id="tbl${vo.letter_id }"></div>
								</div>
								<div class="has-text-right">
									<c:if test="${vo.user_id ne user.user_id }">
										<button class="button is-solid grey-button is-bold raised">
											<select id="transOpt" data-transopt="${status.index }" class="select">
												<option value="" hidden="">Translate</option>
												<option value="KR">Translate(KR)</option>
												<option value="EN">Translate(EN)</option>
											</select>
										</button>
										<c:if test="${vo.cor_yn eq 'N' }">
										<button class="button is-solid grey-button is-bold raised" id="corbtn" data-corid="${vo.letter_id }" data-coridx="${status.index }">교정</button>
										</c:if>
									</c:if>
									<button class="button is-solid grey-button is-bold raised" id="delbtn" data-delid="${vo.letter_id }">삭제</button>
								</div>
							</div>
						</div>
						</c:if>
						<!-- 편지작성 -->
						<c:if test="${!empty vo.arrive_date and vo.name ne user.name }">
						<div class="reply-wrapper">
							<div class="reply-title">
							Write
							</div>
							<div class="reply-wrapper-inner">
								<div class="flex-form">
									<div class="control">
										<table>
										<tr>
										<td>
											<textarea data-letter="${vo.letter_id }" rows="20" cols="20" placeholder="Write your letter"></textarea>
										</td>
										</tr>
										</table>
									</div>
								</div>
								<div class="has-text-right">
									<button id="send" data-send="${vo.letter_id  }" data-to="${vo.user_id }" type="button"
										class="button is-solid accent-button is-bold raised send-message">
										Send Letter</button>
								</div>
							</div>
						</div>
						</c:if>
							<!-- 교정편지추가 -->
							<c:choose>
							<c:when test="${!empty vo.arrive_date and !empty lettercs and vo.cor_yn eq 'Y'}">
							<div class="message-preview-transition is-first">
								<div class="mail">
									<svg xmlns="http://www.w3.org/2000/svg" width="24"
										height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2"
										stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-mail">
										<path
											d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
										<polyline points="22,6 12,13 2,6"></polyline></svg>
								</div>
							</div>
                           	<div class="box message-preview">
                               <div class="box-inner">
                                   <div class="header">
                                       <div class="avatar">
                                           <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" data-user-popover="0">
                                       </div>
                                       <div class="meta">
                                           <div class="name">${user.name}</div>
                                       </div>
                                   </div>
                                   <hr>
                                   <div class="content" id="diff">
                               	   <table>
                               	   	<tr>
                               	   		<td></td>
                               	   		<td></td>
                               	   	</tr>
                               	   	<c:forEach items="${lettercs}" var="cvo">
                               	   	<c:if test="${cvo.letter_id eq vo.letter_id }">
                               	   	<tr>
                               	   		<td>${cvo.origin }</td>
                               	   		<td>${cvo.correcting }<br>
                               	   	</tr>                               	   	
                               	   	</c:if>
                               	   	</c:forEach>
                               	   </table>
                                   </div>
                               	   <hr>    
                               </div>
                           	</div>	
                   			</c:when>
							</c:choose>
                           	<!-- /교정편지추가 -->
                           	</div>
					</c:forEach>
					</div>
					</c:when>
					<c:otherwise>
						<p>해당 편지를 조회할 수 없습니다.</p>
					</c:otherwise>
					</c:choose>
					<!-- /MESSAGE PREVIEWS -->
				</div>
			</div>
			<!-- /MESSAGES CONTAINER -->
		</div>
	</div>
</body>
</html>