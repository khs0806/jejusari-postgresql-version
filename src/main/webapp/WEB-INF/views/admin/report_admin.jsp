<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<meta charset="UTF-8">
<title>신고관리</title>
<style type="text/css">
	#table_td>#textCut>a{
		text-decoration: none;
		color:black;
	}
	
	#table_td>#textCut>a:hover{
		color:#6c757d;
	}

	#table_td>#textCut{
		padding:8px;
		list-style-position:inside;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
<script type="text/javascript">

function pop(root,report_number){
	
	var url="${root}/report/detail?report_number="+report_number;
	window.open(url, "", "width=600, height=600, resizable = no, scrollbars = no" );
}

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

</script>
</head>
<body>
<c:if test="${member_level != 'admin'}">
	<script type="text/javascript">
		alert("접근할 수 있는 권한이 없는 페이지 입니다.");
		location.href="${root}/main";
	</script>
</c:if>
	<div class="container">
		<div class="btn-group mb-3">
		    <button type="button" class="btn btn-secondary" id="memberAdmin">회원 관리</button>
		    <button type="button" class="btn btn-secondary" id="noticeAdmin">공지사항 관리</button>
		    <button type="button" class="btn btn-secondary" id="reportAdmin">신고 관리</button>
  		</div>
		<div id="title" class="text-secondary"><h3>&#91;신고관리&#93;</h3></div>
		<span  style="margin-top:0px;"class="badge badge-secondary">${member_level}</span>
		<div class="table active">
			<div class="row border-bottom" id="table_th">

				<div class="col-md-1"><strong>신고번호</strong></div>
				<div class="col-md-2"><strong>작성자</strong></div>
				<div class="col-md-2"><strong>날짜</strong></div>
				<div class="col-md-1"><strong>매물번호</strong></div>
				<div class="col-md-2"><strong>신고상세</strong></div>
				<div class="col-md-2"><strong>링크</strong></div>
				<div class="col-md-2"><strong>처리여부</strong></div>
			</div>
		
		<c:forEach var="ReportDto" items="${ReportList}">	
				<div class="row border-bottom" id="table_td">
					<div class="col-md-1" id="textCut">${ReportDto.report_number}</div>
					<div class="col-md-2" id="textCut"><strong>${ReportDto.member_id}</strong></div>
					<div class="col-md-2" id="textCut"><strong>${ReportDto.report_date}</strong></div>
					<div class="col-md-1" id="textCut">${ReportDto.sales_number}</div>
					<div class="col-md-2" id="textCut"> <input type="button"  class="btn btn-secondary" value="상세보기" onclick="pop('${root}','${ReportDto.report_number}')" /></div>
					<div class="col-md-2" id="textCut"> <a href="http://192.168.0.8:8181/jeju/sales/detail?sales_number=${ReportDto.sales_number}&pageNumber=1" >페이지로 이동</a> </div>
					<div class="col-md-2" id="textCut">${ReportDto.check_complete}</div>
				</div>
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
				      <a class="page-link" href="${root}/report/admin?pageNumber=${startPage - pageBlock}" tabindex="-1" aria-disabled="true">이전</a>
				    </li>
				    <c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
				    <li class = "page-item"><a class="page-link" href="${root}/report/admin?pageNumber=${i}">${i}</a></li>
				  	</c:forEach>
				    <li id = "next" class = "page-item disabled">
				      <a class = "page-link" href = "${root}/report/admin?pageNumber=${startPage + pageBlock}">다음</a>
				    </li>
				  </ul>
				  
				</nav>
			 </div>
	</div>
</div>
</body>
</html>