<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${ pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${root}/css/member/member_login.css">
	<div class="login">
		<div class="logo">
			<div>제주살이</div>
			<div>간편하게 로그인 하고</div>
			<div>다양한 서비스를 이용하세요.</div>
		</div>
		<div class="kakao">
			<!-- 카카오로 로그인 링크 ----------------------------------------------------------------->
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=47d269828391ebdbbd9ef43e5d60962c&redirect_uri=http://localhost:8181/jeju/test/join&response_type=code"> <!----------------------------->
			<%-- <a href="${root}/member/signup"> --%>
				<img alt="카카오톡로그인" src="${root}/img/kakao_login_medium_wide.png">
			</a>
		</div>
		<div class="foot">
			<div>다른 방법으로 시작하기</div>
				<a href="">
					<img alt="페이스북로그인" src="//s.zigbang.com/zigbang-account/prod/_next/static/btn_content_login_fb_36x36-df6b07d3564954ead2a9ed323aa2b8ca.png">
				</a>
				<a href="">
					<img alt="구글로그인" src="//s.zigbang.com/zigbang-account/prod/_next/static/btn_content_login_google_36x36-cd1a611ed48bc787e3acc89a8e876800.png">
				</a>
				<a href="">
					<img alt="이메일로그인" src="//s.zigbang.com/zigbang-account/prod/_next/static/btn_content_login_email_36x36-e87aa45322ef0190edc5473519396308.png">
				</a>
		</div>
	</div>
