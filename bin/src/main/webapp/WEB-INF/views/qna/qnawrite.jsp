<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Product</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<jsp:include page="../include/cssimport.jsp"/>
</head>
<body class="animsition">

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	
	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(/resources/images/heading-pages-01.jpg);">
		<h2 class="l-text2 t-center">
			SERVICE CENTER
		</h2>
	</section>


	<!-- Content page -->
	<section class="bgwhite p-t-55 p-b-65">
		<div class="container">
			<div class="row">
				<!-- 사이드 네비-->
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
				
				<jsp:include page="../include/qnaSide.jsp" />
				
				</div>

				<!--알맹이-->
				<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
					<div class="flex-w p-b-10">
						<h4>1:1 고객센터</h4>
					</div>
					<div class="p-b-20"> 
					
						<form class="leave-comment" action="qnawrite" method="POST" >
							<!-- Edit Password start -->
							<div class="p-t-15 p-b-14">
								<div class="p-t-15 p-b-23">
									<div class="widget">
										<p class="m-text2 flex-sb-m p-b-10"> 글 작성하기 </p>
										<!-- 멤버 아이디로 받아오기 -->
										<input type="hidden" name="memberId" value="${ loginuser.memberId }" />
										<p>제목</p>
										<div class="bo4 of-hidden size15 m-b-20">
											<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="title" >
										</div>
										<p> 내용을 작성해주세요 </p>
										<textarea class="dis-block s-text7 size21 bo4 p-l-22 p-r-22 p-t-13 m-b-50" name="content"></textarea>

													
										<div class="p-b-10 float-r">
											<!-- Button -->
											<button type="button" class="btn btn-secondary" id="cansel">돌아가기</button>
											<button type="submit" class="btn btn-dark" id="savebutton">작성 완료</button>
											
										</div>
									
									</div>
								</div>
							</div>
						</form>	
					
					</div>
				</div>
			</div>
		</div>

	</section>

	<section class="bg6 p-t-20 p-b-46 m-b-20">
			<div class="flex-w p-l-15 p-r-15">
				<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 respon1">
					<h4 class="m-text12 t-center">
						<i class="fa fa-info-circle" aria-hidden="true"></i>
						바로가기
					</h4>
	
					<a href="#" class="s-text11 t-center">
						회원가입 / 로그인
					</a>

				</div>
	
				<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 bo2 respon2">
						<a href="#" class="m-text12 t-center"	>
							<i class="fa fa-headphones" aria-hidden="true"></i>
							1 : 1 상담
						</a>

					<span class="s-text11 t-left"> 평일 : 다음날 답변 완료 </span>
					<span class="s-text11 t-left"> 토,일/공휴일 : 휴일 이후 답변 완료 </span>
					
				</div>
	
				<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 respon1">
					<h4 class="m-text12 t-center">
						<i class="fa fa-phone" aria-hidden="true"></i>
						전화 : 000 - 0000
					</h4>
					<span class="s-text11 t-left "> 평일 오전 8시 ~ 오후 6시 </span>
					<span class="s-text11 t-left "> 토,일 / 공휴일 휴무 </span>

					
				</div>
			</div>
		</section>

	<jsp:include page="../include/footer.jsp" />


	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>


	
	<jsp:include page="../include/jsimport.jsp" />
	

	
</body>
</html>
