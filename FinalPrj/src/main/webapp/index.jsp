<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KREN</title>

</head>
<body>
	<security:authorize access="isAuthenticated()" />
		<%
		response.sendRedirect("feed.do");
		%>
	
</body>
</html>