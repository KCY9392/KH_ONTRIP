<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.detailArea.vo.DetailArea ,com.ontrip.image.vo.Image,
    com.ontrip.place.model.vo.Place , java.util.ArrayList"%>
<%
   String dareaName = (String)request.getAttribute("dareaName");
   ArrayList<Image> filePath = (ArrayList<Image>)request.getAttribute("filePath");
   ArrayList<Image> playPath = (ArrayList<Image>)request.getAttribute("playPath");
   ArrayList<Place> playInfo = (ArrayList<Place>)request.getAttribute("playInfo");
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
<%--                     <td><img src="<%=filePath.get(2).getFilePath()%><%=filePath.get(1).getOriginName() %>" ></td> --%>
                </tr>
                <tr>
<%--                    <td  colspan = "2"><img src="<%=filePath.get(1).getFilePath()%><%=filePath.get(2).getOriginName() %>" ></td> --%>
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
                          
                            <div style="font-size:20px; font-weight:bold; margin-left: 25%; margin-top: 20px;"><input type="button" value="<%=playInfo.get(i).getPlcName() %>" style="border: 0; background-color: white; font-weight: bold;"></div>
	                            <div style="text-align:center; margin: 70px; margin-left: -130px">
		                            <span><%=playInfo.get(i).getPlcAddress() %></span><br>
		                            <span><%=playInfo.get(i).getPlcPnumber() %></span>
	                            </div>
                        </div> 
                        	<%} %>
                        <%} %>
                      </div>
                



                    <div id = "msearch" class = "box box2"  style="border:1px solid black; padding:20px;"> 
                        <div class="img-container">
                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>
                            
                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div style="margin-left:15%;">
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image2.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>
                    
                        </div>

                    
                    </div>
                




                    <div id = "ssearch" class = "box box2" style="border:1px solid black; padding:20px;">
                        <div class="img-container">
                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image1.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>
                            
                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image1.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image1.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div style="margin-left:15%;">
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image1.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>

                            <div>
                                <div class="img-box" style="width:270px; height:270px;">
                                    <img src = "../image/image1.png" width = "100%" height = "230px" style="border-radius:20px;"> 
                                    <div style="font-size:20px; font-weight:bold;">롯데호텔</div>
                                </div>
                            </div>
                    
                        </div>

                    </div>
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
 

</body>
</html>