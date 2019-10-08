<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    
<div style="padding-left: 250px">
        <div class="container2">
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
								<th class="column-2">용품 갯수</th>	
								<th class="column-2">용품 가격</th>																
								<th class="column-2">총 가격</th> 
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
		                        <td class="column-2"><fmt:formatDate value="${ buy.buyDate }" /></td>
		                        <td class="column-2">${ buy.productName }</td>                        
		                        <td class="column-4">
		                              ${ buy.addr1 }&nbsp;${ buy.addr2 }&nbsp;${ buy.addr3 }
		                        </td>					
		                        <td class="column-2">${ buy.amount }개</td>			
		                        <td class="column-2"><fmt:formatNumber value="${ buy.price }" pattern="#,###" />원</td>		                        																	
			                         <c:choose>
			                           <c:when test="${ buy.flag=='0' }">
			                              <td class="column-2"><fmt:formatNumber value="${ buy.money }" pattern="#,###" />원<br>    
			                              
			                              <a href="/review/ptreviewWrite?memberId=${loginuser.memberId }&productNo=${buy.productNo}&buyNo=${buy.buyNo}" 
			                              class="badge2 badge-success2">리뷰 남기기 </a></td>
			                           </c:when>
			                           <c:otherwise>
			                              <td class="column-2"><fmt:formatNumber value="${ buy.money }" pattern="#,###" />원<br>
			                              <a href="/review/ptreviewUpdate?memberId=${loginuser.memberId }&buyNo=${buy.buyNo}" 
			                              class="badge2 badge-success2">수정 </a>&nbsp;
			                              <a href="/review/ptreviewDelete?memberId=${loginuser.memberId }&buyNo=${buy.buyNo}" 
			                              class="badge2 badge-success2">삭제 </a></td>
			                           </c:otherwise>
			                        </c:choose>
			                     	</tr>
								</c:forEach>
							</table>
		                  </div>
                    <div id="sectionA" class="tab-pane fade in active show">                  
                           <table class="table-shopping-cart">
							<tr class="table-head">
								<th class="column-1"></th>
								<th class="column-4">예약 날짜</th>
								<th class="column-2">분류</th>
								<th class="column-4">이름</th>
								<th class="column-2">가격</th>
								<th></th>
							</tr>
							<c:forEach var="rent" items="${ rents }" varStatus="rentnum">				
								<tr class="table-row" id="card${ rentnum.index }">		
									<td class="column-1">
										<div class="cart-img-product" style="height: 120px; width: 170px">										
											<a href="/camp/campDetail/${ rent.campNo }">
												<img src="/resources/camp-files/${ rent.file.savedFileName }" alt="NO-IMAGE">
											</a>
										</div>				 				
									</td>	
			                        <td class="column-4"><fmt:formatDate value="${rent.startDate}" /> ~ <fmt:formatDate value="${rent.endDate}" /></td>                
			                        <td class="column-2">${ rent.category }</td>
			                        <td class="column-4">
			                              ${ rent.campName }
			                        </td>																					
			                        <c:choose>
			                           <c:when test="${ rent.flag=='0' }">
			                              <td class="column-2"><fmt:formatNumber value="${ rent.price }" pattern="#,###" />원<br>
			                              <a href="/review/reviewWrite?memberId=${loginuser.memberId }&campNo=${rent.campNo}&rentNo=${rent.rentNo}" 
			                              class="badge2 badge-success2">리뷰 남기기 </a></td>
			                           </c:when>
			                           <c:otherwise>
			                              <td class="column-2"><fmt:formatNumber value="${ rent.price }" pattern="#,###" />원<br>
			                              <a href="/review/reviewUpdate?memberId=${ loginuser.memberId }&rentNo=${rent.rentNo}" 
			                              class="badge2 badge-success2">수정 </a>&nbsp;
			                              <a href="/review/reviewDelete?memberId=${ loginuser.memberId }&rentNo=${rent.rentNo}" 
			                              class="badge2 badge-success2">삭제 </a></td>
			                           </c:otherwise>
			                        </c:choose>
			                        <td class="column-2">
				                        <form action="/member/rent_cancle" id="rentform${ rentnum.index }">
											<input type="button" class="btn btn-outline-danger btn-sm" value="예약취소" onclick="javascript:rent_cancle(${ rentnum.index })" />
											<input type="hidden" name="campNo" value="${ rent.campNo }">		
											<input type="hidden" name="campNo" value="${ rent.rentNo }">		
											<input type="hidden" name="memberId" value="${ rent.memberId }">		
										</form>	
			                        </td>
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
