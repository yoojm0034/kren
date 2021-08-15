<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>findPW</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/template/assets/img/favicon.png" />
<!-- Core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/core.css">
<link
	href="${pageContext.request.contextPath}/resources/template/assets/nicelabel/css/jquery-nicelabel.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/template/assets/nicelabel/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/assets/nicelabel/js/jquery.nicelabel.js"></script>
</head>
<body>
<script>
	//아이디 체크 버튼...
	$(function(){
		$("#findPw2Btn").on("click", function(){
			var id = $('#id').val();
			
			if(id == ""){
				alert('아이디를 입력하세요.');
				$('#id').focus();
				return false;
			}
			
			$.ajax({
					url: 'idCheck.do',
					data: { user_id: $('#id').val() },
					success: function(res){ //res= 컨트롤러에서 넘어오는 값
						if(res == true){
							//이메일 입력창 떠야함
							
							alert('존재하는 회원 아이디입니다.');
						}else{
							alert('존재하지 않는 회원 아이디입니다. 회원가입을 진행해주세요.');
						}
					},
					error: function(error){
						alert('관리자에게 문의 요망');
					}
			});
		});
	});

	//이메일 체크 버튼...
	$(function() {
	  $("#findPwBtn").on("click", function(){
		  var mail = $('#email').val();
		  
		//이메일 입력을 하지 않고 버튼을 누를 경우...
		if(mail == ""){
			alert('이메일을 입력하세요.');
			$('#email').focus();
			return false;
		}
		
		//이메일 DB 비교...
			$.ajax({
				url: 'pwSendMail.do',
				data: { email: $('#email').val() },
				success: function(res){ //res= 컨트롤러에서 넘어오는 값
					if(res == 1){
						//회원정보와 동일한 이메일이 존재할 경우...
						alert('임시 비밀번호가 이메일로 발송되었습니다.');
					}else{
						//동일 이메일이 없을 경우...
						alert('입력한 이메일 주소로 회원이 조회되지 않습니다. 회원가입을 진행해주세요.');
					}
				},
				error: function(error){
					alert('관리자에게 문의 요망');
				}
			});
		});
	});
</script>
<!-- Pageloader -->
    <div class="pageloader"></div>
    <div class="infraloader is-active"></div>
    <div class="signup-wrapper">
		<div class="fake-nav">
			<a href="${pageContext.request.contextPath}/home.do" class="logo"> <img
				src="${pageContext.request.contextPath}/resources/template/assets/img/logo/logo2.png" width="112"
				height="28" alt="">
			</a>
		</div>
        <div class="container">
            <!--Container-->
            <div class="login-container is-centered">
                <div class="columns is-vcentered">
                    <div class="column">

                        <h2 class="form-title has-text-centered">Find PASSWORD</h2>
                        <h3 class="form-subtitle has-text-centered">Checking your Email/ID.</h3>

                        <!--Form-->
                        <div class="login-form">
                            <div class="form-panel">
                                <form action="findPW.do" method="post">
									<div class="field">
										<label>ID</label>
										<div class="control">
											<input type="text" class="input" id="id" name="id"
												placeholder="Enter your ID">
											<button type="button" id="findPw2Btn" class="button is-solid accent-button raised">Check</button>
										</div>
										<label>Email</label>
										<div class="control">
											<input type="text" class="input" id="email" name="email"
												placeholder="Enter your email address">
											<button type="button" id="findPwBtn" class="button is-solid accent-button raised">Check</button>
										</div>
									</div>
								</form>
                            </div>
							<br>
                            <div class="buttons">
                                <a class="button is-solid primary-button is-fullwidth raised" href="${pageContext.request.contextPath}/home.do">Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <!-- Concatenated js plugins and jQuery -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/app.js"></script>
	<script src="https://js.stripe.com/v3/"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/data/tipuedrop_content.js"></script>

	<!-- Core js -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/global.js"></script>

	<!-- Navigation options js -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-v1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-mobile.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/navbar-options.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/sidebar-v1.js"></script>

	<!-- Core instance js -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/touch.js"></script>

	<!-- Components js -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/explorer.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/widgets.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/modal-uploader.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/popovers-users.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/popovers-pages.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/lightbox.js"></script>

	<!-- Signup page js -->
	<script src="${pageContext.request.contextPath}/resources/template/assets/js/signup.js"></script>
</body>
</html>