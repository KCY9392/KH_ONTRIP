<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();

	String placeCode = String.valueOf(request.getAttribute("placeCode"));
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 - 시설 등록 화면</title>
    <link href="<%= contextPath %>/resources/css/manager_placeInsert.css" rel="stylesheet" >
 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c46a61fbdf9ee1c5956f08d7c2deaf8&libraries=services"></script>
    <style>
       
       select{
          border:2px solid rgb(239, 243, 138);
          border-radius: 10px;
          padding:5px;
       }
       select:focus{
          border:1px solid green;
          box-sizing: border-box;
          border-radius: 10px;
          outline: 3px solid yellowgreen;
          border-radius: 10px;
       }
       input{
          border:none;
          border-bottom:1px solid gray;
       }
       span{
          font-weight:bold;
          font-size:18px;
          color:rgb(2, 148, 12);
       }
       .input-box input{
          border:none;
          border-bottom:1px solid gray;
       }
       input[name=placeName]{
          height:40px;
       }
       input:focus{
          height:25px;
          outline:none;
          border-color:lightgrey;
          box-shadow:0 0 5px grey;
       }
       .container-div{
          border:none;
          box-shadow:0 0 5px grey;
       }
    </style>
</head>
<body>
    <%@ include file="../common/adnavbar.jsp" %>        
    <%@ include file="../common/managerNavbar.jsp" %> 

        <br><br><br><br>
     
   <form method="post" action="<%= request.getContextPath()%>/PlaceInsert.mn?placeCode=<%= placeCode %>">
         
      
         <div class="container-div">
            <span style="font-size:20px;">시설이름 : &nbsp;</span>
            <input type="text" name="placeName" placeholder="시설이름을 입력하세요."> <br><br>

      <select name="category" id="category" style="width:150px; height:40px; float:left; margin-top:-60px;" required>  
                <option value="PP">놀거리</option>
                <option value="HH">맛집</option>
                <option value="FF">숙소</option>
        </select>
            
            <span style="color:black; font-size:17px;">작성자 : admin</span> <br><br>

            <div style="font-size:20px; padding:10px;">
            <span style="color:grey;">대표지역</span>
            <span style="margin-left:70px; color:grey;">세부지역</span><br>
            </div>

            <select onchange="addressKindChange(this);" name="addressKind" id="addressKind" style="width:150px; height:50px;" required>  
                <option value="L1">서울</option>
                <option value="L3">제주도</option>
                <option value="L2">경기도</option>
                <option value="L4">강원도</option>
                <option value="L5">충청도</option>
                <option value="L6">전라도</option>
                <option value="L7">경상도</option>
            </select>
            <select name="addressDetailKind" id="addressDetailKind" style="width:150px; height:50px;" required> 
                <option>선택해주세요.</option>
                <option>종로</option>
                <option>용산</option>
                <option>강남</option>
            </select>
            
            <br><br>

         <div class="input-box">
               <span>대표자 : &nbsp;</span>
               <input type="text" name="placeBName" required> <br><br>
               <span>주소 : &nbsp;</span>
               <input type="text" name="areaAddress" required> <br><br>
               <span>전화번호 : &nbsp;</span>
               <input type="text" name="telephone" required> <br><br>
               <br>
               <span>위도 : &nbsp;</span>
               <input type="text" name="latitude" required> <br><br>
               <span>경도 : &nbsp;</span>
               <input type="text" name="longitude" required> <br><br>
   			   <span>주소 : &nbsp;</span>
               <input type="text" name="detailAddress" id="address">
               <button type="button" id="searchBtn">검색</button>
               <div id="map" style="width:100%;height:350px;"></div>
	   
               <span>내용</span> <br>
               <textarea name="content" cols="50" rows="5" required>
               </textarea>
            </div>
            <br><br>
            
      <button type="submit" style="border:none; width:150px; height:50px; background-color:bisque; font-weight:900; font-size:15px; border-radius:5px;">등록</button>
        </form>
       </div> 


            <script>
                var submit = document.getElementById('submitButton');
                // submit.onclick = showImage;    

                

                function addressKindChange(e) {
                    let default_option = "선택해주세요";
                    let seoul = ["종로", "용산", "강남"];
                    let jeju = ["서부", "동부", "서귀포"];
                    let gyeonggi = ["포천", "파주", "용인"];
                    let gangwon = ["강릉", "속초", "평창"];
                    let chung = ["아산", "예산", "천안"];
                    let junla = ["전주", "순천", "여수"];
                    let gyeongsang = ["부산", "대구", "경주"];
                    let target = document.getElementById('addressDetailKind');
                    let d;
                    if(e.value == "L1") {
                         d = seoul;
                    } else if(e.value == "L3"){
                         d = jeju;
                    } else if(e.value == "L2"){
                         d = gyeonggi;
                    } else if(e.value == "L4"){
                         d = gangwon;
                    } else if(e.value == "L5"){
                        d = chung;
                    } else if(e.value == "L6"){
                         d = junla;
                    } else if(e.value == "L7"){
                        d = gyeongsang;
                    }
                    d.unshift(default_option);
                    target.options.length = 0;

                    for(x in d) {
                        let opt = document.createElement('option');
                        opt.value = d[x];
                        opt.innerHTML = d[x];
                        target.appendChild(opt);
                    }
                }
            </script>  
            
            <!-- 카카오 맵 api -->
         <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = { 
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };
            
               // 지도를 생성합니다    
               var map = new kakao.maps.Map(mapContainer, mapOption); 

            

         $('#searchBtn').click(function(){
               // 버튼을 click했을때
               
               
               // 주소-좌표 변환 객체를 생성합니다
               var geocoder = new kakao.maps.services.Geocoder();
               
               // 주소로 좌표를 검색합니다
               geocoder.addressSearch($('#address').val(), function(result, status) {
            
                   // 정상적으로 검색이 완료됐으면 
                    if (status === kakao.maps.services.Status.OK) {
                       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                       
                       // 추출한 좌표를 통해 도로명 주소 추출
                       let lat = result[0].y;
                       let lng = result[0].x;
                       getAddr(lat,lng);
                       function getAddr(lat,lng){
                           let geocoder = new kakao.maps.services.Geocoder();
            
                           let coord = new kakao.maps.LatLng(lat, lng);
                           let callback = function(result, status) {
                               if (status === kakao.maps.services.Status.OK) {
                                  // 추출한 도로명 주소를 해당 input의 value값으로 적용
                                   $('#address').val(result[0].road_address.address_name);
                               }
                           }
                           geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
                       }
                       
                       // 결과값으로 받은 위치를 마커로 표시합니다
                       var marker = new kakao.maps.Marker({
                           map: map,
                           position: coords
                       });
         
            
                       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                       map.setCenter(coords);
                   } 
               });  
               // 지도를 클릭한 위치에 표출할 마커입니다
               var marker = new kakao.maps.Marker({ 
                   // 지도 중심좌표에 마커를 생성합니다 
                   position: map.getCenter() 
               }); 
               // 지도에 마커를 표시합니다
               marker.setMap(map);
               
               // 지도에 클릭 이벤트를 등록합니다
               // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
               kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
                   
                   // 클릭한 위도, 경도 정보를 가져옵니다 
                   var latlng = mouseEvent.latLng; 
                   
                   // 마커 위치를 클릭한 위치로 옮깁니다
                   marker.setPosition(latlng);
                   
                   var Lat = latlng.getLat(); //위도
                   var Lng = latlng.getLat();//경도
                   
                   
                   document.getElementsByName("latitude")[0].value = latlng.getLat();
                   document.getElementsByName("longitude")[0].value = latlng.getLng();
                   
               });
            });
            </script>

            
</body>
</html>