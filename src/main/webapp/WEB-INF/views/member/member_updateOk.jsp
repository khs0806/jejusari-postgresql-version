<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
	<c:if test = "${check > 0}">
		<script type="text/javascript">
			alert("회원수정 완료");
			location.href = "${root}/main";
		</script>
	</c:if>
	
	<c:if test = "${check == 0}">
		<script type="text/javascript">
			alert("회원수정 실패");
			location.href = "${root}/main";
		</script>
	</c:if>
</body>
</html>