<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!-- css -->
<link rel="stylesheet" href="${root}/css/sales_board/sales_details.css"/>
<style type="text/css" >
	.sales-content {height: inherit; width: inherit;overflow-x: scroll;}
</style>
<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2992107a6cdd4a70cae5c448140c5fd1&libraries=services"></script> 

<script type="text/javascript">
	$(document).ready(function() {    
		//게스트 막아주기?
		if(${session_member_id==null}){
			alert("매물정보를 확인하시려면 로그인해주십시오.");
			location.href="${root}/member/login";
		}
		
		//스크랩 버튼색...
		if(${scrap_check>0}){
			$("input:button[name=scrap_btn]").css("color","#212529");
			$("input:button[name=scrap_btn]").css("background-color","#ffc107");
			$(".scrap_star").attr("src","${root}/img/star2.png");
			$("input:button[name=scrap_btn]").val("스크랩취소");
		}
		
		var opac_num=(${factorMap.factor_total}/${factor_all_avg})*100
		$(".factor_img").css("filter","opacity("+opac_num+")");
		
		if(${factorMap.factor_total}<=${factor_all_avg}){
			$(".factor_img").css("filter","opacity(0.5)");
		}
		
		//스크랩 클릭시
		var scount=${scrap_count };
			$("input:button[name=scrap_btn]").on("click",function(){
				$.ajax({
			      	url:"${root}/sales/scrap?sales_number=${salesDto.sales_number}",
			     	type:"get",
			      	dataType:"text",
			      	success:function(data){
			      		var check=$.parseJSON(data);
			      		
			      		if(check==1){
			      			$("input:button[name=scrap_btn]").css("color","#212529");
							$("input:button[name=scrap_btn]").css("background-color","#ffc107");
							$(".scrap_star").attr("src","${root}/img/star2.png");
							
							scount=scount+1;
							$(".scrap_count").text(scount);
							$("input:button[name=scrap_btn]").val("스크랩취소");

							alert("스크랩이 완료되었습니다."); 
			      		}else if(check==-1){
			      			$("input:button[name=scrap_btn]").css("color","#ffc107");
							$("input:button[name=scrap_btn]").css("background-color","#ffffff");
							$(".scrap_star").attr("src","${root}/img/star1.png");
							
							scount=scount-1;
							$(".scrap_count").text(scount);
							$("input:button[name=scrap_btn]").val("스크랩");
							
							alert("스크랩이 취소되었습니다."); 
			      		}
			      		
			      	}
			   	});				
		})
		

		//옵션 이미지 변경
		if(${salesDto.sales_full!=1}){
			$(".opt_full").css("filter","invert(80%)");
			$(".opt_full_msg").css("filter","invert(80%)");
		}
		if(${salesDto.sales_parking!=1}){
			$(".opt_parking").css("filter","invert(80%)");
			$(".opt_parking_msg").css("filter","invert(80%)");
		}
		if(${salesDto.sales_cctv!=1}){
			$(".opt_cctv").css("filter","invert(80%)");
			$(".opt_cctv_msg").css("filter","invert(80%)");
		}
		if(${salesDto.sales_ele!=1}){
			$(".opt_ele").css("filter","invert(80%)");
			$(".opt_ele_msg").css("filter","invert(80%)");
		}
		
		//이미지 더 보기 클릭시
		$(".img_more").click(function(){
			//alert("ok");
			$(".imgs").show();
			$(".img_small").show();
			$(".img_more").hide();
		})
		
		//이미지 줄여보기?
		$(".img_small").click(function(){
			//alert("ok");
			$(".imgs").hide();
			$(".img_small").hide();
			$(".img_more").show();
		})
		
		//중개인 더보기 클릭시
		$("input:button[name=member_info]").click(function(){
			window.open('${root}/sales/broker?member_id=${salesDto.member_id }', '', 'width = 300, height = 250');
		})
		
		//매물 더보기 클릭시
		$("input:button[name=more_sales]").click(function(){
			location.href="${root }/sales?pageNumber=${pageNumber}";
		})
		
		//수정 클릭시
		$("input:button[name=sales_update]").click(function(){
			var check=confirm("매물 정보를 수정하시겠습니까?");
			if(check==true){
				location.href="${root }/sales/update?sales_number=${salesDto.sales_number }&pageNumber=${pageNumber}";
			}
		})
		
		//신고처리 클릭시
		$("input:button[name=report_btn]").click(function(){
			var check=confirm("매물 정보를 신고처리하시겠습니까?");
		
			if(check==true){

				//alert("ok");
				window.open('${root}/report/write?sales_number=${salesDto.sales_number}&sales_title=${salesDto.sales_title}', '', 'width = 600, height = 600');

				window.open('${root}/report/write?pageNumber=${pageNumber}&sales_number=${salesDto.sales_number}&sales_title=${salesDto.sales_title}', '', 'width = 600, height = 600');

			}
		})
		
	//삭제하기 클릭시
		$("input:button[name=sales_delete]").click(function(){

				window.open('${root}/sales/delete?sales_number=${salesDto.sales_number}', '', 'width = 600, height = 400');
		
	})
	});

</script>

<div class="container" id="sales_detail">
	<!-- 매물이름, 가격 -->
	<div id="title">
		<span>${salesDto.sales_title }</span>
		<span>${salesDto.sales_category_rent }</span>
		<c:if test="${salesDto.sales_category_rent=='매매' }">
			<span>${salesDto.sales_cost }</span>
		</c:if>	
		<c:if test="${salesDto.sales_category_rent=='전세' }">
			<span>${salesDto.sales_deposit }</span>
		</c:if>	
		<c:if test="${salesDto.sales_category_rent=='월세' }">
			<span>${salesDto.sales_deposit } / ${salesDto.sales_cost }</span>
		</c:if>	
		<span>만원</span>		
		<div>${salesDto.sales_address }</div>
		
	</div>

	<!-- 신고처리(문의 문구) -->
	<div id="if_report">
		<c:if test="${salesDto.sales_check_blind>0 }">
			<span>신고당한 게시글입니다. 중개인 혹은 관리자에게 문의하세요.</span>
			<span>!</span>	
		</c:if>
	</div>
	
	<!-- 중개인정보, 스크랩수, 신고수?, 스크랩신고버튼 -->
	<div id="info">
		<div class="borker">
			<img src="${root}/img/중개인.png" width="25px" height="25px"/>		
			<span>${memberDto.member_name } ( ${salesDto.member_id } )</span>
		</div>

		<div class="scrap_report">
			<img class="scrap_star" src="${root}/img/star1.png" width="20px" height="20px"/>
			<span class="scrap_count">${scrap_count }</span>
			<input type="button" name="scrap_btn" value="스크랩" class="btn btn-outline-warning btn-sm scrap_btn"/>
			<input type="button" name="report_btn" value="신고하기" class="btn btn-outline-danger btn-sm report_btn"/>
		</div>
	</div>
	
	<!-- 주소, 매물요약 -->
	<div id="map_plus_sales" class="row justify-content-between">
			<div class="col mr-3 mt-3" id="map_detail" style="width:50%;height:250px;margin-top:10px;"></div>
			<div class="col ml-2">	
				<div class="input-group input-group  mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing ">구 조</span>
					</div>
				  <input type="text" class="form-control" readonly value="${salesDto.sales_category_type }">
				</div>	
				<div class="input-group input-group mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing ">면 적 (m²)</span>
					</div>
				  <input type="text" class="form-control" readonly value="${salesDto.sales_area } m²">
				</div>
				<div class="input-group input-group  mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing ">평 형</span>
					</div>
					<fmt:formatNumber var="pyung" value="${salesDto.sales_area/(3.3) }" type="number" pattern="0.0"/>
				  <input type="text" class="form-control" readonly value="${pyung} 평">
				</div>
				<div class="input-group input-group  mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing ">중 공 년 도</span>
					</div>
				  <input type="text" class="form-control" readonly value="${salesDto.sales_build_year} 년도">
				</div>
				<div class="input-group input-group  mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing ">층 수</span>
					</div>
				  <input type="text" class="form-control" readonly value="${salesDto.sales_floor}층 ">
				</div>
			</div>
		</div>
		<script>
			var container = document.getElementById('map_detail');
			var options = {	
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
			var map = new kakao.maps.Map(container, options);
			
			//컨트롤러
			var mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			//주소에 맞는 위치 표시하기_마커표시
 	 		var geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch('${salesDto.sales_address }', function(result, status) {
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">매물 위치</div>'
			        });
			        infowindow.open(map, marker);
			        map.setCenter(coords);
			    } 
			}); 
		</script>
	
	<!-- 매물요약  -->
	<div id="sales_sum">
		<div>매물요약</div>
		<div class="all_opt">
			<div class="opt">
				<ul>
					<li><img class="opt_full" src="${root}/img/armchair.png" width="60px" height="60px"/></li>
					<li  class="opt_full_msg">풀옵션</li>
				</ul>
			</div>
			<div class="opt">
				<ul>
					<li><img class="opt_parking" src="${root}/img/parking.png" width="60px" height="60px"/></li>
					<li class="opt_parking_msg">주차장</li>
				</ul>
			</div>
			<div class="opt">
				<ul>
					<li><img class="opt_cctv" src="${root}/img/camera.png" width="60px" height="60px"/></li>
					<li class="opt_cctv_msg">CCTV</li>
				</ul>
			</div>
			<div class="opt">
				<ul>
					<li><img class="opt_ele" src="${root}/img/elevator.png" width="60px" height="60px"/></li>
					<li class="opt_ele_msg">엘리베이터</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 지수정보 ;;나중...-->
	<div id="sales_index">
		<div>지수 정보</div>
		<div class="all_index">
			<div class="index">
				<ul>
					<li><img src="${root}/img/gas.png" width="50px" height="50px"/></li>
					<li>주유소</li>
					<li>${factorMap.factor_gas}</li>
				</ul>
			</div>
			<div class="index">
				<ul>
					<li><img src="${root }/img/market.png" width="50px" height="50px"/></li>
					<li>대형마트</li>
					<li>${factorMap.factor_mart}</li>
				</ul>
			</div>
			<div class="index">
				<ul>
					<li><img src="${root}/img/hall.png" width="50px" height="50px"/></li>
					<li>공공기관</li>
					<li>${factorMap.factor_public}</li>
				</ul>
			</div>
			<div class="index">
				<ul>
					<li><img src="${root}/img/hospital.png" width="50px" height="50px"/></li>
					<li>병원</li>
					<li>${factorMap.factor_hospital}</li>
				</ul>
			</div>
			<div class="index">
				<ul>
					<li><img src="${root}/img/entertainment.png" width="50px" height="50px"/></li>
					<li>관광</li>
					<li>${factorMap.factor_tour}</li>
				</ul>
			</div>
			<div class="index_sum">
				<ul>
					<li><img class="factor_img" src="${root}/img/fruit.png" width="50px" height="50px"/></li>
					<li>총 귤 점수</li>
					<li>${factorMap.factor_total}</li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 매물 소개-중개인 작성 내용 -->
	<div class="input-group mb-3">
	  <div class="form-control text-justify sales-content" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
	  	${salesDto.sales_content}
	  </div>
	</div>

	<!-- 매물 이미지 -->
	  <!-- 매물 이미지 -->
	  <div id="sales_img">
		   <div class="img_all">
		   		<c:forEach var="salesImgDto" items="${salesImgDtoList}" end="2">
		   			<div class="img"><img src="${root }${salesImgDto.image_url}" width="310px" height="350px"/></div>
		   		</c:forEach>
		   		<c:if test="${fn:length(salesImgDtoList)>3}">
		   			<div class="img_more"><img src="${root }/img/next1.png" width="30px" height="30px"/></div>
		   			<c:forEach var="salesImgDto" items="${salesImgDtoList}" begin="3">
		   				<div class="imgs"><img src="${root }${salesImgDto.image_url}" width="310px" height="350px"/></div>
		   			</c:forEach>
			    	<div class="img_small"><img src="${root }/img/next2.png" width="30px" height="30px"/></div>
		   		</c:if>
		   </div>
	  </div>

	<!-- 중개인정보,매물더보기 -->
	<div id="member_btn">
		<input type="button" name="member_info" value="중개인 정보" class="btn btn-outline-info btn-sm"/>
		<input type="button" name="more_sales" value="매물 더보기" class="btn btn-secondary btn-sm"/>
	</div>

	<!-- 중개인; 수정, 삭제 -->
	<c:if test="${session_member_id==memberDto.member_id }">
		<div id="plus_btn">
<!-- 			<input type="button" name="sales_update" value="수정" class="btn btn-light btn-sm"/>	 -->
			<input type="button" name="sales_delete" value="삭제" class="btn btn-light btn-sm"/>
		</div>
	</c:if>
	
	<!-- 관리자; 신고, 삭제 -->
	<c:if test="${member_level=='admin'}">
		<script type="text/javascript">
			function del(root,sales_number){
				var url = root+"/report/delete?sales_number="+sales_number;
				location.href=url;
			}
			
			function update(root,sales_number){
				 var url= root+"/report/update?sales_number="+sales_number;
				 location.href=url;
			 }
		</script>
		<div id="plus_btn">
			<input type="button" name="update" value="신고처리" class="btn btn-light btn-sm" onclick="update('${root}','${salesDto.sales_number}')"/>			<!-- dark? -->
			<input type="button" name="delete" value="삭제" class="btn btn-light btn-sm" onclick="del('${root}','${salesDto.sales_number}')"/>
		</div>
	</c:if>
</div>

