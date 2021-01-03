/*
 * 로그인 유효성 검사
 */
const loginBtn = document.querySelector("#loginBtn");

function btnClickEvent(){
	const id = document.querySelector("#idField");
	const pwd = document.querySelector("#pwdField");
	
	if(id.value.length < 1){
		alert("ID를 입력하지 않았습니다.");
		id.focus();
	}else if(pwd.value.length < 1){
		alert("비밀번호를 입력하지 않았습니다.");
		pwd.focus();
	}else{
		loginAction(id.value, pwd.value);
	}
}

loginBtn.addEventListener("click", btnClickEvent);

/*
 * 로그인 이벤트 발생
 */
function loginAction(id,pwd){
	$.ajax({
		url : "loginEvent.do",
		type : "POST",
		data :{
			"userId" : id, 
			"userPwd" : pwd
		},
		success: function(data){
			if(data.code === "1"){
				location.href="index.do";
			}else{
				alert(data.msg);
			}
		},
		error: function(request, statues, error){
			alert("An error occurs.");
		}
	});
}

/*
 *  회원가입 버튼
 */
function userRegitser(){
	window.location.href="sign.do";
}

/*
 *	Enter Key 인식 (제이쿼리)
 */
$("#idField").keyup(function(event){
	if(event.keyCode === 13){
		btnClickEvent();
	}
});

$("#pwdField").keyup(function(event){
	if(event.keyCode === 13){
		btnClickEvent();
	}
});

$("body").keyup(function(event){
	if(event.keyCode === 13){
		btnClickEvent();
	}
});
