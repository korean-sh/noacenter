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
	<h2>�α��� ����</h2>
	<h2>${sessionScope.userId}</h2>
	<button onclick="fnLogout()">�α׾ƿ�</button>
</body>
</html>