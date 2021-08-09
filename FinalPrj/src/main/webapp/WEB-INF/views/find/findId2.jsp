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
                        <h3 class="form-subtitle has-text-centered">Check the verification code.</h3>

                        <!--Form:받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인-->
                        <form action="findID2.do{dice}" method="post">
                        <div class="login-form">
                            <div class="form-panel">
                                <div class="field">
                                    <label>Verification Code</label>
                                    <div class="control">
                                        <input type="text" class="input" id= "email_injeung" name="email_injeung" placeholder="Enter verification code">
                                    </div>
                                </div>
                            </div>
						<br>
                            <div class="buttons">
                                <a class="button is-solid primary-button is-fullwidth raised" type="submit" onclick="findId2()">verification</a>
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