<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>STAMP SHOP</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(function() {
		$(document).on("click","#check_module",function(){ 
		//$("#check_module").on("click", function() { //최상단 버튼만 기능함
			var name = "${user.name}"
			var stamp = $(this).data('id');
			var pay = $(this).data('pay');
			var cnt = $(this).data('cnt');
			
			console.log(name);
			console.log(stamp);
			console.log(pay);
			console.log(cnt);
			
			var IMP = window.IMP; // 생략가능
			IMP.init('imp86362495');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'kakao',
				//pg : 'danal',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				//상품명
				name : stamp,
				//상품 가격
				amount : pay,
				//구매자명
				buyer_name : name
			}, function(rsp) { //callback...
				console.log(rsp);
				if (rsp.success) {
					//결제 성공 로직
					console.log(rsp);
					var msg = '결제가 완료되었습니다.';
					msg += '결제 금액 : ' + rsp.paid_amount;
					
	 				$.ajax({
								url:'paymentInsert.do',
								data: { 'price': rsp.paid_amount, 'cnt': cnt },
								success: function(data){
									console.log(data);
									//성공하면 인트값 1보다 크면 ...입력 -> 페이지 이동
										}
							}); 
	 				//결제 성공 후 마이페이지-우표함으로 이동...
	 				//location.href="${pageContext.request.contextPath}/myStamp.do"
	 				location.reload();
				} else {
					//결제 실패 로직
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	});
</script>
</head>

<body>
	<!-- 우표상점 -->
	<div class="view-wrapper">

		<div class="shop-wrapper">
			<div class="cart-container">
				<div class="cart-header">
					<div class="header-inner">
						<h2><spring:message code="stamp.shop.title"/></h2>
						<div class="header-actions"></div>
					</div>
				</div>

				<div class="cart-content">
					<div class="columns">
						<div class="column is-8">
							<!--Table-->
							<c:forEach items="${list}" var="vo">
								<div class="flex-table">
									<div class="flex-table-item" id="stampId">
										<div class="product">
											<img src="${pageContext.request.contextPath}/resources/template/assets/img/letter/stamp.png"> <span
												class="product-name"><spring:message code="stamp.name"/></span>
										</div>

										<div class="discount">
											<span class="has-price" id="cnt">X${vo.cnt}<spring:message code="stamp.cnt"/></span>
										</div>

										<div class="price">
											<span class="has-price" id="pay">${vo.pay}</span>
										</div>

										<div>
											<button id="check_module" 
											data-id="${vo.stamp_id}" data-pay="${vo.pay}" data-cnt="${vo.cnt}" 
											class="button is-solid accent-button raised"><spring:message code="stamp.buy.button"/></button>
										</div>
									</div>
								</div>
							</c:forEach>
							<a href="javascript:history.back();" class="button is-solid dark-grey-button raised"
							style="font-size: 1rem; width: 200px;"><spring:message code="stamp.back.button" /></a>
						</div>
						<div class="column is-4">
                            <div class="cart-summary">
                                <div class="summary-header">
                                    <h3><spring:message code="stamp.my"/></h3>
                                </div>
                                <!--card-->
                                <div class="summary-card">
                                    <div class="order-line">
                                        <h4 style="color:black"><spring:message code="stamp.my.title"/></h4>
                                        <h4 style="color:blue">${user.stamp}</h4>
                                    </div>
                                </div>
                                    
                                    <!--card-->
                                    <div class="summary-card">
                                        <img src="${pageContext.request.contextPath}/resources/template/assets/img/icons/explore/clover.svg" alt="">
                                        <h4><spring:message code="stamp.event.title"/></h4>
                                        <p><spring:message code="stamp.event"/></p>
                                    </div>
                                </div>
                            </div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>