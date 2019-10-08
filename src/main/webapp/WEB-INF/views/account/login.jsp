<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
   <title>로그인</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <jsp:include page="../include/cssimport.jsp" />
</head>
<body class="animsition">

   <!-- Header -->
   <jsp:include page="../include/header.jsp" />


   <!-- content page -->    
   <section class="cart bgwhite p-t-70 p-b-100">
         <div class="container">
            <div>
                  <div class="container">
                        <div class="login-register-wrapper">
                              <div class="login-register-tab-list nav">
                                 <a class="active" data-toggle="tab">
                                    <h4> 로그인 </h4>
                                 </a>
                              </div>

                              <div class="tab-content">
                                 <!-- Log In-->
                                 <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                       <div class="login-form">
                                          <form id="login-form" action="login" method="post">
                                             <input type="text" name="memberId" placeholder="아이디">
                                             <input type="password" name="pwd" placeholder="비밀번호">
                                             <div class="button-box">
                                                <div class="login-toggle-btn">
                                                   <input type="checkbox"class="checkbox"  id="idSaveCheck">
                                                   <label>아이디 기억하기</label>
                                                   <a href="#"><span id="idfindform">아이디 찾기</span></a><br>
                                                    <a href="#"><span id="findpwdform">비밀번호 찾기</span></a>
                                                </div>
                                                <div class="p-b-10">
                                                   <button   id="login" type="submit" value="로그인" class="flex-c-m size9 bg4 bo-rad-20 hov1 m-text3 trans-0-4">
                                                      <p class="s-text6 ">로그인</p>
                                                   </button>
                                       </div>
                                    </div>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>                     
               </div>   
            </div>
         </div>
      </section>

   <!-- Footer -->
   <jsp:include page="../include/jsimport.jsp" />
   



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
   
   <script src="../resources/js/jquery-3.2.1.min.js"></script>
   <script src="../resources/styles/bootstrap4/popper.js"></script>
   <script src="../resources/styles/bootstrap4/bootstrap.min.js"></script>
   <script src="../resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
   <script src="../resources/plugins/easing/easing.js"></script>
   <script src="../resources/plugins/parallax-js-master/parallax.min.js"></script>
   <script src="../resources/plugins/colorbox/jquery.colorbox-min.js"></script>
   <script src="../resources/js/custom.js"></script>
   <script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"></script>

   <script type="text/javascript">              
      $(function(){      
         $('#login').on('click', function(event){
            $('#login-form').submit();    
         });
      });

    $(document).ready(function(){
          // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
          var userInputId = getCookie("userInputId");
          $("input[name='memberId']").val(userInputId); 
           
          if($("input[name='memberId']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
              $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
          }
           
          $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
              if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
                  var userInputId = $("input[name='memberId']").val();
                  setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
              }else{ // ID 저장하기 체크 해제 시,
                  deleteCookie("userInputId");
              }
          });
           
          // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
          $("input[name='memberId']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
              if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                  var userInputId = $("input[name='memberId']").val();
                  setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
              }
          });
      });
       
      function setCookie(cookieName, value, exdays){
          var exdate = new Date();
          exdate.setDate(exdate.getDate() + exdays);
          var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
          document.cookie = cookieName + "=" + cookieValue;
      }
       
      function deleteCookie(cookieName){
          var expireDate = new Date();
          expireDate.setDate(expireDate.getDate() - 1);
          document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
      }
       
      function getCookie(cookieName) {
          cookieName = cookieName + '=';
          var cookieData = document.cookie;
          var start = cookieData.indexOf(cookieName);
          var cookieValue = '';
          if(start != -1){
              start += cookieName.length;
              var end = cookieData.indexOf(';', start);
              if(end == -1)end = cookieData.length;
              cookieValue = cookieData.substring(start, end);
          }
          return unescape(cookieValue);
      }
      
   <!-- 아이디 찾기 -->
      $(function(){
      $("#idfindform").click(function(){
         location.href='/account/idfindform';
         })
            })
            
   <!-- 비밀번호 찾기 -->
      $(function(){
      $("#findpwdform").click(function(){
         location.href='/account/findpwdform';
         })
            })            
      </script>
      

</body>
</html>