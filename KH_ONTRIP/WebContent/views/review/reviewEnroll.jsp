<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.ontrip.place.model.vo.Place , com.ontrip.member.model.vo.Member"%>
    
<%
	String placeName = ((String)request.getAttribute("placeName"));
	
	String memberNo = String.valueOf(request.getAttribute("memberNo"));
	
	String placeCode = String.valueOf(request.getAttribute("placeCode"));
	
	String revCode =  String.valueOf(request.getAttribute("revCode"));
	
	// memberNo에 해당하는 memberName 가져오기 위한 코드
	Member memberName = (Member) request.getAttribute("memberName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
    .outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 800px;
        /* border: 1px solid black; */
        margin: auto;
        /* margin-top: 150px; */
        box-sizing: border-box;
        /* text-align: center; */
    }
    #userId , #userPwd{
        border-bottom: 1px solid #adadad;
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
        border-top: 0;
        border-left: 0;
        border-right: 0;
    }
    #secessionTitle{
        font-size: 20px;
        font-weight: bold;
    }
    #checkReview{
        font-size: 20px;
        font-weight: bold;
        margin: 11ch;
        margin-top: 70px;
    }
    #treview{
        width: 730px;
        height: 100px;
    }
    #review{
        font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;   
    }  
    .star-rating {
    display: flex;
    flex-direction: row-reverse;
    font-size: 2.25rem;
    line-height: 2.5rem;
    justify-content: space-around;
    padding: 0 0.2em;
    text-align: center;
    width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
#numreview{
    width: 45px;
    height: 30px; 
    border: 0px; 
    font-size: 20; 
    font-weight: bold;
    color: orangered;
}
form{
    margin: auto;
}
</style>
</head>
<body>

    <%@ include file="../common/navbar.jsp" %>

    <div class="outer1">
        <br><br><br>
        <div align="center">
            <form id="checkReview" action="<%=request.getContextPath()%>/updateScore.se?memberNo=<%=memberNo %>&placeCode=<%=placeCode %>&revCode=<%= revCode %>" method="post">
                <strong style="float: left; margin-left: 150px;">이용시설 : </strong> <input type="text" value="<%=placeName%>" name="placeName" id = "review" style="height: 30px; border: 0px; font-size: 20; font-weight: bold; margin-left: -230px;" readonly><br> 
                <hr width="60%">
    
                <strong style="float: left; margin-left: 150px;">작성일시 :</strong> <input type="date" name="reviewSysdate" id = "review" style="height: 30px; border: 0px; font-size: 17; margin-left: -350px;"><br>
                <strong style="float: left; margin-left: 150px;">작성자 :</strong> <input type="text" name = "memberId" value="<%=memberName.getMemberName() %>" id = "review" style="height: 30px; border: 0px; font-size: 20; font-weight: bold; margin-left: -250px;" readonly><br><br><br> 
                만족도 <br>
                <div class="star-rating space-x-4 mx-auto">
                    <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
                    <label for="5-stars" class="star pr-4">★</label>
                    <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                    <label for="4-stars" class="star">★</label>
                    <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                    <label for="3-stars" class="star">★</label>
                    <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                    <label for="2-stars" class="star">★</label>
                    <input type="radio" id="1-star" name="rating" value="1"  v-model="ratings" />
                    <label for="1-star" class="star">★</label>
                </div>
                <br>
    
               - 청결상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" name="cScore" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br>
               - 직원 & 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" name="gScore" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br>
               - 편의 시설 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" name="pScore" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br><br>
               개선사항<br>
               <input type="text" name="reviewText" id="treview" style="width: 440px;"><br><br>
            
                <div align = "center">
                    <button type = "submit" name = "deleteMember" class = "btn btn-secondary btn-sm">등록</button>
                </div>
            </form>
        </div>
    </div>
    
</body>
</html>