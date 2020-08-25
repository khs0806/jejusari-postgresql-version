<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="${root}/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="${root}/javascript/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/javascript/board/report_register.js"></script>
<script>


	function funcCancel(){
		self.close();
	}
	
	function button_event(root,pageNumber) {

		 if (confirm("작성된 신고글을 등록하시겠습니까?\n신고내용이 명백히 거짓인 경우 책임을 물어야합니다.") == true){    //확인
			
		     document.form.submit();
		     var url = root+"/admin/report_admin?pageNumber="+pageNumber;
	         location.href=url;
		 }else{   //취소

			 self.close();

		 }
	}

</script>
<div class="container" id="sales_list">
	<br />
	<h3>신고 글쓰기</h3>
	<br />

	<form name="createForm1" action="${root}/report/write" method="post" onsubmit="return createForm(this)">
		<div class="row align-items-center justify-content-between">
			<div class="col-md">
				<input type="hidden" name = "sales_number" value="${sales_number}">
				<input type="hidden" name = "pageNumber" value="${pageNumber}">
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
					</div>
					<input type="text" class="form-control"  name="report_title" placeholder="제목을 입력하세요."
						aria-label="제목을 입력하세요.">
				</div>


				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">신고매물 이름</span>
					</div>
					<input type="text" class="form-control" name="sales_title" value="${sales_title}"
						 aria-describedby="basic-addon1" readonly style="background-color: #ffffff;" >
				</div>
			</div>

		</div>


		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text" >내 용</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" rows="14"
				placeholder="내용을 입력하세요." name="report_content" aria-label="내용을 입력하세요."></textarea>
		</div>

		<br />

		<div class="float-right">
			<button type="submit" class="btn btn-warning" onclick="button_event('${root}','${salesDto.sales_number}')">작성</button>
			<button type="button" class="btn btn-light" onclick="funcCancel()">취소</button>
		</div>
	</form>
</div>
