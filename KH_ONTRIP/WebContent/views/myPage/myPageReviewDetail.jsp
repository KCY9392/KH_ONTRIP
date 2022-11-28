<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.ontrip.place.model.vo.Place , 
    com.ontrip.review.vo.Review , com.ontrip.image.vo.Image"%>
    
<%

	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	
	int revCode = Integer.parseInt((String)request.getParameter("revCode"));	
	
	ArrayList<Image> myImageList = (ArrayList<Image>)request.getAttribute("myImageList");
	
	int placeCode = (int)(request.getAttribute("placeCode"));
	
	Review r = (Review) request.getAttribute("re");
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

<!-- Alert 창  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<style>
    .outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 800px;
        height: 1280px;
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
.star-rating { width:315px; }
.star-rating,.star-rating span { display:inline-block; height:55px; overflow:hidden; background:url(views/review/star.png)no-repeat; }
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
</style>
</head>
<body>

    <%@ include file="../common/navbar.jsp" %>

    <div class="outer1 shadow p-3 mb-5 bg-body rounded">
        <br><br><br>
        <div align="center">
            <form id="checkReview" action="<%=request.getContextPath()%>/mydeleteReivew.re?memberNo=<%=memberNo %>&revCode=<%=revCode %>&placeCode=<%=placeCode %>" method="post">
                <strong style="float: left; font-size: 25px;">이용시설 : <%=r.getPlaceName()%> &nbsp;&nbsp;&nbsp;</strong> <input type="text" name="placeName" id = "review" style="height: 30px; width: 150px; border: 0px; font-size: 20; font-weight: bold;" readonly><br> 
                <!-- <hr width="60%"><br> --><br>
                <img src="<%=request.getContextPath()%>/<%=myImageList.get(0).getFilePath()%><%=myImageList.get(0).getChangeName() %>" style="width: 110%; height:330px; margin-left: -23px;" class="shadow p-3 mb-5 bg-body rounded"><br>
                <strong style="float: left;">작성일시 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs&nbsp;&nbsp;;</strong><input type="text" name="reviewSysdate" value="<%=r.getRevDate()%>" id = "review" style="height: 30px; border: 0px; font-size: 17; margin-left: -350px;"><br>
                <strong style="float: left;">작성자 :</strong> <input type="text" name = "memberId" value="<%=r.getMemberName()%>" id = "review" style="height: 30px; border: 0px; font-size: 20; font-weight: bold; margin-left: -250px;" readonly><br><br><br> 
                <div class="shadow-lg" style="width: 151.5%; margin-left: -135px;">
                    &nbsp;만족도&nbsp;&nbsp;&nbsp;<input type="number" id="updateStar" name = "updateStar" value="<%=r.getReviewStar()%>" min="1" max="5" style="width: 40px; border: 0; color: red; font-weight: bold;">/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5<br>
                    <div class="star-rating">
                		<span style="width:<%=r.getReviewStar()*2%>0%; float:left; margin-left: -5.5px;"></span>
                	</div>
                <br>
                <table>
                    <tr>
                        <td>- 청결상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" value="<%=r.getReview_c()%>"id = "numreview1" name="cScore" min="1" max="10" step="1" style="margin-left:-1px; border: 0; width: 50px; color: red; font-weight: bold;">/&nbsp;&nbsp;&nbsp;&nbsp;<td>10</td></td>
                    </tr>
                    <tr>
                        <td>- 직원 & 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview2" value="<%=r.getReview_s() %>" name="sScroe" min="1" max="10" step="1" style="border: 0; width: 50px; color: red; font-weight: bold;">/&nbsp;&nbsp;&nbsp;&nbsp;<td>10</td></td>
                    </tr>
                    <tr>
                        <td>- 편의 시설 서비스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id = "numreview3" name="pScore" value="<%=r.getReview_p() %>" min="1" max="10" step="1" style="border: 0; width: 50px; color: red; font-weight: bold;">/&nbsp;&nbsp;&nbsp;&nbsp;<td>10</td></td>
                    </tr>
                </table>
                </div><br>
               <strong style="font-size: 25px;">개선사항</strong><br>
               <div class="shadow p-3 mb-5 bg-body rounded" style="width:800px; margin-left: -136px;">
               		<input type="text" id="rtext" name="rtext" style="width: 440px; height: 150px; margin-bottom: -30px; border: 0;" value="<%=r.getRevText() %>"><br><br>
               </div>
            
               <% if(loginUser.getMemberName().equals(r.getMemberName())) { %>
                <div align = "center">
                    <button type="button" name ="deleteReivew" onclick="deleteReview();" class="btn btn-outline-warning" style="width:100px; border-radius:0;">삭제</button>
                    <button type="button" name ="updateReivew" onclick="updateReview();" class="btn btn-outline-dark" style="width:100px; border-radius:0;">수정</button>
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
	            		Swal.fire({
		                    title: '후기를 수정하시겠습니까?',
		                    icon: 'warning',
		                    showCancelButton: true,
		                    confirmButtonColor: '#3085d6',
		                    cancelButtonColor: '#d33',
		                    confirmButtonText: '수정',
		                    cancelButtonText: '취소'
		                }).then((result) => {
		                    if (result.isConfirmed) {
		                        Swal.fire({
		                        		title: '수정이 완료되었습니다.',
		                        		icon:'success',
		                        		customClass: {
		                        		    confirmButton: 'swal2-confirm swal2-styled swal2-jong',
		                        		    cancelButton: 'btn btn-danger'
	                  		  			},		
		                        }).then((result) => {
		                        	if(result.isConfirmed){
		    		            		$("#checkReview").submit();
		    		            		location.href = '<%=request.getContextPath() %>/mypageReviewList.me?memberNo=<%=loginUser.getMemberNo()%>';
		                        	}  		                        	
		                        });
		                    }
		                });	
            		}else{
            			Swal.fire({
			                icon: 'error',
			                title: '수정에 실패하였습니다.',
			                text: '다시 입력해주세요.',
			            });
            			location.href = '<%=request.getContextPath() %>/detail.bo';
            		} 
            	
            		
            		
            		
            		
            		
            	}
            	
        	})
        }
        
        
        
        function deleteReview(){
        	
       	 Swal.fire({
                title: '후기를 삭제하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '삭제',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                    		title: '삭제가 완료되었습니다.',
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