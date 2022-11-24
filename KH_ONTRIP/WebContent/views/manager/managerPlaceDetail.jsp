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
 	!-- 소스 다운 -->
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
      
   <form method="post" action="<%= request.getContextPath()%>/placeDelete.mn?placeName=${place.plcName}">
         
      
         <div class="container-div">
            <span style="font-size:20px;">시설이름 :&nbsp;&nbsp;&nbsp;</span>
            <span style="font-size:20px;">${place.plcName}</span> <br><br>

      <span style="width:150px; height:40px; float:left; margin-left:50px; margin-top:-50px;"> ${place.categoryName}</span>
      

            <div class="place-image">
                <img class="img1" src="<%= request.getContextPath() %>/${placeImg[0].filePath}${placeImg[0].changeName}">

                <img class="img2" src="<%= request.getContextPath() %>/${placeImg[1].filePath}${placeImg[1].changeName}">

                <img class="img3" src="<%= request.getContextPath() %>/${placeImg[2].filePath}${placeImg[2].changeName}">
            </div>

            
            <br><br>
            
            <span style="color:black; font-size:17px;">작성자 : admin</span> <br><br>

            <div style="font-size:20px; padding:10px;">
            <span style="color:grey;">대표지역</span>
            <span style="margin-left:70px; color:grey;">세부지역</span><br>
            </div>

			<div style="font-size:20px; padding:10px;">
            <span style="font-size:20px;">${place.localName}</span>
            <span style="margin-left:92px; font-size:20px;">${place.dareaName}</span>
            </div>
            <br>

         <div class="input-box">
               <span>대표자 : &nbsp;</span>
               <span style="font-size:20px;">${place.plcBname}</span> <br><br>
               <span>주소 : &nbsp;</span>
                <span style="font-size:20px;">${place.plcAddress}</span> <br><br>
               <span>전화번호 : &nbsp;</span>
                <span style="font-size:20px;">${place.plcPnumber}</span> <br><br>
               <br>
   			   <div id="map" style="width:100%;height:350px;"></div>
               <span>내용</span> <br>
               <textarea name="content" cols="50" rows="5" style="resize:none;" readonly>
                ${place.plcText}
               </textarea>
               <br><br>
               <span>해시태그 : &nbsp;</span>
               <input name='tags' readonly value="${value}">
               <input type='hidden' name='hashNo' readonly value="${num}">
            </div>
            <br><br>
            
      <button type="submit" style="border:none; width:150px; height:50px; background-color:bisque; font-weight:900; font-size:15px; border-radius:5px;">삭제</button>
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