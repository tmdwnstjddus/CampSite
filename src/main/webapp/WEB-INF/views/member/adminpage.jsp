<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 페이지</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<jsp:include page="../include/cssimport.jsp" />
</head>
<body class="animsition">

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	<!-- content page -->
		<div class="container">
		</div> 
		
	<div class ="mypage_block01_wrap">
		<div class="mypage_block01">
			<img src="/resources/images/person.png" style="width: 50px; height: 50px">&nbsp;<span style="color:blue;">${ loginuser.memberId }</span> 관리자님!
												<br><span style="font-size: 16px; font-weight: normal; color:gray;">이 곳은 더 캠프 관리자 페이지입니다</span>
		</div>
	</div>




	<!-- 마이페이지 카테고리 -->
	<div class="mypage row" style="max-width: 2000px;">
		<div class="row-1" style="padding-left: 575px;padding-right: 80px">
			<img src="/resources/images/admin1.png" alt="" style="width: 150px; height: 150px"><br>
			<button id="memberlist" name="memberlist" type="button" class="btn btn-dark btn-lg">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 리스트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
		</div>
		<div class="row-2" style="padding-right: 80px">
			<img src="/resources/images/admin2.png" alt="" style="width: 150px; height: 150px"><br>
			<button id="qalist" type="button" class="btn btn-dark btn-lg">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질문 답변&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
		</div>
		<div class="row-3">
			<img src="/resources/images/admin3.png" alt="" style="width: 150px; height: 150px"><br>
			<button id="reporting" type="button" class="btn btn-dark btn-lg">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;캠핑장 통계&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
		</div>					
	</div>
	<br><br><br>



	<!-- Footer -->
	<jsp:include page="../include/footer" />





	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>


	<!-- js import -->
	<jsp:include page="../include/jsimport.jsp" />

	<script type="text/javascript">	 
   	$(function(){
	   	
   		$('#memberlist').on('click', function(event){
   			location.href="/member/memberlist"; 
   			
   		});

   		$('#qalist').on('click', function(event){
   			location.href="/member/qalist"; 
   			
   		});
   		
   		$('#reporting').on('click', function(event){
   			location.href="/member/reporting"; 
   			
   		});
   	});
	</script>

</body>
</html>
