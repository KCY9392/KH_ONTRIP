<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.ontrip.place.model.vo.Place , 
    com.ontrip.review.vo.Review"%>
    
<%
	Place place = (Place)request.getAttribute("place");
	String placeName = (String)request.getParameter("placeName");
	
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	
	int revCode = Integer.parseInt((String)request.getParameter("revCode"));
	
	Review r = (Review) request.getAttribute("re");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
        margin-top: 100px;
    }
    #treview{
        width: 730px;
        height: 100px;
    }
    #review{
        font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;   
    }  
#numreview , #numreview1 , #numreview2 , #numreview3 , #updateStar{
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
.star-rating { width:304px; }
.star-rating,.star-rating span { display:inline-block; height:55px; overflow:hidden; background:url(views/review/star.png)no-repeat; }
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
</style>
</head>
<body>

    <%@ include file="../common/navbar.jsp" %>

    <div class="outer1">
        <br><br><br>
        <div align="center">
            <form id="checkReview" action="<%=request.getContextPath()%>/deleteReivew.re?memberNo=<%=memberNo %>&revCode=<%=revCode %>&placeName=<%=r.getPlaceName() %>" method="post">
            	
                <strong style="float: left; margin-left: 150px;">이용시설 : </strong> <input type="text" value="<%=r.getPlaceName()%>" name="placeName" id = "review" style="height: 30px; border: 0px; font-size: 20; font-weight: bold; margin-left: -295px;" readonly><br> 
                <hr width="60%">
    
                <strong style="float: left; margin-left: 150px;">작성일시 :</strong> <input type="date" value="<%=r.getRevDate()%>"name="reviewSysdate" id = "review" style="height: 30px; border: 0px; font-size: 17; margin-left: -350px;" readonly><br>
                <strong style="float: left; margin-left: 150px;">작성자 :</strong> <input type="text" name = "memberId" value="<%=r.getMemberName()%>" id = "review" style="height: 30px; border: 0px; font-size: 20; font-weight: bold; margin-left: -270px;" readonly><br><br><br> 
                &nbsp;만족도&nbsp;&nbsp;&nbsp;<input type="number" id="updateStar" name = "updateStar" value="<%=r.getReviewStar()%>" min="1" max="5" style="width: 40px; border: 0;">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5<br>
                <div>
                	<div class="star-rating">
                		<span style="width:<%=r.getReviewStar()*2%>0%; float:left"></span>
                	</div>
                    <br>
                </div>
                <br>
    
               <table>
               		<tr>
               			<td>
               				- 청결상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" value="<%=r.getReview_c()%>"id = "numreview1" name="cScore" min="1" max="10" step="1" style="margin-left:-1px">/&nbsp;&nbsp;&nbsp;10<br>
               				- 직원 & 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview2" value="<%=r.getReview_s() %>" name="sScroe" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br>
              				- 편의 시설 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview3" name="pScore" value="<%=r.getReview_p() %>" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br><br>
               			</td>
               		</tr>
               </table>
               개선사항<br>
               <input type="text" value="<%=r.getRevText() %>" name="rtext" id="treview" style="width: 440px;"><br><br>
              	<% if(loginUser.getMemberName().equals(r.getMemberName())) { %>
                <div align = "center">
                    <button type="submit" name ="deleteReivew">삭제</button>
                    <button type="button" name ="updateReivew" onclick="updateReview();">수정</button>
                </div>
              <% } %>
            </form>
        </div>
    </div>
    
    <script>
        function updateReview(){
        	
        	let $updateStar = $("input[name=updateStar]");
        	let $cScroe = $("input[name=cScore]");
        	let $sScroe = $("input[name=sScroe]");
        	let $pScroe = $("input[name=pScore]");
        	let $rtext = $("input[name=rtext]");
        	
        	$.ajax({
        		url : "reviewUpdate.re",
            	data : {updateStar : $updateStar.val(), cScore : $cScroe.val(), sScore : $sScroe.val() , pScore : $pScroe.val() , rText : $rtext.val(), revCode : '<%=revCode%>'},
            	success : function(result){
            		if(result == "success"){
            			alert("수정이 완료되었습니다.");
            			location.href = '<%=request.getContextPath() %>/start.me';
            		}else{
            			alert("수정에 실패하였습니다.");
            			location.href = '<%=request.getContextPath() %>/detail.bo';
            		}
            		
            	}
            	
        	})
        }
    </script>
</body>
</html>