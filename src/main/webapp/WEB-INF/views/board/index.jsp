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
            <!--������ ����-->
            <div class="snb_profile">
                <div class="profile_table">
                    <table style="margin-left: auto; margin-right: auto;">
                        <tr>
                            <td rowspan="2" style="width: 90px;">
                                <div>
                                    <img src="resources/images/login/m_default.gif" class="profile_img"/>
                                </div>
                            </td>
                            <td style="text-align: right;">��������� ����������</td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">�ڼ�ȣ ��������</td>
                        </tr>
                    </table>
                </div>
                <div class="profile_logout">
                    <span style="font-size: x-small;">�α׾ƿ�</span>
                </div>
            </div>
            <!-- �޴� ���� -->
            <div class="snb_menu">
                <!-- ����ڿ� ���� �ٸ��� �޴� ��� -->
                <ul>
                    <li><a href="#">������������ ��������</a></li>
                    <li><a href="#">��ü ����</a></li>
                    <li><a href="#">��������� ����������</a></li>
                    <li><a href="#">��������� ���＾��</a></li>
                    <li><a href="#">��������� ��������</a></li>
                    <li><a href="#">��������� ���ּ���</a></li>
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