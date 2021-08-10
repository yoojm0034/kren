<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>findId</title>
<link rel="icon" type="image/png" href="assets/img/favicon.png" />
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500"
	rel="stylesheet">
<!-- Core CSS -->
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="assets/css/core.css">
</head>
<body>
<script>
	//이메일 체크 버튼...
	$(function() {
	  $("#findIdBtn").on("click", function(){
		  var mail = $('#email').val();
		  
		//이메일 입력을 하지 않고 버튼을 누를 경우...
		if(mail == ""){
			
			alert('이메일을 입력하세요.');
			$('#email').focus();
			return;
		}
		
		//이메일 DB 비교...
			$.ajax({
				url: 'mailCheck.do',
				data: { email: $('#email').val() },
				success: function(res){ //res= 컨트롤러에서 넘어오는 값
					if(res == 1){
						//회원정보와 동일한 이메일이 존재할 경우...
						alert('인증번호가 이메일로 발송되었습니다.');
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
	
	//인증번호 체크...
	$(function() {
		  $("#injeungBtn").on("click", function(){
			  var injeung = $('#email_injeung').val();
			  
			//인증번호 입력을 하지 않고 버튼을 누를 경우...
			if(injeung == ""){
				
				alert('인증번호를 입력하세요.');
				$('#email_injeung').focus();
				return;
			}
			$.ajax({
				url: 'mailCheck2.do',
				data: { number: injeung },
				success: function(res){
					if(res == 1){
						//세션에 담긴 인증번호와 동일할 경우...
						location.href('find/findID2.do')
					}else{
						//동일하지 않을 경우...
						alert('인증번호가 일치하지 않습니다. 정확하게 입력해주세요.')
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

		<div class="container">
			<!--Container-->
			<div class="login-container is-centered">
				<div class="columns is-vcentered">
					<div class="column">

						<h2 class="form-title has-text-centered">Find ID</h2>
						<h3 class="form-subtitle has-text-centered">Check your Email.</h3>

						<!--Form-->
						<div class="login-form">
							<div class="form-panel">
								<form action="findID.do" method="post">
									<div class="field">
										<label>Email</label>
										<div class="control">
											<input type="text" class="input" id="email" name="email"
												placeholder="Enter your email address">
											<button type="button" id="findIdBtn" class="button is-solid accent-button raised">Check</button>
										</div>
									</div>
								</form>
								<form action="mailCheck2.do{dice}" method="post">
									<div class="field">
										<label>Verification Code</label>
										<div class="control">
											<input type="text" class="input" id="email_injeung"
												name="email_injeung" placeholder="Enter verification code">
										</div>
									</div>
									<br>
									<div class="buttons">
										<a class="button is-solid primary-button is-fullwidth raised"
											type="button" id="injeungBtn">Verification</a>
										<!-- 
                                <a class="button is-solid primary-button is-fullwidth raised" onclick="location.href='findID2.do'">button</a>
                                 -->
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>