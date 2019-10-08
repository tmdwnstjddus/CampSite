<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>예약/주문 내역</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<jsp:include page="../include/cssimport.jsp" />
	
</head>
<body class="animsition">

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	<!-- content page -->
                    <h4 class="m-text20 p-b-36 p-t-15 text-center"><span style="color: navy">${ loginuser.memberId }님</span>의 예약/주문 내역</h4> 
                    
<div class="work_area">
        <div class="container">
            <div class="bo4">
                <div class="bs-example">
                <ul class="nav nav-tabs bg7 flex-sa">
                    <div class="p-t-15 p-b-14 p-l-22" >
                        <a data-toggle="tab" href="#sectionA" class="toggle-color active" >
                            <h6 class="s-text4 flex-sb-m cs-pointer color0-hov trans-0-4">캠핑장 예약 내역</h6>
                        </a>
                    </div>
                    <div class="p-t-15 p-b-14 p-l-22" >
                        <a data-toggle="tab" href="#sectionC">
                            <h6 class="s-text4 flex-sb-m cs-pointer color0-hov trans-0-4">용품 구매 내역</h6>
                        </a>
                    </div>

                </ul>
                
                

                <div class="tab-content">													
                    <div id="sectionC" class="tab-pane fade in">
                        <table class="table-shopping-cart">
							<tr class="table-head">
								<th class="column-1"></th>
								<th class="column-2">주문 날짜</th>
								<th class="column-2">용품 이름</th>
								<th class="column-4">주소</th>
								<th class="column-2">가격</th> 
							</tr>
							<c:forEach var="buy" items="${ buys }">  							
							<tr class="table-row">		
								<td class="column-1">
									<div class="cart-img-product" style="height: 120px; width: 170px">
										<a href="/product/productDetail/${ buy.productNo }">
											<img src="/resources/camp-files/${ buy.file.savedFileName }" alt="IMG-PRODUCT" style="height: 140px">
										</a>
									</div>								
								</td>														
								<td class="column-2">${ buy.buyDate }</td>
								<td class="column-2">${ buy.productName }</td>
								<td class="column-4">
										${ buy.addr1 }&nbsp;${ buy.addr2 }&nbsp;${ buy.addr3 }
								</td>
								<td class="column-2">￦${  buy.price }<br><a href="/review/reviewWrite?memberId=${loginuser.memberId }&productNo=${buy.productNo}" class="badge2 badge-success2">리뷰 남기기</a></td>
							</tr>
							</c:forEach>
						</table>
                    </div>
                    <div id="sectionA" class="tab-pane fade in active show">                  
                           <table class="table-shopping-cart">
							<tr class="table-head">
								<th class="column-1"></th>
								<th class="column-2">예약 날짜</th>
								<th class="column-4">분류</th>
								<th class="column-4">이름</th>
								<th class="column-2">가격</th>
							</tr>
							<c:forEach var="rent" items="${ rents }">  							
							<tr class="table-row">		
								<td class="column-1">
									<div class="cart-img-product" style="height: 120px; width: 170px">
										<a href="/camp/campDetail/${ rent.campNo }">
											<img src="/resources/camp-files/${ rent.file.savedFileName }" alt="NO-IMAGE">
										</a>
									</div>				 				
								</td>														
								<td class="column-2">${ rent.startDate }${ rent.endDate }</td>							
								<td class="column-4">${ rent.category }</td>
								<td class="column-4">
										${ rent.campName }
								</td>
								<td class="column-2">￦${ rent.price }<br><a href="/review/reviewWrite?memberId=${loginuser.memberId }&campNo=${rent.campNo}" class="badge2 badge-success2">리뷰 남기기</a></td>
							</tr>
							</c:forEach>
						</table>
				</div>
               </div>
              </div>
            </div> 
        </div>    
    </div>
  	<br><br><br>
  	


<!-- #container -->

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
	<script type="text/javascript">
		$(function () {
		
		    $(".tab_content").hide();
		    $(".tab_content:first").show();
		
		    $("ul.tabs li").click(function () {
		        $("ul.tabs li").removeClass("active").css("color", "#333");
		        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
		        $(this).addClass("active").css("color", "darkred");
		        $(".tab_content").hide()
		        var activeTab = $(this).attr("rel");
		        $("#" + activeTab).fadeIn()
		    });
		});
	</script>

</body>
</html>
