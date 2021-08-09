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
					
				<div class="demos-title has-text-centered">
				</div>

				<div class="demos-list">

					<!--Navbar v1-->
					<div class="demo-section">
						<div class="demo-section-title">
							<img
								src="${pageContext.request.contextPath}/resources/template/assets/img/icons/layouts/layout-navbar.svg"
								alt="">
							<div class="title-meta">
								<h3>Quick Menu</h3>
							</div>
						</div>

						<div class="columns is-multiline">
							<!-- Demo item -->
							<div class="column is-4 has-text-centered">
								<figure class="demo-wrapper">
									<img
										data-src="${pageContext.request.contextPath}/resources/template/assets/img/icons/questions/help.svg"
										alt="" data-lazy-load width="100%" height="100%"/>
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
										data-src="${pageContext.request.contextPath}/resources/template/assets/img/icons/questions/assistance.svg"
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
										data-src="${pageContext.request.contextPath}/resources/template/assets/img/icons/questions/cart.svg"
										alt="" data-lazy-load height="372.03px" />
									<div class="circle-overlay"></div>
									<div class="demo-info has-text-centered">
										<div class="wrapper">
											<div class="demo-title">우표상점</div>
											<div class="demo-link" data-theme="light">
												<div class="is-dm" onclick="location.href='${pageContext.request.contextPath}/stampShopList.do'">Go to SHOP <i data-feather="chevron-right"></i></div>
											</div>
										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>
			</div>
			<img src="${pageContext.request.contextPath}/resources/template/assets/img/illustrations/signup/type-3.svg"
			alt="">
		</div>

	</div>
</body>
</html>