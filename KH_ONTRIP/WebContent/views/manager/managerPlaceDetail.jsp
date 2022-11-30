<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.ontrip.place.model.vo.Place"%>
<%
    String contextPath = request.getContextPath();

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 - 시설 삭제 화면</title>
    <link href="<%= contextPath %>/resources/css/manager_placeInsert.css" rel="stylesheet" >
 
    <!-- 소스 다운 -->
   <script src="https://unpkg.com/@yaireo/tagify"></script>
   <!-- 폴리필 (구버젼 브라우저 지원) -->
   <script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
   <link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c46a61fbdf9ee1c5956f08d7c2deaf8&libraries=services"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <style>
       
       select{
          border:2px solid rgb(239, 243, 138);
          border-radius: 10px;
          padding:5px;
       }
       select:focus{
          border:1px solid green;
          box-sizing: border-box;
          /* border-radius: 10px; */
          outline: 3px solid yellowgreen;
          /* border-radius: 10px; */
       }
       input{
          border:none;
          border-bottom:1px solid gray;
       }
       span{
          font-weight:bold;
          font-size:20px;
          color:black; /* rgb(2, 148, 12) */
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
          height:1350px;
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
      .tagify{    
		  border:none;
		  font-size: 20px;
		}
    </style>
</head>
<body>
    <%@ include file="../common/adnavbar.jsp" %>        


        <br><br><br><br><br><br>

        
        <div class="container-div" style="margin:auto;">
            <form method="post" action="<%= request.getContextPath()%>/placeDelete.mn?placeName=${place.plcName}">
                
            <br>
            <div style="border: 1px solid white; height: 8%;" class="shadow-lg">
               <table>
                    <tr>
                        <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;시설이름 : <strong>${place.plcName}</strong></td>
                    </tr>
                    <tr>
                        <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;카테고리 : <strong>${place.categoryName}</strong></td>
                    </tr>
               </table> 
            </div>
            <br>
            <div class="place-image shadow-lg" style="border: 1px solid white; height: 27%;">
                &nbsp;&nbsp;&nbsp;
                <img  src="<%= request.getContextPath() %>/${placeImg[0].filePath}${placeImg[0].changeName}" style="width: 32%; height:237px; margin-left: -2px;">&nbsp;&nbsp;
                <img  src="<%= request.getContextPath() %>/${placeImg[1].filePath}${placeImg[1].changeName}" style="width: 32%; height:237px; margin-left: 0px;">&nbsp;&nbsp;
                <img  src="<%= request.getContextPath() %>/${placeImg[2].filePath}${placeImg[2].changeName}" style="width: 32%; height:237px; margin-left: 0px;">
            </div>
        
            <!-- <span style="color:black; font-size:17px;">작성자 : admin</span> <br><br> -->
            <br>
            <div style="font-size:20px; border: 1px solid white; background-color: rgb(190, 244, 215);" class="shadow-lg">
                <span style="color:grey; text-align: center; font-size: 25px;">대표지역 : <span style="font-size: 25px">[${place.localName}]</span></span>
                <span style="margin-left:70px; color:grey; font-size: 25px;">세부지역 : <span style="font-size: 25px">[${place.dareaName}]</span></span><br>
            </div>
            
            <!-- <div style="font-size:20px; padding:10px; border: 1px solid white;" class="shadow-lg">
            <span style="font-size:20px; margin-left: -10px;">${place.localName}</span>&nbsp;
            <span style="margin-left:97px; font-size:20px;">${place.dareaName}</span>
            </div> -->
            <br>

         <div class="input-box shadow-lg" style="border: 1px solid white;">
               <table>
                    <tr>
                        <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;대표자 : <strong>${place.plcBname}</strong></td>
                    </tr>
                    <tr>
                        <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;주소 : <strong>${place.plcAddress}</strong></td>
                    </tr>
                    <tr>
                        <td style="font-size: 25px; float: left;">&nbsp;&nbsp;&nbsp;전화번호 : <strong>${place.plcPnumber}</strong></td>
                    </tr>
               </table>
         </div>
               <br>
               <div id="map" style="width:100%;height:350px; border: 1px solid white" class="shadow p-3 mb-5 bg-body shadow-lg"></div>
               <div style="border: 1px solid white; margin-top: -20px; background-color: rgb(190, 244, 215);" class="shadow-lg">
                 <span style="font-size: 25px;">내용</span>
               </div>
               <div>
                    <br>
                    <p style="padding:15px; font-size: 17px;" class="shadow-lg">${place.plcText}</p>
               </div>
               <div class="input-box shadow-lg" style="height: 45px;">
                     <span>#해시태그 : &nbsp;</span>
                     <input name='tags' readonly value="${value}" style="background: transparent;">
                     <input type='hidden' name='hashNo' readonly value="${num}" style="background: transparent;">
               </div>
            <br>
             <div>
                <br>
                 <button type="submit" style="border:none; width:150px; height:50px; font-weight:900; font-size:15px; border-radius:5px; font-size: 20px;" class="btn2 btn-success">✔&nbsp;삭제</button>
             </div>
        </form>  
    </div> 


            <script>
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
			<!-- 해시태그 조회 -->
         <script>
             var input = document.querySelector('input[name=tags]')
             new Tagify(input)
         </script>
        
        
   
</body>
</html>