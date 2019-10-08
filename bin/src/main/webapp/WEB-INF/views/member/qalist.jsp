<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>질문 리스트</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<jsp:include page="../include/cssimport.jsp" /> 
	
</head>
<body class="animsition">
 
	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	<!-- content page -->
		<div class="container" style="padding-top:50;text-align:center">
		
		    <h4 class="m-text20 p-b-36 p-t-15 text-center" style="font-size: 28px; font-weight: bolder;">질문 리스트
		    <br><span style="font-size: 16px; color: gray">고객센터 답변이 미등록 된 질문들의 리스트입니다</span></h4>
		
	<table class="table table-bordered">
			<tr style="background-color: black; width: 100px;height: 50px" class="dark">
				<th style="width: 30%;text-align: center; color:white">제목</th>
				<th style="width: 10%;text-align: center; color:white">아이디</th>
				<th style="width: 10%;text-align: center; color:white">작성날짜</th>							
			</tr>
			<c:forEach var="qa" items="${qa}">
				<tr style="height: 20px; text-align: center" onClick="location.href='/qna/qnadetail?qaNo=${ qa.qaNo }'">
					<td >
						<a href="#">
        					${ qa.title }
        				</a>
       				</td>					
					<td>${ qa.memberId }</td>
					<td>${ qa.regDate }</td>										
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
