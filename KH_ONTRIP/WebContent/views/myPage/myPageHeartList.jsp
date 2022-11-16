<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 찜목록</title>

    <link href="<%= request.getContextPath() %>/resources/css/myPageHeartList.css" rel="stylesheet" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
            height:500px;
        }
        table th, table td {
            border: 1px solid #444444;
            border-top: 1px solid #444444;
            border-bottom: 1px solid #444444;
            padding: 10px;
        }
      
      </style>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>

    <%@ include file="../common/myPageNavbar.jsp" %> 
      


      <br><br><br><br>

      <div class="container">
        <div class="center" style="width:1200px; height:750px; margin-left:10%; margin-top: -50px;">
                <div class="centerTitle" style="text-align: center; margin-top:20px;">
                    <h2 style="margin-left:-5%; font-size:40px; font-weight:bold;]">찜목록</h2>
                </div>
                <br><br>

                <div class="centerDiv">
                  <div class="table-div">
                    <table style="border:1px solid black;">
                        <tr class="t0">
                            <th>
                                카테고리명
                            </th>
                            <th>
                                이미지
                            </th>
                            <th>
                                이름
                            </th>
                            <th>
                                선택한 날짜
                            </th>
                            <th>
                                전체선택
                            </th>
                        </tr>
                        <tr class="t1">
                            <td>숙소</td>
                            <!-- value값은 일부러 만들어 놓은거라 밑에 주석되어있는 코드를 쓰면 됨. -->
                            <td>이미지</td>
                            <!-- <td><input type="text" name="userName" value=""></td> -->
                            <td>숙소이름</td>
                            <td>2022-10-20</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr  class="t2">
                            <td rowspan="2">놀거리</td>
                            <!-- value값은 일부러 만들어 놓은거라 밑에 주석되어있는 코드를 쓰면 됨. -->
                            <td>이미지</td>
                            <!-- <td><input type="text" name="userName" value=""></td> -->
                            <td>숙소이름</td>
                            <td>2022-10-20</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        <tr  class="t3">
                            <td>이미지</td>
                            <!-- value값은 일부러 만들어 놓은거라 밑에 주석되어있는 코드를 쓰면 됨. -->
                            <td>숙소이름</td>
                            <!-- <td><input type="text" name="userName" value=""></td> -->
                            <td>2022-10-20</td>
                            <td><input type="checkbox"></td>
                           
                        </tr>
                        <tr class="t4">
                            <td>맛집</td>
                            <!-- value값은 일부러 만들어 놓은거라 밑에 주석되어있는 코드를 쓰면 됨. -->
                            <td>이미지</td>
                            <!-- <td><input type="text" name="userName" value=""></td> -->
                            <td>숙소이름</td>
                            <td>2022-10-20</td>
                            <td><input type="checkbox"></td>
                        </tr>
                        
                      
                        
                    </table>
                  </div>

                </div>
                <br>
                <!-- 모달창 -->
                <div class="main-bg">
                    <button id="login" class="btn btn-danger" style="margin-left:90%; background-color: gray;">선택삭제</button>
                  </div>
              

                <div class="black-bg">
                  <div class="white-bg">
            
                    <h4>찜목록</h4>
                    
                    <form action="#">
                      <div class="my-3">
                        <span>선택한 목록을 삭제하시겠습니까?</span>
                        </div>
                        <button type="submit" class="btn btn-primary btn-color1" id="send">확인</button>
                        <button type="button" class="btn btn-danger btn-color2" id="close" style="background-color:grey;">취소</button>
                    </form> 
                  
                  </div>
                </div> 
            
            </div>
        </div>

        <script>

            $('#login').on('click', function(){
              $('.black-bg').addClass('show-modal');
              $('.table-div').css('opacity', '0.3');
              $('.table-div').css('transition', '200ms');
            })
            $('#close').on('click', function(){
              $('.black-bg').removeClass('show-modal');
              $('.table-div').css('opacity', '1');
            })
      
          </script>
</body>
</html>