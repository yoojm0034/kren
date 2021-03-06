<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm" var="today" />
<!DOCTYPE html>
<html>
<head>
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
	width: 100%;
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
#drop table {
    text-align: left;
}
</style>
<script>
	// ?????? -> ?????????
	function tokr(index){
		var en = $("#trans"+index).val().replace("\r\n","");
		var Data = {english:en};
		var div = $("#tdiv"+index);
		var opt = $("select[data-transopt="+index+"]");
		//console.log(en);
		//console.log(div);			
			$.ajax({
				url:"korean",
				type:"GET",
				data: Data,
			    contentType : "application/json; charset:UTF-8",
				success:function(v){
					var json = JSON.parse(v);
					var korean=json.message.result.translatedText;
					//console.log(korean);
					div.append($('<p/>').html(korean));
					opt.prop('disabled',true);
				},
				error:function(e){
					alert('<spring:message code="letter.alert.errormsg"/>');
				}
			});
	}
		
	// ????????? -> ??????
	function toen(index){
		var ko = $("#trans"+index).val().replace("\r\n","");
		var Data = {korean:ko};
		var div = $("#tdiv"+index);
		var opt = $("select[data-transopt="+index+"]");
		//console.log(ko);
		$.ajax({
			url:"english",
			type:"GET",
			data: Data,
		    contentType : "application/json; charset:UTF-8",
			success:function(v){
				var json = JSON.parse(v);
				var english=json.message.result.translatedText;
				//console.log(english);
				div.append($('<p/>').html(english));
				opt.prop('disabled',true);
			},error:function(e){
				alert('<spring:message code="letter.alert.errormsg"/>');
			}
		});
	}
	
	$(function() {
		// ???????????? ???????????? ??????????????? ?????? 
		$('a.item').on('click', function() {
		    var aid = $(this).data('id');
		    location.href= '${pageContext.request.contextPath}/'+'selectLetters.do/'+aid;
		});		

		// ?????? ?????? ?????????
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
		
		// ??????????????? ??? ?????? ?????? ?????????
		$("body").on('click', '#btnd',  function() {
		    var btnd = $(this).data('btnd');
			var trDel = $("button[data-btnd="+btnd+"]").parent().parent();
			trDel.remove();
		});

// 		// ??????????????? td??? textarea ?????? ?????? ?????????
// 		$("body").on('click', '#btnc',  function() {
// 		    var btnc = $(this).data('btnc');
// 			var textRoad = $("button[data-btnc="+btnc+"]").parent().prev().text();
// 			var tdRoad = $("button[data-btnc="+btnc+"]").parent();
// 		    console.log(btnc, textRoad);
// 			tdRoad.append($('<textarea id="correcting" data-corr="'+btnc+'">').val(textRoad));
// 			$("button[data-btnc="+btnc+"]").remove(); // ?????? ??? ?????? ?????? ??????
// 		});
		
		// ??????????????? ?????? ?????? ?????????
		$("body").on('click', '#corbtn',  function() {
		    var corid = $(this).data('corid');		//letter_id; id
		    var coridx = $(this).data('coridx');	//idx
		    add(corid, coridx);
		});
		
		// ??????????????? ????????? ???????????? ??????
		$("body").on('click', '#frmBtn',  function() {
		    var num = $(this).data('num');			//row
		    var frmbtn = $(this).data('frmbtn');	//idx
		    letterc(num, frmbtn);
		});

		// ??????????????? ????????? ?????????????????? ??????
		$("body").on('click', '#delbtn',  function() {
		    var delid = $(this).data('delid');	//letter_id
		    console.log(delid);
		    
		    if(confirm('<spring:message code="letter.confirm.delete"/>') ) {
			    $.ajax({
			    	url:'deleteLetter.do',
			    	type:'post',
			    	data:JSON.stringify({letter_id:delid}),
				    contentType : "application/json; charset=UTF-8",
			    	success: function(data) {
			    		//alert('<spring:message code="letter.delete.success"/>');
			    		location.reload(true);
			    	},
			    	error: function(e) {
			    		alert('<spring:message code="letter.delete.fail"/>');
			    	}
			    });		    	
		    } else {
		    	alert('<spring:message code="letter.confirm.no"/>');
		    }
		});
		
//--------??????START--------------------------------
		$('body').on('click','#rbtn', function() { // ??????????????? ?????????
			var report = $(this).data('report');//name
			var repo = $(this).data('repo'); 	//letter_id
			var sub = $('button[data-report="'+repo+'"]'); //???????????? 
			var radio = $("input:radio[name='"+repo+"']:checked").val(); //????????????
			var txt = "";
			if(radio == '??????') {
				txt = $('input[data-rtxt="'+repo+'"]').val();//????????????
				if(txt=='') {
					alert('<spring:message code="letter.report.text.empty"/>');
					return;
				}
			} else {
				txt = radio;
			}
			if(txt == null) {//?????? ???????????? ????????????
				alert('<spring:message code="letter.report.blank"/>');
				return;
			}
			var chk = $("input:checkbox[data-rchk='"+repo+"']:checked").val(); //????????????
			console.log(report, repo, radio, chk, txt);
			
			if(confirm('<spring:message code="letter.confirm.report"/>')) {
				$.ajax({//?????? ?????? ??????
					url:'${pageContext.request.contextPath}/reportUserCheck.do',
					type:'post',
					data:{content:repo,user_id:'${user.user_id}'},
					success: function(cnt) {
						if(cnt == 0) {
							$.ajax({//???????????? ??????
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
									alert('<spring:message code="letter.report.success"/>');
									location.reload(true);
								},
								error: function(err) {
									alert('<spring:message code="letter.alert.errormsg"/>');
								}
							});
						} else {
							alert('<spring:message code="letter.report.did"/>');
						}
					},
					error: function(e) {
						alert('<spring:message code="letter.alert.errormsg"/>');
					}
				});//$.ajax?????? ?????? ??????
			}
		});//#rbtn,??????????????? ?????????
		
		$('body').on('click','#msg', function() { //????????? ????????? ?????? ????????? ??? ?????????
			var select = $(this);
			var repo = select.attr('name');
			console.log(repo);
			var msg = $("input:radio[name='"+repo+"']:checked").val();
			if(msg == '??????') {
				$('input[data-rtxt="'+repo+'"]').attr('hidden',false);				
			} else {
				$('input[data-rtxt="'+repo+'"]').attr('hidden',true);				
			}
		});
//--------??????END----------------------------------------
//---------?????????-----------------------------------------
		function getTextLength(str) {//??????1, ??????2
		    var len = 0;
		    for (var i = 0; i < str.length; i++) {
		        if (escape(str.charAt(i)).length == 6) {
		            len++;
		        }
		        len++;
		    }
		    return len;
		}
		
		String.prototype.cut = function(len) {//????????? ???????????? ??????????????????
            var str = this;
            var l = 0;
            for (var i=0; i<str.length; i++) {
                    l += (str.charCodeAt(i) > 128) ? 2 : 1;
                    if (l > len) return str.substring(0,i);
            }
            return str;
    	}
		
		$('textarea[data-letter^="letter_"]').each(function(i, el) {
			$(el).keyup(function(e) {
			var content = $(el).val();
			var span = $(el).parent().parent().parent().parent().parent().parent().parent().parent().children().eq(0).children().children();
			span.text(getTextLength(content));
			
				if (getTextLength(content) > 10000) {
					$(el).get(0).blur();
					$(el).val(content.cut(10000));
					$(el).get(0).focus();					
					span.text('10000');
					alert('<spring:message code="letter.alert.max"/>');
					return ;
				}
			});
		});
		
//--------????????????-----------------------------------------
		// ?????? ??????
		$("body").on('click', '#send', function() {
			var send = $(this).data('send'); //letter_id
			var to = $(this).data('to'); //to_id
			var sendbtn = $('button[data-send="'+send+'"]');
			var txtarea = $('textarea[data-letter="'+send+'"]').val();
			console.log(txtarea);
			if(txtarea == "") {
				alert('<spring:message code="letter.alert.blank"/>');
				$('textarea[data-letter="'+send+'"]').focus();
				return ;
			}
			if (getTextLength(txtarea) < 500) {
				alert('<spring:message code="letter.alert.min"/>');
				return ;
			}
			//???????????? ??????
			$.ajax({
				url : '${pageContext.request.contextPath}/stampLetterCheck.do',
				type : 'post',
				data : JSON.stringify({user_id:'${user.user_id}'}),
			    contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data > 0) { //????????? ?????????
						if(confirm('<spring:message code="letter.confirm.send"/>') ) {
							$.ajax({//????????????????????????
								url:'${pageContext.request.contextPath}/cntLetterCheck.do',
								type:'post',
								data:{user_id:'${user.user_id}'},
								success: function(cnt) {
									if(cnt < 5) {//????????? 5?????? ????????????
									    $.ajax({//????????????
									    	url:'${pageContext.request.contextPath}/insertLetter.do',
									    	type:'post',
									    	data:JSON.stringify({
									    		letter_id:send,
									    		to_id:to,
									    		content:txtarea,
									    		gubun:'??????'
									    	}),
										    contentType : "application/json; charset=UTF-8",
									    	success: function(data) {
									    		//alert('<spring:message code="letter.send.success"/>');
									    		location.reload(true);
									    		sendLetterPush(to);
									    	},
									    	error: function(e) {
									    		alert('<spring:message code="letter.send.fail"/>');
									    	}
									    });	//$ajax	   
									} else {
										alert('<spring:message code="letter.send.five"/>');//?????? ?????????
										if(confirm('<spring:message code="letter.confirm.save"/>') ) {
										    $.ajax({
										    	url:'${pageContext.request.contextPath}/insertLetter.do',
										    	type:'post',
										    	data:JSON.stringify({
										    		letter_id:send,
										    		to_id:to,
										    		content:txtarea,
										    		gubun:'????????????'
										    	}),
											    contentType : "application/json; charset=UTF-8",
										    	success: function(data) {
										    		//alert('<spring:message code="letter.save.success"/>');
										    		location.href = '${pageContext.request.contextPath}/savedLetter.do';
										    	},
										    	error: function(e) {
										    		alert('<spring:message code="letter.save.fail"/>');
										    	}
										    });		    	
									    }
									}
								}
							});//$??????????????????	    	
					    } else {
					    	if(confirm('<spring:message code="letter.confirm.save"/>') ) {
							    $.ajax({
							    	url:'${pageContext.request.contextPath}/insertLetter.do',
							    	type:'post',
							    	data:JSON.stringify({
							    		letter_id:send,
							    		to_id:to,
							    		content:txtarea,
							    		gubun:'????????????'
							    	}),
								    contentType : "application/json; charset=UTF-8",
							    	success: function(data) {
							    		//alert('<spring:message code="letter.save.success"/>');
							    		location.href = '${pageContext.request.contextPath}/savedLetter.do';
							    	},
							    	error: function(e) {
							    		alert('<spring:message code="letter.save.fail"/>');
							    	}
							    });		    	
						    } else {
						    	alert('<spring:message code="letter.confirm.save.no"/>');
						    }
					    }
					} else { //????????? ?????????
						alert('<spring:message code="letter.stamp.check"/>');
						if(confirm('<spring:message code="letter.confirm.save"/>') ) {
						    $.ajax({
						    	url:'${pageContext.request.contextPath}/insertLetter.do',
						    	type:'post',
						    	data:JSON.stringify({
						    		letter_id:send,
						    		to_id:to,
						    		content:txtarea,
						    		gubun:'????????????'
						    	}),
							    contentType : "application/json; charset=UTF-8",
						    	success: function(data) {
						    		//alert('<spring:message code="letter.save.success"/>');
						    		location.href = '${pageContext.request.contextPath}/savedLetter.do';
						    	},
						    	error: function(e) {
						    		alert('<spring:message code="letter.save.fail"/>');
						    	}
						    });		    	
					    }
					}
				},
				error : function(e) {
					alert('<spring:message code="letter.alert.errormsg"/>');
				}
			});
			

		});
		
	});// $(function()..end

	// ??????????????? ??????
	function add(id, idx) {
		var lid = $("#letter"+id).val();
	    var result = lid.split(".");
	    console.log(result);
		
		var div = $('#tbl'+id);
		var tbl = $('<table>');

		// ????????? ?????????
		let thead = ['','']
		var head = $('<tr>');
		for (var field in thead) {
			var name = $('<td>').text(thead[field].trim());
			head.append(name);
		}
		tbl.append(head);
		div.append(tbl);
		
		// ?????? ????????? ??????
		var rownum = 1;
		var num = 0;
		for(var i=0; i < result.length; i++) {
			if(result[i].length != 0) { // ???????????? ?????????????????????
				num = i;
				var tr = $('<tr>');
// 				tr.append($('<td>').append(rownum+i)); //?????????
				tr.append($('<td data-cont="'+i+'">').append(result[i]));
// 				tr.append($('<td>').append($('<button type="button" id="btnc" data-btnc="'+i+'">').text('??????')));
				tr.append($('<td>').append($('<textarea id="correcting" data-corr="'+i+'">').val(result[i])));
				tbl.append(tr);			
			}
		}
		console.log('rnum:',rownum);
		var tr2 = $('<tr>');
		var col = $('<td colspan="3">');
		var submit = $('<button type="button" id="frmBtn" data-num="'+num+'" data-frmbtn="'+idx+'">').text('??????');
		col.append(submit);
		tr2.append(col);
		tbl.append(tr2)
		div.append(tbl);
		var tblBtn = $('button[data-coridx="'+idx+'"]'); // ??????????????? ?????? ?????? ??????
		tblBtn.remove();
	} //function add
	
	function letterc(row, idx) {
	    var corr = ""; // ????????????
	    var cont = ""; // ?????????
		for (var i=0; i <= row; i++) {
			if(i == row) {
				corr += $('textarea[data-corr="'+i+'"]').val().replace(/,/g, "");
				cont += $('td[data-cont="'+i+'"]').text().replace(/,/g, "");
			} else {
				corr += $('textarea[data-corr="'+i+'"]').val().replace(/,/g, "")+".,";
				cont += $('td[data-cont="'+i+'"]').text().replace(/,/g, "")+".,";
			}
		}
		var letter = $('input[data-leid="'+idx+'"]').val(); //????????????
		
		var rows = ""; // ??????????????? ????????? ???????????? ?????????
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
				//alert('<spring:message code="letter.corr.success"/>');
				$('#tbl'+letter).remove(); // ?????? ????????? ??????
				location.reload(true);
			},error:function(e){
				console.log(e);
			}
		});
	} //function letterc
</script>
</head>
<body>
<input type="hidden" id="user_id" value="${user.user_id }">
	<div class="inbox-wrapper">
		<div class="inbox-wrapper-inner">
			<!-- LEFT SIDEBAR  -->
			<div class="inbox-left-sidebar">
				<div class="inbox-left-sidebar-inner ">
					<!-- MENU -->
					<div class="left-menu" style="overflow: auto;">
						<a href="${pageContext.request.contextPath}/letterBox.do" class="item is-active">
							<span class="name"><spring:message code="letter.sidebar.new"/></span>
						</a>
						<a href="${pageContext.request.contextPath}/savedLetter.do" class="item">
							<span class="name"><spring:message code="letter.sidebar.save"/></span>
						</a>
						<c:if test="${!empty friends }">
						<c:forEach items="${friends }" var="vo">	
							<c:if test="${vo.cnt ne 1 }">				
							<a data-id="${vo.user_id}" class="item">
								<span class="name">${vo.name }</span>
								<c:if test="${vo.status eq '????????????' or vo.status eq '????????????'}">
									<span>
										<svg
										viewBox="0 0 24 24" width="15" height="15"
										stroke="currentColor" stroke-width="2"
										fill="none" stroke-linecap="round"
										stroke-linejoin="round" class="css-i6dzq1">
										<line x1="18" y1="6" x2="6" y2="18"></line>
										<line x1="6" y1="6" x2="18" y2="18"></line></svg>
									</span>
								</c:if>
							</a>
							</c:if>
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
						<spring:message code="letter.sidebar.close"/> 
						</a>
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
						<div class="control is-grouped">
							<a class="button" href="javascript:location.reload()"> <svg
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
						</div>
						</div>
						<!-- /BUTTON GROUP -->
					</div>

						<!-- MESSAGES LIST -->
						<!-- MESSAGE CARDS -->
						<c:choose>
						<c:when test="${!empty newLetter }">
							<div id="inbox-messages" class="inbox-messages has-slimscroll">
								<div class="inbox-messages-inner">
								<c:forEach items="${newLetter }" var="vo" varStatus="status">
								<fmt:formatDate value="${vo.arrive_date }" pattern="yyyy/MM/dd HH:mm" var="arrive_dt"/>
									<div id="msg-card-${status.index }" data-preview-id="${status.index }"
										class="card is-msg has-attachment">
										<div class="card-content">
											<c:if test="${ arrive_dt <= today }">
											<span class="msg-timestamp"> <fmt:formatDate value="${vo.arrive_date }" pattern="yy/MM/dd HH:mm"/>  <img
												src="${pageContext.request.contextPath}/resources/template/assets/img/letter/stamp.png">
											</span>
											</c:if>
											<c:if test="${ arrive_dt > today }">
											<!-- ?????????????????? -->
											<fmt:parseDate var="startDate_D" value="${arrive_dt }" pattern="yy/MM/dd HH:mm"/>
											<fmt:parseDate var="endDate_D" value="${today }"  pattern="yy/MM/dd HH:mm"/>
											<fmt:parseNumber var="startDate_N" value="${startDate_D.time}" integerOnly="true" />
											<fmt:parseNumber var="endDate_N" value="${endDate_D.time}" integerOnly="true" /> 
											
											<!-- ???????????? -->
											<c:set var="datetime" value="${ (startDate_N - endDate_N)/( 60 * 60 * 1000 ) }" />
											<fmt:parseNumber var="percent" value="${datetime }" integerOnly="true" />
											<fmt:parseNumber var="percent2" value="${ datetime + ((1-(datetime%1))%1) }" integerOnly="true" /><!-- ?????? -->								
											
											<c:if test="${percent ne 0}">
											<span class="msg-timestamp">${percent }<spring:message code="letter.in.hour"/>
											<img src="${pageContext.request.contextPath}/resources/template/assets/img/letter/stamp.png">
											</span>
											</c:if>
											
											<c:if test="${percent eq 0}">
											<span class="msg-timestamp"><spring:message code="letter.within.hour"/>
											<img src="${pageContext.request.contextPath}/resources/template/assets/img/letter/stamp.png">
											</span>											
											</c:if>
											</c:if>
											<div class="msg-header">
												<div class="user-image">
													<c:if test="${vo.uuid ne '-' }">
														<img
															style="width: 48px; height: 48px; border-radius: 50%; display: inline-block;"
															src="${pageContext.request.contextPath}/resources/upload/${vo.uuid }" alt="friends"
     														onclick="location.href='${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }'">									
													</c:if>
													<c:if test="${vo.uuid eq '-' }">										
														<img
															style="width: 48px; height: 48px; border-radius: 50%; display: inline-block;"
															src="https://via.placeholder.com/400x400" alt="friends">
													</c:if>	
													<span class="msg-from"
														style="vertical-align: top; margin-left: 5px;"> <small><a>${vo.name }</a><img src="https://image.flaticon.com/icons/png/512/3925/3925153.png" width="20"></small>
													</span>
												</div>
											</div>
											<br>
											<div class="msg-snippet">
											<c:if test="${arrive_dt <= today }">
												<p>${vo.content }</p>
											</c:if>
											<c:if test="${arrive_dt > today }">
												<p><spring:message code="letter.to.msg"/></p>
											</c:if>		
											</div>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<p></p>
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
								<a class="button" href="javascript:window.print()"><svg viewBox="0 0 24 24" width="24"
										height="24" stroke="currentColor" stroke-width="2" fill="none"
										stroke-linecap="round" stroke-linejoin="round"
										class="css-i6dzq1">
										<polyline points="6 9 6 2 18 2 18 9"></polyline>
										<path
											d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
										<rect x="6" y="14" width="12" height="8"></rect></svg> </a>
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
					<c:when test="${!empty newLetter }">
					<div class="message-body has-slimscroll">
					<c:forEach items="${newLetter }" var="vo" varStatus="status">
					<fmt:formatDate value="${vo.arrive_date }" pattern="yyyy/MM/dd HH:mm" var="arrive_dt"/>
					<div id="message-preview-${status.index }" class="message-body-inner">
						<c:if test="${arrive_dt <= today }">
						<div class="box message-preview">
							<div class="box-inner">
								<div class="header">
									<div class="avatar" onclick="location.href='${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }'">
										<c:if test="${vo.uuid ne '-' }">
											<img src="${pageContext.request.contextPath}/resources/upload/${vo.uuid }"
												alt=""
												data-user-popover="1">										
										</c:if>
										<c:if test="${vo.uuid eq '-' }">
											<img src="https://via.placeholder.com/300x300"
												data-demo-src="assets/img/avatars/dan.jpg" alt=""
												data-user-popover="1">										
										</c:if>		
									</div>
									<div class="meta">
										<div class="name">${vo.name }</div>
										<div class="date"><fmt:formatDate value="${vo.arrive_date }" pattern="yy/MM/dd HH:mm"/> </div>
									</div>
									<div class="meta-right">
								<!-- report Btn -->
				               	<div class="navbar-item is-icon drop-trigger" id="drop">
            					<a class="icon-link" id="btnModal" href="javascript:void(0);">
                                 <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                    <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                                    <line x1="12" y1="9" x2="12" y2="13"></line>
                                    <line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
                             	</a>
               					<div class="nav-drop is-account-dropdown is-active">
		                     	<div class="inner">
		                        <div class="nav-drop-header">
		                           <span><spring:message code="letter.report.title"/></span>
		                        </div>
		                        <div class="nav-drop-body is-friend-requests" id="replyB" style="overflow:scroll;height:200px;">
	                        	<table>
	                        	<tr>
                        		<td>
                        		<input type="radio" id="msg" name="${vo.letter_id }" value="?????? ?????????"><spring:message code="letter.report.content"/>
                        		</td>
	                        	</tr>
	                        	<tr>
                        		<td>
								<input type="radio" id="msg" name="${vo.letter_id }" value="???????????? ??????"><spring:message code="letter.report.lie"/>
                        		</td>
	                        	</tr>
	                        	<tr>
                        		<td>
								<input type="radio" id="msg" name="${vo.letter_id }" value="????????? ??????"><spring:message code="letter.report.sexual"/>
                        		</td>
	                        	</tr>
	                        	<tr>
                        		<td>
								<input type="radio" id="msg" name="${vo.letter_id }" value="???????????? ????????? ??????"><spring:message code="letter.report.date"/>
                        		</td>
	                        	</tr>
	                        	<tr>
                        		<td>
								<input type="radio" id="msg" name="${vo.letter_id }" value="??????/??????"><spring:message code="letter.report.word"/>
                        		</td>
	                        	</tr>
	                        	<tr>
                        		<td>
								<input type="radio" id="msg" name="${vo.letter_id }" value="??????"><spring:message code="letter.report.etc"/>
                        		</td>
	                        	</tr>
	                        	<tr>
                        		<td>
								<spring:message code="letter.report.input.placeholder" var="placeholder1" />
								<input data-rtxt="${vo.letter_id }" placeholder="${placeholder1 }" hidden="true" maxlength="30"></input>
                        		</td>
	                        	</tr>
	                        	</table>
		                        </div>
		                        <div class="nav-drop-footer">
		                        <input type="checkbox" id="blocked" data-rchk="${vo.letter_id }" value="${vo.user_id }">${vo.name } <spring:message code="letter.report.block"/>
								<button id="rbtn" data-repo="${vo.letter_id }" data-report="${vo.user_id }"><spring:message code="letter.btn.report"/></button>
		                        </div>
		                        </div>
			                   </div>               
              					</div>
              					<!-- /report Btn -->
									</div>
								</div>
	
								<hr>
								<div class="content">
									<p style="word-wrap:break-word; white-space: pre-line;">${vo.content }</p>
									<input type="hidden" id="trans${status.index }" value="${vo.content }">
									<input type="hidden" id="letter${vo.letter_id }" value="${vo.content }">
									<div id="tdiv${status.index }"></div>
									<input type="hidden" data-leid="${status.index}" value="${vo.letter_id }">
									<div id="tbl${vo.letter_id }"></div>
								</div>
								<div class="has-text-right" id="btn">
									<button class="button is-solid grey-button is-bold raised">
										<select id="transOpt" data-transopt="${status.index }" class="select">
											<option value="" hidden=""><spring:message code="letter.select.option.hidden"/></option>
											<option value="KR"><spring:message code="letter.select.option.ko"/></option>
											<option value="EN"><spring:message code="letter.select.option.en"/></option>
										</select>
									</button>
									<button class="button is-solid grey-button is-bold raised" id="corbtn" data-corid="${vo.letter_id }" data-coridx="${status.index }">
									<spring:message code="letter.btn.corr"/>
									</button>
									<button class="button is-solid grey-button is-bold raised" id="delbtn" data-delid="${vo.letter_id }">
									<spring:message code="letter.btn.del"/>
									</button>
								</div>
						</div>
						</div>
						</c:if>
						<!-- ???????????? -->
						<c:if test="${arrive_dt <= today and vo.name ne user.name }">
						<div class="reply-wrapper">
							<div class="reply-title">
							<spring:message code="letter.title.write"/>
							<div class="right">
								(<span>0</span> / 10000)
							</div>
							</div>
							<div class="reply-wrapper-inner">
								<div class="flex-form">
									<div class="control">
										<table>
										<tr>
										<td>
											<spring:message code="letter.textarea.placeholder" var="placeholder2" />
											<textarea data-letter="${vo.letter_id }" rows="20" cols="20" placeholder="${placeholder2 }"></textarea>
										</td>
										</tr>
										</table>
									</div>
								</div>
								<div class="has-text-left">
									<button id="send" data-send="${vo.letter_id  }" data-to="${vo.user_id }" type="button"
										class="button is-solid accent-button is-bold raised send-message">
										<spring:message code="letter.btn.send"/>
									</button>
								</div>
							</div>
						</div>
						</c:if>
						<!-- /???????????? -->
						<!-- ?????????????????? -->
							<c:choose>
							<c:when test="${arrive_dt <= today and !empty lettercs and vo.cor_yn eq 'Y'}">
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
                           	<!-- /?????????????????? -->
						</div>				
					</c:forEach>
					</div>
					</c:when>
					<c:otherwise>
						<p></p>
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