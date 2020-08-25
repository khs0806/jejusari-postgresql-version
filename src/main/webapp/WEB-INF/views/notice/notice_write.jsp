<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<%-- <link type = "text/css" rel = "stylesheet" href = "${root}/css/admin/notice_write.css"/> --%>
<%-- <link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css"> --%>
<!-- 공지사항 작성 툴 -->
<script type="text/javascript" src="${root }/javascript/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script type="text/javascript">
function noticeCheck(obj){
	
	//작성자 입력 유무 체크
	if(obj.member_id.value == ""){
		alert("작성자를 입력하세요.");
		obj.member_id.focus();
		return false;
	}
	
	//내용 입력 유무 체크
	if(obj.notice_content.value == ""){
		alert("내용을 입력하세요.");
		obj.notice_content.focus();
		return false;
	}
	
	//제목 입력 유무 체크
	if(obj.notice_title.value == ""){
		alert("제목을 입력하세요.");
		obj.notice_title.focus();
		return false;
	}
}
</script>
</head>
<body>
	<div class = "container" id = "board">
		<h3 class="text-secandary">[공지사항 작성]</h3>
		<span class="badge badge-secondary">관리자</span>
		<form action="${root}/notice/writeOk" method = "post" onsubmit = "return noticeCheck(this)" id = "noticeWrite">
			<div id = "box">
				<div class = "writer">
					<label>작성자</label>
					<!-- <input type = "text" value = "관리자"> -->
					<input name="member_id" type="text" class="form-control" value = "${member_id}" readonly>
				</div>
				
				<div class = "title">
					<label>제목</label>
					<!-- <input type = "text" name = "subject"> -->
					<input name="notice_title" type="text" class="form-control" placeholder="제목을 입력하세요.">
				</div>
				
<!-- 					파일 업로드
					<div class = "file">
						<label>첨부파일</label>
						<input type = "file" size = "40" name = "file">
					</div> -->
				
				<!-- <div class="file">
			      <label for="exampleInputFile">첨부파일</label>
			      <input class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" type="file">
			      <small class="form-text text-muted" id="fileHelp">첨부파일을 선택해주세요.</small>
   				</div> -->
				
				<!-- <div class = "category">
					<textarea rows="13" cols="93" name = "content"></textarea>
				</div> -->
				
				<div class="category">
					<textarea name = "notice_content" class="form-control" id="summernote" rows="3" style = "height: 100px;"></textarea>
   				</div>
   				
   				<script>
   				$(document).ready(function() {
   				  $('#summernote').summernote();
   				});
   				$('#summernote').summernote({
   					  height: 300,				//에디터 높이
   					  minHeight: null,			//최소 높이
   					  maxHeight: null,			//최대 높이
   					  focus: true,				//에디터 로딩 후 포커스를 맞출지
   					  placeholder: '최대 2048자까지 작성할 수 있습니다.',
   				// 이미지 첨부 부분
   		  				callbacks: {
   							onImageUpload: function(image) {
   								//console.log("좀 찍혀봐;");	//여까진 찍힘
   								uploadImageContent(image);
   								//console.log("함수 넘어가?;");	//안돌아옴 -> script에 jquery.min.js 추가해주니까 넘어감!
   							}
   						}
   				// 이미지 첨부 부분 끝
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
   		 		function uploadImageContent(image) {
   					var data = new FormData();
   					data.append("file", image[0]);
   					//data.append();
   				/* 	반복해서 받을경우 반복문돌리기
   					var f = new FormData();

   		            var files = e.target.files;

   		            for (var i = 0; i < files.length; i++) {
   		                f.append("files", files[i]);
   		            } */
   					console.log(image);
   					var url = '${root}/uploadSummernoteImageFile';
   					console.log(url);
   					$.ajax({
   						url: url,
   						cache: false,
   						contentType: false,
   						processData: false,
   						enctype: 'multipart/form-data',
   						data: data,
   						type: "POST",
   						success: function(d) {
   							var srcUrl=d.url;
   							console.log(d.url);
   							console.log(d.responseCode);
   							console.log(d.filename);
   							var image = $('<img>').attr('src', srcUrl);
   							$img = $('<img>').attr({ src: srcUrl })
   						   	$("#summernote").summernote('insertNode', $img[0]);
   						},
   						error: function(data) {
   							console.log('안들어갔슈');
   							console.log(data);
   						}
   					});
   				}
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