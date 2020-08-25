<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<c:if test="${check5>0}">
		<script type="text/javascript">
			alert("게시글이 삭제되었습니다.");
			window.opener.location = "${root}/sales";

			self.close();
		</script>
	</c:if>
	<c:if test="${check5==0}">
		<script type="text/javascript">
			alert("게시글이 삭제되지 않았습니다. 다시 시도해주세요.");
			self.close();
		</script>
	</c:if>
</body>
</html>