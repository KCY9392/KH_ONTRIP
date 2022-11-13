<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    hr{
        width: 550px;
    }
    .rn_navbar{
        margin: auto;
        width: 100%;
        float: left;
        box-sizing: border-box;
        border: 1px solid rgb(160, 160, 160);
        margin-top: 3px;
        background-color: rgb(155, 205, 138);
        padding: 40px;
        position: fixed;
    }
    .hotel{
        padding-left: 200px;
        color: rgb(34, 34, 34);
        background-color: rgb(155, 205, 138);
        position: fixed;
        font-size: 20px;
        font-weight: 600;
    }
    .outer{
        float: right;
        box-sizing: border-box;
        text-align: center;
    }
    #checkIn, #checkOut, #day{
        font-size: 20px;
        font-weight: 900;
        margin-left: 50px;
    }
    
    .container{
            margin:auto;
            text-align: center;
            width: 1000px;
            height: 700px;
            
        }
    .selectRn{
        border-right: solid 1px black;
        border-left: solid 1px black;
        text-align: left;
        
    }
    #info{
        margin:auto;
        width: 500px;
        text-align: center;
        background-color: rgb(238, 235, 235);
        border: 1px solid rgb(196, 192, 192);
    }
    #info2{
        margin:auto;
        width: 850px;
        border-radius: 15px;
        border: 1px solid rgb(196, 192, 192);
    }
    .pay{
        
        margin-left: 1110px;
    }
    #btn{
        width:200px;
        height:33px;
        font-size: 20px;
        font-weight: 900;
    }
    .pay-info{
        width:800px;
        height:33px;
    }
    #pay, #date, #payment{
        width:330px;
        height:33px;
        font-size: 20px;
        font-weight: 600;
    }
    .span_name,.adult, .child, .room-no,.room-type, .span_phone{
        font-size: 20px;
        font-weight: 900;
        margin-left: 220px;
    }
</style>
</head>
<body>
    <nav class="navbar bg-light" style="position:fixed; z-index:9999; width:100vw; ">
        <div class="container-fluid" style="background-color: white; padding-bottom: 7px; border-bottom:1px solid rgb(218, 213, 213);">
          <a class="navbar-brand" href="#">
            <b class="nav_b">Ontrip</b>&nbsp;
            <h7 style="font-size:13px; color:rgb(151,154,151);">MAKE YOUR ROUTE OPTIMIZED</h7>
          </a>
          <form class="d-flex" role="click">
            
            <button style="border:none; color:black;" class="btn btn-outline-success" type="button" onclick="myPage();">마이페이지</button>
            <button style="margin-right: 40px; margin-left:20px; color:black; border:none;" class="btn btn-outline-success" type="button"
                onclick="logout();">로그아웃</button>
          </form>
        </div>
      </nav>
    <br><br><br><br>
    <div class="rn_navbar" >
        <span class="hotel">서울 롯데호텔</span>
        <div class="outer">
            <span id="checkIn">체크인 : </span>
            <input type="date" name="checkIn"> 

            <span id="checkOut">체크아웃 : </span>
            <input type="date" name="checkOut">
            <span id="day">몇박</span>
        </div>
    </div>
    <br><br><br><br><br>
    <div class="container">
        <form action="<%=request.getContextPath() %>/insert.me" id="enroll-form" method="post">
           <div class="centerText">
                <div class="selectRn">
                    <br><br><br><br>
                    <span class="span_name">예약자 이름 : </span>&nbsp;&nbsp;&nbsp; 
                    <input type="text" placeholder="여행자 이름" size="14" name="memberName" required>  &nbsp; &nbsp; &nbsp; &nbsp;
                    <br><br>
                    <hr><br><br>
                    <span class="adult">성인 : </span>&nbsp;&nbsp;&nbsp; 
                    <select class="select_gender" name="gender">
                        <option>인원</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                    </select> 

                    <span class="child">어린이 : </span> &nbsp;&nbsp;&nbsp; 
                    <select class="select_gender" name="gender">
                        <option>인원</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    <br><br> 
                    <hr>
                    <br><br>
                    <span class="room-no">객실 수 :</span> &nbsp;&nbsp;&nbsp; 
                    <select class="select_gender" name="gender">
                        <option>방 갯수</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select> 
                    <br><br>
                    <hr>
                    <br><br>
                    <span class="room-type">객실 타입 :</span> &nbsp;&nbsp;&nbsp; 
                    <select class="select_gender" name="gender">
                        <option>타입</option>
                        <option value="100000">스탠다드룸</option>
                        <option value="200000">디럭스룸</option>
                        <option value="300000">트윈룸</option>
                        <option value="400000">패밀리룸</option>
                        <option value="500000">스위트룸</option>
                    </select>
                    <br><br>
                    <hr>
                    <br><br>
                    <span class="span_phone">휴대전화 : </span> &nbsp;&nbsp;&nbsp; 
                    <input class="input" type="text" placeholder="휴대전화번호 ( ' - ' 포함 )" name="phone" required><br>
                    <br><br>
                    <hr><br><br>
                    <div id="info">
                        <p style="text-align: left; margin-left: 30px;">
                            객실 기본정보 : <br>
                            3인기준/ 인원추가 불가<br>
                            에어컨, 중앙난방, TV, 냉장고, 커피포트<br>
                            욕조, 비대, 드라이기, 가운, 욕실용품<br>
                            무료 WI-FI<br>
                            금연객실
                        </p>
                    </div>
                    <br><br>
                    <h2 style="text-align: start; margin-left: 80px;">요금정책</h2>
                    <div id="info2">
                        <p style="text-align: left; margin-left: 15px;">
                            상기 요금에 조식은 포함되어있지 않습니다.<br>
                            한강 조망(리버뷰) 및 전망 욕실은 추가요금이 발생되며, 예약 희망시 유선 문의 또는 추가 요청 
                            기재 부탁드립니다.
                        </p>
                    </div>
                    <br><br>
                    <h2 style="text-align: start; margin-left: 80px;">취소규정</h2>
                    <div id="info2">
                        <p style="text-align: left; margin-left: 15px;">
                            예약 취소 및 변경은 체크인 하루전 18:00(한국시간)까지 가능합니다.<br>
                            예약하신 일자에 체크인 되지 않거나 또는 위의 지정 시간 이후에 예약을 취소했을 경우에는예약 사항에 대해
                            노-쇼(No Show)처리되며, 이에 따른 위약금으로 예약 첫날에 해당하는 1박 객실요금이 청구되오니 유의하시기 바랍니다.
                        </p>
                    </div>
                    <div class="pay">
                        <p id="pay">객실요금(1)박 : 10000000000</p>
                        <p id="date">이용일수 : 2일</p>
                        <p id="payment">총 요금 : 2000000000000</p>
                        <button id="btn">결제하기</button>
                    </div>
                    <br><br><br><br><br>
                </div>
           </div>
      </form>
    </div>
</body>
</html>