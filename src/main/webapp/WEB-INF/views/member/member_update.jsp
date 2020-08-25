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
	<div class="container">
		<div class="info">
			<p>회원 정보 수정</p>
			<a href="#" id="a-first">기본 정보 수정</a>
			<a href="${root}/member/withdraw1" id="a-second">회원 탈퇴</a>
		</div>
		
		<br>
		
		<form action="${root}/member/update" method="post">
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${member_id}">
				</div>
			</div>
			
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm-3">
					<input type="text" name="member_name" class="form-control mb-2" id="staticEmail" value="${member_name}">
				</div>
			</div>
			
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-3">
					<input type="text" name="member_email" class="form-control mb-2" id="staticEmail" > 
				</div>
				@
			<select class="col-sm-3 h-25 custom-select" id="inputGroupSelect01" name="email">
			    <option selected>선택하세요.</option>
			    <option value="hanmail.net">hanmail.net</option>
			    <option value="naver.com">naver.com</option>
			    <option value="yahoo.co.kr">yahoo.co.kr</option>
			    <option value="hotmail.com">hotmail.com</option>
			    <option value="paran.com">paran.com</option>
			    <option value="nate.com">nate.com</option>
			    <option value="google.com">google.com</option>
			    <option value="gmail.com">gmail.com</option>
			    <option value="empal.com">empal.com</option>
			    <option value="korea.com">korea.com</option>
			    <option value="freechal.com">freechal.com</option>
			  </select>
			</div>
			
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">전화번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control mb-2" style="width: 150px; display: inline-block;" name="no1">
					-
					<input type="text" class="form-control mb-2" style="width: 150px; display: inline-block;" name="no2">
					-
					<input type="text" class="form-control mb-2" style="width: 150px; display: inline-block;" name="no3">
					
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="customCheck1">
						<label class="custom-control-label" for="customCheck1">제주살이의 서비스 안내 및 자동 알림을 휴대폰으로 수신하겠습니다.</label>
					</div>
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