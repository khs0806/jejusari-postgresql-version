<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<c:choose>
		<c:when test="${check>0}">
			<c:remove var="id" scope="session"/>
			<c:remove var="memberLevel" scope="session"/>
			
			<script type="text/javascript">
				alert("신고 삭제되었습니다.");
				location.href="${root}/report/admin";
			</script>
		</c:when>
		<c:when test="${check==0}">
			<script type="text/javascript">
				alert("신고 삭제되지않았습니다.");
				location.href="${root}/report/admin";
			</script>
		</c:when>
	</c:choose>
</body>
</html>