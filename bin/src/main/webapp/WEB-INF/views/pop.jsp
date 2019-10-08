<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<title>겨울맞이 이벤트</title>
	</head>
	
		<img src="/resources/images/pop.png">
	<body onunload="closeWin()">
	<form style="text-align: right; font-weight: 500;">
	<input type=checkbox name="Notice" value="">오늘 하루 열지 않음
	&nbsp;
	<a href="javascript:window.close()" style="color: black">닫기 X</a>
	</form>
	</body>
	<script type="text/javascript">
	function setCookie( name, value, expiredays )
	{
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	 
	function closeWin()
	{
	if ( document.forms[0].Notice.checked )
	setCookie( "Notice", "done" , 1);
	self.close();
	}
</html>		
		

