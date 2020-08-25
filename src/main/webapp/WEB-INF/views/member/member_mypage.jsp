<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/member/member_mypage.css">
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.css">
<style type="text/css">
	#salesTitle, #scrapTitle {
		list-style-position:inside;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
		font-weight: bold;
		display: inline-block;
	}
</style>
<script type="text/javascript">
	$(function() {
		// 중개업자만 매물 등록 섹션 보이기
		if(${member_level == "BR"}){
 			$("#sales_cards").show();
        } else {
        	$("#sales_cards").hide();
        }
		
		//스크랩 삭제	
		$("input:button[name=delScrapBtn]").on("click",function(){
			var sales_number=$(this).next().val();
// 			alert(sales_number);
			
			$.ajax({
		      	url:"${root}/sales/scrap?sales_number=" + sales_number,
		     	type:"get",
		      	dataType:"text",
		      	success:function(data){
		      		var check=$.parseJSON(data);
// 	      			alert(check);
		      		if(check==-1){
						location.href="${root}/member/mypage";
		      		}
		      	}
			});
		});
		
		//매물 삭제	
		$("input:button[name=delSalesBtn]").on("click",function(){
			var sales_number=$(this).next().val();
// 			alert(sales_number);
			
			$.ajax({
		      	url:"${root}/sales/delete",
		     	type:"post",
		      	dataType:"text",
		      	data:{sales_number: sales_number},
		      	success:function(){
					location.href="${root}/member/mypage";
		      	}
			});
		});
	
	});
</script>
</head>
<body>
	<div class="container">
		<div id="first">
			<p>
				<span>${member_name} 님</span>
				<a href="${root}/member/update">⚙ 회원정보 수정</a>
			</p>
		</div>
		
		<div id="second">
			<p style="">나의 스크랩</p>
			
			<div class="scrap-cards">
				<c:forEach items="${scrapList}" var="scrap">
					<div id="myscrap" class="card border-warning card-sh" style="max-width: 20rem;">
						<div class="card-body">
							<a href="${root}/sales/detail?sales_number=${scrap.sales_number}&pageNumber=1"><img alt="test" src="${root}${scrap.image_url}" width="280px" height="250px"></a>
<%-- 							<c:set var="title" value="${scrap.sales_title}"/> --%>
<%-- 							${fn:substring(title, 0, 10)}...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
							<div id="scrapTitle">${scrap.sales_title}</div>
							<input name="delScrapBtn" type="button" class="btn btn-warning" value="삭제">
							<input type="hidden" value="${scrap.sales_number}"/>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- 중개업자만 보임 -->
		<div id="sales_cards">
			<div id="third">
				<p>내가 올린 매물</p>
				
				<div class="scrap-cards">
					<c:forEach items="${salesList}" var="sales">
						<div class="card border-warning card-sh" style="max-width: 20rem;">
							<div class="card-body" >
								<a href="${root}/sales/detail?sales_number=${sales.sales_number}&pageNumber=1"><img alt="test" src="${root}${sales.image_url}" width="280px" height="250px"></a>
<%-- 								<c:set var="title" value="${sales.sales_title}"/> --%>
<%-- 								${fn:substring(title, 0, 10)}...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
								<div id="salesTitle">${sales.sales_title}</div>
								<input name="delSalesBtn" type="button" class="btn btn-warning" value="삭제">
								<input type="hidden" value="${sales.sales_number}"/>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>