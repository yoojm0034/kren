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
						<h2><img src="${pageContext.request.contextPath}/resources/template/assets/img/letter/stamp.png">My Stamp</h2>
						<div class="header-actions"></div>
					</div>
				</div>
					<table border="1">
						<tr>
							<td>구매일시</td> <td>상세내용(구매/적립/사용)</td> <td>카운트 수</td>
						</tr>
					</table>
				
			</div>
		</div>
	</div>
					
</body>
</html>