/*
 * 회원가입 유효성 검사
 */
function validateRegisterForm(){
	const userCompany = document.querySelector("#company").options[company.selectedIndex].value;
	const userId = document.querySelector("#id");
	const userPwd1 = document.querySelector("#pswd1");
	const userPwd2 = document.querySelector("#pswd2");
	const userName = document.querySelector("#name");
	const userBirth = document.querySelector("#yy");
	const userGender = document.querySelector("#gender").options[gender.selectedIndex].value;
	const userEmail = document.querySelector("#email");

	if(userCompany === "00"){
		alert("소속을 선택해주세요.");
	}else if(validateUserId(userId.value)){
		alert("유효하지 않은 ID 입니다.");
		userId.focus();
	}else if(!validateUserPwd(userPwd1.value)){
		alert("유효하지 않은 비밀번호입니다.");
		userPwd1.focus();
	}else if(!(userPwd1.value === userPwd2.value)){
		alert("비밀번호가 일치하지 않습니다.");
		userPwd1.focus();
	}else if(userName.value.length < 2){
		alert("유효하지 않은 이름입니다.");
		userName.focus();
	}else if(!validateUserBirth(userBirth.value)){
		alert("유효하지 않은 생년월일입니다.");
		userBirth.focus();
	}else if(userGender === "00"){
		alert("성별을 선택해주세요.");
	}else if(!validateEmail(userEmail.value)){
		alert("유효하지 않은 이메일 주소입니다.");
		userEmail.focus();
	}else{
		registerAction();
	}
}

/*
 * ID 확인
 */
function validateUserId(userId){
	if(userId.length < 5){
		return true;
	}else{
		const regExp =/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		return regExp.test(userId);
	}
}

/*
 * 비밀번호 검증
 */
function validateUserPwd(userPwd){
	if(userPwd.length < 1){
		return false;
	}else{
		const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/;
		return regExp.test(userPwd);
	}
}

/*
 * 생년월일 검증
 */
function validateUserBirth(userBirth){
	
	const year = Number(userBirth.substr(0,4));
	const month = Number(userBirth.substr(4,2));
	const day = Number(userBirth.substr(6,2));
	const currentYear = new Date().getFullYear();
	const adultYear = currentYear - 20;
	
	if(userBirth.length !== 8){
		console.log("1");
		return false;
	}else if(year < 1940 || year > adultYear){
		console.log("2");
		return false;
	}else if(month === 2){
		if(day > 29){
			console.log("3");
			return false;
		}
	}else if(month > 12){
		console.log("4");
		return false;
	}else if(month!== 2){
		if(day > 31){
			console.log("5");
			return false;
		}
	}
	return true;
}


/*
 * 이메일 정규식
 */
function validateEmail(email) {
	const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return regExp.test(email);	
}

/*
 * 한글만 입력
 */
function init(){
	const userName = document.querySelector("#name");
	userName.addEventListener("keyup", onlyKorean);
	userName.addEventListener("keypress", onlyKorean);
	userName.addEventListener("keydown", onlyKorean);
	
	const userId = document.querySelector("#id");
	userId.addEventListener("keyup", notUseKorean);
}

function onlyKorean(){
	const pattern = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	this.value = this.value.replace(pattern, '');
}

/*
 * 한글 입력 방지
 */
function notUseKorean(event){
	if(!(event.keyCode >=37 && event.keyCode <= 40)){
		const pattern = /[\ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
		this.value = this.value.replace(pattern, "");
	}
}

init();


/*
 * input tag에 name이 없으면 serialize() 는 null 값을 가져온다.
 */
function registerAction(){
	
	const form = $("#registerForm").serialize();

	$.ajax({
		url : "save.do",
		type : "POST",
		data : form,
		success: function(data){
			if(data.code === "1"){
				alert(data.msg);
				location.href="/";
			}else {
				alert(data.msg);
			}
		},
		error: function(request, statues, error){
			alert("An error occurs.");
		}
	});
}

/*
 * Enter Key 입력
 */
$("body").keyup(function(event){
	if(event.keyCode === 13){
		validateRegisterForm();
	}
});