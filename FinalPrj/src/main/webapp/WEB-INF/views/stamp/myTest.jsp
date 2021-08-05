<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

var name = "${user.name}"
var dt = "${vo.sh_dt}"
var type = "${vo.sh_type}"
var cnt = "${vo.cnt}"

console.log(name);
console.log(dt);
console.log(type);
console.log(cnt);

</script>
</head>
<body>
	<div class="view-wrapper">

		<div class="shop-wrapper">
			<div class="cart-container">
				<div class="cart-header">
					<div class="header-inner">
						<h2>My STAMP</h2>
						<div class="header-actions"></div>
					</div>
				</div>

				<div class="cart-content">
					<div class="columns">
						<div class="column is-8">
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
											<span class="has-price" id="cnt">${vo.cnt}</span>
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