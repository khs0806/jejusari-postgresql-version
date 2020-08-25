<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root }/css/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="${root}/javascript/jquery-3.5.1.js"></script>
<style type="text/css">
#full_broker{
	 margin:20px auto;
	 width:260px;
}

#infoinfo{
	 width:260px;
	 border:2px solid #c0c0c0;
	 overflow:hidden;
	 line-height:50px;
	 margin-bottom:20px;
	 padding: 10px;
   	 border-radius: 10px;
}

.imgimg:first-child {
 	float:left;
}

.broker_info{
 	margin-left:120px;
}

.broker_info div{
 font-size:15px;
 font-weight:bold;
}

#close_btn{
	 width:250px;
	 border:0px solid blue;
	 text-align:center;
}
</style>
<script>
	$(function(){
		$("input[type=button]").click(function(){
			self.close();
		});
	});
</script>
</head>
<body>
	 <div id="full_broker">
		  <div id="infoinfo">
			   <div class="imgimg">
			    	<img src="${root }/img/중개인.png" width="100px" height="100px"/> 
			   </div>
		   <div class="broker_info"> 
			    <div>${memberDto.member_name }</div>
			    <div>${memberDto.member_phone}</div>
		   </div>
		  </div>
		  <div id="close_btn">
		   		<input type="button" value="닫기" class="btn btn-info btn-sm"/>
		  </div>
	 </div>
</body>
</html> 
