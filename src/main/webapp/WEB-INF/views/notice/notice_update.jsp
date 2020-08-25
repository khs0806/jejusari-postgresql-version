<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<%-- <link type = "text/css" rel = "stylesheet" href = "${root}/css/admin/notice_write.css"/>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css"> --%>
<!-- 공지사항 작성 툴 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
</head>
<body>
	<div id = "board" class = "container">
		<h3 class="text-secondary">[공지사항 작성]</h3>
		<span class="badge badge-secondary">관리자</span>
		<form action="${root}/notice/updateOk" method = "post">
			<input type = "hidden" name = "notice_number" value = "${noticeDto.notice_number}"/>
				<div id = "box">
					<div class = "writer">
						<label>작성자</label>
						<input class="form-control" type = "text" value = "${noticeDto.member_id}" name = "member_id1" readonly>
						<input type="hidden" value = "${noticeDto.member_id}" name = "member_id" />
					</div>
					
					<div class = "title">
						<label>제목</label>
						<input type = "text" name = "notice_title" value = "${noticeDto.notice_title}" class="form-control">
					</div>
					

					
					<div class="category">
				      <textarea name = "notice_content" class="form-control" id="summernote" rows="3" style = "height: 100px;">${noticeDto.notice_content}</textarea>
    				</div>
    				
    				<script>
    					$('#summernote').summernote({
    					  height: 300,
    					  minHeight: null,
    					  maxHeight: null,
    					  focus: true,
    					  placeholder: '최대 2048자까지 작성할 수 있습니다.'
    					});
    					
    					$('.dropdown-toggle').dropdown();
    					
    					$("#summernote").summernote({
    					    toolbar: [
    					        ['para', ['ul']]
    					    ],
    					    focus: true,
    					    disableResize: true,
    					    disableResizeEditor: true,
    					    resize: false
    					});
    					$('.note-statusbar').hide()
    				</script>
					
					
					<div class = "text" style = "text-align: right;">
						<button class="btn btn-secondary" type="button" onclick = "location.href = '${root}/notice'">목록</button>
						<button class="btn btn-secondary" type="reset">취소</button>
						<button class="btn btn-secondary" type="submit">작성</button>
						<%-- <input type = "button" value = "목록" onclick = "location.href = '${root}/notice/notice_list.do'"/> --%>
						<!-- <input type = "reset" value = "취소"> -->
						<!-- <input type = "submit" value = "작성"> -->
					</div>
			</div>
		</form>
	</div>
</body>
</html>