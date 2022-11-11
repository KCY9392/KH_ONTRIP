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
    <title>온트립(OnTrip) - 맛집</title>

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
            <b style="margin-left: 66px;">O O 맛집</b> &nbsp;&nbsp;
            <b>목멱산방</b> &nbsp;&nbsp;
            
            <button style="background-color: rgb(44, 144, 72); border-radius:10px; border:3px solid rgb(44, 144, 72); ">
                <i class="fa-regular fa-heart fa-lg"></i>
            </button> &nbsp;&nbsp;
            
        </div>

        <br><br>

        <div class="img-hotel">
            <img src="../image/목멱산방.jpg" alt=""> <!-- 해당 사진 1-->
            <img src="../image/목멱산방4.jpg" alt=""> <!-- 해당 사진 2-->
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
        <span style="font-size:13px; font-weight: bold;">서울 중구 퇴계로 20길 71 1층 목멱산방</span>

        <br><br>

        <div class="explain-text">
            <p>
                목멱산방은 세 가지 가치를 가집니다. <br><br>
                1. 고객에게 선물이 되는 브랜드 <br>
                2. 직원들에게 선물이 될 만한 일터 <br>
                3. 지구에 선물이 될 만한 친환경적인 식자재 사용의 신념 <br><br>
                우리는 대한민국 비빔밥의 기준 목멱산방입니다.
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