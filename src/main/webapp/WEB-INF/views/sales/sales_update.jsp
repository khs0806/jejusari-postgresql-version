<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  -->
<script type="text/javascript" src="${root }/javascript/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!--  -->
<link rel="stylesheet" href="${root }/css/bootstrap/bootstrap.min.css">

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18514d37ace0e69349e647543ecf89f8&libraries=services"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		
		if(${salesDto.sales_category_type=='아파트'}){
			$("#APT").attr("checked",true);
		}
		if(${salesDto.sales_category_type=='원룸'}){
			$("#ONE").attr("checked",true);
		}
		if(${salesDto.sales_category_type=='투룸' }){
			$("#TWO").attr("checked",true);
		}
		if(${salesDto.sales_category_type=='쓰리룸'}){
			$("#THREE").attr("checked",true);
		}
		if(${salesDto.sales_category_type=='오피스텔'}){
			$("#OFFICE").attr("checked",true);
		}
		
		if(${salesDto.sales_full!=1}){
			$("#inlineCheckbox1").prop("checked", true);
		}
		if(${salesDto.sales_parking!=1}){
			$("#inlineCheckbox2").prop("checked", true);
		}
		if(${salesDto.sales_cctv!=1}){
			$("#inlineCheckbox3").prop("checked", true);
		}
		if(${salesDto.sales_ele!=1}){
			$("#inlineCheckbox4").prop("checked", true);
		}
		
		

		$(".custom-file-input").on("change", function() {
			  var fileName = $(this).val().split("\\").pop();
			  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
		});

	});
</script>
</head>
<body>
	<div class="container" id="sales_list">
		<h3>매물 글쓰기</h3>
		<form action="${root }/sales/updateOk" method="post"  enctype = "multipart/form-data">
		<div class="row align-items-center justify-content-between">
			<div class="col-md-8">
			
				<!-- 아파트/원룸투룸쓰리룸/오피스텔 라디오박스 -->
				<div class="btn-group btn-group-toggle mb-3" data-toggle="buttons">
					<label class="btn btn-outline-warning">
						<input type="radio" name="sales_category_type" value="아파트" id="APT">아파트
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="sales_category_type" value="원룸" id="ONE">원룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="sales_category_type" value="투룸" id="TWO">투룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="sales_category_type" value="쓰리룸" id="THREE">쓰리룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="sales_category_type" value="오피스텔" id="OFFICE">오피스텔
					</label>
				</div>
				
				<!-- 전월세/매매 선택 셀렉트 박스 -->
				<div class="input-group mb-3 align-items-center">
					<select id="sales_category_rent" name="sales_category_rent" class="custom-select col-md-2">
						<option value="${salesDto.sales_category_rent }">${salesDto.sales_category_rent }</option>
						<option value="매매">매매</option>
						<option value="전세">전세</option>
						<option value="월세">월세</option>
					</select>
					
					
				  <input name="sales_title" type="text" class="form-control" placeholder="${salesDto.sales_title }" value="${salesDto.sales_title }" aria-label="제목을 입력하세요.">
				</div>
				
				<!-- 옵션 선택 태그 -->
				<div class="form-check form-check-inline">
				  <input name="sales_option" class="form-check-input" type="checkbox" id="inlineCheckbox1" value="풀옵션">
				  <label class="form-check-label" for="inlineCheckbox1">풀옵션</label>
				</div>
				<div class="form-check form-check-inline">
				  <input name="sales_option" class="form-check-input" type="checkbox" id="inlineCheckbox2" value="주차장">
				  <label class="form-check-label" for="inlineCheckbox2">주차장</label>
				</div>
				<div class="form-check form-check-inline">
				  <input name="sales_option" class="form-check-input" type="checkbox" id="inlineCheckbox3" value="CCTV">
				  <label class="form-check-label" for="inlineCheckbox3">CCTV</label>
				</div>
				<div class="form-check form-check-inline">
				  <input name="sales_option" class="form-check-input" type="checkbox" id="inlineCheckbox4" value="엘레베이터">
				  <label class="form-check-label" for="inlineCheckbox4">엘레베이터</label>
				</div>
				
				<!-- 주소찾기 검색창 -->
				<div class="input-group input-group-sm mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-sm">주소찾기</span>
				  </div>
				  <input type="text" name="sales_address" id="sample5_address" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="${salesDto.sales_address }" value="${salesDto.sales_address }" readOnly>
				</div>
				
			</div>
			
			<!-- 우측상단 3개 입력정보 -->
			<div class="col-md-3">
		<script type="text/javascript">
					$(function(){	//매매, 전세, 월세 선택에 따라 보증금, 매매가(월세) 입력란 드러나고 감춰지게
						$("select[name='sales_category_rent']").click(function(){
							//console.log($("#sales_category_rent option:selected").val());
							if($("#sales_category_rent option:selected").val()=='전세'){
								$("#sales_cost").hide();
								$("input[name='sales_cost']").val('0');
								console.log($("input[name='sales_cost']").val());
								$("#sales_deposit").show();
							}
							if($("#sales_category_rent option:selected").val()=='월세'){
								$("#sales_cost").show();
								$("#sales_deposit").show();
							}
							if($("#sales_category_rent option:selected").val()=='매매'){
								$("#sales_cost").show();
								$("#sales_deposit").hide();
								$("input[name='sales_deposit']").val('0');
							}
						});
					});
			</script>
			<!-- 여기에 c:if써서 월세면 보증금도 추가, 전세면 보증금만 나오게, 매매는 가격만 나오게 -->
				<div class="input-group input-group-sm mb-2" id="sales_deposit">
					<div class="input-group-prepend">
				    	<span class="input-group-text">가격 (만원)</span>
					</div>
					<input name="sales_cost" type="text" class="form-control" placeholder="${salesDto.sales_deposit }" value="${salesDto.sales_deposit }"  aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group input-group-sm mb-2" id="sales_cost">
					<div class="input-group-prepend">
				    	<span class="input-group-text">가격 (만원)</span>
					</div>
					<input name="sales_cost" type="text" class="form-control" placeholder="${salesDto.sales_cost }" value="${salesDto.sales_cost }" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group input-group-sm mb-2">
					<div class="input-group-prepend">
				    	<span class="input-group-text" id="sales_area">면적(m<sup>2</sup>)</span>
					</div>
					<input name="sales_area" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="${salesDto.sales_area }" value="${salesDto.sales_area }">
				</div>
				<div class="input-group input-group-sm mb-2">
					<div class="input-group-prepend">
				    	<span class="input-group-text" id="sales_build_year">준공년도</span>
					</div>
					<input name="sales_build_year" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="${salesDto.sales_build_year }" value="${salesDto.sales_build_year }">
				</div>
				<div class="input-group input-group-sm mb-2">
					<div class="input-group-prepend">
				    	<span class="input-group-text" id="sales_floor">&nbsp;&nbsp;층&nbsp;&nbsp;수&nbsp;&nbsp;</span>
					</div>
					<input name="sales_floor" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="${salesDto.sales_floor }" value="${salesDto.sales_floor }">
				</div>
			</div>
			
		</div>

		<!-- 본문 -->
		<div class="form-group">
		    <label for="exampleFormControlTextarea1">내용</label>
		    <textarea name="sales_content" class="form-control" id="summernote" rows="14">${salesDto.sales_content }</textarea>
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
		
		<!-- 파일업로드 -->
		<div class="input-group flex-nowrap mb-1">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="addon-wrapping">현재 이미지</span>
		  </div>
		  <input type="text" class="form-control" placeholder="${urlNameAll }" aria-label="${urlNameAll }" aria-describedby="addon-wrapping" readOnly>
		</div>
		<div class="input-group mb-3">
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" id="inputGroupFile02" name="thumbnail">
		    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
		  </div>
		  <div class="input-group-append">
		    <span class="input-group-text" id="inputGroupFileAddon02">Upload</span>
		  </div>
		</div>
		
		
		<!-- 작성버튼 -->
		<div class="d-flex justify-content-end mb-5">
			<button type="submit" class="btn btn-warning mr-3">수정</button>
			<button type="button" name="sales_no_update" class="btn btn-light">취소</button>
		</div>
		<script type="text/javascript">
			$("input:button[name=sales_no_update]").click(function(){
				var check=confirm("매물 정보 수정을 취소하시겠습니까?");
				if(check==true){
					location.href="${root }/sales/detail?sales_number=${salesDto.sales_number}&pageNumber=${pageNumber}";
				}
			})
		</script>
			<input name="sales_number" type="hidden" value="${salesDto.sales_number}"/>
			<input name="pageNumber" type="hidden" value="${pageNumber}"/>
		</form>
	</div>	
	

<script type="text/javascript" src="${root }/javascript/sales/sales_address.js"></script>
</body>
</html>