<%@ page language="java" contentType="text/html; charset=EUC-KR" 	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>고용안정정보망 커뮤니티 로그인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/51db22a717.js"	crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/login.css">
<!-- Jquery -->
<script src="resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div class="page-container">
		<div class="login-form-container shadow">
			<div class="login-form-right-side">
				<div class="top-logo-wrap"></div>
				<img src="resources/images/login/formal.gif" />
				<p>노사발전재단 고용안정정보망 커뮤니티</p>
			</div>
			<div class="login-form-left-side">
				<div class="login-top-wrap">
					<button class="create-account-btn shadow-light"
						onclick="userRegitser()">회원가입</button>
				</div>
				<div class="login-input-container">
					<div class="login-input-wrap">
						<p>ID</p>
						<input type="text" id="idField" autocomplete="off"/>
					</div>
					<form>
					<div class="login-input-wrap">
						<p>Password</p>
						<input type="password" id="pwdField" autocomplete="off"/>
					</div>
					</form>
				</div>
				<div class="login-btn-wrap">
					<button class="login-btn" id="loginBtn">Login</button>
					<a href="#">비밀번호 찾기</a>
				</div>

			</div>
			<!--login-form-left-side-->
		</div>
		<!--login-form-container shadow-->
	</div>
	<!--page-container-->
</body>
<!-- JS -->
<script type="text/javascript" src="resources/js/login.js" charset="UTF-8"></script>
</html>