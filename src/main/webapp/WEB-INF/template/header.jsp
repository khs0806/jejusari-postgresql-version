<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${ pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${root}/css/board/footer.css">
<link rel="stylesheet" href="${root}/css/board/board_main.css">
<link rel="stylesheet" href="${root}/css/member/memberJoin.css">
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<style type="text/css">
	a {color: black; text-decoration: none !important;}
	#addr_detail{display: none;}
	#main_page .table{margin-top: 0.5rem;
    margin-bottom: 0.5rem;}
    #sales_list strong{margin-top: 0.5rem;}
	#sales_list p{margin-bottom: 0.5rem;}
	#sales_list #table_td .col-md-1, #sales_list #table_td .col-md-2{    line-height: 3rem}
	.container{margin-top:100px; margin-bottom: 100px;}
</style>
<!--===============================================================================================-->
<script type="text/javascript" src="${root}/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${root }/javascript/bootstrap/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#AdminPage").hide();
		$("#AdminPage").attr('disabled', true);
		
		var url = window.location.pathname;
		var url_param=url.substring(6);
		console.log("url_param :"+url_param);
		console.log(url_param);
		console.log(url_param.indexOf("/"));
		if(url_param.indexOf("/")!=-1){
			var list_name=url_param.substring(0,url_param.indexOf("/"));
			console.log("list_name: "+list_name);
			$("#"+list_name).addClass("active");
			console.log("#"+list_name);
		}else{
			$("#"+url_param).addClass("active");
		}
	});
	
	
</script>
</head>
<body>
	<header class="navbar navbar-expand-lg navbar-light border-bottom">
		<a class="navbar-brand" href="${root}/">제주살이</a>
		
		<div class="navbar-collapse justify-content-center" id="navbarColor01">
			<ul class="navbar-nav mx-5">
				<li class="nav-item mx-5" id="introduce"><a class="nav-link" href="${root}/introduce">소개
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item mx-5" id="sales"><a class="nav-link" href="${root}/sales">매물정보</a></li>
				<li class="nav-item mx-5" id="notice"><a class="nav-link" href="${root}/notice">공지사항</a></li>
				<li class="nav-item mx-5" id="news"><a class="nav-link" href="${root}/news">최신뉴스</a></li>
			</ul>
		</div>
		<input type="submit"  class="btn btn-secondary" id="AdminPage" value="Admin"/>
		<c:if test="${member_name == null}">
			<ul class="navbar-nav ml-md-auto">
				<li class="nav-item"><a class="nav-link" href="${root}/member/login" style="font-size:15px;">로그인 · 회원가입</a></li>
			</ul>
			<ul class="navbar-nav ml-md-auto">
				<li class="nav-item"><a class="nav-link" href="${root}/member/tempjoin" style="font-size:15px;">임시 회원가입</a></li>
			</ul>
			<ul class="navbar-nav ml-md-auto">
				<li class="nav-item"><a class="nav-link" href="${root}/member/templogin" style="font-size:15px;">임시 로그인</a></li>
			</ul>
		</c:if>
		<c:if test="${member_name != null}">
			<span>${member_name} 님 환영합니다.</span>
			<ul class="navbar-nav ml-md-auto">
				<%-- <li class="nav-item"><a class="nav-link" href="https://kauth.kakao.com/oauth/authorize?client_id=8c08273a21863da84621e6bb6aca71ee&redirect_uri=http://localhost:8282${root}&response_type=code">로그인</a></li> --%>
				<li class="nav-item"><a class="nav-link" href="${root}/member/mypage" style="font-size:15px;">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="${root}/member/logout" style="font-size:15px;">로그아웃</a></li>
<!-- 			<li class="nav-item"><a class="nav-link" href="https://kauth.kakao.com/oauth/logout?client_id=47d269828391ebdbbd9ef43e5d60962c&logout_redirect_uri=http://localhost:8282/jeju/member/logout" style="font-size:15px;">로그아웃</a></li> -->
			</ul>
			
		</c:if>
		<c:if test="${member_id eq 'admin'}">
			<script type="text/javascript">
			$(document).ready(function(){
				$("#AdminPage").show();
				$("#AdminPage").attr('disabled', false);
			 	$("#AdminPage").click(function(){
					location.href="${root}/member/admin";
				});
			});
			</script>
		</c:if>
	</header>
