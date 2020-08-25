<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/news/news_list.css">
<style type="text/css">
	a {color: black; text-decoration: none !important;}
</style>
</head>
<body>
	<div class="container" id="sales_list">
		
		<div class="table active">
			<div class="row border-bottom" id="table_th">
				<div class="col-md-1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div class="col-md-8"><strong>제목</strong></div>
				<div class="col-md-1"><strong>날짜</strong></div>
			</div>
			
			<c:forEach items="${newsList}" var="news">
				<c:set var="i" value="${i+1}"/>
				<a href="${news.link}">
					<div class="row border-bottom" id="table_td">
						<div class="col-md-1 pl-5"><strong>${i}</strong></div>
						<div class="col-md-8"><strong>${news.title}</strong></div>
						<div class="col-md-3" id="newsDate">${news.date}</div>
					</div>
				</a>
			</c:forEach>
		</div>
		
<!-- 		<div class="d-flex bd-highlight"> -->
<!-- 			<div class="p-2 w-100 bd-highlight"> -->
<!-- 				<nav aria-label="Page navigation"> -->
<!-- 					<ul class="pagination justify-content-center"> -->
<!-- 						<li class="page-item disabled"> -->
<!-- 							<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a> -->
<!-- 						</li> -->
						
<!-- 						<li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 						<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 						<li class="page-item"><a class="page-link" href="#">3</a></li> -->
						
<!-- 						<li class="page-item"> -->
<!-- 							<a class="page-link" href="#">Next</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</nav> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
</body>
</html>