<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우표함</title>
</head>
<body>
<div class="view-wrapper">
		<div class="shop-wrapper">
			<div class="cart-container">
				<div class="cart-header">
					<div class="header-inner">
						<h2>My STAMP</h2>
						<div class="header-actions"></div>
						<div class="header-actions">
                            <div class="buttons">
                                <a href="stampShopList.do" class="button is-solid accent-button raised">STAMP SHOP</a>
                            </div>
                        </div>
					</div>
				</div>

				<div class="cart-content">
					<div class="columns">
						<div class="column is-8">
							
							<div class="cart-summary">
								<div class="summary-header">
                                    <h3>USAGE HISTORY</h3>
                            	</div>
                            </div>
                            <!--Table-->
							<c:forEach items="${slist}" var="vo">
								<div class="flex-table">
									<div class="flex-table-item" id="sh_dt">
										<div class="product">
											<span class="product-name">${vo.sh_dt}</span>
										</div>

										<div class="discount">
											<span class="has-price" id="sh_type">${vo.sh_type}</span>
										</div>
										
										
										<div class="discount">
											<span class="has-price" id="cnt">
											<c:choose>
												<c:when test="${vo.sh_type eq '편지작성' }"> 
													<span style="color:red">-${vo.cnt}</span>
												</c:when>
												<c:otherwise>
													<span style="color:blue">+${vo.cnt}</span>
												</c:otherwise>
											</c:choose>
											</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						 <div class="column is-4">
                            <div class="cart-summary">
                                <div class="summary-header">
                                    <h3>STATUS OF MY STAMP RETENTION</h3>
                                </div>

                                <!--card-->
                                <div class="summary-card">
                                    <div class="order-line">
                                        <h4 style="color:black">stamp</h4>
                                        <h4 style="color:blue">${user.stamp}</h4>
                                    </div>
                                </div>
                                    
                                    <!--card-->
                                    <div class="summary-card">
                                        <img src="${pageContext.request.contextPath}/resources/template/assets/img/icons/explore/clover.svg" alt="">
                                        <h4>Accrual Event</h4>
                                        <p>현재 진행 중인 이벤트가 없습니다.</p>
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