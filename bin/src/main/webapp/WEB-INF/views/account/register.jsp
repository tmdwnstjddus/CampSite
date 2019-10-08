<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Contact</title>
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
											<a class="active" data-toggle="tab" href="#lg1">
												<h4> 회원가입 </h4>
											</a>
										</div>

										<div class="tab-content">
											<!-- Log In-->
											<div id="lg1" class="tab-pane active">
												<div class="login-form-container">
													<div class="login-form">
														<form action="register" method="post">
														
															<div class="cart_title">회원 정보</div><br>
															<input type="text" name="name" placeholder="이름">
															<p>
																<input type="text" id="memberId" name="memberId" placeholder="아이디">
																<div class="button-box">
											                    	<button name="idCheck" id="idCheck" type="button" class="flex-c-m size9 bg4 bo-rad-20 hov1 m-text3 trans-0-4">
											                    		<p class="s-text6">중복확인</p>
											                    	</button> 
											                </p>    
											                </div>
											                <p id="result">
											                   	<span id="msg"></span>
											                </p>
											                <br>
															<input type="password" name="pwd" placeholder="비밀번호">
															<input type="password" name="confirm" placeholder="비밀번호 확인">
															<input type="text" name="phone" placeholder="핸드폰" >
															<input type="email" name="email" placeholder="이메일" >
															
															<div class="cart_title">주소 정보</div><br>															
															<input type="button" style="color: white;background-color: black" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
															<input type="text" name="addr1" id="addr1" placeholder="우편번호">	
															<input type="text" name="addr2" id="addr2" placeholder="주소"><br>
															<input type="text" name="addr3" id="addr3" placeholder="상세주소">
															<div class="button-box">
																<button id="submit" type="submit" disabled="disabled"  class="flex-c-m size9 bg4 bo-rad-20 hov1 m-text3 trans-0-4">
																	<p class="s-text6 " > 회원가입 </p>
																</button>
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
	<jsp:include page="../include/jsimport" />
	



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
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
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
                        extraAddr = ' (' + extraAddr + ')';
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

  //중복검사
	$("#idCheck").click(function(){	 
		 var query = {memberId : $("#memberId").val()};
		 
		 $.ajax({
			 url : "/account/idCheck",
			 type : "post",
			 data : query,
			 success : function(data) {		  
				 if(data == 1) {
					 $("#result #msg").text("이미 사용중인 아이디 입니다.");
					 $("#result #msg").attr("style", "color:#f00"); 
					 $("#submit").attr("disabled", "disabled"); 
					 } else {
						 $("#result #msg").text("사용 가능한 아이디 입니다.");
						 $("#result #msg").attr("style", "color:#00f");
						 $("#submit").removeAttr("disabled");
					 }
				 }
		 	});
		 });
	
	//중복확인후 아이디 변경 재검사
	$("#memberId").keyup(function(){
		 $("#result #msg").text("중복확인을 해주세요.");
		 $("#result #msg").attr("style", "color:#000"); 
		 $("#submit").attr("disabled", "disabled");
		 
		});
</script>
	


</body>
</html>
