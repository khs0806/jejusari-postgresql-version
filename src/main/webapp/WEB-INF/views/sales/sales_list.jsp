<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${root }/javascript/jquery-3.5.1.js"></script>
		<script>
		function updateCostInput(val) {
          document.getElementById('costInput').value=val; 
        }
		function updateAreaInput(val) {
          document.getElementById('areaInput').value=val; 
        }
		
		$(function(){
			$("#BRbutton").hide();
		});
		</script>
<script>
	function updateCostInput(val) {
		document.getElementById('costInput').value = val;
	}
	function updateAreaInput(val) {
		document.getElementById('areaInput').value = val;
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container" id="sales_list">
		<form action="${root}/sales?keyword=${keyword}">
			<div class="btn-group btn-group-toggle mb-3" data-toggle="buttons">
					<label class="btn btn-outline-warning">
						<input type="checkbox" name="sales_category_type" value="아파트" id="APT">아파트
					</label>
					<label class="btn btn-outline-warning">
						<input type="checkbox" name="sales_category_type" value="원룸" id="ONE">원룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="checkbox" name="sales_category_type" value="투룸" id="TWO">투룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="checkbox" name="sales_category_type" value="쓰리룸" id="THREE">쓰리룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="checkbox" name="sales_category_type" value="오피스텔" id="OFFICE">오피스텔
					</label>
				</div>
			<div class="input-group mb-3">
				<select name="sales_category_rent" class="custom-select col-md-1">
					<option value="">옵션</option>
					<option value="매매">매매</option>
					<option value="전세">전세</option>
					<option value="월세">월세</option>
				</select>
			  <input id="searchKeyword" type="text" class="form-control col-md-4" placeholder="지역명을 입력하세요." name="sales_address" aria-describedby="button-addon2" value="${salesDto.sales_address}">
			  <div class="input-group-append">
			    <button class="btn btn-outline-warning" type="submit" id="button-addon2"><strong>매물찾기</strong></button>
			  </div>
			</div>

			<!-- range -->
			<!-- <input type="range" min="0" max="20" step="0.1" onchange="updateCostInput(this.value);"> <label>가격</label>
			<input type="text" style="text-align:center;"size="1" id="costInput" value=""><span>억</span>
			<input type="range"  onchange="updateAreaInput(this.value);"> <label>면적</label>
			<input type="text" style="text-align:center;"size="1" id="areaInput" value=""><span>평</span>
			<br>
			 -->
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" name="sales_option" id="foolOption" value="풀옵션">
			  <label class="form-check-label" for="foolOption">풀옵션</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" name="sales_option" id="parking" value="주차장">
			  <label class="form-check-label" for="parking">주차장</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" name="sales_option" id="cctv" value="CCTV">
			  <label class="form-check-label" for="cctv">CCTV</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" name="sales_option" id="elevator" value="엘리베이터">
			  <label class="form-check-label" for="elevator">엘리베이터</label>
			</div>
			
		</form>
		
		<!-- 게시판 목록 -->
		<div class="table active">
			<div class="row border-bottom" id="table_th">
				<div class="col-md-6"><strong>제목</strong></div>
				<div class="col-md-1"><strong>종류</strong></div>
				<div class="col-md-2"><strong>면적</strong></div>
				<div class="col-md-1"><strong>구분</strong></div>
				<div class="col-md-2"><strong>가격</strong></div>
			</div>
		<c:forEach var="salesList" items="${salesList }">
		<script type="text/javascript">
			$(function(){	
			// 보증금가 1억이상일때 표현을 몇 억 000만원 으로 표시되게
				var billion=Math.floor('${salesList.sales_deposit}'/10000);
				var deposit=null;
				if(billion>=1 ? deposit=billion+'억'+('${salesList.sales_deposit}'%10000)+"만원" : deposit='${salesList.sales_deposit}'+"만원");
				console.log("보증금 : "+deposit);
				/* { 
					var deposit=billion+'억'+sales_deposit(sales_cost) % 10000+"만원";
				 }
				if(billion < 1){
					var deposit=sales_deposit;
				} */
				$("#sales_deposit${salesList.sales_number }").text(deposit);
				
			// 매매가가 1억이상일때 표현을 몇 억 000만원 으로 표시되게 (sales_cost)
				var billion1=Math.floor('${salesList.sales_cost}'/10000);
				var deposit1=null;
				if(billion1>=1 ? deposit1=billion1+'억'+('${salesList.sales_cost}'%10000)+"만원" : deposit1='${salesList.sales_cost}'+"만원");
				console.log("매매가 : "+deposit1);
				$("#sales_cost${salesList.sales_number }").text(deposit1);
				
			// 보증금, 매매가 0일때 감추는 jquery. c:forEach 사이에 존재해야함
				if('${salesList.sales_deposit}'==0){
					$("#sales_deposit${salesList.sales_number }").hide();
				}
				if('${salesList.sales_cost}'==0){
					$("#sales_cost${salesList.sales_number }").hide();
				}
				if('${salesList.sales_deposit}'!=0 && '${salesList.sales_cost}'!= 0){
					$('#slash${salesList.sales_number }').text(" / ");
				}
			});
		</script>
			<a href="${root}/sales/detail?sales_number=${salesList.sales_number }&pageNumber=${pageMaker.cri.pageNumber}">
			<div class="row border-bottom" id="table_td">
				<div class="col-md-6"><strong>${salesList.sales_title}</strong><p>${salesList.sales_address}</p></div>
				<div class="col-md-1">${salesList.sales_category_type}</div>
				<div class="col-md-2"><fmt:formatNumber value="${salesList.sales_area/(3.3)}" type="number" pattern="0.0"/>평/
						<fmt:formatNumber value="${salesList.sales_area}" type="number" pattern="0.0"/>m<sup>2</sup>/${salesList.sales_floor}층</div>
				<div class="col-md-1">${salesList.sales_category_rent}</div>
				<div class="col-md-2"><span id="sales_deposit${salesList.sales_number}"></span><span id="slash${salesList.sales_number}"></span><span id="sales_cost${salesList.sales_number }"></span></div>
			<!-- 	<div class="col-md-2"></div> -->
			</div>
			</a>
		</c:forEach>
		</div>
		
		<!-- 페이징 -->
		
		<div class="d-flex bd-highlight">
          <div class="p-2 w-100 bd-highlight">
            <nav aria-label="Page navigation">
              <ul class="pagination justify-content-center">
              <c:if test="${pageMaker.prev}">
                <li id="previous" class="page-item">
                  <a class="page-link" href="${root}/sales${pageMaker.makeSearch(pageMaker.startPage - 1)}">Previous</a>
                </li>
               </c:if>
              <c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item" id="pageNumber${idx }"><a class="page-link" href="${root}/sales${pageMaker.makeSearch(idx)}">${idx}</a></li>


              </c:forEach>
                 <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                <li id="next" class="page-item">
                  <a class="page-link" href="${root}/sales${pageMaker.makeSearch(pageMaker.endPage + 1)}">Next</a>
                </li>
                </c:if>
              </ul>
            </nav>
          </div>
          
			 <c:if test = "${member_level eq 'BR'}">
			 	<script type="text/javascript">
				 	$(function(){
						$("#BRbutton").show();
					});
			 	</script>
			 </c:if>
			 <!-- 매매업자에게만 보이는 글쓰기 버튼 -->
			 <div class="p-2 flex-shrink-1 bd-highlight" id = "BRbutton">
			  	<input type="button" value="매물올리기" class="btn btn-warning btn-sales">
			 </div>
		</div>
		<script>
		$(function(){
				$(".btn-sales").click(function(){
					location.href='${root}/sales/write';
				});
		});
		/*paging handler*/
		$(function(){
		    var url = window.location.href;  
		    if((url.length-33)>0){
			    var activePage = url.substring(url.lastIndexOf('pageNumber=')+11, url.indexOf('&'));
			    console.log(activePage);
			    $('#pageNumber'+activePage).addClass('active'); 
		    }else{
		    	$('#pageNumber1').addClass('active'); 
			}
		})
		</script>
		
		<br>
		<br>
	</div>
</body>
</html>