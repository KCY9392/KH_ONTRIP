<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <script defer src="../../KH_ONTRIP/resources/deletequestion.js?ver=123"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10" defer></script>

  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

  <!-- BootStrap 연결 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

  <title>문의사항 상세조회</title>
  <style>
    .container1{
      display: flex;
      flex-direction: column;
      align-items: center;
    }
     .container{
       display: flex;
       flex-direction: column;
       align-items: center;
     }
    .panel-title{
      font-size:35px;
    }
    span{
      font-size: 20px;
      font-weight: bold;
    }
    textarea{
      padding:5px;
      border:1px solid rgb(171, 168, 168);
      border-radius: 5px;
      resize: none;
      width: 500px;
	  margin-bottom: 0px;
	  height:100px;
    }
    .btn-5{
      padding:5px;
      width:130px;
      height:50px;
      border:none;
      border-radius: 10px;
      font-weight: 900;
      color:green;
      cursor: pointer;
      font-size: 16px;
    }
    .btn-5:hover{
      background-color: rgb(215, 211, 211) ;
    }
    .btn-5:active{
      background-color: rgb(180, 177, 177) ;
    }
    #before, #save, #delete{
      color:rgb(250, 255, 255);
      font-size: 18px;
      font-weight: 900;
      width:200px;
    }
    div>button:nth-child(1):hover{
      cursor: pointer;
      color:rgb(115, 183, 187);
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
		       transform: translateY(80%);
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

     <div class="uk-section uk-section-default sl-in2"
      style="min-width: 90vw; height: 28vh;">
      <div class="uk-container">
         <div style="text-align: center; margin-top: -1.5%;">
            <div style="font-size: 40px; font-weight: 600;">OnTrip</div>
            <br>
            <div style="color: darkgray">MAKE YOUR ROUTE OPTIMIZED</div>
            <br> <br>
            <div>
               <span style="color: coral; font-size: 20px; font-weight: 600;">문의사항 &nbsp;상세조회</span>
            </div>
         </div>
      </div>
   </div>

<div class="container1" style="margin-top:-50px;">
  <div class="form-group" style="text-align:center; font-size:20px;">
  
    <form method="post" action="/KH_ONTRIP/question/queUpdateForm">
	    
	    <br>
		<table align="center" style="width:800px; height:300px; margin-left:-150px;">
			<tr style="height:100px;">
				<td><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</span></td>
				<td style="text-align:left;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${memberQuestionDetailed.qTitle}</span></td>
			</tr>
			<tr>
				<td><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용</span></td>

				<td><textarea cols="20" rows="7" name="qContent" readonly>${memberQuestionDetailed.qContent}</textarea></td>
			</tr>	
			<tr>
				<td><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;답변</span></td>
				<td><textarea cols="30" rows="10"readonly>${memberQuestionDetailed.aContent}</textarea></td>
			</tr>
	      <input type="hidden" name="qCode" value="${memberQuestionDetailed.qCode}">
	      <input type="hidden" name="qTitle" value="${memberQuestionDetailed.qTitle}">
	      <input type="hidden" name="qContent" value="${memberQuestionDetailed.qContent}">
	      <br>
		</table>
		
	      <c:if test="${isUpdated}">
	        <button type="submit" id="save" class="btn btn-lg btn-success mx-0 mb-2" style="background-color: rgb(189, 192, 191); border: 0; height:50px;
	        	margin-left:0 !important;  cursor:pointer; display:inline-block; ">수정하기</button>
	      </c:if>
    </form>
    <Br>
    <form action="/KH_ONTRIP/question/questions" method="get">
      <div style="margin-top:-57px; margin-left:150px;">
      <button type="submit" id="before" class="btn btn-lg btn-success mx-0 mb-2" 
      style="background-color: yellowgreen; border: 0; height:50px;
      	  cursor:pointer; margin-left:-400px !important; margin-top:60px;">목록으로</button>
      </div>
    </form>
    <form name="deleteQue" action="/KH_ONTRIP/question/queDelete?qCode=${memberQuestionDetailed.qCode}" method="post">
    	<div style="margin-top:-57px !important; margin-left:550px;">
      <button type="button" id="delete" class="sub" style="background-color: rgb(189, 192, 191); border: 0; height:50px;
        border-radius:5px; cursor:pointer; display:inline-block; margin-left:-320px !important;">삭제하기</button>
      </div>
    </form>
  </div>
</div>

</body>
</html>