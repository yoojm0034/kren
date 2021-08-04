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

		<div id="friendkit-demo-landing"
			class="hero is-fullheight landing-hero-wrapper">
			<div id="particles-js"></div>
			<div class="hero-body">
				<div class="container is-desktop">
					<div class="columns landing-caption is-vcentered">
						<div class="column is-7">
							<img src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/characters/friends.svg" alt="">
						</div>
						<div class="column is-5">
							<h2>KREN</h2>
							<h3>ABOUT US</h3>
							<div class="buttons">
								<a href="#landing-start" class="button">LETTER</a>
								<button id="tour-start" class="button is-hidden-mobile">FEED</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="demos-section" class="section demos-wrapper">
			<div class="container is-desktop">
				<div class="header-logo">
					<img src="${pageContext.request.contextPath}/resources/template/assets/img/logo/friendkit-white.svg" alt="">
				</div>
				<div class="demos-title has-text-centered">
					<h3>Prebuilt pages to start with</h3>
				</div>

				<div class="demos-list">

					<!--Navbar v1-->
					<div class="demo-section">
						<div class="demo-section-title">
							<img src="${pageContext.request.contextPath}/resources/template/assets/img/icons/layouts/layout-navbar.svg" alt="">
							<div class="title-meta">
								<h3>바로가기</h3>
								<p>With a top navigation</p>
							</div>
						</div>

						<div class="columns is-multiline">
							<!-- Demo item -->
							<div class="column is-4 has-text-centered">
								<figure class="demo-wrapper">
									<img data-src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/questions/blogging.svg" alt=""
										data-lazy-load />
									<div class="circle-overlay"></div>
									<div class="demo-info has-text-centered">
										<div class="wrapper">
											<div class="demo-title">공지사항</div>
											<div class="demo-link" data-theme="light">
												<a class="is-dm" href="${pageContext.request.contextPath}/userNoticeList.do">Go
													to demo <i data-feather="chevron-right"></i>
												</a>
											</div>
										</div>
									</div>
								</figure>
							</div>
							<!-- Demo item -->
							<div class="column is-4 has-text-centered">
								<figure class="demo-wrapper">
									<img data-src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/questions/automotive.svg" alt=""
										data-lazy-load />
									<div class="circle-overlay"></div>
									<div class="demo-info has-text-centered">
										<div class="wrapper">
											<div class="demo-title">Q&A 작성</div>
											<div class="demo-link" data-theme="dark">
												<a class="is-dm" href="/navbar-v1-feed.html">Go
													to demo <i data-feather="chevron-right"></i>
												</a>
											</div>
										</div>
									</div>
								</figure>
							</div>
							<!-- Demo item -->
							<div class="column is-4 has-text-centered">
								<figure class="demo-wrapper">
									<img data-src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/questions/business.svg" alt=""
										data-lazy-load />
									<div class="circle-overlay"></div>
									<div class="demo-info has-text-centered">
										<div class="wrapper">
											<div class="demo-title">Feed page</div>
											<div class="demo-link" data-theme="light">
												<a class="is-dm" href="/navbar-v1-feed-sidebar.html"
													target="_blank">Go to demo <i
													data-feather="chevron-right"></i></a>
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




	</div>
</body>
</html>