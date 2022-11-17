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
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>

     

     	
        <%@ include file="../common/managerNavbar.jsp" %> 

        <br><br><br><br>

         <div class="container-div">
            <span>제목 : </span>
            <input type="text" name="title" placeholder="제목을 입력하세요."> <br><br>

            <!-- 이미지 첨부파일 -->
            <div class="img-container">
                <div class="image-upload" id="image-upload">
        
                    <form method="post" enctype="multipart/form-data">
                        <div class="button">
                            <label for="chooseFile1" style="margin-bottom:-20px;">
                                👉 CLICK HERE! 👈
                            </label>
                        </div>
                        <input type="file" id="chooseFile1" name="chooseFile" accept="image/*" onchange="loadFile1(this)">
                    </form>
        
                    <div class="fileContainer">
                        <div class="fileInput">
                            <p id="fileName"></p>
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
                                👉 CLICK HERE! 👈
                            </label>
                        </div>
                        <input type="file" id="chooseFile2" name="chooseFile" accept="image/*" onchange="loadFile2(this)">
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
                                👉 CLICK HERE! 👈
                            </label>
                        </div>
                        <input type="file" id="chooseFile3" name="chooseFile" accept="image/*" onchange="loadFile3(this)">
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
            
            <span>작성자 : admin</span> <br><br>

            <div style="font-size:20px; padding:10px;">
            <span>대표지역</span>
            <span style="margin-left:70px;">세부지역</span><br>
            </div>

            <select onchange="addressKindChange(this);" name="addressKind" id="addressKind" style="width:150px; height:50px;">  
                <option value="a">서울</option>
                <option value="b">제주도</option>
                <option value="c">경기도</option>
                <option value="d">강원도</option>
                <option value="e">충청도</option>
                <option value="f">전라도</option>
                <option value="g">경상도</option>
            </select>
            <select name="addressDetailKind" id="addressDetailKind" style="width:150px; height:50px;">
                <option>선택해주세요.</option>
                <option>종로</option>
                <option>용산</option>
                <option>강남</option>
            </select>
            
            <br><br>

            <span>대표자 : </span>
            <input type="text" name="adminName"> <br><br>
            <span>주소 : </span>
            <input type="text" name="areaAddress"> <br><br>
            <span>전화번호 : </span>
            <input type="text" name="telephone"> <br><br>
            <br>
            <span>위도 : </span>
            <input type="text" name="latitude"> <br><br>
            <span>경도 : </span>
            <input type="text" name="longitude"> <br><br>

            <span>내용</span> <br>
            <textarea name="content" cols="50" rows="5">
더운 여름 시원한 서핑 체험하세욧!
            </textarea>
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
    
                        name.style.fontSize = "12px";
    
                        var newImage = document.createElement("img");
                        newImage.setAttribute("class", 'img');
    
                        newImage.src = URL.createObjectURL(file);   
    
                        newImage.style.width = "15%";
                        newImage.style.height = "15%";  
                        newImage.style.objectFit = "contain";
                        newImage.style.marginLeft = "-84%";
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

                    name.style.fontSize = "12px";

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

                    name.style.fontSize = "12px";

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
                    if(e.value == "a") {
                         d = seoul;
                    } else if(e.value == "b"){
                         d = jeju;
                    } else if(e.value == "c"){
                         d = gyeonggi;
                    } else if(e.value == "d"){
                         d = gangwon;
                    } else if(e.value == "e"){
                        d = chung;
                    } else if(e.value == "f"){
                         d = junla;
                    } else if(e.value == "g"){
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