<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${root}/css/member/member_signup.css">
<script type="text/javascript" src="${root }/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function(){
	    $("input:radio[name=member_level]").click(function(){  	 
	        if($("input[name=member_level]:checked").val() == "BR"){
	 			$("#if_broker").show();
	        }else{
	        	$("#if_broker").hide();
	        }
	    });
	})
	
	function valCheck(obj) {
		if(obj.member_name.value == "") {
			alert("이름을 입력해주세요.");
			obj.member_name.focus();
			return false;
		}
		

		var checked_items = 0;
		for(i = 0; i < obj.elements.length; i++){
			if((obj.elements[i].name == "member_level") && (obj.elements[i].checked)) checked_items++;
		}
		if(checked_items == 0){
			alert("유형을 선택해주세요.");
			obj.member_level[0].focus();
			return false;
		}
		return true;
	}
	
	
	
	
</script>
</head>
<body>
	<form id="plus_info" action="${root}/member/tempjoin" method="post" onsubmit = "return valCheck(this)">
		<div class="tit">임시 회원가입</div>
		
		<div class="nickname">
			<div class="label">아이디</div>
			<input type="text" name="member_id" class="col-sm-3 h-25 form-control"/>
			<button class="btn btn-outline-warning btn-sm" type="button" id="button-addon2" style="margin-top:2px;">중복 확인</button>
		</div>
		
		<div class="nickname">
			<div class="label">이름</div>
			<input type="text" name="member_name" class="col-sm-3 h-25 form-control"/>
			<button class="btn btn-outline-warning btn-sm" type="button" id="button-addon2" style="margin-top:2px;">중복 확인</button>
		</div>
		
		<div class="email">
			<div class="label">이메일</div>
			<input type="text" name="member_email" class="col-sm-3 h-25 form-control"/>
			
			<select class="col-sm-3 h-25 custom-select" id="inputGroupSelect01" name="email">
			    <option selected>선택하세요.</option>
			    <option value="hanmail.net">hanmail.net</option>
			    <option value="naver.com">naver.com</option>
			    <option value="yahoo.co.kr">yahoo.co.kr</option>
			    <option value="hotmail.com">hotmail.com</option>
			    <option value="paran.com">paran.com</option>
			    <option value="nate.com">nate.com</option>
			    <option value="google.com">google.com</option>
			    <option value="gmail.com">gmail.com</option>
			    <option value="empal.com">empal.com</option>
			    <option value="korea.com">korea.com</option>
			    <option value="freechal.com">freechal.com</option>
			  </select>
		</div>
		
		<div class="member_level">
			<div class="label">가입 유형</div>
			<input type="radio" name="member_level" value="GE" id = "member_level"/>
			일반회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
			<input type="radio" name="member_level" value="BR" id = "member_level"/>
			중개업자
			<input type="radio" name="member_level" value="admin" id = "member_level"/>
			관리자
		</div>
		
		<div id="if_broker" style="display:none;">
			<div class="msg">국가공간정보포털의 부동산중개업 정보에 등록된<br/>대표 공인중개사만 회원가입이 가능합니다.</div>
			<div class="phone_num">
				<div class="label2">대표공인중개사<br/>휴대폰 번호</div>
				<select class="col-sm-2 h-25 custom-select" name="no1">
					<option selected>010</option>
					<option value="1">011</option>
					<option value="2">016</option>
				</select>
				<div style="color:black;">-</div>
				<input type="text" class="col-sm-2 h-25 form-control" name="no2">
				<div style="color:black;">-</div>
				<input type="text" class="col-sm-2 h-25 form-control" name="no3">
			</div>	
		</div>
		
		<div class="last_btn">
			<input type="submit" value="완료" class="btn btn-warning btn-sm"/>
			<input type="reset" value="취소" class="btn btn-light btn-sm"/>
		</div>
	</form>
</body>
</html>