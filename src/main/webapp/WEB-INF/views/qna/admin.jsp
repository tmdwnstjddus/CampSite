<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
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
					<jsp:include page= "../include/qnaSide.jsp" />
				</div>

				<!--알맹이-->
				<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
					<div class="flex-w flex-sb p-b-10 ">
						<h4>공지</h4>
						<div>
							<button type="button" class="btn btn-primary" onclick="location.href ='/qna/qnawrite'">공지 작성</button>
						</div>
						
					</div>
							

					<div class="m-b-30 "> 
						<div class="flex-w flex-sb">
							<table class="table table-hover bo4">
								<thead>
									<tr>
										<th scope="col" class="column-7">#</th>
										<th scope="col" class="column-6">공지</th>
										<th scope="col" class="column-5">작성자</th>
										<th scope="col" class="column-5">작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="announce" items="${ announce }">
										<tr onClick="location.href='/qna/announce-detail?qaNo=${ announce.qaNo }'">
											<td><a href="#" class="badge badge-primary"><input type="hidden" value=${ announce.qaNo }>공지</a> </td>
											<td>${ announce.title } </td>
											<td>관리자</td>
											<td>${ announce.regDate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>	
						</div>
					
					</div>
					
					
					<div class="flex-w flex-sb">
						<div class="flex-w flex-sb p-b-10 ">
							<h4 class="p-b-10"> 고객 문의사항</h4>
						</div>
								<table class="table table-hover bo4">
										<thead>
											<tr>
												<th scope="col" class="column-7">#</th>
												<th scope="col" class="column-6">문의사항</th>
												<th scope="col" class="column-5">작성자</th>
												<th scope="col" class="column-5">작성날짜</th>
												<th scope="col" class="column-5">답변여부</th>
											</tr>
										</thead>
										<tbody id="questionListArray">
												
												<!-- 답변리스트 동적생성  -->

										</tbody>
								</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<!-- answer modal  -->

<div class="modal fade" id="answerModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="answerModalTitle">답변하기</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		
		<div class="modal-body">
			<form>
				<div class="form-group">
					<span id="qaNo" style="display:none;"></span>
					<div class="m-text6	 flex-sb flex-m p-b-21">
						<div class="t-left">
							<span>작성자</span>
							<span class="m-l-3 m-r-6">|</span>
							<span id="memberId"></span>
						</div>
						<div class="t-right">
							<span>등록일자</span>
							<span class="m-l-3 m-r-6">|</span>
							<span id="qnaDate"></span>
						</div>
					</div>
					<div class="bo4 of-hidden size15 m-b-20">
						<span class="sizefull p-l-22 p-r-22" id=title></span>
					</div>
					<div class="dis-block size25 bo4 p-l-22 p-r-22 p-t-13 m-b-25" id="qnaContent"></div>
				</div>
				<div class="form-group">
					<input type="hidden" id="admin">
					<label for="message-text" class="col-form-label">답변:</label>
					<textarea class="form-control dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-25 sizefull" id="answerText"></textarea>
				</div>
			</form>
		</div>
		
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			<button type="button" id="answerSubmitButton" class="btn btn-primary">답변하기</button>
		</div>

		</div>
	</div>
</div>

<!-- completed modal  -->

<div class="modal fade" id="answerCompletedModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="answerModalTitle">답변하기</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		
		<div class="modal-body">
			<form id="answerform">
				<div class="form-group">
					<span id="c-qaNo" style="display:none;"></span>
					<div class="m-text6	 flex-sb flex-m p-b-21">
						<div class="t-left">
							<span>작성자</span>
							<span class="m-l-3 m-r-6">|</span>
							<span id="c-memberId"></span>
						</div>
						<div class="t-right">
							<span>등록일자</span>
							<span class="m-l-3 m-r-6">|</span>
							<span id="c-qnaDate"></span>
						</div>
					</div>
					<div class="bo4 of-hidden size15 m-b-20">
						<span class="sizefull s-text7 p-l-22 p-r-22" id=c-title></span>
					</div>
					<div class="dis-block s-text7 size25 bo4 p-l-22 p-r-22 p-t-13 m-b-25" id="c-qnaContent"></div>
				</div>
				<div class="form-group">
					<label for="message-text" class="col-form-label">답변:</label>
					<textarea class="form-control dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-25 sizefull" id="c-answerText"></textarea>
				</div>
			</form>
		</div>
		
		<div class="modal-footer">
			<button type="button" id="answerDeleteButton" class="btn btn-secondary">삭제하기</button>
			<button type="button" id="answerUpdateButton" class="btn btn-primary">수정하기</button>
		</div>

		</div>
	</div>
</div>


<!-- update modal  -->

<div class="modal fade" id="answerUpdateModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="answerModalTitle">답변하기</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		
		<div class="modal-body">
			<form id="answerform">
				<div class="form-group">
					<span id="c-qaNo" style="display:none;"></span>
					<div class="m-text6	 flex-sb flex-m p-b-21">
						<div class="t-left">
							<span>작성자</span>
							<span class="m-l-3 m-r-6">|</span>
							<span id="u-memberId"></span>
						</div>
						<div class="t-right">
							<span>등록일자</span>
							<span class="m-l-3 m-r-6">|</span>
							<span id="u-qnaDate"></span>
						</div>
					</div>
					<div class="bo4 of-hidden size15 m-b-20">
						<span class="sizefull s-text7 p-l-22 p-r-22" id=u-title></span>
					</div>
					<div class="dis-block s-text7 size25 bo4 p-l-22 p-r-22 p-t-13 m-b-25" id="u-qnaContent"></div>
				</div>
				<div class="form-group">
					<label for="message-text" class="col-form-label">답변:</label>
					<textarea class="form-control dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-25 sizefull" id="u-answerText"></textarea>
				</div>
			</form>
		</div>
		
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">수정취소</button>
			<button type="button" id="answerUpdateButton" class="btn btn-primary">수정하기</button>
		</div>

		</div>
	</div>
</div>
	
	


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
						<a href="/upload/qnawrite" class="m-text12 t-center"	>
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


	<!-- Footer -->
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


	<!-- js import -->
	<jsp:include page="../include/jsimport.jsp" />
	<script src="/resources/js/qna-answer.js"></script>
	
</body>
</html>
