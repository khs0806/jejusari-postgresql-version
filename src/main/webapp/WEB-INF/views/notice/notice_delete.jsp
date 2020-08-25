<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시물 삭제</title>
</head>
<body>

	<div align = "center" style = "margin-top: 100px;">
		<form method = "post" action = "${root}/notice/deleteOk">
			<input type = "hidden" value = "${notice_number}" name = "notice_number"/>

			<div>
				<h3>[관리자 페이지]삭제 하시겠습니까?</h3>
				</br>
				<input type = "submit" value = "글삭제"/>
				<input type = "button" value = "취소" onclick = "location.href = '${root}/notice'"/>
			</div>
		</form>
	</div>
</body>
</html>