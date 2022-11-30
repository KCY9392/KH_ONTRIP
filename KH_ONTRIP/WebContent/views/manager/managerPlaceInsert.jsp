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
    <!-- 소스 다운 -->
   <script src="https://unpkg.com/@yaireo/tagify"></script>
   <!-- 폴리필 (구버젼 브라우저 지원) -->
   <script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
   <link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
    <link href="<%= contextPath %>/resources/css/manager_placeInsert.css" rel="stylesheet" >
 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c46a61fbdf9ee1c5956f08d7c2deaf8&libraries=services"></script>
     <!-- 소스 다운 -->
    <script src="https://unpkg.com/@yaireo/tagify"></script>
    <!-- 폴리필 (구버젼 브라우저 지원) -->
    <script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
    <link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

    <style>
       select{
          border:0;
       }
       select:focus{
          border:1px solid green;
          box-sizing: border-box;
          /* border-radius: 10px; */
          outline: 1px solid yellowgreen;
/*           border-radius: 10px; */
       }
       input{
          border:none;
          /* border-bottom:1px solid gray; */
       }
       span{
          font-weight:bold;
          font-size:20px;
          color:black; /* rgb(2, 148, 12) */
       }
       .input-box input{
          border:none;
          /* border-bottom:1px solid gray; */
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
          height:1400px;
       }
       .place-image{
        width: 100%;
       }
       .btn2:hover{
        color:#6098FF;  
       }
       .btn2:hover::before{
        opacity: 1;
        background-color: #fff;
        -webkit-transform: scaleY(1);
        transform: scaleY(1);
        transition: -webkit-transform .6s cubic-bezier(.08, .35, .13, 1.02), opacity .4s;
        transition: transform .6s cubic-bezier(.08, .35, .13, 1.02), opacity
      }
      input::placeholder {color:rgba(176, 173, 173, 0.71);}
      #searchBtn:hover{transform: scale(.9);}
      .tagify{    
		  border:none;
		}
    </style>
</head>
<body>
    <%@ include file="../common/adnavbar.jsp" %>        
<br><br><br><br><br><br>

        <div class="container-div" style="margin:auto;">
            <form method="post" action="<%= request.getContextPath()%>/PlaceInsert.mn?placeCode=<%= placeCode %>">
                
            <br>
            <div style="border: 1px solid white; height: 50px;" class="shadow-lg">
               <table>
                    <tr>
                        <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시설이름 :&nbsp;&nbsp; &nbsp;<strong><input type="text" name="placeName" style="font-weight:bold; background: transparent; width: 400px;" placeholder="등록하실 시설 이름을 입력해주세요 ✎"></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td style="font-size: 25px; float: left;">
                            <strong>
                                <select name="category" id="category" style="width:150px; height:40px; float:left; font-weight:bold;" required>  
                                    <option value="PP">&nbsp;&nbsp;&nbsp;놀거리</option>
                                    <option value="FF">&nbsp;&nbsp;&nbsp;맛집</option>
                                    <option value="HH">&nbsp;&nbsp;&nbsp;숙소</option>
                                </select>
                            </strong>
                        </td>
                    </tr>
               </table> 
            </div>
            <br>
            <div class="place-image shadow-lg" style="border: 1px solid white; height: 27%;">
                <table>
                    <tr>
                        <td>
                            <span style="color:black; font-size:25px;">&nbsp;&nbsp;&nbsp;작성자 : admin</span> <br>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- <span style="color:black; font-size:17px;">작성자 : admin</span> <br><br> -->
            <br>
            <div style="font-size:20px; border: 1px solid white; background-color: rgb(190, 244, 215);" class="shadow-lg">
                <span style="color:grey; text-align: center; font-size: 25px;">대표지역 : 
                    <select onchange="addressKindChange(this);" name="addressKind" id="addressKind" style="width:250px; height:50px; font-weight:bold; background: transparent;" required>  
                        <option value="L1">서울</option>
                        <option value="L3">제주도</option>
                        <option value="L2">경기도</option>
                        <option value="L4">강원도</option>
                        <option value="L5">충청도</option>
                        <option value="L6">전라도</option>
                        <option value="L7">경상도</option>
                    </select>
                </span>
                <span style="margin-left:70px; color:grey; font-size: 25px;">세부지역 : 
                    <select name="addressDetailKind" id="addressDetailKind" style="width:250px; height:50px; font-weight:bold; background: transparent;" required> 
                        <option>선택해주세요.</option>
                        <option>종로</option>
                        <option>용산</option>
                        <option>강남</option>
                    </select>
                </span><br>
            </div>
            
            <!-- <div style="font-size:20px; padding:10px; border: 1px solid white;" class="shadow-lg">
            <span style="font-size:20px; margin-left: -10px;">${place.localName}</span>&nbsp;
            <span style="margin-left:97px; font-size:20px;">${place.dareaName}</span>
            </div> -->
            <br>

         <div class="input-box shadow-lg" style="border: 1px solid white;">
               <table>
                    <tr>
                        <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;대표자 : <strong><input type="text" name="placeBName" style="background: transparent; font-weight:bold;" placeholder="대표자 성함을 입력해주세요 ✎" required></strong></td>
                    </tr>
                    <tr>
                        <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;전화번호 : <strong><input type="text" name="telephone" style="background: transparent; width: 450px; font-weight:bold;" placeholder="등록하실 시설 전화번호를 입력해주세요 ✎" required></strong></td>
                    </tr>
                    <tr>
                        <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;주소 : <strong><input type="text" name="areaAddress" style="background: transparent; width: 430px; font-weight:bold;" placeholder="등록하실 시설 주소를 입력해주세요 ✎" id="address">
                            <button type="button" id="searchBtn" style="border-radius: 10px; background-color: black;"><img src="views/manager/button.png" width="30px" height="30px"></button></strong></td>
                    </tr>
               </table>
         </div>
               <br>
               <div id="map" style="width:100%;height:350px; border: 1px solid white" class="shadow p-3 mb-5 bg-body shadow-lg"></div>
               
               <div class="input-box shadow-lg" style="border: 1px solid white;">
                <table>
                     <tr>
                         <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;위도 : <strong><input type="text" name="latitude" style="background: transparent; font-weight:bold; color: rgba(92, 92, 201, 0.711);" required></strong></td>
                     </tr>
                     <tr>
                         <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;경도 : <strong><input type="text" name="longitude" style="background: transparent; font-weight:bold; color: rgba(219, 56, 56, 0.641);" required></strong></td>
                     </tr>
                </table>
                </div>

                <br>
                <div style="font-size:20px; border: 1px solid white; background-color: rgb(190, 244, 215);" class="shadow-lg">
                    <table>
                         <tr>
                             <td><span style="color:black; font-size: 25px;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                시설설명</span></td>
                         </tr>
                    </table>
                </div>

                <br>
                <div class="input-box shadow-lg" style="border: 1px solid white; height: 250px;">
                    <table>
                         <tr>
                             <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;<strong>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <textarea name="content" cols="50" rows="5" style="border: 0; background: transparent; font-size: 17px; width: 800px; height: 170px;" placeholder="등록하실 시설 설명을 입력해주세요 ✎" required></textarea></strong></td>
                         </tr>
                    </table>
                </div>
                <div>
                   <br>
                   <!-- 해시 태그 정보를 저장할 input 태그. (textarea도 지원) -->
                  <span>해시태그 : &nbsp;</span>
                  <input name='hash' placeholder="#해시태그를 입력해주세요 ✎">
                  <input type="hidden" name='hidden_hash'>        
                </div>
                    
             <div style="border: 1px solid white;">
                <br>
                <br>
                 <button type="submit" style="border:none; width:150px; height:50px; font-weight:900; font-size:15px; border-radius:5px; font-size: 20px;" class="btn2 btn-success">✔&nbsp;등록</button>
             </div>
             
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
            
          <script>
             const input = document.querySelector('input[name=hash]');
             let tagify = new Tagify(input); // initialize Tagify
             let hidden_hash = document.querySelector('input[name=hidden_hash]');
             // 태그가 추가되면 이벤트 발생
             tagify.on('add', function() {
               console.log(tagify.value); // 입력된 태그 정보 객체
               let tag = "";
               let arr = tagify.value;
               for(let i =0; i<arr.length; i++){ //{value: 태그명, tagid : ? , asda:?}
                  tag += arr[i]["value"]+  ( i != arr.length-1 ?  "," : "")
                  
                    hidden_hash.value = tag;
               }
             })
             //바다,산,부산  
         </script>

        
</body>
</html>