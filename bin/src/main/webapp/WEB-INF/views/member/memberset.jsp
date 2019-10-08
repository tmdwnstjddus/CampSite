<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Contact</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<jsp:include page="../include/cssimport.jsp" />
	
</head>
<body class="animsition">

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	<!-- content page -->
		<div class="container">
			<div>
                <div style="text-align: center">
                    <h4 class="m-text20 p-b-36 p-t-15">회원정보</h4> 
                </div>
			</div>
		</div>
			<!-- 회원 정보 수정 -->
	         <div class="memberset">
	         	<form id="memberset-form" action="memberset" method="post">
	             <table class="table table-hover">
					<tr style="height: 50px">
						<th style="width:;text-align: right">아이디</th>
						<td>${ member.memberId }
							<input type="hidden" name="memberId" value="${ member.memberId }" style="width:280px" />
						</td>
					</tr>
					<tr style="height: 50px">
						<th style="width:;text-align: right">비밀번호</th>
						<td>
							<input type="password" name="pwd" style="width:280px" />
						</td>
					</tr>
					<tr style="height: 50px">
						<th style="width:;text-align: right">비밀번호 확인</th>
						<td>
							<input type="password" name="confirm" style="width:280px" />
						</td>
					</tr>
					<tr style="height: 50px">
						<th style="width:;text-align: right">이름</th>
						<td>${ member.name }</td>
					</tr>
					<tr style="height: 50px">
						<th style="width:;text-align: right">전화번호</th>
						<td>${ member.phone }</td>
					</tr>
					<tr style="height: 50px">
						<th style="width:;text-align: right">이메일</th>
						<td>${ member.email }</td>
					</tr>	
					<tr style="height: 50px">
						<th style="width:;text-align: right">주소</th>
						<td>${ member.addr1 }&nbsp;${ member.addr2 }&nbsp;${ member.addr3 }</td>
					</tr>									
				</table>
			</form>
		</div>	
                    <!-- Button -->
	             <div style="padding-top: 10px; text-align: center">
				 <input type="submit" id="btnmemberset" value="수정" class="size9 bg4 bo-rad-20 hov1 m-text3 trans-0-4" style="color:white;" >
				 <input type="button" id="btnmembermypage" value="취소" class="size9 bg4 bo-rad-20 hov1 m-text3 trans-0-4" style="color:white;" >		
				</div>	

          
	<!-- Footer -->
	<jsp:include page="../include/footer" />



	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>


	<!-- js import -->
	<jsp:include page="../include/jsimport.jsp" />
	
	<script>
	   	$(function(){
		   	
   		$('#btnmembermypage').on('click', function(event){
   			location.href="/member/mypage?memberId=${loginuser.memberId }"; 
   			
   		});
   		
   		$('#btnmemberset').on('click', function(event){
   			$('#memberset-form').submit();
   			
   		});
   	});
  	</script>
</body>
</html>
