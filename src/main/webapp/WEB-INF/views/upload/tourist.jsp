<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>주변관광지</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<jsp:include page="../include/cssimport.jsp" />
	
</head>
<body class="animsition"> 

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	<!-- content page -->
        <h3 class="m-text20 p-b-36 p-t-15 text-center" style="font-size: 33px; font-weight: bolder;">주변 관광지</h3><br>
        
          
		<div style="text-align: center">
			<img src="/resources/images/t0.png"><br><br><br>
			<img src="/resources/images/t1.png"><br><br><br>
			<img src="/resources/images/t2.png"><br><br><br>
			<img src="/resources/images/t3.png"><br><br><br>
			<img src="/resources/images/t4.png"><br><br><br>
			<img src="/resources/images/t5.png">
		</div>
                   
  	<br><br><br><br><br><br>
	
	
	<!-- Footer -->
	<jsp:include page="../include/footer" />

	<!-- js import -->
	<jsp:include page="../include/jsimport.jsp" />
	
</body>
</html>
