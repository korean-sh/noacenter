/**
 * 비정상적인 경로 접근 차단
 */

function validSessionId(){
	const userId = document.querySelector("#sessionId").value;
	const body = document.querySelector("body");
	if(userId.length === 0){
		body.style.display = "none";
		alert("해당 홈페이지는 로그인 후 사용할 수 있습니다.");
		location.href="/";
	}
}

validSessionId();