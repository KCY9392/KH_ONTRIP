<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, com.ontrip.member.model.vo.Member"%>

<%
	Member loginUser2 = (Member) session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새로만든 마이페이지 navbar</title>
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

    </style>
</head>
<body>


 	
      <br><br><br><br>

    <div class="left-categoryBox">
        <div class="userResult">
            <button type="button" id = "n" name="search" onclick = "myMember();">여행자 정보</button>
        </div>
        <div class="reserveResult">
            <button type="button" id = "n" name="search" onclick="myReservation();">예약 숙소</button>
        </div>
        <div class="heartResult">
            <button type="button" id = "n" name="search" onclick="myHeart();">찜 목록</button>
        </div>
        <div class="reviewResult">
            <button type="button"  id = "n" name="search" onclick="myReview();">등록 후기</button>
        </div>
        <div class="statusResult">
            <button type="button" id = "n" name="search"  onclick = "deleteMember();">회원 탈퇴</button>
        </div>
      </div>
      
      <script>
            function myMember(){
                location.href = "<%=request.getContextPath()%>/mypage.me";
            }
            
            function myReservation(){
               location.href = "<%=request.getContextPath()%>/mypageReservationList.me";
            }
            
            function myHeart(){
               location.href = "<%=request.getContextPath()%>/mypageHeartList.me?memberNo=<%=loginUser2.getMemberNo()%>";
            }
            
            function myReview(){
               location.href = "<%=request.getContextPath()%>/mypageReviewList.me";
            }
            
            function deleteMember(){
                location.href = "<%=request.getContextPath()%>/MemberDelete.me";
            }
         </script>
      

      
</body>
</html>