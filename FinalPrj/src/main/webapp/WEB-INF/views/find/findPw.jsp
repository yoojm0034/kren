<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>findPW</title>
	<!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/core.css">
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
				return;
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
			return;
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
												placeholder="Enter your email address">
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

                            <div class="buttons">
                                <a class="button is-solid primary-button is-fullwidth raised">Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>