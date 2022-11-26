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
   	
  	//해시 태그 가져오기 
  	String value = (String) request.getAttribute("value");

  	// 로그아웃시 사용자의 찜하기 기록을 유지하기위한 객체
  	Heart ht = (Heart) request.getAttribute("ht");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <title>온트립(OnTrip) - 맛집</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/clickHotel.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
    <!-- 소스 다운 -->
   <script src="https://unpkg.com/@yaireo/tagify"></script>
   <!-- 폴리필 (구버젼 브라우저 지원) -->
   <script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
   <link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
    <!-- animate.style -->
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />

	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Noto+Sans+KR&display=swap" rel="stylesheet">    
   
    
<style>
.outer7{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 950px;
        height: 200px;
        border: 1px solid rgb(167, 166, 166);
        margin: auto;
        margin-top: 10px;
        margin-left: -30px;
        display:flex;
    }
	.outer8 {
	   width: 40%;
	   height: 100%;
	   border-right: 1px solid rgb(167, 166, 166);
	}
	
	.outer10{
	   width: 65%;
	   height: 100%;
	}
	.outer11{
	   margin-top: 50px;
	}
	
	.outer7.shadow-lg :hover{
	   background-color: rgb(207, 206, 206);
	   cursor : pointer;
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
       	  font-family: 'Noto Sans KR', sans-serif !important;
       	  font-size: small;
       	  font-weight:600;
       	  background-color:rgb(250, 250, 250);
       	  padding:20px;
       	  border-radius:10px;
       }
       .btn-div{
      background-color: lightgrey;
      font-size:15px;
      box-shadow : 0 0 3px;
      border-radius: 10px;
      border:none;
       font-weight: 500;
       background-color:rgb(249, 249, 249);
       font-family: 'Gugi', cursive;
   }
   .btn-div:hover{
      background-color:white;

   }
   #n, #m, #s {
   width: 315px;
   height: 53px;
}
.tagify{    
  border:none;
  max-width: 190px;
  height:50px;
  font-size: 15px;
  font-weight: bold;
}
</style>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    
     <br><br><br>

    <div class="body-container">

        <div class="title-container" style="text-align:center;">
            <b><%= dareaName %>맛집</b> &nbsp;&nbsp;
            <b style="margin-right: 90px;"><%= placeName %></b> &nbsp;&nbsp;
            
          <button  type="submit" class="heart <% if(ht != null){ %> done<% } %>" style="border: 0; width: 30px; height: 30px;">❤️</button> &nbsp;&nbsp;
            
        </div>
        <br>
        <div style="float:right; margin-right:15px;">
            <a href="<%=request.getContextPath()%>/review.re?placeName=<%=placeName %>&memberNo=<%=loginUser.getMemberNo()%>&placeCode=<%=placeCode%>" class="review">
            <button class="btn-review2" style="font-weight: bold; color:blueviolet; background-color: cornsilk; border-radius:10px; border:3px solid rgb(44, 144, 72); ">이용후기 보러가기</button>
            </a>
        </div>
		<br>
		<div style="text-align:center; margin-left:200px">
        <input name='tags' readonly value="<%=value%>">
        </div>

        <div class="img-hotel">
            <% if (!placeImages.isEmpty()) { %>
               <% for (int i = 0; i < placeImages.size(); i++) { %>
            	<img src="<%= request.getContextPath() %>/<%=placeImages.get(i).getFilePath()+placeImages.get(i).getChangeName() %>" alt="">       
            <% } %>
            <% } %>
		
        <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = { 
                    center: new kakao.maps.LatLng(<%= place.getPlcLa() %>, <%= place.getPlcLo() %>), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            // 지도를 표시할 div와  지도 옵션으로  지도를 생성
            var map = new kakao.maps.Map(mapContainer, mapOption); 
        </script> 
        </div>

        <br><br>

        <i class="fa-solid fa-location-dot" style="color:green;"></i>
        <span style="font-size:15px; font-weight: bold;"><%= place.getPlcAddress() %></span>
		
		<br><br>
            <!-- 지도를 표시할 div -->
        <div id="map" style="width:50%;height:350px; margin:auto;"></div>
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
                        	<div class="outer7 shadow-lg" onclick="movePlay('<%= playInfo.get(i).getPlcName() %>','<%= dareaName%>', '<%= loginUser.getMemberNo() %>')">
                                <div class="outer8">
                                        <img src="<%= request.getContextPath() %>/<%=playPath.get(i).getFilePath()+playPath.get(i).getChangeName() %>" width = "100%" height = "198px"> 
                                </div>
                                <div class="outer10">
                                    <div class="outer11">
                                    <span style="border: 0; font-size: 20px; font-weight: bold;"><%=playInfo.get(i).getPlcName() %></span><br><br>
                                    <span style="font-size: 15px;"><%=playInfo.get(i).getPlcAddress() %><br><%=playInfo.get(i).getPlcPnumber() %></span>
                                    </div>
                                </div>
                            </div> 
                           	<%} %>
                        	<%} %>
                      </div>




            <div id="msearch" class="box box2" style="padding: 20px; text-align: center;"">
               <% if (!foodPath.isEmpty()) { %> 
               <%  for (int i = 0; i < foodPath.size(); i++) { %> 
              <div class="outer7 shadow-lg" onclick="moveFood('<%= foodInfo.get(i).getPlcName() %>','<%= dareaName%>', '<%= loginUser.getMemberNo() %>')">
                <div class="outer8">
                        <img src="<%= request.getContextPath() %>/<%=foodPath.get(i).getFilePath()+foodPath.get(i).getChangeName() %>" width = "100%" height = "198px"> 
                </div>
                <div class="outer10">
                    <div class="outer11">
                    <span style="border: 0; font-size: 20px; font-weight: bold;"><%=foodInfo.get(i).getPlcName() %></span><br><br>
                    <span style="font-size: 15px;"><%=foodInfo.get(i).getPlcAddress() %><br><%=foodInfo.get(i).getPlcPnumber() %></span>
                    </div>
                </div>
            </div> 
               <% } %> 
               <% } %> 
            </div>



            <div id = "ssearch" class = "box box2" style=" padding:20px; text-align: center;"">
               <%  if (!hotelPath.isEmpty()) { %>
               <%  for (int i = 0; i < hotelPath.size(); i++) { %>
               <div class="outer7 shadow-lg" onclick="moveHotel('<%= hotelInfo.get(i).getPlcName() %>','<%= dareaName%>', '<%= loginUser.getMemberNo() %>')">
	                <div class="outer8">
	                        <img src="<%= request.getContextPath() %>/<%=hotelPath.get(i).getFilePath()+hotelPath.get(i).getChangeName() %>" width = "100%" height = "198px"> 
	                </div>
	                <div class="outer10">
	                    <div class="outer11">
	                    <span style="border: 0; font-size: 20px; font-weight: bold;"><%=hotelInfo.get(i).getPlcName() %></span><br><br>
	                    <span style="font-size: 15px;"><%=hotelInfo.get(i).getPlcAddress() %><br><%=hotelInfo.get(i).getPlcPnumber() %></span>
	                    </div>
	                </div>
	            </div> 

               <% } %>
               <% } %>
            </div>
            </fieldset>
        </div>
        
    <script>
        function show(element){
            let tag = document.getElementsByClassName("box");

            for(let i=0; i<tag.length; i++){
                if(element.id+"search" == tag[i].id){
                    tag[i].style.display = "block";
                    tag[i].style.animation = "fadeIn";
                    tag[i].style.animationDuration = "1s";
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
             <script>
             var input = document.querySelector('input[name=tags]')
             new Tagify(input)
         	</script>
             
</body>
</html>