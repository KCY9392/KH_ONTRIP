<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.place.model.vo.Place"%>
<%
    String contextPath = request.getContextPath();

   Place p = ((Place)request.getAttribute("place"));
   
   int placeCode = p.getPlcCode();
   String categoryCode = p.getCategoryCode();
   String dareaCode = p.getDareaCode();
   String localCode = p.getLocalCode();
   
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 - 시설 이미지 등록 화면</title>
    <link href="<%= contextPath %>/resources/css/manager_placeInsert.css" rel="stylesheet" >
 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
    <style>
        #outer{
            width: 1300px;
            margin: auto;
        }
        .outer1{
            margin-left: 200px;
        }
        button:hover{transform: scale(.9);}
    </style>
</head>
<body>

<%@ include file="../common/adnavbar.jsp" %>        

        <br><br><br><br><br><br><br>
     
   <form method="post" action="<%= request.getContextPath()%>/PlaceInsert2.mn?placeCode=<%= placeCode %>&categoryCode=<%= categoryCode %>&dareaCode=<%= dareaCode %>&localCode=<%= localCode %>" enctype="multipart/form-data">
    <div style="border: 1px solid white; height: 650px;" class="shadow-lg" id="outer">
        <table>
             <tr>
                 <td style="font-size: 25px;">
                    <br>
                    <div style="width: 121.5%;">
                        <h1><strong>
                            시설 이미지를 등록해주세요&nbsp;&nbsp;&nbsp;</strong>
                            <button type="submit" class="btn btn-dark btn-outline-dark" style="border:none; width:150px; height:60px; font-weight:920; font-size:20px; border-radius:5px; margin: auto; color: white;">등록</button></h1>
                    </div>
                        <br><br>
                   <div class="outer1">
                     <div class="shadow-lg">
                            <!-- 이미지 첨부파일 1 -->
                    <div class="img-container">
                        <div class="image-upload" id="image-upload">
                                <div class="button">
                                    <label for="chooseFile1" style="margin-bottom:-30px;">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                        <strong>👉 CLICK HERE 👈</strong>
                                    </label>
                                </div>
                                <input type="file" id="chooseFile1" name="file1" accept="image/*" onchange="loadFile1(this)" required>
                          
                
                            <div class="fileContainer">
                                <div class="fileInput">
                                    <p id="fileName" name="file1"></p>
                                </div>
                        </div>
                    </div>
                        
                        
                        <div class="image-show" id="image-show1"></div>
                    </div>

                    <!-- 이미지 첨부파일 2 -->
                    <div class="img-container">
                        <div class="image-upload" id="image-upload">
                
                                <div class="button">
                                    <label for="chooseFile2" style="margin-bottom:-30px;">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                        <strong>👉 CLICK HERE 👈</strong>
                                    </label>
                                </div>
                                <input type="file" id="chooseFile2" name="file2" accept="image/*" onchange="loadFile2(this)" required>
                            
                
                            <div class="fileContainer">
                                <div class="fileInput">
                                    <p id="fileName2"></p>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="image-show" id="image-show2"></div>
                    </div>

                    <!-- 이미지 첨부파일 3 -->
                    <div class="img-container">
                        <div class="image-upload" id="image-upload">
                
                                <div class="button">
                                    <label for="chooseFile3" style="margin-bottom:-30px;">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                        <strong>👉 CLICK HERE 👈</strong>
                                    </label>
                                </div>
                                <input type="file" id="chooseFile3" name="file3" accept="image/*" onchange="loadFile3(this)" required>
                            
                
                            <div class="fileContainer">
                                <div class="fileInput">
                                    <p id="fileName3"></p>
                                </div>
                            </div>
                        </div>
                        <div class="image-show" id="image-show3"></div>
                   </div>
                     </div>
                </td>
             </tr>
        </table> 
     </div>
     
</form>


            <!-- 이미지 첨부파일 -->
            <!-- <div class="img-container">
                <div class="image-upload" id="image-upload">
        
                        <div class="button">
                            <label for="chooseFile1" style="margin-bottom:-20px;">
                                👉 CLICK HERE 👈
                            </label>
                        </div>
                        <input type="file" id="chooseFile1" name="file1" accept="image/*" onchange="loadFile1(this)" required>
                  
        
                    <div class="fileContainer">
                        <div class="fileInput">
                            <p id="fileName" name="file1"></p>
                        </div>
                </div>
            </div>
                
                
                <div class="image-show" id="image-show1"></div>
            </div> -->

            <!-- 이미지 첨부파일 -->
            <!-- <div class="img-container">
                <div class="image-upload" id="image-upload">
        
                        <div class="button">
                            <label for="chooseFile2" style="margin-bottom:-20px;">
                                👉 CLICK HERE 👈
                            </label>
                        </div>
                        <input type="file" id="chooseFile2" name="file2" accept="image/*" onchange="loadFile2(this)" required>
                    
        
                    <div class="fileContainer">
                        <div class="fileInput">
                            <p id="fileName2"></p>
                        </div>
                    </div>
                </div>
                
                
                <div class="image-show" id="image-show2"></div>
            </div> -->

            <!-- 이미지 첨부파일 -->
            <!-- <div class="img-container">
                <div class="image-upload" id="image-upload">
        
                        <div class="button">
                            <label for="chooseFile3" style="margin-bottom:-20px;">
                                👉 CLICK HERE 👈
                            </label>
                        </div>
                        <input type="file" id="chooseFile3" name="file3" accept="image/*" onchange="loadFile3(this)" required>
                    
        
                    <div class="fileContainer">
                        <div class="fileInput">
                            <p id="fileName3"></p>
                        </div>
                    </div>
                </div>
                
                
                <div class="image-show" id="image-show3"></div>
            </div> -->
            <!-- <button type="submit" style="border:none; width:150px; height:50px; background-color:bisque; font-weight:900; font-size:15px; border-radius:5px;">등록</button>
        </form> -->
       
       <script>
       
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
               newImage.style.marginTop = "-27%";
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
           newImage.style.marginTop = "-27%";
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
           newImage.style.marginTop = "-27%";
           newImage.style.zIndex = "1";

           var container = document.getElementById('image-show3');
           container.replaceChildren();
           container.appendChild(newImage);
       };


       
       </script>
</body>
</html>