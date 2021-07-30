<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->

<title>STAMP SHOP</title>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function() {
		$("#check_module").click(function() {
			var name = "${user.name}"
			console.log("222")
			var IMP = window.IMP; // 생략가능
			IMP.init('imp86362495');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'kakao',
				pay_method : 'card',

				merchant_uid : 'merchant_' + new Date().getTime(),

				name : name,
				//결제창에서 보여질 이름
				amount : 1000,
				//가격
				buyer_name : name
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					

				} else {
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
						<h2>STAMP SHOP</h2>
						<div class="header-actions"></div>
					</div>
				</div>

				<div class="cart-content">
					<div class="columns">
						<div class="column is-8">
							<!--Table-->
							<c:forEach items="${ list }" var="vo">
								<div class="flex-table">
									<div class="flex-table-item" data-id="${ vo.stamp_id }">
										<div class="product">
											<img src="template/assets/img/letter/stamp.png"> <span
												class="product-name"></span>
										</div>

										<div class="discount">
											<span class="has-price">X${ vo.cnt }개</span>
										</div>

										<div class="price">
											<span class="has-price">${ vo.pay }</span>
										</div>

										<div>
											<button id="check_module" class="button">Buy</button>
										</div>


									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>