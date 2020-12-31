<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function fnLogout(){
		window.location.href = "logout.do";
	}
</script>
</head>
<body>
	<!-- session 확인 -->
	<input type="text" id="sessionId" class="sessionId" value= "${sessionScope.userId}" style="display: none;"/>
	<div id="bodyDiv">
		<h2>로그인 성공</h2>
		<h2>${sessionScope.userId}</h2>
		<button onclick="fnLogout()">로그아웃</button>

	</div>
	<script type="text/javascript" src="resources/js/sessionCheck.js" charset="UTF-8"></script>
</body>
</html>