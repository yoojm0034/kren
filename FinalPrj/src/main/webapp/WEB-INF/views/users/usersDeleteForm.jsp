<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test</title>
<style>
	h3 { font-size: 1.5rem; font-weight: 600;}
	
	.policy { line-height: 2rem; }
	
	.button { font-family: 'ONE-Mobile-Regular'}
	
	#qna { font-size: 1.1rem; width: 150px}
</style>
</head>
<script>
$(function() {
	$('#deleteBtn').click(function() {
		//약관동의여부 확인
		if($("input:checkbox[name=agree]").is(":checked") == true) {
			if (confirm("정말로 탈퇴하시겠습니까? \n탈퇴 요청은 되돌릴 수 없습니다.")) {
				$.ajax({
					url: '${pageContext.request.contextPath}/usersDelete.do',
			    	type:'post',
					success: function(result) {
						console.log(result);
						if (result > 0) { 
							alert("탈퇴처리 되었습니다.");
							location.href = "${pageContext.request.contextPath}/empty/home.do"
						}
					},
					error : function(err) {
						alert('에러가 발생했습니다. 관리자에게 문의해주세요.');
					}
				});
			}
		} else
			alert("약관에 동의하지 않으셨습니다.");
	})
});
</script>
<body>
<div align="center">
	<img src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/placeholders/2.svg" width="350px">
	<div class="policy">
		<h3>정말로 떠나실건가요?</h3><br>
		<p><b>계정의 정보를 포함한 모든 데이터는 절대로 복구되지 않습니다.</b></p>
		<p>계정과 관련한 문제가 있다면 저희 KREN팀에게 알려주시면 도와드리겠습니다.</p><br>
		<button class="button is-solid dark-grey-button raised" id="qna" onclick="location.href='userQnaWrite.do'">문의하기</button><br><br><br>
		<div class="basic-checkbox">
	        <input class="styled-checkbox" id="styled-checkbox-2" name="agree" type="checkbox">
	        <label for="styled-checkbox-2">탈퇴 약관에 동의합니다.</label>
    	</div>
    	<br>
		<button class="button is-solid dark-grey-button raised" onclick="javascript:history.back();">뒤로가기</button>
		<button class="button is-solid primary-button raised" id="deleteBtn">계정삭제</button>
	</div>
</div>
</body>
</html>