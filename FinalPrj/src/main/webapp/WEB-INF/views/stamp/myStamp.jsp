<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
#sh_type {
	font-family: 'ONE-Mobile-Regular';
	font-weight: 500;
}
.x-small {
	font-size: small;
	color: gray;
}
</style>
<div style="padding: 0px 12px 0px 12px;">
	<div class="container is-custom">
		<div id="profile-main" class="view-wrap is-headless">
			<div class="columns profile-contents">
				<div id="profile-timeline-widgets" class="column is-8">
					<div class="box-heading">
						<h4>
							<b>
								<spring:message code="stamph.history" />
							</b>
						</h4>
						<p class="x-small"> 
							<spring:message code="stamph.guide" />
						</p>
					</div>
					<br>
					<div class="cart-content">
						<div class="cart-summary">
							<!-- 반복 영역 -->
							<c:forEach items="${slist}" var="vo" end="20">
								<div class="flex-table">
									<div class="flex-table-item" id="sh_dt">
										<div class="product sh_dt" style="width: 20%">
											<span class="product-name">${vo.sh_dt}</span>
										</div>
										<div class="discount"
											style="width: 60%; justify-content: left; padding-left: 12px">
											<c:if test="${vo.sh_type eq '편지작성' }">
												<span class="has-price" id="sh_type"><spring:message
														code="stamph.letter" arguments="${vo.name}" /></span>
											</c:if>
											<c:if test="${vo.sh_type eq '출석체크' }">
												<span class="has-price" id="sh_type"><spring:message
														code="stamph.login" /></span>
											</c:if>
											<c:if test="${vo.sh_type eq '피드등록' }">
												<span class="has-price" id="sh_type"><spring:message
														code="stamph.post" /></span>
											</c:if>
											<c:if test="${vo.sh_type eq '구매' }">
												<span class="has-price" id="sh_type"><spring:message
														code="stamph.pay" /></span>
											</c:if>
											<c:if test="${vo.sh_type eq '회원가입' }">
												<span class="has-price" id="sh_type"><spring:message
														code="stmaph.join" /></span>
											</c:if>
										</div>
										<div class="discount">
											<span class="has-price" id="cnt"> 
												<c:choose>
													<c:when test="${vo.sh_type eq '편지작성' }">
														<span style="color: red">-${vo.cnt}</span>
													</c:when>
													<c:otherwise>
														<span style="color: blue">+${vo.cnt}</span>
													</c:otherwise>
												</c:choose>
											</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="box-heading column is-4"
					style="margin-top: 12px; width: 32.4%; height: 300px">
					<div class="summary-card" style="width: 100%; text-align: center;">
						<img src="${pageContext.request.contextPath}/resources/template/assets/img/icons/explore/clover.svg" alt="">
						<h4>
							<spring:message code="stamph.buy1" />
						</h4>
						<br> 
						<a href="stampShopList.do"
							class="button is-solid dark-grey-button raised"
							style="font-size: 1rem; width: 200px;"><spring:message
								code="stamph.buy2" /></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>