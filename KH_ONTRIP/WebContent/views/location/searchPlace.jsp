<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.image.vo.Image, com.ontrip.place.model.vo.Place , java.util.ArrayList"%>
<%
	ArrayList<Image> placePath = (ArrayList<Image>)request.getAttribute("placePath");
	ArrayList<Place> placeInfo = (ArrayList<Place>)request.getAttribute("placeInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 폰트적용  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css" rel="stylesheet" >

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

<!-- BootStrap 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

 
<style>
    body{
        margin:0;
    }
    div{
        box-sizing: border-box;
    }
    .searchtitle{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
        font-size: 60px;
        text-align: center;
    }
    .bottom{
        width: 1000px;
        height: 750px;
        /* border: 1px solid black; */
        margin: auto;
    }
    .outer7{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 950px;
        height: 200px;
        border: 1px solid rgb(167, 166, 166);
        margin: auto;
        margin-top: 10px;
        margin-left: 100x;
        display:flex;
    }
    .outer8 {
	   width: 40%;
	   height: 100%;
	   border-right: 1px solid rgb(167, 166, 166);
	}
	
	.outer10{
	   width: 65%;
	   height: 100%;
	}
	.outer11{
	   margin-top: 50px;
	}
	
	.outer7.shadow-lg :hover{
	   background-color: rgb(207, 206, 206);
	   cursor : pointer;
	}
    #mForm{
        border: none
    }
    .uk-flex-middle {
        align-items: center;
    }
    .uk-flex-center {
        justify-content: center;
    }
    .uk-flex {
        display: flex;
    }
    .uk-background-cover {
        background-size: cover;
    }
    .uk-background-contain{
        background-position: 50% 50%;
        background-repeat: no-repeat;
    }
    .uk-section-default {
        background: rgb(250, 250, 250);
    }

    .uk-section {
        padding-top: 70px;
        padding-bottom: 70px;
    }
    .uk-section {
        display: flow-root;
        box-sizing: border-box;
    }
    .sl-in2 {
	  animation: change1 1s ease forwards;
	}
	
	@keyframes change1 {
	  from {
	    transform: translateY(30%);
	  }
	
	  to {
	    transform: translateY(0%);
	  }
	}
</style>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    
      <br><br><br>
      
      <div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:28vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="font-size:40px; font-weight:600;">OnTrip</div><br>
                <div style="color:darkgray">MAKE YOUR ROUTE OPTIMIZED</div> <br><br>
                <div>
                	<span style="color: coral; font-size:23px; font-weight:600;">검색결과</span>
                </div>
            </div>
        </div>
    </div>
     

      <br><br>

	<div class="bottom" style="width: 100%; text-align: center;">
		<fieldset id="mForm">

			<% if(!placePath.isEmpty()) { %>
			<% for(int i=0; i<placePath.size(); i++){ %>
                    <div class="outer7 shadow-lg" onclick="movePlace('<%= placeInfo.get(i).getPlcName() %>','<%= placeInfo.get(i).getDareaName()%>', '<%= loginUser.getMemberNo() %>', '<%= placeInfo.get(i).getCategoryCode()%>')">
	               <div class="outer8">
	                     <img
	                        src="<%= request.getContextPath() %>/<%=placePath.get(i).getFilePath()+placePath.get(i).getChangeName() %>"
	                        width="100%" height="198px">
	               </div>
	               <div class="outer10">
	                  <div class="outer11">
	                  <span style="border: 0; font-size: 20px; font-weight: bold;"><%=placeInfo.get(i).getPlcName() %></span><br><br>
	                  <span style="font-size: 15px;"><%=placeInfo.get(i).getPlcAddress() %><br><%=placeInfo.get(i).getPlcPnumber() %></span>
	                  </div>
	               </div>
	            </div> 
				<%} %>
			<%} %>
			
	
		</fieldset>
	</div>
	<script>
	function movePlace(placeName, dareaName, memberNo, categoryCode){
		if(categoryCode == "PP"){
			location.href= "<%=request.getContextPath()%>"+"/selectPlay.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;				
		} else if(categoryCode == "FF"){
			location.href= "<%=request.getContextPath()%>"+"/selectFood.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
		} else{
			location.href= "<%=request.getContextPath()%>"+"/selectHotel.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
		}
	}

	</script>
</body>
</html>