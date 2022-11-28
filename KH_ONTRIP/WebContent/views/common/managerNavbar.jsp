<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자용 초록창버튼바</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
        body{
            margin:0;
            text-align: center;
        }
        div{
            box-sizing: border-box;
        }

        .nav_b{
            font-size: 30px;
            padding-left: 40px;
            color:rgb(155, 205, 138);
        }
        .nav_h{
            font-size:small;
        }
        .nav_brand{
            margin-left: 50px;
        }
        .left-categoryBox{
            width:15%;
            height:91vh;
            margin-top: -3px;
            background-color:white;
            float:left;
            position:fixed;
            top:-header.height;
            transition:top 0.5s;
        }
        #n{
            width: 100%;
            height: 100%;
            background-color: darkseagreen;
            border: 1px solid darkgreen;
            color: white;
            font-size: 35px;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: bold;
            border-radius: 15px;   
        }
        .userResult , .reserveResult , .heartResult , .reviewResult , .statusResult{
            width: 100%;
            height: 20%;
        }
        .table{
            text-align: center;
            margin-left:27%;
            margin-top:80px;
        }
        .btn-num1{
            margin-left:33.3%;
        }
        #n:hover{
        	font-size:40px;
        	background-color: rgb(155, 203, 155);
        }

    </style>
</head>
<body>
      <br><br><br><br>

      <div class="left-categoryBox" id="nbar">
          <div class="userResult">
              <button type="button" id = "n" name="search" onclick="location.href='/KH_ONTRIP/placeList.mn?categoryCode=PP'">메인 관리</button>
          </div>
          <div class="reserveResult">
              <button type="button" id = "n" name="search" onclick="location.href='/KH_ONTRIP/manager/members'">회원 관리</button>
          </div>
          <div class="heartResult">
              <button type="button" id = "n" name="search" onclick="location.href='/KH_ONTRIP/manager/reviews/play?category=PP'">등록 후기</button>
          </div>
          <div class="reviewResult">
              <button type="button" id = "n" name="search" onclick="location.href='/KH_ONTRIP/manager/questions'">문의사항 관리</button>
          </div>
          <div class="statusResult">
              <button type="button" id = "n" name="search" onclick="location.href='/KH_ONTRIP/manager/qnas'">Q&A 관리</button>
          </div>
      </div>


    
</body>
</html>