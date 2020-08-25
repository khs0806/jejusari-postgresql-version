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
<link rel="stylesheet" href="${root}/css/member/member_info.css">
<link rel="stylesheet" href="${root}/css/member/member_withdraw.css">
</head>
<body>
	<div id="content">
		<div class="info">
			<p>회원 정보 수정</p>
			<a href="#" id="a-first">기본 정보 수정</a>
			<a href="#" id="a-second">회원 탈퇴</a>
		</div>
		
		<div class="wrap">
			<div class="step">
				<img alt="" src="${root}/img/step1.jpg">
			</div>
			
			<div class="check">
				<p>회원 탈퇴 하시겠습니까?</p>
				<p>서비스 이용에 만족을 못하셨거나 서비스에 미흡한 점이 있었다면,</p>
				<p>앞으로 좋은 서비스를 위하여 노력하겠습니다.</p>
				
				<div class="p-2 flex-shrink-1 bd-highlight">
					<input type="button" value="탈퇴" class="btn btn-warning"  onclick="location.href='${root}/member/withdraw2'" style="margin-right: 30px;">
					<input type="button" value="취소" class="btn btn-warning">
				</div>
			</div>
		</div>
	</div>
</body>
</html>