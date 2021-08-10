<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			alert('내용을 입력하세요.');
			$('#text').focus();
			return ;
		}
		if(confirm("편지를 저장하시겠습니까?") ) {
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
		    		alert('편지가 저장되었습니다.');
		    		opener.parent.location.href = '${pageContext.request.contextPath}/savedLetter.do';
		    		window.close();
		    	},
		    	error: function(e) {
		    		alert('저장실패');
		    	}
		    });		    	
	    }
	});

	// 편지 입력
	$('#send').on('click',function() {
		content = $('#text').val();
		if(content == "") {
			alert('내용을 입력하세요.');
			$('#text').focus();
			return ;
		}
		//우표수량 체크
		$.ajax({
			url : '${pageContext.request.contextPath}/stampLetterCheck.do',
			type : 'post',
			data : JSON.stringify({user_id:user_id}),
		    contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if (data > 0) { //우표가 있으면
					if(confirm("편지를 전송하시겠습니까?") ) {
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
								    		alert('전송되었습니다.');
								    		sendLetterPush(toid);
								    		opener.parent.location.reload();
								    		window.close();
								    	},
								    	error: function(e) {
								    		alert('편지전송실패');
								    	}
							    	});//$ajax	   
								} else {
									alert('편지전송횟수 초과!');
								}
							}
						});//$편지전송횟수	    	
				    } else {
				    	if(confirm("편지를 저장하시겠습니까?") ) {
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
						    		alert('편지가 저장되었습니다.');
						    		location.href = '${pageContext.request.contextPath}/savedLetter.do';
						    		window.close();
						    	},
						    	error: function(e) {
						    		alert('저장실패');
						    	}
						    });		    	
					    } else {
					    	alert("편지작성이 취소되었습니다.");
					    }
				    }
				} else { //우표가 없으면
					alert('우표수량을 확인해주세요.');
					if(confirm("편지를 저장하시겠습니까?") ) {
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
					    		alert('편지가 저장되었습니다.');
					    		opener.parent.location.href = '${pageContext.request.contextPath}/savedLetter.do';
					    		window.close();
					    	},
					    	error: function(e) {
					    		alert('저장실패');
					    	}
					    });		    	
				    }
				}
			},
			error : function(e) {
				alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
			}
		});
	});
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
					<button id="save" class="button">임시저장</button>
					<button id="send" class="button is-solid primary-button raised">편지 보내기</button>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>