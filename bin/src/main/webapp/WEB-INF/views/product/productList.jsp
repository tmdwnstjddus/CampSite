<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>캠핑장 용품</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="../include/cssimport.jsp" />
	
</head>
<body class="animsition">

<jsp:include page="../include/header.jsp" />

	<!-- Title Page -->
	<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(/resources/images/heading-pages-02.jpg);">
		<h2 class="l-text2 t-center">
			Camping Product
		</h2>
		<p class="m-text13 t-center">
			캠핑장 용품 판매소
		</p>
	</section>


	<!-- Content page -->
	<section class="bgwhite p-t-55 p-b-65">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
					<div class="leftbar p-r-20 p-r-0-sm">
						<!--  -->
						<h4 class="m-text14 p-b-7">
							Categories
						</h4>
						<form name="selectform2" method="GET" action="productList">
						<ul class="p-b-54">
							<li class="p-t-4">
								<input type="radio" class="s-text20 active1 radio-btn" name="category" value="all" id="all" /><label for="all">ALL</label>
							</li>

							<li class="p-t-4">
								<input type="radio" class="s-text20 active1 radio-btn" name="category" value="텐트and탑프" id="tent" <c:if test="${param.category eq 'tent'}"></c:if>/><label for="tent">텐트/탑프</label>
							</li>

							<li class="p-t-4">
								<input type="radio" class="s-text20 active1 radio-btn" name="category" value="침낭and매트리스" id="sleepingBag" <c:if test="${param.category eq 'sleepingBag'}"></c:if>/><label for="sleepingBag">침낭/매트리스</label>								
							</li>

							<li class="p-t-4">
								<input type="radio" class="s-text20 active1 radio-btn" name="category" value="그릴and화로" id="grill" <c:if test="${param.category eq 'grill'}"></c:if>/><label for="grill">그릴/화로</label>
							</li>
							
							<li class="p-t-4">
								<input type="radio" class="s-text20 active1 radio-btn" name="category" value="버너and랜턴" id="burner" <c:if test="${param.category eq 'burner'}"></c:if>/><label for="burner">버너/랜턴</label>
							</li>
							
							<li class="p-t-4">
								<input type="radio" class="s-text20 active1 radio-btn" name="category" value="취사도구" id="cook" <c:if test="${param.category eq 'cook'}"></c:if>/><label for="cook">취사도구</label>							
							</li>

							<li class="p-t-4">
								<a href="#" class="s-text13">
									
								</a>
							</li>
						</ul>
						</form>

						<div>	
							<c:if test="${ loginuser.type eq 'admin' }">							
							<a class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4" href="/product/productWrite">등록하기</a>
							</c:if>
						</div>						

					</div>
				</div>

				<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
					<div class="flex-sb-m flex-w p-b-35">
						<div class="flex-w"></div>
						<span class="s-text8 p-t-5 p-b-5"></span>
					</div>

					<!-- Product -->
					<div class="row">
					
					<c:forEach var="products" items="${products}">
						<div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
							<!-- Block2 -->
							<div class="block2">
								<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
									<a href="/product/productDetail/${products.productNo}">
										<img src="/resources/camp-files/${ products.file.savedFileName }" alt="IMG-PRODUCT">
									</a>								
								</div>

								<div class="block2-txt p-t-20">
									<a href="/product/productDetail/${ products.productNo }" class="block2-name dis-block s-text3 p-b-5">
										${products.productName }
									</a>

									<span class="block2-price m-text6 p-r-5">
										${products.price }
									</span>
								</div>
							</div>
						</div>
					</c:forEach>

						
					</div>

					<!-- Pagination -->
					<div class="pagination flex-m flex-w p-t-26">
							
						    <c:if test="${ pageMaker.prev }">					  
						        <a href='/product/productList?page=${pageMaker.startPage-1 }&category=${category}'><i class="fa fa-chevron-left"></i></a>						    
						    </c:if>
						    
						    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
						     
						        <a href='/product/productList?category=${category}&page=${idx }' class="item-pagination flex-c-m trans-0-4"><i class="fa">${idx }</i></a>
						        						  
						    </c:forEach>
						    
						    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">			    
						        <a href='/product/productList?page=${pageMaker.endPage+1 }&category=${category}'  class="item-pagination flex-c-m trans-0-4"><i class="fa fa-chevron-right"></i></a>					    
						    </c:if>
						
					</div>
				</div>
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
	<script type="text/javascript">	 
	$(function(){
   		
   			
   			/* $('button[data-category]').on('click', function(event) {

   	   			var category = $(this).attr('data-category');
   				$.ajax({
   	   				url:"campKind",
   	   				data: "category=" + category,
   	   				method: "GET",
   	   				success: function(data, status, xhr) {
   	   	   					alert(data);
   	   	   					
   	   	   			}
	   	   			, error: function(xhr, status, err){
						alert(err);
						
		   	   		}
   	   	   		});
   			}); */
   			
		$('#all').on('change', function(event){
			location.href="/product/productList?category=all";	 			
		});
		$('#tent').on('change', function(event){
			this.form.submit();
		});
		$('#sleepingBag').on('change', function(event){
			this.form.submit();
		});
		$('#grill').on('change', function(event){
			this.form.submit();
		});
		$('#burner').on('change', function(event){
			this.form.submit();
		});
		$('#cook').on('change', function(event){
			this.form.submit();
		});
   			
   		 			
			});
	

	
		
	</script>

</body>
</html>
