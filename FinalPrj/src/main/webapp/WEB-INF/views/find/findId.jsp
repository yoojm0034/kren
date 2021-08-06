<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title> findId</title>
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/core.css">
</head>
<body>
<script>
$(function(){
	$('#findID').click(function(){
		if($('#email').val()==""){
			//이메일 입력을 하지 않고 버튼을 누를 경우...
			alert('이메일을 입력하세요.');
			$('#email').focus();
			return false;
		}
		
		//이메일 확인...
		$.ajax({
			url: 'findId.do',
			data: {email: $('#email').val()},
			success: function(data){
				if(){
					
				}else{
					
				}
				location.href='findID2.do'
			},
			error: function(error){
				alert('관리자에게 문의 요망');
			}
		});
	});
});

//------------------------이메일 체크------------------------
/* $(function() {
	$('#emailCheck').click(function() {
		if ($('#email').val() == "") {
			alert('이메일을 입력하세요.');
			$('#email').focus();
			return false;
		}
		//email 중복확인 ajax
		$.ajax({
			url : 'userEmailCheck.do',
			data : {
				email : $('#email').val()
			},
			type : 'post',
			success : function(data) {
				if (data < 0) {
					alert('회원 조회가 되지않는 이메일입니다. 회원가입을 진행해주세요.');
					$('#email').attr("readonly", true);
					$('#emailCheck').val('checked');
					$('#codeCheck').focus();
				} else {
					$('#email').val('');
					$('#email').focus();
					//중복확인 통과후 인증코드 메일보내는 ajax
					$.ajax({
						url : 'sendEmail.do',
						data : {
							email : $('#email').val()
						},
						type : 'post',
						success : function(code) {
							alert('메일이 전송되었습니다.');
							$('#codeCheck').click(function() { // 성공해서 이메일에서 값을 건네받은 경우에, 인증번호 버튼을 클릭 시 값을 검사
								if ($('#inputCode').val() == code) { // 사용자의 입력값과 sendSMS에서 받은 값이 일치하는 경우
									alert('이메일 인증이 완료되었습니다.');
									$('#codeCheck').val("checked");
								} else {
									alert('인증번호가 틀립니다');
								}
							})
						},
						error : function(err) {
							alert('관리자에게 문의 요망');
						}
					});
				}
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
}); */
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
                        <form id="frm">
                        <div class="login-form">
                            <div class="form-panel">
                                <div class="field">
                                    <label>Email</label>
                                    <div class="control">
                                        <input type="text" class="input" id="email" name="email" placeholder="Enter your email address">
                                    </div>
                                </div>
                            </div>
						<br>
                            <div class="buttons">
                                <a class="button is-solid primary-button is-fullwidth raised" id="findID" onclick="findID()">이메일인증번호</a>
                                <a class="button is-solid primary-button is-fullwidth raised" onclick="location.href='findID2.do'">button</a>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>