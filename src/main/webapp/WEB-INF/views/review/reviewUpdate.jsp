<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="title" value="캠핑공간 수정"  scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<jsp:include page="../include/cssimport.jsp" />
<link rel="stylesheet" type="text/css" href="/resources/css/camp.css">
</head>
<body class="animsition">

<jsp:include page="../include/header.jsp" />

	<!-- Title Page -->
	<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(/resources/images/heading-pages-02.jpg);">
		<h2 class="l-text2 t-center">
			Camp
		</h2>
		<p class="m-text13 t-center">
			캠핑리뷰 등록
		</p>
	</section>
	
	<!-- content page -->
	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">

				<div class="col-md-12 p-b-30">
					<form action="reviewUpdate" method="post" enctype="multipart/form-data" id="updateForm">
						<input type="hidden" name="rentNo" value="${review.rentNo }">
						<input type="hidden" name="memberId" value="${loginuser.memberId}">
						<input type="hidden" name="reviewNo" value="${review.reviewNo}">
						<div class="heading">
							<h3>리뷰 작성</h3>
							
							<span class="option"><span class="txt_required"><span class="ico_required">* </span>필수입력</span></span>
						</div>
						
						<div class="box_form">
							<div class="tit">
								<label for="review_title">제목<span class="ico_required">*</span></label>
							</div>
							<span class="option"><span class="txt_count"><em id="campNameCnt">0</em>자/<em>18</em>자</span></span>
							<div class="input">
								<input type="text" id="title" min="1" maxlength="18" name="title" value="${ review.title }">
								
								<hr>
							</div>
							<p class="p_guide normal">
								<i class="sp_icon ico_alert"></i>사용 가능한 특수문자 : ( , ) , [ , ] , - , .(마침표), ,(쉼표)
							</p>
							<p class="p_guide warn">
								<i class="sp_icon ico_alert"></i>이름 입력은 필수입니다.
							</p>
						</div>
						<div class="box_form">
							<div class="tit">
								<label for="memberId">작성자<span class="ico_required"></span></label>
							</div>
							<div class="input">
								${loginuser.memberId }
								<hr>
							</div>
							
						</div>
						<div class="box_form">
							<div class="tit">
								<label for="category">리뷰종류<span class="ico_required">*</span></label>
							</div>
							<p class="option">
								<span class="txt_required"></span>
							</p>
							<div class="row">
								<ul class="check_list space ml-3">
									<li>
										<input type="radio" name="category" value="campreview" id="campreview" required>
										<label for="campreview" class="ellip">캠핑장</label>
									</li>
								</ul>
							</div>
						</div>
						<div class="box_form">
							<div class="tit">
								<label for="content">내용 작성<span class="ico_required">*</span></label>
							</div>
							<span class="option">
								<span class="txt_count"><em id="campContentCnt">0</em>자/<em>500</em>자<span class="txt_guide">(최소 20자)</span></span>
							</span>
							<div class="input">
								<textarea id="content" class="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-20" minlength="20" maxlength="500" name="content" required
									placeholder="캠핑장이나 상품에 관련된 리뷰를 작성해주세요">${review.content }</textarea>
							</div>
							<p class="p_guide warn">
								<i class="sp_icon ico_alert"></i>내용은 필수 입력입니다.
							</p>
						</div>

						
						
						
						<div class="box_form">
							<div class="btn_box">
								<input type="submit" class="flex-c-m size1 bg4 bo-rad-23 hov1 m-text3 trans-0-4" value="리뷰 수정">
							</div>
						</div>
							
					</form>
				</div>
				
			</div><!-- end row -->
		</div><!-- end container -->
	</section>

	<!-- Footer -->
	<jsp:include page="../include/footer.jsp" />

	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection1 -->
	<div id="dropDownSelect1"></div>

	<!-- js import -->
	<jsp:include page="../include/jsimport.jsp" />

</body>
</html>