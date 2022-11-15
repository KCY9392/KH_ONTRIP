<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.detailArea.vo.DetailArea ,com.ontrip.image.vo.Image,
    com.ontrip.place.model.vo.Place , java.util.ArrayList"%>
<%
   String dareaName = (String)request.getAttribute("dareaName");
   ArrayList<Image> filePath = (ArrayList<Image>)request.getAttribute("filePath");
   ArrayList<Image> playPath = (ArrayList<Image>)request.getAttribute("playPath");
   ArrayList<Place> playInfo = (ArrayList<Place>)request.getAttribute("playInfo");
   ArrayList<Image> foodPath = (ArrayList<Image>)request.getAttribute("foodPath");
   ArrayList<Place> foodInfo = (ArrayList<Place>)request.getAttribute("foodInfo");
   ArrayList<Image> hotelPath = (ArrayList<Image>)request.getAttribute("hotelPath");
   ArrayList<Place> hotelInfo = (ArrayList<Place>)request.getAttribute("hotelInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 상세선택</title>
<style>
    body{
        margin:0;
    }
    div{
        box-sizing: border-box;
    }
    .outer{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 580px;
        border: 1px solid white;
        margin: auto;
        margin-top: 50px;
        display:flex;
    }
    .locationtitle{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
        font-size: 60px;
    }
    .outer1{
        width: 50%;
        margin: -1;
        /* border: 1px solid black; */
        height: 100%;
        display: inline-block;
    }
    .right{
        height: 75%;
        width: 100%;
    }
    
    table img{
       width:100%;
       height:30%;
    }
    .bottom{
        width: 1000px;
        height: 750px;
        /* border: 1px solid black; */
        margin: auto;
    }
    .selectTitle{
        text-align: center;
    }
    #mForm{
        border: none
    }
    #n , #m , #s{
        width:315px;
        height: 53px;
    }
    .box{
        width: 930px;
        height: 550px;
        margin: auto;
        display: none;
        margin: 10px;
        padding: 10px;
    }
    .outer2{
        width: 100%;
        /* border: 1px solid black; */
    }
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
</style>
<link href="<%= request.getContextPath()%>/resources/css/clickHotel.css" rel="stylesheet" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> 
</head>
<body>

    <%@ include file="../common/navbar.jsp" %>
    
    <%
       
    %>

    <br><br><br><br><br><br>
    
    <h1 class = "locationtitle"><%=dareaName %></h1>

    <br>
    <br>
    <br>
    
    <div class = "outer" style=" margin:auto;">
            <div class = "right">
             <table>
                <tr>
<%--                     <td><img src="<%=filePath.get(0).getFilePath()%><%=filePath.get(0).getOriginName() %>" ></td> --%>
<%--                     <td><img src="<%=filePath.get(1).getFilePath()%><%=filePath.get(1).getOriginName() %>" ></td> --%>
                </tr>
                <tr>
<%--                    <td  colspan = "2"><img src="<%=filePath.get(2).getFilePath()%><%=filePath.get(2).getOriginName() %>" ></td> --%>
                </tr>               
            </table>
            </div>
    </div>
    <br><br><br><br>

   <div class = "bottom" style="width:100%">
            <fieldset id = "mForm">
                <div class = "selectTitle">
                    <button type="button" class="btn-div" id = "n" name="search" onclick="show(this);">놀거리</button>
                    <button type="button" class="btn-div" id = "m" name="search" onclick="show(this);">맛집</button>
                    <button type="button" class="btn-div" id = "s" name="search" onclick="show(this);">숙소</button>
    
                     <div id = "nsearch" class = "box" style="padding:20px; text-align: center;">  <!-- border:1px solid black; -->
            <% if(!playPath.isEmpty()) { %>
                         <% for(int i=0; i<playPath.size(); i++){ %>
                        <div class="outer7">
                            <div class="outer8">
                                <div class="outer9" style="width:270px; height:270px;">
                                    <img src="<%=playPath.get(i).getFilePath() %><%=playPath.get(i).getOriginName() %>" width = "122%" height = "198px"> 
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
               <div class="outer7">
                  <div class="outer8">
                     <div class="outer9" style="width: 270px; height: 270px;">
                        <img
                           src="<%=foodPath.get(i).getFilePath()%><%=foodPath.get(i).getOriginName()%>"
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
               <div class="outer7">
                  <div class="outer8">
                     <div class="outer9" style="width: 270px; height: 270px;">
                        <img
                           src="<%=hotelPath.get(i).getFilePath()%><%=hotelPath.get(i).getOriginName()%>"
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
        <%if (!playPath.isEmpty()) {%>
                    <%for (int i = 0; i < playPath.size(); i++) {%>
         function <%=playInfo.get(i).getPlcName()%>(){
             location.href = "<%=request.getContextPath()%>/selectPlay.pe?placeName=<%=playInfo.get(i).getPlcName()%>";
          }
           <%}%>
      <%}%>
      
      <%if (!hotelPath.isEmpty()) {%>
        <%for (int i = 0; i < hotelPath.size(); i++) {%>
      function <%=hotelInfo.get(i).getPlcName()%>(){
         location.href = "<%=request.getContextPath()%>/selectHotel.pe?placeName=<%=hotelInfo.get(i).getPlcName()%>&dareaName=<%=dareaName %>";
      }
         <%}%>
      <%}%>
      
      <%if (!foodPath.isEmpty()) {%>
        <%for (int i = 0; i < foodPath.size(); i++) {%>
      function <%=foodInfo.get(i).getPlcName()%>(){
         location.href = "<%=request.getContextPath()%>/selectFood.pe?placeName=<%=foodInfo.get(i).getPlcName()%>";
      }
         <%}%>
      <%}%>
    </script>
</body>
</html>