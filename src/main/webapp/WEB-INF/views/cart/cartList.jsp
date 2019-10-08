<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" 
       contentType="text/html; charset=utf-8" 
       pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
   <title>장바구니</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <jsp:include page="../include/cssimport.jsp" />
   <style>
.bo99 {
border: 1px solid black;
border-radius: 4px;
}
.w-size188 {
    max-width: 670px;
}
   </style>
   
</head>
<body class="animsition">

<jsp:include page="../include/header.jsp" />

   <!-- Title Page -->
   <section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(/resources/images/main3.png);">
      <h2 class="l-text2 t-center">
         Cart
      </h2>
   </section>


   <!-- Cart -->
   <section class="cart bgwhite p-t-70 p-b-100">
      <div class="container">
         <!-- Cart item -->
         <div class="pos-relative">
            <div class="wrap-table-shopping-cart bgwhite">
               
               
               <!-- 장바구니 리스트 -->
               <c:choose>
               <c:when test="${map.count ==0 }">
               <br/><br/>
                  <p style="text-align: center; font-size:20px;">장바구니가 비었습니다</p>
               <br/><br/>
               </c:when>
               
               <c:otherwise>
               <table class="table-shopping-cart">
                  <tr class="table-head">
                     <th class="column-1" style="font-size:16px;font-weight: bold;"></th>
                     <th class="column-2" style="font-size:16px;font-weight: bold;">제품이름</th>
                     <th class="column-3" style="font-size:16px;font-weight: bold;">가격</th>
                     <th class="column-1 p-l-70" style="font-size:16px;font-weight: bold;">수량</th>
                     <th class="column-8 p-l-50" style="font-size:16px;font-weight: bold;">총 가격</th>
                  </tr>
               </table>
               <c:forEach var="row" items="${map.carts}">
               <form name="form1"  id="form${row.cartNo }" method="GET" action="/cart/updateCart">
               <input type="hidden" name="memberId" value="${loginuser.memberId }">
               <input type="hidden" name="cartNo" value="${row.cartNo }">
               
               <div class="container-table-cart pos-relative">
               <div class="wrap-table-shopping-cart bgwhite">
                     <table class="table-shopping-cart">
                        <tr class="table-row">
                           <td class="column-1">
                              <div class="cart-img-product b-rad-4 o-f-hidden">
                                 <img src="/resources/camp-files/${ row.file.savedFileName }" alt="IMG-PRODUCT">
                              </div>
                           </td>
                           <td class="column-2">
                              <a href="#">${row.productName }</a>
                           </td>
                           <td class="column-3"><fmt:formatNumber value="${ row.price }" pattern="#,###" />원</td>
                           <td class="column-1">
                              <div class="flex-w bo5 of-hidden w-size17">
                                 <input type="hidden" name="productNo" value="${row.productNo }">
                                 
                                 <button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
                                    <i class="fs-12 fa fa-minus" aria-hidden="true"></i>
                                 </button>
      
                                 <input class="size8 m-text18 t-center num-product" type="number" name="amount" value="${ row.amount }">
      
                                 <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
                                    <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
                                 </button>
                                 
                                 
                              </div>
                           </td>
                           <td class="column-8"><fmt:formatNumber value="${ row.money }" pattern="#,###" />원</td>
                           <td>
                              <button id="submit"><img src="/resources/images/modify.png"></button>
                           </td>
                           <td>
                              <a href="/cart/deleteCart?cartNo=${ row.cartNo }&memberId=${loginuser.memberId}">
                                 <img src="/resources/images/delete.png" onclick="return confirm('해당 물품을 삭제하시겠습니까?');">
                              </a>
                           </td>
                           
                        </tr>
                     </table>
                  </div>
               </div>
               </form>
               </c:forEach>
               
               
               
               
               <form name="form2" method="POST" action="/cart/buyCart" onsubmit="return check()">
               <input type="hidden" name="memberId" value="${loginuser.memberId }">
               
               <!-- 주소정보 -->
               <section class="cart bgwhite p-t-70 p-b-30">
               <div class="container">
                  <div class="container">
                     <div class="login-register-wrapper">
                        <div class="tab-content">            
                           <div id="lg1" class="tab-pane active">
                              <div class="login-form-container">
                                 <div class="login-form">
                                 <div class="cart_title" style="font-weight: bold">회원정보</div><br>   
                                 <input type="text" class="form-control" id="name_from"
                                           placeholder="이름" value="${ loginuser.name }" readonly>            
                                       <input type="text" class="form-control" id="phone_from"
                                           placeholder="핸드폰 번호" value="${ loginuser.phone }" readonly>                                                   
                                 <input type="text" class="form-control" id="addr1_from" readonly
                                           placeholder="도로명주소" value="${ loginuser.addr1}">
                                        <input type="text" class="form-control" id="addr2_from" readonly
                                           placeholder="지번주소" value="${ loginuser.addr2 }">
                                        <input type="text" class="form-control col" id="addr3_from" readonly
                                           placeholder="상세주소" value="${ loginuser.addr3 }">
                                  
                                       <hr>       
                                         <input type="checkbox" id="f-option2" name="selector" class="custom-control-input" onclick="checkBuy(this)">
                                         <label for="f-option2" class="custom-control-label" style="font-weight: bolder; font-size: 18px">주문자 정보와 동일</label>
                                         <hr>
                                         <br>
                                 <div class="cart_title" style="font-weight: bold">주문자 정보</div><br>                                            
                                         <input type="text" id="name" name="name" placeholder="이름">  
                                        <input type="text" id="phone" name="phone" placeholder="핸드폰 번호">
                                 <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background-color: black; color:white">   
                                 <input type="text" id="addr1" name="addr1"  placeholder="우편번호">   
                                 <input type="text" id="addr2" name="addr2" placeholder="주소"><br>
                                 <input type="text" id="addr3" name="addr3"  placeholder="상세주소">       
                                 </div>                              
                              </div>                           
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </section>
                           
            <!-- 구매정보 -->
            <div style="padding-left: 240px">
            <div class="bo99 w-size188 p-l-80 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 p-lr-15-sm">
            <h5 class="m-text20 p-b-24">
               구매 정보
            </h5>

            <div class="flex-w flex-sb-m p-b-12">
               <span class="s-text18 w-size19 w-full-sm">
                  구매금액:
               </span>
               <span class="m-text21 w-size20 w-full-sm">
               <fmt:formatNumber value="${ map.sumMoney }" pattern="#,###" />원
               </span>
            </div>

            <!-- 택배비 -->
            <div class="flex-w flex-sb bo10 p-t-15 p-b-20">
               <span class="s-text18 w-size19 w-full-sm">
                  택배비:
               </span>
               <span class="m-text21 w-size20 w-full-sm">
               <c:choose>
                  <c:when test="${map.fee != 0 }">
                  <fmt:formatNumber value="${ map.fee }" pattern="#,###" />원
                  </c:when>
               </c:choose>               
               </span>
               <span style="font-size:14px; color:orange;">10만원 이상 구매시 무료로 배송됩니다 </span>         
            </div>

            <!-- 총 구매금액 -->
            <div class="flex-w flex-sb-m p-t-26 p-b-30">
               <span class="m-text22 w-size19 w-full-sm">
                  총 결제금액:
               </span>
               <span class="m-text21 w-size20 w-full-sm">
               <fmt:formatNumber value="${ map.allSum }" pattern="#,###" />원
               </span>      
            </div>
               <div class="size15 trans-0-4">
                  <!-- Button -->
                  <button type="submit" class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" onclick="return confirm('해당 물품을 구매하시겠습니까?');">
                     결제하기
                  </button>
               </div>
            </div>
         </div>
      </form>
   </c:otherwise>
</c:choose>
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
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>

    $(function(){
           $('#submit').on('click', function(event){
               $('#form1').submit();
               });
           });
   
    function sample6_execDaumPostcode() {
           new daum.Postcode({
               oncomplete: function(data) {
                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                   var addr = ''; // 주소 변수
                   var extraAddr = ''; // 참고항목 변수

                   //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                       addr = data.roadAddress;
                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
                       addr = data.jibunAddress;
                   }

                   // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                   if(data.userSelectedType === 'R'){
                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if(extraAddr !== ''){
                           extraAddr = '(' + extraAddr + ')';
                       }           
                   } 

                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   document.getElementById('addr1').value = data.zonecode;
                   document.getElementById("addr2").value = addr;
                   // 커서를 상세주소 필드로 이동한다.
                   document.getElementById("addr3").focus();
               }
           }).open();
       }

    /* 주문자 정보 동일 */
    function checkBuy(my) {
       if (my.checked) {
          $('#name').attr('value', $('#name_from').attr('value'));
          $('#phone').attr('value', $('#phone_from').attr('value'));
          $('#addr1').attr('value', $('#addr1_from').attr('value'));
          $('#addr2').attr('value', $('#addr2_from').attr('value'));
          $('#addr3').attr('value', $('#addr3_from').attr('value'));
      
       }else{
          $('#name').attr('value', '');
          $('#phone').attr('value', '');
          $('#addr1').attr('value', '');
          $('#addr2').attr('value', '');
          $('#addr3').attr('value', '');
       }
    }

   
   </script>

</body>
</html>