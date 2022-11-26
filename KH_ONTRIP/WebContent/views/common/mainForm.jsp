<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>
<%
    String contextPath = request.getContextPath();
	String hashTag = (String)request.getAttribute("hashTag");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 숙소, 즐길거리, 맛집 추천사이트</title>
    <link href="<%= contextPath %>/resources/css/mainForm.css" rel="stylesheet" >
    <!-- 소스 다운 -->
    <script src="https://unpkg.com/@yaireo/tagify"></script>
    <!-- 폴리필 (구버젼 브라우저 지원) -->
    <script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
    <link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<style>
	   .tagify{    
	        width: 50%;
	        max-width: 400px;
          
	      }

   </style>
	
</head>
<body>
   <%@ include file="../common/navbar.jsp" %>
  

  <br><br><br><br><br><br><br>

  <div class="title-text">
    <h1>어떤 여행을 원하시나요?</h1>
  </div>

  <hr style="border-bottom:5px solid black; width:600px; margin:auto;"> <br>
  
  <div class="center-hash">* 검색하고싶은 내용을 검색창에 입력해주세요</div>

  <br>

    <form action="<%=request.getContextPath() %>/searchPlace.se" id="enroll-form" method="post">
     <div class="input-group mb-3" style="width:700px; height:50px; margin:auto;">
       <input style="border:2px solid rgb(206, 204, 204);" type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" name="word" placeholder="시설의 이름을 입력해주세요">
       <button style="border:2px solid rgb(206, 204, 204); color:burlywood; font-weight: bold;" class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
     </div>
  	</form>
  	
	<form action="<%=request.getContextPath() %>/searchHashPlace.se" id="enroll-form" method="post">
    <div>
      <span style="margin-left:1550px;"><%= hashTag %></span>
    </div>
	   <div class="input-group mb-3" style="width:700px; height:50px; margin-left:1550px; ">
	   <input style="border:2px solid rgb(206, 204, 204);" type="text" id="search12" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" name='hash' placeholder="해시태그를 입력해주세요">
	   <input type="hidden" name='hidden_hash'>
	   <button style="border:2px solid rgb(206, 204, 204); color:burlywood; font-weight: bold;" class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
	   </div>
	</form>
	
  <br><br><br>
  
<div style="width: 90%; margin:auto; text-align: center;">
  <div class="row" id="cityList" style=" margin:auto; ">
    
    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="서울">
      <a href="<%=request.getContextPath() %>/mainForm.no?localName=서울&localCode=L1" onclick="" style="color:inherit; text-decoration: none!important;"  aria-expanded="false">
        <div class="card city-card-style " style="margin:0; border: none !important; ">
          <div class="card-image imgbox slide-in" >
            <img src="resources/image/seoul.jpg" alt="city" style="box-shadow:0 0 8px black;">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Seoul</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 서울</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="제주도">
      <a href="<%=request.getContextPath() %>/mainForm.no?localName=제주도&localCode=L3" onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox slide-in">
            <img src="resources/image/jeju.jpg" alt="city" style="box-shadow:0 0 8px black;">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Jeju</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 제주도</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="경기도">
      <a href="<%=request.getContextPath() %>/mainForm.no?localName=경기도&localCode=L2" onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox slide-in">
            <img src="resources/image/paju.jpg" alt="city" style="box-shadow:0 0 8px black;">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Gyeonggi-do</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 경기도</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    

    
    
    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="강원도">
      <a href="<%=request.getContextPath() %>/mainForm.no?localName=강원도&localCode=L4" onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox slide-in">
            <img src="resources/image/pyeongchang.jpg" alt="city" style="box-shadow:0 0 8px black;">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Gangwon-do</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 강원도</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br>

    
    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="충청도">
      <a href="<%=request.getContextPath() %>/mainForm.no?localName=충청도&localCode=L5" onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox slide-in">
            <img src="resources/image/yesan.jpg" alt="city" style="box-shadow:0 0 8px black;">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Chungcheong-do</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 충청도</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="전라도">
      <a href="<%=request.getContextPath() %>/mainForm.no?localName=전라도&localCode=L6" onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox slide-in">
            <img src="resources/image/jeonju.jpg" alt="city" style="box-shadow:0 0 8px black;">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Jeolla-do</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 전라도</h6>
              </div>
          </div>
        </div>
      </a>
    </div>

    <div class="col s12 m6 l3" name="asia">
      <input type="hidden" value="경상도">
      <a href="<%=request.getContextPath() %>/mainForm.no?localName=경상도&localCode=L7" onclick="" style="color:inherit; text-decoration: none!important;" aria-expanded="false">
        <div class="card city-card-style" style="margin:0; border: none !important; ">
          <div class="card-image imgbox slide-in">
            <img src="resources/image/busan.jpg" alt="city" style="box-shadow:0 0 8px black;">
          </div>
          <div class="city-card-contents-div">
            <br>
              <div class="citynamefont"><b>Gyeongsang-do</b><br>
                <h6 class="city-card-contents-subtitle">대한민국 경상도</h6></div>
          </div>
        </div>
      </a>
    </div>


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



