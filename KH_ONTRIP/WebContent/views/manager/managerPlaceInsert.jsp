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
      
   <form method="post" action="<%= request.getContextPath()%>/PlaceInsert.mn">
         
      
         <div class="container-div">
            <span style="font-size:20px;">시설이름 : &nbsp;</span>
            <input type="text" name="placeName" placeholder="시설이름을 입력하세요."> <br><br>

      <select name="category" id="category" style="width:150px; height:40px; float:left; margin-top:-60px;" required>  
                <option value="PP">놀거리</option>
                <option value="HH">맛집</option>
                <option value="FF">숙소</option>
        </select>
      
            <!-- 이미지 첨부파일 -->
            <div class="img-container">
                <div class="image-upload" id="image-upload">
        
                    <form method="post" enctype="multipart/form-data">
                        <div class="button">
                            <label for="chooseFile1" style="margin-bottom:-20px;">
                                👉 CLICK HERE 👈
                            </label>
                        </div>
                        <input type="file" id="chooseFile1" name="file1" accept="image/*" onchange="loadFile1(this)" required>
                    </form>
        
                    <div class="fileContainer">
                        <div class="fileInput">
                            <p id="fileName" name="file1"></p>
                        </div>
                    </div>
                </div>
                
                
                <div class="image-show" id="image-show1"></div>
            </div>

            <!-- 이미지 첨부파일 -->
            <div class="img-container">
                <div class="image-upload" id="image-upload">
        
                    <form method="post" enctype="multipart/form-data">
                        <div class="button">
                            <label for="chooseFile2" style="margin-bottom:-20px;">
                                👉 CLICK HERE 👈
                            </label>
                        </div>
                        <input type="file" id="chooseFile2" name="file2" accept="image/*" onchange="loadFile2(this)" required>
                    </form>
        
                    <div class="fileContainer">
                        <div class="fileInput">
                            <p id="fileName2"></p>
                        </div>
                    </div>
                </div>
                
                
                <div class="image-show" id="image-show2"></div>
            </div>

            <!-- 이미지 첨부파일 -->
            <div class="img-container">
                <div class="image-upload" id="image-upload">
        
                    <form method="post" enctype="multipart/form-data">
                        <div class="button">
                            <label for="chooseFile3" style="margin-bottom:-20px;">
                                👉 CLICK HERE 👈
                            </label>
                        </div>
                        <input type="file" id="chooseFile3" name="file3" accept="image/*" onchange="loadFile3(this)" required>
                    </form>
        
                    <div class="fileContainer">
                        <div class="fileInput">
                            <p id="fileName3"></p>
                        </div>
                    </div>
                </div>
                
                
                <div class="image-show" id="image-show3"></div>
            </div>
            
            <br><br><br><br><br><br><br><br><br><br><br><br>
            
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

                function showImage() {
                    var newImage = document.getElementById('image-show').lastElementChild;
                    newImage.style.visibility = "visible";
                    
                    document.getElementById('image-upload').style.visibility = 'hidden';

                    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
                    
                }


                function loadFile1(input) {
                    

                        var file = input.files[0];
    
                        var name = document.getElementById('fileName');
                        name.textContent = file.name;
    
                        name.style.fontSize = "13px";
    
                        var newImage = document.createElement("img");
                        newImage.setAttribute("class", 'img');
    
                        newImage.src = URL.createObjectURL(file);   
    
                        newImage.style.width = "15%";
                        newImage.style.height = "15%";  
                        newImage.style.objectFit = "contain";
                        newImage.style.marginLeft = "-85%";
                        newImage.style.marginTop = "-31%";
                        newImage.style.zIndex = "1";
    
                        var container = document.getElementById('image-show1');
                        container.replaceChildren();
                        container.appendChild(newImage);
                        

                };

                function loadFile2(input) {
                    var file = input.files[0];

                    var name = document.getElementById('fileName2');
                    name.textContent = file.name;

                    name.style.fontSize = "13px";

                    var newImage = document.createElement("img");
                    newImage.setAttribute("class", 'img');

                    newImage.src = URL.createObjectURL(file);   

                    newImage.style.width = "15%";
                    newImage.style.height = "15%";  
                    newImage.style.objectFit = "contain";
                    newImage.style.marginLeft = "-84.5%";
                    newImage.style.marginTop = "-31%";
                    newImage.style.zIndex = "1";

                    var container = document.getElementById('image-show2');
                    container.replaceChildren();
                    container.appendChild(newImage);
                };

                function loadFile3(input) {
                    var file = input.files[0];

                    var name = document.getElementById('fileName3');
                    name.textContent = file.name;

                    name.style.fontSize = "13px";

                    var newImage = document.createElement("img");
                    newImage.setAttribute("class", 'img');

                    newImage.src = URL.createObjectURL(file);   

                    newImage.style.width = "15%";
                    newImage.style.height = "15%";   
                    newImage.style.objectFit = "contain";
                    newImage.style.marginLeft = "-84.5%";
                    newImage.style.marginTop = "-31%";
                    newImage.style.zIndex = "1";

                    var container = document.getElementById('image-show3');
                    container.replaceChildren();
                    container.appendChild(newImage);
                };



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


        
        
   
</body>
</html>