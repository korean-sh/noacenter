/**
 * Jqeury 연습
 */

/*
 * $.ajax({
    url : "로딩할 페이지 URL, ex)/common/list.jsp",
    dataType : "html",
    type : "post",  // post 또는 get
    data : { a:"값1", b:"값2"},   // 호출할 url 에 있는 페이지로 넘길 파라메터
    success : function(result){
        $("#div 아이디").html(result);
    }
	});
 */

$(document).ready(function(){
	$("#logout").click(function(){
		location.href="logout.do";
	});

	$("#homePath").click(function(){
		$("#child").load("home.do");
	});
	
	$("#testPath").click(function(){
		$("#child").load("test.do");
	});
});


