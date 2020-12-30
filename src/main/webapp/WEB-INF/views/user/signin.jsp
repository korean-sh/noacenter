<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>고용안정정보망 커뮤니티 로그인</title>
<link href="https://fonts.googleapis.com/css2?family=Alata&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" href="resources/css/signIn.css">
<!-- Jquery -->
<script src="resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<form:form modelAttribute="userDTO" class="registerForm" id ="registerForm" name="registerForm">
	<!-- header -->
	<div id="header">
		<a href="/"><img src="resources/images/login/userRegister.gif" /></a>
	</div>

	<!-- wrapper -->
	<div id="wrapper">
		<!-- content-->
		<div id="content">
			<!-- Company -->
			<div>
				<h3 class="join_title">
					<label for="company">소속</label>
				</h3>
				<span class="box"> <select id="company" name="userCompany">
						<option value="00">선택</option>
						<option value="01">노사발전재단 전직지원팀</option>
						<option value="02">노사발전재단 금융특화센터</option>
						<option value="03">노사발전재단 서울센터</option>
						<option value="04">노사발전재단 서울서부센터</option>
						<option value="05">노사발전재단 경기센터</option>
						<option value="06">노사발전재단 강원센터</option>
						<option value="06">노사발전재단 시스템 관리자</option>
				</select>
				</span>
			</div>

			<!-- ID -->
			<div>
				<h3 class="join_title">
					<label for="id">아이디</label>
				</h3>
				<span class="box int_id"><input type="text" id="id" class="int" name="userId" maxlength="20" /></span> <span class="error_next_box"></span>
			</div>

			<form>
			<!-- PW1 -->
			<div>
				<h3 class="join_title">
					<label for="pswd1">비밀번호</label>
				</h3>
				<span class="box int_pass"> <input type="password" id="pswd1" class="int" name="userPwd" maxlength="20" autocomplete="off" /> <span id="alertTxt">사용불가</span>
				</span> <span class="error_next_box"></span>
			</div>

			<!-- PW2 -->
			<div>
				<h3 class="join_title">
					<label for="pswd2">비밀번호 재확인</label>
				</h3>
				<span class="box int_pass_check"> <input type="password" id="pswd2" class="int" maxlength="20" autocomplete="off"/>
				</span> <span class="error_next_box"></span>
			</div>
			</form>

			<!-- NAME -->
			<div>
				<h3 class="join_title">
					<label for="name">이름</label>
				</h3>
				<span class="box int_name"> <input type="text" id="name" class="int" name="userName" maxlength="10" />
				</span> <span class="error_next_box"></span>
			</div>

			<!-- BIRTH -->
			<div>
				<h3 class="join_title">
					<label for="yy">생년월일</label>
				</h3>

				<div id="bir_wrap">
					<!-- BIRTH_YY -->
					<div id="bir_yy">
						<span class="box"> <input type="text" id="yy" class="int"  name="userBirth" maxlength="8" placeholder="ex) 1980.01.02인 경우 19800102" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						</span>
					</div>
			</div>

			<!-- GENDER -->
			<div>
				<h3 class="join_title">
					<label for="gender">성별</label>
				</h3>
				<span class="box gender_code"> <select id="gender" class="sel" name="userGender">
						<option value="00">성별</option>
						<option value="1">남자</option>
						<option value="2">여자</option>
				</select>
				</span> <span class="error_next_box">필수 정보입니다.</span>
			</div>

			<!-- EMAIL -->
			<div>
				<h3 class="join_title">
					<label for="email">이메일</label>
				</h3>
				<span class="box int_email"> <input type="text" id="email" class="int" maxlength="100" name="userEmail" />
				</span> <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
			</div>

			<!-- JOIN BTN-->
			<div class="btn_area">
				<button type="button" id="btnJoin" onclick="validateRegisterForm()">가입하기</button>
			</div>
		</div>
		</div>
		<!-- content-->
	</div>
	</form:form>
		<!-- JS -->
	<script type="text/javascript" src="resources/js/signin.js"	charset="UTF-8"></script>
</body>
</html>