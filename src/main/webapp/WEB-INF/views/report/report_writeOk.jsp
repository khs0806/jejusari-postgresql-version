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
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("신고작성이 완료되었습니다.");
			self.close();
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("신고작성이 실패했스빈다. 다시 시도해주세요.");
			location.href="${root}/report/report_write";
		</script>
	</c:if>
</body>
</html>