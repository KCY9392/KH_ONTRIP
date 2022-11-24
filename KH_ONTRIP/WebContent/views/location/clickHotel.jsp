<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.ontrip.place.model.vo.Place,
    com.ontrip.image.vo.Image, com.ontrip.heart.vo.Heart"%>
<%
    String contextPath = request.getContextPath();

   //시설 정보 띄우기
   Place place = (Place)request.getAttribute("place");
   String placeName = (String)request.getAttribute("placeName");
   
   //상세지역이름
   String dareaName = (String)request.getAttribute("dareaName");
   
   //시설사진띄우기
   ArrayList<Image> placeImages = (ArrayList<Image>)request.getAttribute("placeImages");
   
   //시설코드 넘기기
   String placeCode = (String)request.getAttribute("placeCode");
   
   //밑에 놀거리, 숙소, 맛집 버튼별 사진나오게하기
   ArrayList<Image> filePath = (ArrayList<Image>)request.getAttribute("filePath");
      ArrayList<Image> playPath = (ArrayList<Image>)request.getAttribute("playPath");
      ArrayList<Place> playInfo = (ArrayList<Place>)request.getAttribute("playInfo");
    ArrayList<Image> foodPath = (ArrayList<Image>)request.getAttribute("foodPath");
   ArrayList<Place> foodInfo = (ArrayList<Place>)request.getAttribute("foodInfo");
      ArrayList<Image> hotelPath = (ArrayList<Image>)request.getAttribute("hotelPath");
      ArrayList<Place> hotelInfo = (ArrayList<Place>)request.getAttribute("hotelInfo");
      
      Heart ht = (Heart)request.getAttribute("ht");
      
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
    
    
<style>
.outer7{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 950px;
        height: 200px;
        border: 1px solid black;
        margin: auto;
        margin-top: 10px;
        margin-left: -30px;
        display:flex;
    }
    .outer8{
        width: 35%;
        height: 100%;
        border: 1px solid blue;
    }
    .outer9{
        width: 70%;
        height: 100%;
        /* border: 1px solid red; */
    }
    .title-container>button:nth-child(3){
    border:none;
    background-color: rgb(92, 92, 237);
    color:white;
    border-radius: 10px;
    height:35px;
    margin-right:100px;
}
   .heart {
            color: transparent;
            text-shadow: 0 0 2px rgb(255, 255, 255), 0 0 0 #000;
            display: flex;
            flex-direction: row-reverse;
            font-size: 2.5rem;
            line-height: 2.5rem;
            justify-content: space-around;
            padding: 0 0.2em;
            float: right;
            margin-right: 100px;
            width: 5em;
            background-color: white;
        }
        .heart.done {
          color: inherit;
          text-shadow: 0;
        }
        pre{
       	  overflow: auto;
       	  white-space: pre-wrap;
       	  font-family: Verdana, Arial, Helvetica, sans-serif;
       	  font-size: small;
       }
       
</style>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    
     <br><br><br><br>

    <div class="body-container">

        <div class="title-container">
            <b><%= dareaName %>숙소</b> &nbsp;&nbsp;
            <b><%= placeName %></b> &nbsp;&nbsp;
            
            <button onclick="Goreservation();">예약하러가기</button>
            <button  type="submit" class="heart <% if(ht != null){ %> done<% } %>" style="border: 0; width: 30px; height: 35px; text-align:right;">❤️</button> &nbsp;&nbsp;

        </div>
        <br>
        <div style="float:right; margin-right:15px;">
            <a href="<%=request.getContextPath()%>/review.re?placeName=<%=placeName %>&memberNo=<%=loginUser.getMemberNo()%>&placeCode=<%=placeCode%>" class="review">
            <button class="btn-review2" style="font-weight: bold; color:blueviolet; background-color: cornsilk; border-radius:10px; border:3px solid rgb(44, 144, 72); ">이용후기 보러가기</button>
            </a>
        </div>

        <br><br>

        <div class="img-hotel">
           <%
                  if (!placeImages.isEmpty()) {
               %>
               <%
                  for (int i = 0; i < placeImages.size(); i++) {
               %>
               <img src="<%= request.getContextPath() %>/<%=placeImages.get(i).getFilePath()+placeImages.get(i).getChangeName() %>" >
            <% } %>
            <% } %>

       
        </div>

        <br>

        <i class="fa-solid fa-location-dot" style="color:green;"></i>
        <span style="font-size:13px; font-weight: bold;"><%= place.getPlcAddress() %></span>

            <!-- 지도를 표시할 div -->
        <div id="map" style="width:50%;height:350px; margin-left:380px;"></div>
        <br><br>

        <div class="explain-text">
            <pre>
<%= place.getPlcText() %>
            </pre>
        </div>

        <br><br>

        <div class = "bottom" style="width:100%">
            <fieldset id = "mForm" class="myweb">
                <div class = "selectTitle">
                    <button type="button" class="btn-div" id = "n" name="search" onclick="show(this);">놀거리</button>
                    <button type="button" class="btn-div" id = "m" name="search" onclick="show(this);">맛집</button>
                    <button type="button" class="btn-div" id = "s" name="search" onclick="show(this);">숙소</button>
    
                     <div id = "nsearch" class = "box" style="padding:20px; text-align: center;">  <!-- border:1px solid black; -->
            <% if(!playPath.isEmpty()) { %>
                         <% for(int i=0; i<playPath.size(); i++){ %>
                        <div class="outer7" onclick="movePlay('<%= playInfo.get(i).getPlcName() %>','<%= dareaName%>', '<%= loginUser.getMemberNo() %>')">
                            <div class="outer8">
                                <div class="outer9" style="width:270px; height:270px;">
                                    <img src="<%= request.getContextPath() %>/<%=playPath.get(i).getFilePath()+playPath.get(i).getChangeName() %>" width = "122%" height = "198px"> 
                                </div>
                            </div>
                          
                            <div style="font-size:20px; font-weight:bold; margin-left: 25%; margin-top: 20px;"><input type="button" onclick="<%=playInfo.get(i).getPlcName() %>();" value="<%=playInfo.get(i).getPlcName() %>" style="border: 0; background-color: white; font-weight: bold;"></div>
                               <div style="text-align:center; margin: 70px; margin-left: -130px">
                                  <span><%=playInfo.get(i).getPlcAddress() %></span><br>
                                  <span><%=playInfo.get(i).getPlcPnumber() %></span>
                               </div>
                        </div> 
                           <%} %>
                        <%} %>
                      </div>




            <div id="msearch" class="box box2" style="padding: 20px;">
               <%
                   if (!foodPath.isEmpty()) {
                %>
            <% 
                  for (int i = 0; i < foodPath.size(); i++) { 
               %> 
               <div class="outer7" onclick="moveFood('<%= foodInfo.get(i).getPlcName() %>','<%= dareaName%>', '<%= loginUser.getMemberNo() %>')">
                  <div class="outer8">
                     <div class="outer9" style="width: 270px; height: 270px;">
                        <img
                          src="<%= request.getContextPath() %>/<%=foodPath.get(i).getFilePath()+foodPath.get(i).getChangeName() %>" 
                           width="122%" height="198px">
                     </div>
                  </div>

                  <div
                     style="font-size: 20px; font-weight: bold; margin-left: 25%; margin-top: 20px;">
                     <input type="button"
                       onclick="<%=foodInfo.get(i).getPlcName()%>();" 
                       value="<%=foodInfo.get(i).getPlcName()%>" 
                        style="border: 0; background-color: white; font-weight: bold;">
                  </div>
                  <div style="text-align: center; margin: 70px; margin-left: -130px">
                     <span><%=foodInfo.get(i).getPlcAddress()%></span><br> <span><%=foodInfo.get(i).getPlcPnumber()%></span> 
                  </div>
               </div>
               <%
                    }
              %> 
                <% 
                  } 
               %> 
            </div>





            <div id = "ssearch" class = "box box2" style=" padding:20px;">
                       <%
                  if (!hotelPath.isEmpty()) {
               %>
               <%
                  for (int i = 0; i < hotelPath.size(); i++) {
               %>
               <div class="outer7" onclick="moveHotel('<%= hotelInfo.get(i).getPlcName() %>','<%= dareaName%>', '<%= loginUser.getMemberNo() %>')">
                  <div class="outer8">
                     <div class="outer9" style="width: 270px; height: 270px;">
                        <img
                           src="<%= request.getContextPath() %>/<%=hotelPath.get(i).getFilePath()+hotelPath.get(i).getChangeName() %>"
                           width="122%" height="198px">
                     </div>
                  </div>

                  <div style="font-size:20px; font-weight:bold; margin-left: 25%; margin-top: 20px;"><input type="button" onclick="<%=hotelInfo.get(i).getPlcName() %>();" value="<%=hotelInfo.get(i).getPlcName() %>" style="border: 0; background-color: white; font-weight: bold;"></div>
                               <div style="text-align:center; margin: 70px; margin-left: -130px">
                                  <span><%=hotelInfo.get(i).getPlcAddress() %></span><br>
                                  <span><%=hotelInfo.get(i).getPlcPnumber() %></span>
                               </div>
                        </div> 
               <%
                  }
               %>
               <%
                  }
               %>
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
   <script>
   function movePlay(placeName, dareaName, memberNo){
		location.href= "<%=request.getContextPath()%>"+"/selectPlay.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
	}
	
	function moveFood(placeName, dareaName, memberNo){
		location.href= "<%=request.getContextPath()%>"+"/selectFood.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
	}
	
	function moveHotel(placeName, dareaName, memberNo){
		location.href= "<%=request.getContextPath()%>"+"/selectHotel.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
	}
    </script>
    
    
    <script>
       function Goreservation(){
          location.href = "/KH_ONTRIP/reservation/saveform?memNo=<%= loginUser.getMemberNo() %>&plcCode=<%= placeCode %>";
       }
    
    </script>
    <script>
       $(function(){

         $(".heart").click(function(){
            if(this.classList.contains('done')){
               $.ajax({
                  url : "deleteHeart.ht",
                  data : {
                     memNo : <%= loginUser.getMemberNo() %>,
                     plcCode : <%= placeCode %>
                     },
                  type : "post",
                  success : function(result){// 익명함수, 매개변수로 서블릿으로부터 전달받은 값
                     console.log(result);
                     $(".heart done").text(result);
                     $('.heart').toggleClass("done");
                  },
                  error : function(){
                     console.log("ajax통신 실패!");
                  }
               })
            }else{
               $.ajax({
                  url : "insertHeart.ht",
                  data : {
                     memNo : <%= loginUser.getMemberNo() %>,
                     plcCode : <%= placeCode %>
                     },
                  type : "post",
                  success : function(result){// 익명함수, 매개변수로 서블릿으로부터 전달받은 값
                     console.log(result);
                     $(".heart done").text(result);
                     $(".heart").toggleClass("done");
                  },
                  error : function(){
                     console.log("ajax통신 실패!");
                  }
               })
            }
         });
      })
   </script>
   
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c46a61fbdf9ee1c5956f08d7c2deaf8"></script>
        <script>
           var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
               mapOption = { 
                   center: new kakao.maps.LatLng(${place.plcLa}, ${place.plcLo}), // 지도의 중심좌표
                   level: 3 // 지도의 확대 레벨
               };
           
              // 지도를 생성합니다    
              var map = new kakao.maps.Map(mapContainer, mapOption);
              
           // 마커가 표시될 위치입니다 
              var markerPosition  = new kakao.maps.LatLng(${place.plcLa}, ${place.plcLo}); 

              // 마커를 생성합니다
              var marker = new kakao.maps.Marker({
                  position: markerPosition
              });

              // 마커가 지도 위에 표시되도록 설정합니다
              marker.setMap(map);
            </script>
</body>
</html>