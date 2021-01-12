<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
        body {
            background-color: rgb(240, 242, 245);
        }
        .content {
            background-color: rgb(255,255,255);
        }

        .wrap {
            margin:0 auto;
            width:600px;
            border-radius: 10px;
            background-color: rgb(255,255,255);
            box-shadow: 4px 4px 4px gray;
            margin-top:30px;
        }

        .first {
            border-radius: 10px 10px 0px 0px;
            background-color: rgb(83, 39, 83);
            display: flex;
            height:30px;
            justify-content: flex-end;
        }

        .last {
            border-radius: 0px 0px 10px 10px;
            padding:10px;
        }

        .img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            text-align: center;
            background-color:black;
        }

        table {
            margin: 10px 0px 10px 10px;
        }

        .item{
            width:20px;
            height: 20px;
            margin:5px 10px 0px 0px;
        }

        .item1 {
            border-radius: 50%;
            /* background-color: red; */
            background: linear-gradient(white, 15%, red);
        }

        .item2 {
            border-radius: 50%;
            /* background-color: orange; */
            background: linear-gradient(white, 10%, orange);
        }

        .item3 {
            border-radius: 50%;
            /* background-color: green; */
            background: linear-gradient(white, 10%, green);
        }

    </style>
</head>
<body>
	<!-- for 문 -->
    <div class="wrap">
        <div class="content first">
            <div class="item item1"></div>
            <div class="item item2"></div>
            <div class="item item3"></div>
        </div>
        <div class="content">
            <div>
                <table>
                    <tr>
                        <td rowspan="2" style="width:50px;"><div class="img"></div></td>
                        <td><b>박성호 전문위원</b></td>
                    </tr>
                    <tr>
                        <td style="color:gray;">1월9일 오후5:00</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="content last">
            <p>안녕하세요</p>
            <p>테스트 글입니다.</p>
            <p>하이루</p>
        </div>
    </div>
    
     <div class="wrap">
        <div class="content first">
            <div class="item item1"></div>
            <div class="item item2"></div>
            <div class="item item3"></div>
        </div>
        <div class="content">
            <div>
                <table>
                    <tr>
                        <td rowspan="2" style="width:50px;"><div class="img"></div></td>
                        <td><b>박성호 전문위원</b></td>
                    </tr>
                    <tr>
                        <td style="color:gray;">1월9일 오후5:00</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="content last">
            <p>안녕하세요</p>
            <p>테스트 글입니다.</p>
            <p>하이루</p>
        </div>
    </div>
</body>
</html>