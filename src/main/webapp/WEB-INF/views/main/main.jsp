<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	#main_page .card {height: 700px; overflow: hidden;display: flex;
            align-items: center;
            justify-content: flex-end;}
	#main_page .card img{    
		width: 100%;
	}
	#main_page .card-img-overlay{padding:15rem; text-align: center;}
	
	#newsTitle, #noticeTitle {
		list-style-position:inside;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
 
 <script>
 	$(function(){
 		if (${msg ne null}){
 			alert('${msg}');
 		}
 	});
 	
 </script>
 
 <div id="main_page">
	 <div class="card bg-dark text-white">
	  <img src="${root}/img/cozy-seopji-1833560_1920.jpg" class="card-img" alt="...">
	  <div class="card-img-overlay ">
		<form action="${root}/sales?keyword=${keyword}" >
		<div class="input-group mb-3">
		  <input id="searchKeyword" type="text" class="form-control" name="sales_address" placeholder="지역명을 검색하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
		  <div class="input-group-append">
		    <button class="btn btn-warning" type="submit" id="button-addon2">매물찾기</button>
		  </div>
		</div>
		</form>
	    <h5 class="card-title">제 주 살 이</h5>
	    <p class="card-text">제주살이는 제주거주를 꿈꾸는 이들을 위한 부동산 매물 정보 제공 사이트입니다.</p>
	    <p class="card-text">제주살이를 통해서 당신만의 특별한 제주살이를 실현하세요!</p>
	  </div>
	
	</div>

			<!-- <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
			  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
		   </svg> -->

	<div class="container">
		<div class="main">
			<div class="row mt-5 mb-5 mx-md-n5">
				<div class="col px-md-5">
						<div class="border-bottom mr-3 p-3" id="table_th_news">
							<strong>공지사항</strong>
							<strong style="float:right;">
								<a href="${root}/notice" style="color:#6c757d;font-size:12px;">> 더보기</a>
							</strong>
						</div>
						<c:forEach var="noticeDto" items="${noticeList}" end="6" varStatus="status">
						<a href="${root}/notice/detail?notice_number=${noticeDto.notice_number}">
							<div class="row table active">
								<div class="col-md-1 pl-5"><strong>${status.index+1}</strong></div>
								<div class="col-md-7" id="noticeTitle"><strong>${noticeDto.notice_title }</strong></div>
								<div class="col-md-3">
									<strong><fmt:formatDate value = "${noticeDto.notice_date}" pattern = "yyyy-MM-dd"/></strong>
								</div>
							</div>
						</a>
						</c:forEach>
				</div>
				
				<div class="col px-md-5">
                  <div class="border-bottom mr-3 p-3" id="table_th_news">
                  	<strong>제주 이슈</strong>
                  	<strong style="float:right;">
							<a href="${root}/news" style="color:#6c757d;font-size:12px;">> 더보기</a>
					</strong>
                  </div>
               <c:forEach items="${newsList}" end="6" var="news" varStatus="status">
                  <a href="${news.link}">
                     <div class="row table active">
                        <div class="col-md-1 pl-5"><strong>${status.index+1}</strong></div>
                        <div class="col-md-7" id="newsTitle"><strong>${news.title}</strong></div>
                        <div class="col-md-3"><strong>${news.date}</strong></div>
                     </div>
                  </a>
               </c:forEach>
            </div>
			</div>
		</div>
	</div>
</div>
