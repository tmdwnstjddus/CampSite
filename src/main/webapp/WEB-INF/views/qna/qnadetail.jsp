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
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(/resources/images/service-and-announce.jpg);">
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
					<div class="flex-w p-b-10">
						<h4>1:1 고객센터</h4>
					</div>
					<div class="p-b-20"> 
						<div class="leave-comment">
							<!-- Edit Password start -->
							<div class="p-t-15 p-b-14">
								<div class="p-t-15 p-b-23">
									<div class="widget">
										
										<div class="m-text6	 flex-sb flex-m p-b-21">
											<div class="t-left">
												<span>작성자</span>
												<span class="m-l-3 m-r-6">|</span>
												<span>${ qna.memberId }</span>
											</div>
											<div class="t-right">
												<span>등록일자</span>
												<span class="m-l-3 m-r-6">|</span>
												<span>${ qna.regDate }</span>
											</div>

										</div>
										
									
										<div class="bo4 of-hidden size15 m-b-20">
											
											<input class="sizefull s-text7 p-l-22 p-r-22" id=title name="title" value=${ qna.title } />
										</div>

										<textarea class="dis-block size20  s-text7 bo4 p-l-22 p-r-22 p-t-13 p-b-13 m-b-25" name="content">${ qna.content }</textarea>
										
										<div style='display:${ loginuser.memberId eq qna.memberId ? "block" : "none" }'>
											<div class="p-b-10 t-right">
												<!-- Button -->
												
												<button type="button" class="btn btn-outline-secondary" id="user_deleted_qa">삭제</button>
											</div>
										</div>

										<hr class="p-b-30"/>	
										
										<div id="comment-data-container">
											<c:choose>
												<c:when test="${ empty qnacomments }">
													<div id="Unregistered" style="display:block;" class="s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-25 bg8 t-center">
														<p class="p-t-35 p-b-8">아직 답변이 등록되지않았습니다.</p>
													</div>
													
												<!-- 답변등록 폼 -->
												
														<div id="answer" style="display: none">
														<form id="answerform">
															<input type="hidden" name="qaNo" id="qaNo" value="${ qna.qaNo }"/>
															
															<textarea class="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-25 sizefull" name="content" id="answerText"></textarea>
											
															<div class="p-b-10 t-right">
																<!-- Button -->
																<button type="button" class="btn btn-secondary" id="answerSubmitButton">답변등록</button>
															</div>
														</form>
														</div>
													
												</c:when>
												<c:otherwise>
													<div  id="comment-answer">
													<c:forEach var="qnacomment" items="${ qnacomments }">
													<div class="m-text6	 flex-sb flex-m p-b-21">
													
														<div class="t-left">
															<span>답변자</span>
															<span class="m-l-3 m-r-6">|</span>
															<span>관리자</span>
														</div>
														<div class="t-right">
															<span>등록일자</span>
															<span class="m-l-3 m-r-6">|</span>
															<span>${ qnacomment.regDate }</span>
														</div>
									
													</div>
													<div class="dis-block s-text7 size25 bo4 p-l-22 p-r-22 p-t-13 m-b-25" name="success-anser">
														${ qnacomment.comment }
													</div>
													<div class="p-b-10 t-right">
													</div>
													</c:forEach>
													</div>
													
												</c:otherwise>
											
											</c:choose>
											
										</div>
										
										
										<div class="p-b-10 t-center">
											<button type="button" class="btn btn-secondary"onclick ="location.href ='/qna/qna'">목록으로</button>
										</div>
									
									</div>
								</div>
							</div>
						</div>	
					
						
					</div>

				</div>
				
			</div>
		</div>

	</section>
	
			<div class="col col-md-5">
				<input type="text" class="form-control" id="searchValueForQuestionList" placeholder="검색어를 입력하세요" />		
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
		
		<script type="text/javascript" >
		
	    

	    //== admin answer update ajax
	    
	    
	    //== admin answer delete ajax //delete-comment-btn
 
	    
	     
	    	    	
       //=====user q delete 
		$(function(){
       		var qaNo = ${qna.qaNo};
       		
       		var btnDelete = document.querySelector('#user_deleted_qa');
       		btnDelete.addEventListener('click', function(event) {
       			var ok = confirm("삭제할까요?");
       			if (ok) {
        			location.href = "deletedqna/"+ qaNo ; 			
       			}
       		});
		});
 
	

	</script>

	 

	
</body>
</html>
