<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="side.jsp"/>
<header class="header1">
      <!-- Header desktop -->
      <div class="container-menu-header">

         <div class="wrap_header">
            <!-- Logo -->
            <a href="/home" class="logo">
               <img src="/resources/images/icons/logo.png" alt="IMG-LOGO">
               TheCamp
            </a>

            <!-- Menu -->
            <div class="wrap_menu">
               <nav class="menu">
                  <ul class="main_menu">
                     <li>
                     <!-- <input type="hidden" name="category" value="all"/> -->
                        <a href="/camp/campList?category=all">캠핑장 예약</a>
                     </li>

                     <li >
                        <a href="/product/productList?category=all">캠핑장 용품</a>
                     </li>
                     <li>
                        <a href="/upload/tourist">주변관광지</a>
                     </li> 
                     <li>
                        <a href="/qna/qna">Q&A</a>
                     </li>                     
                  </ul>
               </nav>
            </div>
            <!-- Header Icon -->
 		<div class="header-icons">
 			<div class="header-wrapicon1 dis-block">
			<c:choose>
				<c:when test="${ empty loginuser }">
					<a href="/account/login">로그인</a>&nbsp;&nbsp;
					<a href="/account/register">회원가입</a>   
				</c:when>
				<c:otherwise>
					<div>                        
						<a href="#" onclick="openNav()" class="p-r-8">
							<img src="/resources/images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
						 <span style="color: blue">${ loginuser.memberId }님</span> 환영합니다!</a>&nbsp;	</a>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
         </div>
         </div>
      </div>


      <!-- Header Mobile -->
      <div class="wrap_header_mobile">
         <!-- Logo moblie -->
         <a href="index.html" class="logo-mobile">
            <img src="/resources/images/icons/logo.png" alt="IMG-LOGO">
         </a>

         <!-- Button show menu -->
         <div class="btn-show-menu">
            <!-- Header Icon mobile -->
            <div class="header-icons-mobile">

               <a href="#" class="openbtn header-wrapicon1 dis-block" onclick="openNav()">
                  <img src="/resources/images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
               </a>

               <span class="linedivide2"></span>

               <div class="header-wrapicon2">
                  <img src="/resources/images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
               </div>
            </div>

            <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
               <span class="hamburger-box">
                  <span class="hamburger-inner"></span>
               </span>
            </div>
         </div>
      </div>

      <!-- Menu Mobile -->
      <div class="wrap-side-menu" >
         <nav class="side-menu">
            <ul class="main-menu">
               <li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">
                  <span class="topbar-child1">
                     Free shipping for standard order over $100
                  </span>
               </li>

               <li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">
                  <div class="topbar-child2-mobile">
                     <span class="topbar-email">
                        fashe@example.com
                     </span>

                     <div class="topbar-language rs1-select2">
                        <select class="selection-1" name="time">
                           <option>USD</option>
                           <option>EUR</option>
                        </select>
                     </div>
                  </div>
               </li>

               <li class="item-topbar-mobile p-l-10">
                  <div class="topbar-social-mobile">
                     <a href="#" class="topbar-social-item fa fa-facebook"></a>
                     <a href="#" class="topbar-social-item fa fa-instagram"></a>
                     <a href="#" class="topbar-social-item fa fa-pinterest-p"></a>
                     <a href="#" class="topbar-social-item fa fa-snapchat-ghost"></a>
                     <a href="#" class="topbar-social-item fa fa-youtube-play"></a>
                  </div>
               </li>

               <li class="item-menu-mobile">
                  <a href="index.html">Home</a>
                  <ul class="sub-menu">
                     <li><a href="index.html">Homepage V1</a></li>
                     <li><a href="home-02.html">Homepage V2</a></li>
                     <li><a href="home-03.html">Homepage V3</a></li>
                  </ul>
                  <i class="arrow-main-menu fa fa-angle-right" aria-hidden="true"></i>
               </li>

               <li class="item-menu-mobile">
                  <a href="product.html">Shop</a>
               </li>

               <li class="item-menu-mobile">
                  <a href="product.html">Sale</a>
               </li>

               <li class="item-menu-mobile">
                  <a href="cart.html">Features</a>
               </li>

               <li class="item-menu-mobile">
                  <a href="blog.html">Blog</a>
               </li>

               <li class="item-menu-mobile">
                  <a href="about.html">About</a>
               </li>

               <li class="item-menu-mobile">
                  <a href="contact.html">Contact</a>
               </li>
            </ul>
         </nav>
      </div>
   </header>
   
   
   
   <script type="text/javascript">
              /* Set the width of the sidebar to 250px (show it) */
    function openNav() {
    document.getElementById("mySidepanel").style.width = "350px";
    }

    /* Set the width of the sidebar to 0 (hide it) */
    function closeNav() {
    document.getElementById("mySidepanel").style.width = "0";
    }
                
    </script>