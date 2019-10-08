<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


        <div id="mySidepanel" class="sidepanel ">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <div class="nevpanner"> 
                  <div class="rightbar">
        
                    <!-- 마이페이지 -->
                    <h4 class="m-text23 p-t-56 p-b-34">
                      	MyPage
                    </h4>    
                    <ul>
                      <c:if test="${ loginuser.type eq 'admin' }">    
                     	<li class="p-t-6 p-b-8 bo6">
	                        <a href="/member/adminpage" class="s-text13 p-t-5 p-b-5"
	                        style="color:red">
	                                                  관리자 페이지
	                        </a>
	                     </li> 
                      </c:if>                      
                      <li class="p-t-6 p-b-8 bo6">
                        <a href="/member/mypage?memberId=${loginuser.memberId }" class="s-text13 p-t-5 p-b-5">
                          	마이페이지
                        </a>
                      </li>
                     <li class="p-t-6 p-b-8 bo6">
                        <a href="/cart/ordercart?memberId=${ loginuser.memberId }" class="s-text13 p-t-5 p-b-5">
                          	장바구니
                        </a>
                      </li>    
                     <li class="p-t-6 p-b-8 bo6">
                        <a href="/member/orderlist?memberId=${loginuser.memberId }" class="s-text13 p-t-5 p-b-5">
                          	예약내역
                        </a>
                      </li>                                                       
                    </ul>
                     
        
                    <div class="p-t-10 t-right logout-btn">
                    	<button class="btn btn-outline-primary" onclick="location.href='/account/logout'">
							<i class="fa fa-sign-out" aria-hidden="true"></i>
							<span>로그아웃</span>
						</button>
					</div>
                  </div>
                </div>
          </div>
        </div>