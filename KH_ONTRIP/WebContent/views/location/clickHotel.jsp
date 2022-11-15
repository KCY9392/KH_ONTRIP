<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <title>온트립(OnTrip) - 숙소</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/clickHotel.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    
     <br><br><br><br>

    <div class="body-container">

        <div class="title-container">
            <b>O O 숙소</b> &nbsp;&nbsp;
            <b>서울 롯데호텔</b> &nbsp;&nbsp;
            
            <button>예약하러가기</button>
            
            <button style="background-color: rgb(44, 144, 72); color:white; border-radius:10px; border:3px solid rgb(44, 144, 72);">
                <i class="fa-regular fa-heart fa-lg"></i>
            </button> &nbsp;&nbsp;
            
        </div>
        <br>
        <div style="float:right; margin-right:15px;">
            <a href="#">
                <!-- 이용후기페이지로 이동 -->
                <button class="btn-review1" style="font-weight: bold; color:blueviolet; background-color: cornsilk; border-radius:10px; border:3px solid rgb(44, 144, 72); ">이용후기 보러가기</button>
            </a>
            <a href="#">
                <!-- 이용후기 작성 페이지로 이동 -->
                <button class="btn-review2" style="font-weight: bold; color:blueviolet; background-color: cornsilk; border-radius:10px; border:3px solid rgb(44, 144, 72); ">후기작성하기</button>
            </a>
        </div>

        <br><br>

        <div class="img-hotel">
            <img src="../image/롯데호텔.png" alt=""> <!-- 해당 사진 1-->
            <img src="../image/롯데호텔2.png" alt=""> <!-- 해당 사진 2-->
            <!-- 지도를 표시할 div -->
        <div id="map" style="width:100%;height:350px;"></div>

        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c46a61fbdf9ee1c5956f08d7c2deaf8"></script>
        <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = { 
<%--                     center: new kakao.maps.LatLng(<%= %>, <%= %>), // 지도의 중심좌표 --%>
                    level: 3 // 지도의 확대 레벨
                };

            // 지도를 표시할 div와  지도 옵션으로  지도를 생성
            var map = new kakao.maps.Map(mapContainer, mapOption); 
        </script> <!-- 지도api 자리 -->
        </div>

        <br>

        <a href="" class="review">방문자 후기</a> &nbsp;&nbsp;
        <span style="font-size:12px; font-weight: 100; color:rgb(127, 129, 129);">504개</span> <br><br>
        <i class="fa-solid fa-location-dot" style="color:green;"></i>
        <span style="font-size:13px; font-weight: bold;">서울 중구 을지로 30</span>

        <br><br>

        <div class="explain-text">
            <p>
                롯데호텔은 서울,월드,울산,제주,부산을 잇는 국내 최대의 특 1급
                호텔체인과 마포, 김포공항의 비즈니스 호텔, <br>
                나아가 러시아 모스크바에 6성급 호텔을
                오픈하며 글로벌 리딩 호텔&리조트 기업으로 발돋움하고 있습니다. <br><br>
                세련되고 모던한 감각, <br>
                편안하고 안락한 객실과 세심한 배려가 묻어나는 서비스가 있습니다.
            </p>
        </div>

        <br><br>

        <div class = "bottom" style="width:100%">
            <fieldset id = "mForm">
                <div class = "selectTitle">
                    <button type="button" class="btn-div" id = "n" name="search" onclick="show(this);">놀거리</button>
                    <button type="button" class="btn-div" id = "m" name="search" onclick="show(this);">맛집</button>
                    <button type="button" class="btn-div" id = "s" name="search" onclick="show(this);">숙소</button>
    
                    <div id = "nsearch" class = "box" style="border:1px solid black; padding:20px; text-align: center;">

                        <div class="img-container">
                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/롯데호텔.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>
                            
                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/롯데호텔2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">KH호텔</div>
                                </div>
                            </div>

                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">시나브로호텔</div>
                                </div>
                            </div>

                            <div style="margin-left:15%;">
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/gyeongju.jpg" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">구름호텔</div>
                                </div>
                            </div>

                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/gangnam.jpg" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">돈가스호텔</div>
                                </div>
                            </div>
                    
                        </div>

                    </div>
                



                    <div id = "msearch" class = "box box2"  style="border:1px solid black; padding:20px;"> 
                        <div class="img-container">
                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>
                            
                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div style="margin-left:15%;">
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>
                    
                        </div>

                    
                    </div>
                




                    <div id = "ssearch" class = "box box2" style="border:1px solid black; padding:20px;">
                        <div class="img-container">
                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image1.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>
                            
                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image1.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image1.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div style="margin-left:15%;">
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image1.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image1.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>
                    
                        </div>

                    </div>
                </div>
            </fieldset>
        </div>
        
    </div>

    <script>
        function show(element){
            let tag = document.getElementsByClassName("box");

            for(let i=0; i<tag.length; i++){
                if(element.id+"search" == tag[i].id){
                    tag[i].style.display = "block";
                }else{
                    tag[i].style.display = "none";
                }
            }
        }
        
    </script>


    
</body>
</html>