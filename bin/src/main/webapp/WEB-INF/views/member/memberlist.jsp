<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원목록</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<jsp:include page="../include/cssimport.jsp" /> 
	
</head>
<body class="animsition">

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	<!-- content page -->
		<div class="container" style="padding-top:50;text-align:center">
		
		
	<table class="table table-bordered">
			<tr style="background-color: black;height: 50px" class="dark">
				<th style="width: 10%;text-align: center; color:white">아이디</th>
				<th style="width: 10%;text-align: center; color:white">이름</th>
				<th style="width: 10%;text-align: center; color:white">회원분류</th>				
				<th style="width: 15%;text-align: center; color:white">이메일</th>
				<th style="width: 15%;text-align: center; color:white">전화번호</th>
				<th style="width: 10%;text-align: center; color:white">가입날짜</th>
				<th style="width: 90%;text-align: center; color:white">주소</th>				
			</tr>
			<c:forEach var="member" items="${members}">
				<tr style="height: 20px; text-align: center">
					<td >
						<a href="memberview?memberId=${member.memberId }">
        					${member.memberId }
        				</a>
       				</td>					
					<td>${ member.name }</td>
					<td>${ member.type }</td>					
					<td>${ member.email }</td>
					<td>${ member.phone }</td>
					<td>${ member.regDate }</td>
					<td>${ member.addr1 }${ member.addr2 }${ member.addr3 }</td>						
				</tr>
			</c:forEach>
		</table>
	
		<br></br>
		<div class="text-center">
		 <input type="button" id="cancel" value="돌아가기" class="size9 bg4 bo-rad-20 hov1 m-text3 trans-0-4">
		 
		</div>


	<!-- Footer -->
	<jsp:include page="../include/footer" />





	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>


	<!-- js import -->
	<jsp:include page="../include/jsimport.jsp" />
	
	<script type="text/javascript">	        	
   	$(function(){
   		$('#cancel').on('click', function(event){
   			location.href="/member/adminpage"; 
   			
   		});
   		  		
   	});
	</script>

</body>
</html>
