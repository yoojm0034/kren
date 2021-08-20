<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/core.css">
<style>

@font-face {
    font-family: 'Dolbomche_R';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/Dolbomche_R.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	background-image:
		url(${pageContext.request.contextPath}/resources/template/assets/img/letter/postcard.png);
	background-repeat: no-repeat;
	font-family:'Dolbomche_R';
}

.wrap {
	width: 830px;
	height: 550px;
}

.contents {
	position: absolute;
	top: 80px;
	left: 30px;
	width: 800px;
	height: 450px;
}

.bold {
	font-size: 24px;
	font-weight: 600;
	padding: 10px 0px 10px 5px;
}

.letter {
	margin: 0px;
	width: 780px;
	height: 331px;
	resize: none;
	overflow: auto;
	border: 0;
	background-color: transparent;
	outline: none;
	font-family:'Dolbomche_R';
	font-size: 16px;
	padding: 10px;
}

.left { float:left; }
.right { float:right; margin-right:20px;}
.button { font-size: 1rem }

</style>
<script>
$(function () {
	let toid = opener.document.getElementById('to_id').value;
	let user_id = opener.document.getElementById('user_id').value;
	let name = opener.document.getElementById('name').value;
	let toname = opener.document.getElementById('to_name').value;
	let content = $('#text').val();
	
	let to = $('#to');
	let from = $('#from');
	to.text('TO.'+toname);
	from.text('FROM.'+name);	
	console.log(toid, user_id, content, name, toname);

	//편지저장
	$('#save').on('click',function() {
		content = $('#text').val();
		if(content == "") {
			alert('<spring:message code="letter.alert.blank"/>');
			$('#text').focus();
			return ;
		}
		if(confirm('<spring:message code="letter.confirm.save"/>') ) {
		    $.ajax({
		    	url:'${pageContext.request.contextPath}/insertLetter.do',
		    	type:'post',
		    	data:JSON.stringify({
		    		to_id:toid,
		    		content:content,
		    		gubun:'임시저장'
		    	}),
			    contentType : "application/json; charset=UTF-8",
		    	success: function(data) {
		    		alert('<spring:message code="letter.save.success"/>');
		    		opener.parent.location.href = '${pageContext.request.contextPath}/savedLetter.do';
		    		window.close();
		    	},
		    	error: function(e) {
		    		alert('<spring:message code="letter.save.fail"/>');
		    	}
		    });		    	
	    }
	});
//---------글자수--------------------------------
	function getTextLength(str) {
	    var len = 0;
	    for (var i = 0; i < str.length; i++) {
	        if (escape(str.charAt(i)).length == 6) {
	            len++;
	        }
	        len++;
	    }
	    return len;
	}

	String.prototype.cut = function(len) {//원하는 크기대로 문자열자르기
	    var str = this;
	    var l = 0;
	    for (var i=0; i<str.length; i++) {
	            l += (str.charCodeAt(i) > 128) ? 2 : 1;
	            if (l > len) return str.substring(0,i);
	    }
	    return str;
	}

	$('#text').keyup(function(e) {
		var content = $(this).val();
		var span = $('#textCnt');
		span.text(getTextLength(content));
		
		if (getTextLength(content) > 10000) {
			$(this).get(0).blur();
			$(this).val(content.cut(10000));
			$(this).get(0).focus();					
			span.text('10000');
			alert('<spring:message code="letter.alert.max"/>');
			return ;
		}
	});

//--------편지입력--------------------------------
	$('#send').on('click',function() {
		content = $('#text').val();
		if(content == "") {
			alert('<spring:message code="letter.alert.blank"/>');
			$('#text').focus();
			return ;
		}
		if (getTextLength(content) < 500) {
			alert('<spring:message code="letter.alert.min"/>');
			return ;
		}
		
		//오늘 보낸 내역이 있는지
		$.ajax({
			url:'${pageContext.request.contextPath}/letterTodayHistory.do',
			type:'post',
			data:{user_id:user_id,to_id:toid},
			success:function(today) {
				if(today < 1) {//오늘 안보냈으면
					//우표수량 체크
					$.ajax({
						url : '${pageContext.request.contextPath}/stampLetterCheck.do',
						type : 'post',
						data : JSON.stringify({user_id:user_id}),
					    contentType : "application/json; charset=UTF-8",
						success : function(data) {
							if (data > 0) { //우표가 있으면
								if(confirm('<spring:message code="letter.confirm.send"/>') ) {
									$.ajax({//편지전송횟수체크
										url:'${pageContext.request.contextPath}/cntLetterCheck.do',
										type:'post',
										data:{user_id:'${user.user_id}'},
										success: function(cnt) {
											if(cnt < 5) {//하루에 5통만 전송가능
											    $.ajax({//편지작성
											    	url:'${pageContext.request.contextPath}/insertLetter.do',
											    	type:'post',
											    	data:JSON.stringify({
											    		to_id:toid,
											    		content:content,
											    		gubun:'일반'
											    	}),
												    contentType : "application/json; charset=UTF-8",
											    	success: function(data) {
											    		alert('<spring:message code="letter.send.success"/>');
											    		sendLetterPush(toid);
											    		opener.parent.location.reload();
											    		window.close();
											    	},
											    	error: function(e) {
											    		alert('<spring:message code="letter.send.fail"/>');
											    	}
										    	});//$ajax	   
											} else {
												alert('<spring:message code="letter.send.five"/>');
											}
										}
									});//$편지전송횟수	    	
							    } else {
							    	if(confirm('<spring:message code="letter.confirm.save"/>') ) {
									    $.ajax({
									    	url:'${pageContext.request.contextPath}/insertLetter.do',
									    	type:'post',
									    	data:JSON.stringify({
									    		to_id:to,
									    		content:content,
									    		gubun:'임시저장'
									    	}),
										    contentType : "application/json; charset=UTF-8",
									    	success: function(data) {
									    		alert('<spring:message code="letter.save.success"/>');
									    		location.href = '${pageContext.request.contextPath}/savedLetter.do';
									    		window.close();
									    	},
									    	error: function(e) {
									    		alert('<spring:message code="letter.save.fail"/>');
									    	}
									    });		    	
								    } else {
								    	alert('<spring:message code="letter.confirm.save.no"/>');
								    }
							    }
							} else { //우표가 없으면
								alert('<spring:message code="letter.stamp.check"/>');
								if(confirm('<spring:message code="letter.confirm.save"/>') ) {
								    $.ajax({
								    	url:'${pageContext.request.contextPath}/insertLetter.do',
								    	type:'post',
								    	data:JSON.stringify({
								    		to_id:to,
								    		content:content,
								    		gubun:'임시저장'
								    	}),
									    contentType : "application/json; charset=UTF-8",
								    	success: function(data) {
								    		alert('<spring:message code="letter.save.success"/>');
								    		opener.parent.location.href = '${pageContext.request.contextPath}/savedLetter.do';
								    		window.close();
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
				} else {//오늘 보냈으면
					alert('<spring:message code="letter.popup.today.send"/>');
				}
			},
			error:function(e) {
				alert('<spring:message code="letter.alert.errormsg"/>');
			}
		});//$.ajax오늘보낸내역
	});//전송클릭이벤트
})

</script>
</head>
<body>
	<div class="wrap">
		<div class="contents">
			<div class="bold"><span id="to">To.</span></div>
			<div>
				<textarea class="letter" id="text" placeholder="write letter"></textarea>
			</div>
			<div class="bold">
				<div class="left"><span id="from">From.</span></div>	
				<div class="right">
					(<span id="textCnt">0</span> / 10000)
					<button id="save" class="button"><spring:message code="letter.btn.save"/></button>
					<button id="send" class="button is-solid primary-button raised"><spring:message code="letter.btn.send"/></button>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>