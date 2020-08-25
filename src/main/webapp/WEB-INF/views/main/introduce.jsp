<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${root}/css/main/introduce.css">
	<div class="container">
		<div class="first">
			<h2>제주살이</h2>
			<p>제주살이는 제주거주를 꿈꾸는 이들을 위한 부동산 매물 정보 제공 사이트입니다.</p>
			<p>제주도 주택의 매매 및 전월세 정보뿐만 아니라,</p>
			<p>주유소, 대형마트, 공공기관, 병원, 관광명소와 같은 항목을 점수를 산정해 귤점으로 제공합니다.</p>
			<p>제주살이를 통해서 당신만의 특별한 제주살이를 실현하세요!</p>
		</div>

		<div class="second">
			<h2>귤점 산정 방식</h2>
			<div class="tot">
				<ul>
					<li>
						<img src="${root}/img/fruit.png" width="20px" height="20px"/>
						감귤 지수
					</li>
					<li>모든 지수의 총 합을 표현합니다.</li>
				</ul>
			</div>

			<div class="about_tot">
				<div class="about">
					<img src="${root}/img/gas.png" width="50px" height="50px"/>
					<ul>
						<li>주유소 지수</li>
						<li>매물 주택에서 3km이내에 있는 주유소의 개수가 점수로 표현됩니다.</li>
					</ul>
				</div>
				<div class="about">
					<img src="${root}/img/market.png" width="50px" height="50px"/>
					<ul>
						<li>대형마트 지수</li>
						<li>매물 주택에서 3km이내에 있는 대형마트의 개수가 점수로 표현됩니다.</li>
					</ul>
				</div>
				<div class="about">
					<img src="${root}/img/hall.png" width="50px" height="50px"/>
					<ul>
						<li>공공기관 지수</li>
						<li>매물 주택에서 3km이내에 있는 공공기관의 개수가 점수로 표현됩니다.</li>
					</ul>
				</div>
				<div class="about">
					<img src="${root}/img/hospital.png" width="50px" height="50px"/>
					<ul>
						<li>병원 지수</li>
						<li>매물 주택에서 3km이내에 있는 병원의 개수가 점수로 표현됩니다..</li>
					</ul>
				</div>
				<div class="about">
					<img src="${root}/img/entertainment.png" width="50px" height="50px"/>
					<ul>
						<li>관광명소 지수</li>
						<li>매물 주택에서 3km이내에 있는 관광명소의 개수가 점수로 표현됩니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
