<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<table>
			<tr>
				<th width="50%">상품명</th>
				<th>가격</th>
				<th>갯수</th>
			</tr>
			<c:forEach items="${ list }" var="vo">
				<tr data-id="${vo.stamp_id}">
					<td>${vo.stamp_id }</td>
					<td>${vo.pay }</td>
					<td>${vo.cnt }</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>