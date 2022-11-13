<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
    .outer{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 700px;
        border: 1px solid black; 
        margin: auto;
        margin-top: 50px;
        box-sizing: border-box;
    }
    .outer1{
        width: 50%;
        height: 100%;
        border: 1px solid blue;
        float: left;
    }
    .outer2{
        width: 50%;
        height: 100%;
        border: 1px solid red;
        float: right;
    }
    #avgNumberTitle{
        margin-top: 50px;
        margin-left: 30px;
    }
    #avgNumber{
        font-weight: bold;
        font-size: 30px;
        border: 0;
    }
    #text3{
        margin-left: 30px;
        font-size: 20px;
        font-weight: bold;
    }
    #avgGage{
        width: 350px;
        background-color: black;
    }
</style>
</head>
<body>
    <div class="outer">
        <div class="outer1">
            <form>
                <table>
                    <tr>
                        <p id ="avgNumberTitle"><strong style="font-size: 30px;">평균점수</strong></p>
                        <hr width="60%" style="float: left; margin-left: 35px;">
                        <td></td><br>
                        <p id="avgNumber"><input type="text" id="avgNumber" style="width: 45px; height: 35px; margin-left: -300px; color: blue;">&nbsp;&nbsp;/&nbsp;&nbsp;10</p><br><br>
                        <p id="text3">청결도</p>
                        <progress value="8.7" style="margin-left: 30px;" max="10" id="avgGage"></progress> &nbsp;<strong>8.7</strong>
                        <p id="text3">직원 & 서비스</p>
                        <progress value="7.0" style="margin-left: 30px;" max="10" id="avgGage"></progress> &nbsp;<strong>7.0</strong>
                        <p id="text3">편의시설 서비스</p>
                        <progress value="6.0" style="margin-left: 30px;" max="10" id="avgGage"></progress> &nbsp;<strong>6.0</strong>
                        <br><br>
                        <div>
                            <img src="location1.png" style="width: 400px; height:200px; margin-left: 30px;">
                        </div>
                    </tr>
                </table>
            </form>
        </div>
        <div class="outer2" >
            <iframe src="reviewCreate.jsp" frameborder="0" style="width:100%; height:700px; border: 3px"></iframe>
        </div>
    </div>
</body>
</html>