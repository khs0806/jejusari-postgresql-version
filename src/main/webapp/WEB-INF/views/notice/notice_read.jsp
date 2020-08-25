<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<%-- <link type = "text/css" rel = "stylesheet" href = "${root}/css/admin/notice_read.css"/>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css"> --%>
<style type="text/css" >
	.notice-content {height: inherit;width: inherit;overflow-x: scroll;}
</style>
<script type = "text/javascript">
function delFun(root, notice_number){
	var url = root + "/notice/delete?notice_number=" + notice_number;
	location.href = url;
}

function changeFun(root, notice_number){
	var url = root + "/notice/update?notice_number=" + notice_number;
	location.href = url;
}

$(function(){
	$("#adminbutton").hide();
});

$(function(){
	$("#memberbutton").hide();
});
</script>
<!-- <script>
	$(function(){
		$(".update-btn").click(function(){
			location.href='${root}/notice/update';
		});
	});
</script> -->
	<div class = "container" id = "board">
				<div id = "box">
					<h3 class="text-secondary">[공지사항]</h3>
					<span class="badge badge-secondary">${member_level}</span>
					
					<!-- 관리자에게만 보이는 버튼 -->
					<c:if test = "${member_level eq 'admin'}">
					 	<script type="text/javascript">
						 	$(function(){
								$("#adminbutton").show();
							});
					 	</script>
					 </c:if>
					 
					<div class = "text" style = "text-align: right;" id = "adminbutton">
						<button class="btn btn-secondary" type="button" onclick = "location.href = '${root}/notice'">목록</button>
						<button class="btn btn-secondary update-btn" type="button" onclick = "changeFun('${root}', '${noticeDto.notice_number}')">수정</button>
						<button class="btn btn-secondary delete-btn" type="button" onclick = "delFun('${root}', '${noticeDto.notice_number}')">삭제</button>
					</div>
					
					<!-- 회원에게만 보이는 버튼 -->
					<c:if test = "${member_level != 'admin'}">
					 	<script type="text/javascript">
						 	$(function(){
								$("#memberbutton").show();
							});
					 	</script>
					 </c:if>
					 
					<div class = "text" style = "text-align: right;" id = "memberbutton">
						<button class="btn btn-secondary" type="button" onclick = "location.href = '${root}/notice'">목록</button>
					</div>
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">${noticeDto.notice_title}</div>
					</div>
					
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">글번호</span>
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">${noticeDto.notice_number}</div>
					  
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">조회수</span>
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">${noticeDto.notice_count}</div>
					  
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">작성일</span>
					    <%-- <fmt:formatDate value = "${dto.작성일}" pattern = "yyyy-MM-dd HH:mm:ss"/> --%>
					    
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  	<fmt:formatDate value = "${noticeDto.notice_date}" pattern = "yyyy-MM-dd HH:mm:ss"/>
					  </div>
					  
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>					    
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">${noticeDto.member_id}</div>
					</div>
					
					<%-- <c:if test = "${boardDto.fileSize != 0}">
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">첨부 파일</span>
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">있으면출, 없으면 출력안함</div>
					  <a href = "${root}/notice/downLoad.do?글번호=${글번호}">${파일이름}</a>
					</div>
					</c:if> --%>

					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">내용</span>
					  </div>
					  <div class="form-control text-justify notice-content" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  	${noticeDto.notice_content}
					  </div>
					</div>
					
			</div>
			
			
	</div>
