<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항작성</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
</head>
<body>
	<div class="view-wrapper is-full" >

		<!-- 컨텐츠 시작 -->
		<div class="inner-wrapper" style="width: 80%">

			<div class="settings-wrapper">
				<form id="frm" action="${pageContext.request.contextPath}/userQnaInsert.do" enctype="multipart/form-data" method="post">
					<div id="general-settings" class="settings-section is-active">
						<div class="settings-panel">

							<div class="title-wrap">
								<a class="mobile-sidebar-trigger"> <i data-feather="menu"></i>
								</a>
								<h2>Q&A 작성</h2>
							</div>

							<div class="settings-form-wrapper">
								<div class="settings-form">
									<div class="columns is-multiline">

										<div class="column is-6">
											<!--Field-->
											<div class="field field-group">
												<label>Name</label>
												<div class="control has-icon">
													<input type="text" class="input is-fade" id="name" name="name" placeholder="이름을 입력해주세요." required="required">
													<div class="form-icon">
														<i data-feather="user"></i>
													</div>
												</div>
											</div>
											
										</div>

										<div class="column is-6">
											<!--Field-->
											<div class="field field-group">
												<label>Email</label>
												<div class="control has-icon">
													<input type="text" class="input is-fade" id="email" name="email" placeholder="회신 받을 이메일을 입력하세요." required="required">
													<div class="form-icon">
														<i data-feather="user"></i>
													</div>
												</div>
											</div>
										</div>

										<div class="column is-12">
											<!--Field-->
											<div class="field field-group">
												<label>Content</label>
												<div class="control">
													<textarea type="text" class="textarea is-fade" rows="5"
														placeholder="여기에 내용을 작성해 주세요" required="required" id="content" name="content"></textarea>
												</div>
											</div>
										</div>

										<div class="column is-12">
											<div class="buttons">
												<button type="button" id="btnQnaSubmit" class="button is-solid accent-button form-button">작성하기</button>
												<button class="button is-light form-button" onclick="history.back()">뒤로가기</button>
											</div>
										</div>

									</div>
								</div>

								<div class="illustration">
									<img class="light-image"
										src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/settings/1.svg" alt=""> <img
										class="dark-image"
										src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/settings/1-dark.svg" alt="">
									<p>
										궁금한 사항이 있으시면 문의해주세요.
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