<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 삭제</title>
</head>
<body>
	<c:if test = "${check > 0}">
		<script type="text/javascript">
			alert("[관리자 페이지]게시물이 삭제되었습니다.");
			location.href = "${root}/notice";
		</script>
	</c:if>
	
	<c:if test = "${check == 0}">
		<script type="text/javascript">
			alert("[관리자 페이지]게시물이 삭제되지 않았습니다. 다시 시도해주세요.");
			location.href = "${root}/notice?notice_number=${notice_number}";
		</script>
	</c:if>
</body>
</html>