<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="title" value="캠핑공간 수정" scope="request"/>
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
			캠핑공간 등록
		</p>
	</section>
	
	<!-- content page -->
	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">

				<div class="col-md-12 p-b-30">
					<form action="/camp/campUpdate" method="post" enctype="multipart/form-data" id="updateForm">
						<input type="hidden" name="campNo" value="${ camp.campNo }">
						<div class="heading">
							<h3>캠핑 정보를 입력해 주세요.</h3>
							<span class="option"><span class="txt_required"><span class="ico_required">* </span>필수입력</span></span>
						</div>
						<div class="box_form">
							<div class="tit">
								<label for="camp_name">캠프명<span class="ico_required">*</span></label>
							</div>
							<span class="option"><span class="txt_count"><em id="campNameCnt">0</em>자/<em>18</em>자</span></span>
							<div class="input">
								<input type="text" id="camp_name" min="1" maxlength="18" name="campName" value="${ camp.campName }">
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
								<label for="category">캠프유형<span class="ico_required">*</span></label>
							</div>
							<p class="option">
								<span class="txt_required">필수선택</span>
							</p>
							<div class="row">
								<ul class="check_list space ml-3">
									<li>
										<input type="radio" name="category" value="글램핑" id="glamping" <c:if test="${ camp.category eq '글램핑' }">checked</c:if>>
										<label for="glamping" class="ellip">글램핑</label>
									</li>
									<li>
										<input type="radio" name="category" value="숙소" id="room" <c:if test="${ camp.category eq '숙소' }">checked</c:if>>
										<label for="room" class="ellip">숙소</label>
									</li>
									<li>
										<input type="radio" name="category" value="카라반" id="caravan" <c:if test="${ camp.category eq '카라반' }">checked</c:if>>
										<label for="caravan" class="ellip">카라반</label>
									</li>
								</ul>
							</div>
						</div>
						<div class="box_form">
							<div class="tit">
								<label for="camp_text">캠핑장 소개<span class="ico_required">*</span></label>
							</div>
							<span class="option">
								<span class="txt_count"><em id="campContentCnt">0</em>자/<em>500</em>자<span class="txt_guide">(최소 20자)</span></span>
							</span>
							<div class="input">
								<textarea id="camp_text" class="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-20" minlength="20" maxlength="500" name="content" required
									placeholder="캠핑장을 상세하게 소개해보세요. 캠핑장의 특징이나 주변환경 등의 세부정보를 작성하시면 효과적입니다.">${ camp.content }</textarea>
							</div>
							<p class="p_guide warn">
								<i class="sp_icon ico_alert"></i>소개는 필수 입력입니다.
							</p>
						</div>
						<div class="box_form">
							<span class="tit">대표이미지<span class="ico_required"> *</span></span>
							<p class="option">2048 *1158 권장, 최대 3MB</p>
							<div class="file ">
								<div class="inner inner_img">
									<img src="/resources/camp-files/${ camp.file.savedFileName }" width="200px" height="200px">
								</div>
								<div class="btn_box">
									<label class="titleImgBtn btn" for="titleImgFile"><div>파일첨부</div> 
									<input type="file" class="_fileRel" name="titleImgFile" id="titleImgFile"
										accept="image/*" style="display: none;"></label>
								</div>
							</div>
							<p class="p_guide warn">
								<i class="sp_icon ico_alert"></i>대표이미지는 필수 입력입니다.
							</p>
						</div>
						<div class="box_form">
							<span class="tit">이미지<label for="camp_img"><span class="ico_required">*</span></label></span>
							<p class="option">
								2048 * 1158 권장, 한 장당 최대 3MB<span class="txt_guide">(최대 10장)</span>
							</p>
							<div class="file ">
								<div class="inner inner_imgs row">
									<c:forEach var="file" items="${ camp.fileList }" varStatus="i">
									<div class="col-sm-3">
										<div class="img-wrap">
											<span class="close" data-fileNo="${ file.campFileNo }">&times;</span>
											<img src="/resources/camp-files/${ file.savedFileName }" width="200px" height="200px">
										</div>
									</div>
									</c:forEach>
								</div>
								<div class="btn_box">
									<label class="imgBtn btn" for="imgFile"><div>파일첨부</div> 
										<input type="file" class="_fileRel" name="imgFile" id="imgFile" style="display: none;"
											accept="image/*" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)" multiple>
									</label>
									<div class="nav_btn">
										<a class="btn_move">
											<i class="sp_icon ico_select_prev"></i>
											<em class="blind">앞으로 순서 이동</em>
										</a>
										<a class="btn_move ">
											<i class="sp_icon ico_select_del"></i>
											<em class="blind">삭제</em>
										</a>
										<a class="btn_move ">
											<i class="sp_icon ico_select_next"></i>
											<em class="blind">뒤로 순서 이동</em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="box_form">
							<div class="tit">
								<label for="price">가격<span class="ico_required">*</span></label>
							</div>
							<div class="input">
								<input type="text" class="sizefull s-text7 p-l-22 p-r-22" name="price" value="${ camp.price }">
								<hr>
							</div>
							<p class="p_guide warn">
								<i class="sp_icon ico_alert"></i>가격은 필수 입력입니다.
							</p>
						</div>
						
						<div class="box_form">
							<div class="btn_box">
								<input type="submit" class="flex-c-m size2 bg4 bo-rad-23 hov1 m-text3 trans-0-4" value="캠핑장 수정">
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