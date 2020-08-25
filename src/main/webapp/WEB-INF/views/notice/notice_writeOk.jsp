<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성 완료</title>
</head>
<body>
	<c:if test = "${check > 0}">
		<script type="text/javascript">
			alert("[관리자 페이지] 공지사항 작성이 완료되었습니다. 공지사항 게시판으로 이동합니다.");
			location.href = "${root}/notice";
		</script>
	</c:if>
	
	<c:if test = "${check == 0}">
		<script type="text/javascript">
			alert("[관리자 페이지] 공지사항 작성을 실패하셨습니다. 공지사항 작성 페이지로 다시 돌아 갑니다.");
			location.href = "${root}/notice/write";
		</script>
	</c:if>
</body>
</html>