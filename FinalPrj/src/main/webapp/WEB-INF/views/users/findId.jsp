<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>findID</title>
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

        <div class="fake-nav">
            <a href="/" class="logo">
                <img src="assets/img/logo/friendkit-bold.svg" width="112" height="28" alt="">
            </a>
        </div>

        <div class="process-bar-wrap">
            <div class="process-bar">
                <div class="progress-wrap">
                    <div class="track"></div>
                    <div class="bar"></div>
                    <div id="step-dot-1" class="dot is-first is-active is-current" data-step="0">
                        <i data-feather="smile"></i>
                    </div>
                    <div id="step-dot-2" class="dot is-second" data-step="25">
                        <i data-feather="user"></i>
                    </div>
                    <div id="step-dot-3" class="dot is-third" data-step="50">
                        <i data-feather="image"></i>
                    </div>
                    <div id="step-dot-4" class="dot is-fourth" data-step="75">
                        <i data-feather="lock"></i>
                    </div>
                    <div id="step-dot-5" class="dot is-fifth" data-step="100">
                        <i data-feather="flag"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="outer-panel">
            <div class="outer-panel-inner">
                <div class="process-title">
                    <h2 id="step-title-1" class="step-title is-active">Find ID</h2>
                    <h2 id="step-title-2" class="step-title">Please check the verification number.</h2>
                    <h2 id="step-title-3" class="step-title">Find your ID.</h2>
                </div>
				
				<!-- 1페이지/이메일 조회 -->
                <div id="signup-panel-1" class="process-panel-wrap is-active">
                   <div class="form-panel">
                        <div class="field">
                            <label>Email</label>
                            <div class="control">
                                <input type="text" class="input" placeholder="Checking your email address">
                            </div>
                        </div>
                    </div>
                    <div class="buttons">
                        <a class="button process-button" data-step="step-dot-1">Back</a>
                        <a class="button process-button is-next" data-step="step-dot-3">Next</a>
                    </div>
                </div>

				<!-- 2페이지/이메일 인증번호 입력 -->
                <div id="signup-panel-2" class="process-panel-wrap is-narrow">
                    <div class="form-panel">
                        <div class="field">
                            <label>Certification Number</label>
                            <div class="control">
                                <input type="text" class="input" placeholder="Enter your Certification Number">
                            </div>
                        </div>
                    </div>

                    <div class="buttons">
                    	<a class="button is-solid primary-button is-fullwidth raised">Confirm</a>
                    </div>
                </div>
				
				<!-- 아이디 출력 -->
                <div id="signup-panel-3" class="process-panel-wrap is-narrow">
                    <div class="form-panel">
                        <div class="photo-upload">
                            <div class="preview">
                                <a class="upload-button">
                                    <i data-feather="plus"></i>
                                </a>
                                <img id="upload-preview" src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/avatar-w.png" alt="">
                                <form id="profile-pic-dz" class="dropzone is-hidden" action="/"></form>
                            </div>
                            <div class="limitation">
                                <small>Only images with a size lower than 3MB are allowed.</small>
                            </div>
                        </div>
                    </div>

                    <div class="buttons">
                        <a class="button process-button" data-step="step-dot-2">Back</a>
                        <a class="button process-button is-next" data-step="step-dot-4">Next</a>
                    </div>
                </div>

            </div>
        </div>
	</div>
</body>
</html>