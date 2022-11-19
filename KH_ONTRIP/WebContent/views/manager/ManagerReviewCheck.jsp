<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 800px;
        /* border: 1px solid black; */
        margin: auto;
        margin-top: 150px;
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
        margin-top: -0px;
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

    <%@ include file="../common/myPageNavbar.jsp" %>  

    <div class="outer1">
        <br><br><br>
        <div align="center">
            <form id="checkReview" action="<%=request.getContextPath()%>/" method="post">
                <strong style="float: left; margin-left: 150px;">제목 :</strong> <input type="text" id = "reviewtitle" style="height: 30px; border: 0px; font-size: 20; font-weight: bold; margin-left: -250px;"><br> 
                <hr width="60%">
                <strong style="float: left; margin-left: 150px;">작성자 :</strong> <input type="text" id = "reviewUserName" style="height: 30px; border: 0px; font-size: 20; font-weight: bold; margin-left: -250px;"><br> 
                <hr width="60%">
    
                <strong style="float: left; margin-left: 150px;">작성일시 :</strong> <input type="date" id = "reviewDate" style="height: 30px; border: 0px; font-size: 17; margin-left: -350px;"><br><br>
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
                    <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                    <label for="1-star" class="star">★</label>
                </div>
                <br>
    
               - 교통&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br>
               - 이용가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br>
               - 서비스 만족도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br><br>
               놀거리 후기<br>
               <input type="text" id="treview" style="width: 440px;"><br><br>
            
                <div align = "center">
                    <br><br>
                    <button type = "submit" name = "deleteMember" class = "btn btn-secondary btn-sm">삭제</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>