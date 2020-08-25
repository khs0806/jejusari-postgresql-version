<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${root}/css/member/member_update.css">
</head>
<body>
	<div id="content">
		<div class="info">
			<p>임시 로그인</p>
		</div>
		
		<br>
		
		<form action="${root}/member/templogin" method="post">
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">아이디만 입력(비밀번호 구현x)</label>
				<div class="col-sm-3">
					<input type="text" name="member_id" id="staticEmail">
				</div>
			</div>
			
			<div style="width: 100%; text-align: center;">
				<input type="submit" class="btn btn-warning btn-sh" value="확인">
				<input type="button" class="btn btn-warning btn-sh" value="취소">
			</div>
		</form>
	</div>
</body>
</html>