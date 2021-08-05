<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>findIdPw</title>
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

                        <h2 class="form-title has-text-centered">forgot ID/password?</h2>
                        <h3 class="form-subtitle has-text-centered">Choose between Find ID and Find Password.</h3>

                        <!--Form-->
                        <div class="login-form">

                            <div class="buttons">
                                <a class="button is-solid primary-button is-fullwidth raised"
                                type="button" onclick="location.href='findID.do'">Find ID</a>
                            </div>
                            
                            <div class="buttons">
                                <a class="button is-solid primary-button is-fullwidth raised"
                                type="button" onclick="location.href='findPW.do'">Find Password</a>
                            </div>

                            <div class="account-link has-text-centered">
                                <a href="#">Having trouble? Please press our Help Center. for a quick answer to your problem.</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>