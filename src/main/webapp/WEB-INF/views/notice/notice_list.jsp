<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%-- <link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/admin/notice_list.css"> --%>
<script>
	$(function(){
		$(".write-btn").click(function(){
			location.href='${root}/notice/write';
		});
	});
	

	$(document).ready(function(){
		$("#memberAdmin").click(function(){
			//alert("member");
			location.href="${root}/member/admin";
		});
		$("#noticeAdmin").click(function(){
			//alert("notice");
			location.href="${root}/notice";
		});
		$("#reportAdmin").click(function(){
			//alert("report");
			location.href="${root}/report/admin";
		});
	});


	$(function(){
		$("#adminbutton").hide();
		$("#memberAdmin").hide();
		$("#noticeAdmin").hide();
		$("#reportAdmin").hide();
		$("#title").hide();
		$("#badgeAd").hide();
	});

</script>

<style type="text/css">
	body{
      overflow-x:hidden;
   }
</style>
</head>
<body>
<form>
	<%-- <c:if test = "${member_id eq null}">
		<script type="text/javascript">
			alert("회원이 아닙니다! 로그인 또는 회원가입을 해주세요.");
			location.href = "${root}/member/login";
		</script>
	</c:if> --%>
	
	<div class = "container" id="admin_container">
		<div class="btn-group mb-3">
		    <button type="button" class="btn btn-secondary" id="memberAdmin">회원 관리</button>
		    <button type="button" class="btn btn-secondary" id="noticeAdmin">공지사항 관리</button>
		    <button type="button" class="btn btn-secondary" id="reportAdmin">신고 관리</button>
  		</div>
  		<div id="title" class="text-secondary"><h3>&#91;공지사항 관리&#93;</h3></div>
		<span class="badge badge-secondary" id="badgeAd">${member_level}</span>
		<br/>
		
		<div class="table active">
			<div class="row border-bottom" id="table_th">
				<div class="col-md-1"><strong>글번호</strong></div>
				<div class="col-md-8"><strong>제목</strong></div>
				<div class="col-md-1"><strong>조회수</strong></div>
				<div class="col-md-2"><strong>날짜</strong></div>
			</div>
		<c:forEach var = "noticeList" items = "${noticeList}">	
			<a href="${root}/notice/detail?notice_number=${noticeList.notice_number}">
			<div class="row border-bottom" id="table_td">
				<div class="col-md-1">${noticeList.notice_number}</div>
				<div class="col-md-8"><p><strong>${noticeList.notice_title}</strong></p></div>
				<div class="col-md-1">${noticeList.notice_count}</div>
				<div class="col-md-2"><fmt:formatDate value = "${noticeList.notice_date}" pattern = "yyyy-MM-dd HH:mm:ss"/></div>
			<!-- 	<div class="col-md-2"></div> -->
			</div>
			</a>
		</c:forEach>
		</div>
		
		<!-- 페이징 -->
		<fmt:parseNumber var = "pageCount" value = "${count / boardSize + (count % boardSize == 0 ? 0 : 1)}" integerOnly = "true"/>
		<c:set var = "pageBlock" value = "${5}"/>
		<fmt:parseNumber var = "result" value = "${(currentPage - 1) / pageBlock}" integerOnly = "true"/>
		<c:set var = "startPage" value = "${result * pageBlock + 1}"/>
		<c:set var = "endPage" value ="${startPage + pageBlock - 1}"/>
		<c:if test="${endPage > pageCount }">
			<c:set var = "endPage" value = "${pageCount}"/>
		</c:if>

		<c:if test="${startPage > pageBlock }">
			<script type="text/javascript">
				$(function(){
					$('#previous').removeClass('disabled');
				})
			</script>
		</c:if>
		<c:if test="${endPage < pageCount }">
			<script type="text/javascript">
				$(function(){
					$('#next').removeClass('disabled');
				})
			</script>
		</c:if>
		<div class="d-flex bd-highlight">
			 <div class="p-2 w-100 bd-highlight">
				<nav aria-label="Page navigation">
				  <ul class="pagination justify-content-center">
				    <li id = "previous" class="page-item disabled">
				      <a class="page-link" href="${root}/notice?pageNumber=${startPage - pageBlock}" tabindex="-1" aria-disabled="true">이전</a>
				    </li>
				    <c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
				    <li class = "page-item"><a class="page-link" href="${root}/notice?pageNumber=${i}">${i}</a></li>
				  	</c:forEach>
				    <li id = "next" class = "page-item disabled">
				      <a class = "page-link" href = "${root}/notice?pageNumber=${startPage + pageBlock}">다음</a>
				    </li>
				  </ul>
				  
				</nav>
			 </div>
			 
			 <c:if test = "${member_level eq 'admin'}">
			 	<script type="text/javascript">
				 	$(function(){
						$("#adminbutton").show();
						$("#memberAdmin").show();
						$("#noticeAdmin").show();
						$("#reportAdmin").show();
						$("#title").show();
						$("#badgeAd").show();
						
					});
			 	</script>
			 </c:if>
			 
			 <!-- 관리자에게만 보이는 글쓰기 버튼 -->
			 <div class = "p-2 flex-shrink-1 bd-highlight" id = "adminbutton">
			  	<input type = "button" value = "글작성" class = "btn btn-secondary write-btn">
			 </div>
		</div>
	</div>
</form>
</body>
</html>