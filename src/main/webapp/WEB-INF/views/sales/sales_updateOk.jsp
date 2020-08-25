<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<c:set var = "root" value = "${pageContext.request.contextPath}"/>
	<c:if test = "${check > 0}">
		<script type="text/javascript">
			alert("매물 정보가 수정 되었습니다.");
			location.href = "${root}/sales/detail?sales_number=${sales_number}&pageNumber=${pageNumber}";
		</script>
	</c:if>
	
	<c:if test = "${check == 0}">
		<script type="text/javascript">
			alert("매물 정보가 수정 되지 않았습니다.");
			location.href = "${root}/sales/detail?sales_number=${sales_number}&pageNumber=${pageNumber}";
		</script>
	</c:if>
</body>
</html>