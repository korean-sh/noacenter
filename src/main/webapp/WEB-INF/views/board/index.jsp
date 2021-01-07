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
<!-- CSS -->
<link rel="stylesheet" href="resources/css/index.css">
</head>
 <body>
        <div class="snb">
            <!--프로필 영역-->
            <div class="snb_profile">
                <div class="profile_table">
                    <table style="margin-left: auto; margin-right: auto;">
                        <tr>
                            <td rowspan="2" style="width: 90px;">
                                <div>
                                    <img src="resources/images/login/m_default.gif" class="profile_img"/>
                                </div>
                            </td>
                            <td style="text-align: right;">노사발전재단 전직지원팀</td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">박성호 전문위원</td>
                        </tr>
                    </table>
                </div>
                <div class="profile_logout">
                    <span style="font-size: x-small;">로그아웃</span>
                </div>
            </div>
            <!-- 메뉴 영역 -->
            <div class="snb_menu">
                <!-- 사용자에 따라 다르게 메뉴 출력 -->
                <ul>
                    <li><a href="#">고용안정정보망 공지사항</a></li>
                    <li><a href="#">전체 센터</a></li>
                    <li><a href="#">노사발전재단 전직지원팀</a></li>
                    <li><a href="#">노사발전재단 서울센터</a></li>
                    <li><a href="#">노사발전재단 강원센터</a></li>
                    <li><a href="#">노사발전재단 제주센터</a></li>
                </ul>
            </div>
        </div>

        <div class="parent">
            <div class="child">
                content
            </div>
        </div>
	<script type="text/javascript" src="resources/js/sessionCheck.js" charset="UTF-8"></script>
</body>
</html>