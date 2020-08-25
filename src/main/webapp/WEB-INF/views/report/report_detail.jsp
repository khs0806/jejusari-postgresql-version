<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="${root}/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="${root}/javascript/bootstrap/bootstrap.min.js"></script>
<script>
	function funcCancel(){
		self.close();
	}
</script>
<div class="container" id="sales_list">
	<br />
	<h3>신고 글쓰기</h3>
	<br />
	<form name="createForm1" action="${root}/report/write" method="post" onsubmit="return createForm(this)">
		<div class="row align-items-center justify-content-between">
			<div class="col-md">

				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
					</div>
					<c:forEach var="ReportDto" items="${list}" >
					<input type="text" class="form-control" value="${ReportDto.report_title}"/>
				</div>
			</div>

		</div>


		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">내 용</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" rows="14">
				${ReportDto.report_content}
			</textarea>
			</c:forEach>
		</div>
		<br />
		<div class="float-right">
			<button type="button" class="btn btn-light" onclick="funcCancel()">닫기</button>
		</div>
	</form>
</div>
