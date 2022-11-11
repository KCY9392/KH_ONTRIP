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
    <title>온트립(OnTrip) - 즐길거리</title>

    <link href="<%= contextPath %>/resources/css/clickHotel.css" rel="stylesheet" >
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
            <b style="margin-left: 66px;">O O 놀거리</b> &nbsp;&nbsp;
            <b>잠실 롯데월드</b> &nbsp;&nbsp;
            
            <button style="background-color: rgb(44, 144, 72); border-radius:10px; border:3px solid rgb(44, 144, 72); ">
                <i class="fa-regular fa-heart fa-lg"></i>
            </button> &nbsp;&nbsp;
            
        </div>

        <br><br>

        <div class="img-hotel">
            <img src="../image/롯데월드.jpg" alt=""> <!-- 해당 사진 1-->
            <img src="../image/롯데월드2.jpg" alt=""> <!-- 해당 사진 2-->
            <!-- 지도를 표시할 div -->
        <div id="map" style="width:100%;height:350px;"></div>

        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c46a61fbdf9ee1c5956f08d7c2deaf8"></script>
        <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = { 
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
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
                성인 종일(종합이용권) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                62,000원 <br>
                청소년 종일(종합이용권) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                54,000원 <br>
                어린이 종일(종합이용권) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                47,000원 <br>
                베이비 종일(종합이용권) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                15,000원 <br>
                성인 After4(종합이용권) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                50,000원 <br>
                청소년 After4(종합이용권) &nbsp;&nbsp;&nbsp;&nbsp;
                43,000원 <br>
                어린이 After4(종합이용권) &nbsp;&nbsp;&nbsp;&nbsp;
                36,000원 <br>
                베이비 After4(종합이용권) &nbsp;&nbsp;&nbsp;&nbsp;
                15,000원 <br>
                성인 종일(파크이용권) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                59,000원 <br>
                청소년 종일(파크이용권) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                52,000원
            </p>
        </div>

        <br><br>

        <div class = "bottom" style="width:100%">
            <fieldset id = "mForm">
                <div class = "selectTitle">
                    <button type="button" class="btn-div" id = "n" name="search" onclick="show(this);">놀거리</button>
                    <button type="button" class="btn-div" id = "m" name="search" onclick="show(this);">맛집</button>
                    <button type="button" class="btn-div" id = "s" name="search" onclick="show(this);">숙소</button>
    
                    <div id = "nsearch" class = "box" style="border:1px solid black; padding:20px;">

                        
                        <div>
                            <img src = "../image/image2.png" width = "200px" height = "180px" style="border-radius:20px;"> 
                        </div>
                        
                        <div>
                            <p>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                            </p>
                            
                        </div>
                        
                        <div>
                            <img src = "../image/image3.png" width = "200px" height = "180px" style="border-radius:20px;">
                        </div>
                        
                        <div>
                            <p>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br> 
                            </p>
                            
                        </div>

                        <div>
                            <img src = "../image/image1.png" width = "200px" height = "180px" style="border-radius:20px;">
                        </div>
                        
                        <div>
                            <p>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                            </p>
                        </div>
                    </div>
                



                    <div id = "msearch" class = "box"  style="border:1px solid black; padding:20px;"> 
                        <div>
                            <img src = "../image/image3.png" width = "200px" height = "180px" style="border-radius:20px;"> 
                        </div>
                        
                        <div>
                            <p>
                                안녕하세요 김채영입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 김채영입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 김채영입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 김채영입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 김채영입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 김채영입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 김채영입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 김채영입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                            </p>
                            
                        </div>
                        
                        <div>
                            <img src = "../image/image1.png" width = "200px" height = "180px" style="border-radius:20px;">
                        </div>
                        
                        <div>
                            <p>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br> 
                            </p>
                            
                        </div>

                        <div>
                            <img src = "../image/image2.png" width = "200px" height = "180px" style="border-radius:20px;">
                        </div>
                        
                        <div>
                            <p>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                            </p>
                        </div>

                    </div>
                    </div>
                




                    <div id = "ssearch" class = "box" style="border:1px solid black; padding:20px;">
                        <div>
                            <img src = "../image/image1.png" width = "200px" height = "180px" style="border-radius:20px;"> 
                        </div>
                        
                        <div>
                            <p>
                                안녕하세요 조성우입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 조성우입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 조성우입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 조성우입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 조성우입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 조성우입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 조성우입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 조성우입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                            </p>
                            
                        </div>
                        
                        <div>
                            <img src = "../image/image2.png" width = "200px" height = "180px" style="border-radius:20px;">
                        </div>
                        
                        <div>
                            <p>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br> 
                            </p>
                            
                        </div>

                        <div>
                            <img src = "../image/image3.png" width = "200px" height = "180px" style="border-radius:20px;">
                        </div>
                        
                        <div>
                            <p>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                                안녕하세요 황종수입니다.안녕하세요 황종수입니다.안녕하세요 황종수입니다.<br>
                            </p>
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