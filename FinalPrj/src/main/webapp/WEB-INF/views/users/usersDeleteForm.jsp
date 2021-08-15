<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
			if (confirm('<spring:message code="usersDelete.alert.comfirm"/>')) {
				$.ajax({
					url: '${pageContext.request.contextPath}/usersDelete.do',
			    	type:'post',
					success: function(result) {
						console.log(result);
						if (result != 0) { 
							alert('<spring:message code="usersDelete.alert.success"/>');
							location.href = "${pageContext.request.contextPath}/home.do"
						}
					},
					error : function(err) {
						alert('<spring:message code="errormsg"/>');
					}
				});
			}
		} else
			alert('<spring:message code="usersDelete.alert.agree"/>');
	})
});
</script>
<body>
<div align="center">
	<img src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/placeholders/2.svg" width="350px">
	<div class="policy">
		<h3><spring:message code="usersDelete.msg1"/></h3><br>
		<p><b><spring:message code="usersDelete.msg2"/></b></p>
		<p><spring:message code="usersDelete.msg3"/></p><br>
		<button class="button is-solid dark-grey-button raised" id="qna" onclick="location.href='userQnaWrite.do'"><spring:message code="head.contact"/></button><br><br><br>
		<div class="basic-checkbox">
	        <input class="styled-checkbox" id="styled-checkbox-2" name="agree" type="checkbox">
	        <label for="styled-checkbox-2"><spring:message code="usersDelete.agree"/></label>
    	</div>
    	<br>
		<button class="button is-solid dark-grey-button raised" onclick="javascript:history.back();"><spring:message code="usersDelete.goback"/></button>
		<button class="button is-solid primary-button raised" id="deleteBtn"><spring:message code="btn.deleteAccount"/></button>
	</div>
</div>
</body>
</html>