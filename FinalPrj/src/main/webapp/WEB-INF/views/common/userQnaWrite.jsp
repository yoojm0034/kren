<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script>
  $(function() {
	$('#btnQnaSubmit').click(function(){
		if(frm.name.value == ""){
			alert("이름를 입력하세요");
			frm.name.focus();
			return false;
		}
		if(frm.email.value == ""){
			alert("이메일을 입력하세요");
			frm.email.focus();
			return false;
		}
		if(frm.content.value == ""){
			alert("내용 입력하세요");
			frm.content.focus();
			return false;
		}
		var con = confirm("문의사항을 작성하시겠습니까?");
		if(con == true){
		  alert("작성되었습니다.");
		  frm.submit();
		}
		else if(con == false){
		  alert("취소되었습니다.");
		  window.reload();
		}
		
	})
  })	
</script>
<style>

.settings-wrapper .settings-section .settings-panel .settings-form-wrapper .illustration img {
	max-width: none;
}

.settings-wrapper {
    box-shadow: 0 0 19px 4px #b2b2b2;
}

.title {
	font-family: 'ONE-Mobile-Regular';
    color: #616161;
    font-weight: 600;
    font-size: 1.5rem;
    padding: 15px 0 15px 0;
}
</style>
</head>
<body>
	<div class="view-wrapper is-full" >
		<!-- 컨텐츠 시작 -->
		<div class="inner-wrapper" style="width: 60%; margin:auto; padding-top: 40px;">

			<div class="settings-wrapper">
				<form id="frm" action="${pageContext.request.contextPath}/userQnaInsert.do" enctype="multipart/form-data" method="post">
					<div id="general-settings" class="settings-section is-active">
						<div class="settings-panel">

							<div class="title-wrap">
								<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
								</a>
								<p class="title">문의하기</p>
							</div>

							<div class="settings-form-wrapper">
								<div class="settings-form">
									<div class="columns is-multiline">

										<div class="column is-6">
											<!--Field-->
											<div class="field field-group">
												<div class="control">
													<label>Name</label>
													<input type="text" class="input is-fade" id="name" name="name" placeholder="이름을 입력해주세요." required="required">
												</div>
											</div>
											
										</div>

										<div class="column is-6">
											<!--Field-->
											<div class="field field-group">
												<div class="control">
													<label>Email</label>
													<input type="text" class="input is-fade" id="email" name="email" placeholder="회신 받을 이메일을 입력하세요." required="required">
												</div>
											</div>
										</div>

										<div class="column is-12">
											<!--Field-->
											<div class="field field-group">
												<div class="control">
												<label>Content</label>
													<textarea class="textarea is-fade" rows="8" placeholder="여기에 내용을 작성해 주세요" 
													required="required" id="content" name="content" style="resize: none;"></textarea>
												</div>
											</div>
										</div>

										<div class="column is-12">
											<div class="buttons" style="justify-content: center;">
												<c:if test="${not empty user.user_id}">
													<button class="button is-light form-button" onclick="history.back()">뒤로가기</button>
												</c:if>
												<button type="button" id="btnQnaSubmit" class="button is-solid accent-button form-button">작성하기</button>
											</div>
										</div>

									</div>
								</div>

								<div class="illustration" style="padding: 20px">
									<img class="light-image" src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/placeholders/1.svg" width="300px"> 
									<img class="dark-image" src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/placeholders/1.svg" width="300px">
									<br>
									<p>
										※궁금한 사항이 있으시면 문의해주세요.<br>
										※이메일은 정확하게 입력해주세요.
									</p>
								
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 컨텐츠 종료 -->


	</div>


</body>
</html>