<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.ontrip.place.model.vo.Place , com.ontrip.member.model.vo.Member ,
    com.ontrip.image.vo.Image"%>
    
<%
	String placeName = ((String)request.getAttribute("placeName"));
	
	String memberNo = String.valueOf(request.getAttribute("memberNo"));
	
	String placeCode = String.valueOf(request.getAttribute("placeCode"));
	
	String revCode =  String.valueOf(request.getAttribute("revCode"));
	
	// memberNo에 해당하는 memberName 가져오기 위한 코드
	Member memberName = (Member) request.getAttribute("memberName");
	
	ArrayList<Image> selectMainImagelist = (ArrayList<Image>) request.getAttribute("selectMainImagelist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 폰트적용  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css"
   rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
   integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
   crossorigin="anonymous"></script>

<!-- BootStrap 연결 -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
   integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
   crossorigin="anonymous"></script>
<!-- Alert 창  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<style>
    .outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 800px;
        height: 1250px;
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

button:hover{transform: scale(.9);}
</style>
</head>
<body>

    <%@ include file="../common/navbar.jsp" %>

    <div class="outer1 shadow p-3 mb-5 bg-body rounded">
        <br><br><br>
        <div align="center">
            <form id="checkReview" action="<%=request.getContextPath()%>/updateScore.se?memberNo=<%=memberNo %>&placeCode=<%=placeCode %>&revCode=<%= revCode %>&placeName=<%=placeName %>" method="post">
                <strong style="float: left; font-size: 25px;">이용시설 : <%=placeName%> &nbsp;&nbsp;&nbsp;</strong> <input type="text" name="placeName" id = "review" style="height: 30px; width: 150px; border: 0px; font-size: 20; font-weight: bold;" readonly><br> 
                <!-- <hr width="60%"><br> --><br>
                <img src="<%=request.getContextPath()%>/<%=selectMainImagelist.get(0).getFilePath()%><%=selectMainImagelist.get(0).getChangeName() %>" style="width: 110%; height:330px; margin-left: -23px;" class="shadow p-3 mb-5 bg-body rounded"><br>
                <strong style="float: left;">작성일시 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong><input type="date" name="reviewSysdate" id = "review" style="height: 30px; border: 0px; font-size: 17; margin-left: -350px;"><br>
                <strong style="float: left;">작성자 :</strong> <input type="text" name = "memberId" value="<%=memberName.getMemberName() %>" id = "review" style="height: 30px; border: 0px; font-size: 20; font-weight: bold; margin-left: -250px;" readonly><br><br><br> 
                <div class="shadow-lg" style="width: 151.5%; margin-left: -135px; padding:25px;">
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
                <table>
                    <tr>
                        <td>- 청결상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" name="cScore" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;&nbsp;<td>10</td></td>
                    </tr>
                    <tr>
                        <td>- 직원 & 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" name="gScore" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;&nbsp;<td>10</td></td>
                    </tr>
                    <tr>
                        <td>- 편의 시설 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" name="pScore" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;&nbsp;<td>10</td></td>
                    </tr>
                </table>
               <!-- - 청결상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" name="cScore" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br>
               - 직원 & 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" name="gScore" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br>
               - 편의 시설 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview" name="pScore" min="1" max="10" step="1">/&nbsp;&nbsp;&nbsp;10<br><br> -->
                </div><br>
               <strong style="font-size: 25px;">내용</strong><br><br>
               <div class="shadow p-3 mb-5 bg-body rounded" style="width:800px; margin-left: -135px;">
               		<textarea name="reviewText" id="treview" style="width: 440px; height: 150px; margin-bottom: -30px; border: 0;" placeholder="후기를 입력해주세요 ✎"></textarea><br><br>
               </div>
               <br>
            
                <div align = "center">
                    <button type = button name = "deleteMember" class = "btn btn-secondary btn-lg btn-outline-dark" 
                    	onclick="reviewUpdate();"  style="margin-top: -25px; width: 100px; background-color: black; color: white;">등록</button>
                </div>
            </form>
        </div>
    </div>
    <br><br><br><br>
    <script>
    
    	function reviewUpdate(){
	              
	            	Swal.fire({
	                    title: '후기를 등록하시겠습니까?',
	                    icon: 'warning',
	                    showCancelButton: true,
	                    confirmButtonColor: '#3085d6',
	                    cancelButtonColor: '#d33',
	                    confirmButtonText: '등록',
	                    cancelButtonText: '취소'
	                }).then((result) => {
	                    if (result.isConfirmed) {
	                        Swal.fire({
	                        		title: '등록이 완료되었습니다.',
	                        		icon:'success',
	                        		customClass: {
	                        		    confirmButton: 'swal2-confirm swal2-styled swal2-jong',
	                        		    cancelButton: 'btn btn-danger'
                  		  			},		
	                        }).then((result) => {
	                        	if(result.isConfirmed){
	    		            		$("#checkReview").submit();
	                        		
	                        	}  		                        	
	                        });
	                    }
	                });
	            	
	       		
        } 
  
    			
    </script>
    
</body>
</html>