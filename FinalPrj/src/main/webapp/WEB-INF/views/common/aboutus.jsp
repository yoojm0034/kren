<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="landing-wrapper">
		<div id="demos-section" class="section demos-wrapper">
			<div class="container is-desktop">
				<div class="header-logo">
					<img
						src="${pageContext.request.contextPath}/resources/template/assets/img/logo/friendkit-white.svg"
						alt="">
				</div>
				<div class="demos-title has-text-centered">
					<h3>Prebuilt pages to start with</h3>
				</div>

				<div class="demos-list">

					<!--Navbar v1-->
					<div class="demo-section">
						<div class="demo-section-title">
							<img
								src="${pageContext.request.contextPath}/resources/template/assets/img/icons/layouts/layout-navbar.svg"
								alt="">
							<div class="title-meta">
								<h3>바로가기</h3>
							</div>
						</div>

						<div class="columns is-multiline">
							<!-- Demo item -->
							<div class="column is-4 has-text-centered">
								<figure class="demo-wrapper">
									<img
										data-src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/questions/blogging.svg"
										alt="" data-lazy-load />
									<div class="circle-overlay"></div>
									<div class="demo-info has-text-centered">
										<div class="wrapper">
											<div class="demo-title">공지사항</div>
											<div class="demo-link" data-theme="light">
												<div class="is-dm" onclick="location.href='${pageContext.request.contextPath}/userNoticeList.do'">
													Go to Notice 
													<i data-feather="chevron-right"></i>
												</div>
											</div>
										</div>
									</div>
								</figure>
							</div>
							<!-- Demo item -->
							<div class="column is-4 has-text-centered">
								<figure class="demo-wrapper">
									<img
										data-src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/questions/automotive.svg"
										alt="" data-lazy-load />
									<div class="circle-overlay"></div>
									<div class="demo-info has-text-centered">
										<div class="wrapper">
											<div class="demo-title">문의하기</div>
											<div class="demo-link" data-theme="dark">
												<div class="is-dm" onclick="location.href='${pageContext.request.contextPath}/userQnaWrite.do'">Contact Us
													<i data-feather="chevron-right"></i>
												</div>
											</div>
										</div>
									</div>
								</figure>
							</div>
							<!-- Demo item -->
							<div class="column is-4 has-text-centered">
								<figure class="demo-wrapper">
									<img
										data-src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/questions/business.svg"
										alt="" data-lazy-load />
									<div class="circle-overlay"></div>
									<div class="demo-info has-text-centered">
										<div class="wrapper">
											<div class="demo-title">Feed page</div>
											<div class="demo-link" data-theme="light">
												<a class="is-dm" href="/navbar-v1-feed-sidebar.html">Go to demo <i data-feather="chevron-right"></i></a>
											</div>
										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<button onclick="sendTextPush('admin','feed_2')" type="button">댓글</button>
		<button onclick="sendFollowPush('admin')" type="button">팔로우</button>
		<button onclick="sendLetterPush('admin')" type="button">편지</button>
		<button onclick="sendLikePush('admin','feed_2')" type="button">좋아요</button>



	</div>
</body>
</html>