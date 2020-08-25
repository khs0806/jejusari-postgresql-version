<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<%-- 
<link rel="stylesheet" href="${root}/css/admin/member_admin.css">
<link rel="stylesheet" href="${root}/css/admin/notice_list.css"> --%>
<script type="text/javascript" src="${root}/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnDrop").click(function(){
		
		var drop=[];
		
		$("input[name=drop]:checked").each(function(){
			drop.push($(this).val());
		});
		
		
		if(drop.length==0){
			alert("삭제할 항목을 선택해주세요.")
		}else{
			if(confirm("정말 삭제하시겠습니까?") == true){
				$.ajax({
					type:"POST",
					url:"${root}/member/drop",
					data:{"drop":drop},
					async:false,
					success:function pageReload(){
						alert("삭제되었습니다.");
						location.href="${root}/member/admin";
					},
					error:function(){
						alert("삭제가 실패되었습니다.");
					}
				});
				
				drop = new Array();
				id="";
			}
			else{
				location.reload(true);
			}
			
		}

	});
	
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
<!-- <form action="#" method="POST" onsubmit="return memberDrop(this)"> -->
<c:if test="${member_level != 'admin'}">
	<script type="text/javascript">
		alert("접근할 수 있는 권한이 없는 페이지 입니다.");
		location.href="${root}/main";
	</script>
</c:if>
	<div class = "container">
		<div class="btn-group mb-3">
		    <button type="button" class="btn btn-secondary" id="memberAdmin">회원 관리</button>
		    <button type="button" class="btn btn-secondary" id="noticeAdmin">공지사항 관리</button>
		    <button type="button" class="btn btn-secondary" id="reportAdmin">신고 관리</button>
  		</div>
		<div id="title" class="text-secondary"><h3>&#91;회원관리&#93;</h3></div>
		<span  style="margin-top:0px;" class="badge badge-secondary">${member_level}</span>
		
		<div class="table active">
			<div class="row border-bottom" id="table_th">
				<div class="col-md-1">&nbsp;</div>
				<div class="col-md-1"><strong>번호</strong></div>
				<div class="col-md-2"><strong>아이디</strong></div>
				<div class="col-md-3"><strong>이메일</strong></div>
				<div class="col-md-2"><strong>등급</strong></div>
				<div class="col-md-3"><strong>가입일시</strong></div>
			</div>
		<c:forEach var="MemberDto" items="${MemberList}">	
			<div class="row border-bottom" id="table_td">
				<div class="col-md-1"><input type="checkbox" value="${MemberDto.member_number}" name="drop"/></div>
				<div class="col-md-1">${MemberDto.member_number}</div>
				<div class="col-md-2"><p><strong>${MemberDto.member_id}</strong></p></div>
				<div class="col-md-3">${MemberDto.member_email}</div>
				<div class="col-md-2">${MemberDto.member_level}</div>
				<div class="col-md-3">${MemberDto.member_register_date}</div>
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
				      <a class="page-link" href="${root}/member/admin?pageNumber=${startPage - pageBlock}" tabindex="-1" aria-disabled="true">이전</a>
				    </li>
				    <c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
				    <li class = "page-item"><a class="page-link" href="${root}/member/admin?pageNumber=${i}">${i}</a></li>
				  	</c:forEach>
				    <li id = "next" class = "page-item disabled">
				      <a class = "page-link" href = "${root}/member/admin?pageNumber=${startPage + pageBlock}">다음</a>
				    </li>
				  </ul>
				  
				</nav>
			 </div>
			 
			 <!-- 관리자에게만 보이는 글쓰기 버튼 -->
			 <div class="p-2 flex-shrink-1 bd-highlight">
				 <input type="submit"  class="btn btn-secondary" id="btnDrop" value="회원탈퇴"/>
			 </div>
		</div>
		
	</div>
<!-- </form> -->
</body>
</html>