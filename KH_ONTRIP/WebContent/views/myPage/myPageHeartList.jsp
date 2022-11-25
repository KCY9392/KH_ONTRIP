<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.ontrip.heart.vo.Heart"%>
<%
	ArrayList<Heart> htList = (ArrayList<Heart>)request.getAttribute("htList");
%>
<%
    String contextPath = request.getContextPath();
%>
<% 
	Member loginUser = (Member) session.getAttribute("loginUser");
	// 로그인전 or 로그인 실패 : null
	// 로그인 성공후 : 로그인한 회원의 정보가 담긴 member객체.
	
	String alertMsg = (String) session.getAttribute("alertMsg");
	// 서비스 요청전 : null
	// 서비스 요청성공후 : alert로 띄워줄 메시지 문구.
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 찜목록</title>

    <link href="<%= request.getContextPath() %>/resources/css/myPageHeartList.css" rel="stylesheet" >

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
    table {
        width: 100%;
        border-collapse: collapse;
        text-align: center;
        height:500px;
    }
    table th, table td {
        border: 1px solid #444444;
        border-top: 1px solid #444444;
        border-bottom: 1px solid #444444;
        padding: 10px;
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
	    transform: translateY(80%);
	  }
	
	  to {
	    transform: translateY(0%);
	  }
	}
</style>
</head>
<body>

<%@ include file="../common/mypageNewNavbar.jsp" %>
<br><br><br> 
      
	<div class="uk-flex uk-flex-center uk-flex-middle uk-background-cover " style="margin:auto; width: 90vw; height: 60vh; background-image: url(&quot;https://www.myro.co.kr/myro_image/mainN7.jpg&quot;);">
        <h3 style="color:white; font-size:50px;">ONTRIP :</h3> &nbsp;&nbsp;&nbsp;&nbsp; 
        <h1 style="font-size:55px; color:rgb(85, 84, 84);">찜 목록</h1>
    </div>

    <br><br><br>

    <div class="uk-section uk-section-default sl-in2" style="min-width: 90vw; height:20vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="font-size:40px; font-weight:600;">OnTrip</div><br>
                <div style="color:darkgray">MAKE YOUR ROUTE OPTIMIZED</div>
            </div>
        </div>
    </div>

    <br><br><br>

      

      <div class="container2" style="margin:auto; box-shadow:0 0 10px 1px rgb(124, 179, 218);
      			 width:1200px; padding-bottom:30px; padding-top:30px;">
        <div class="center" style="width:1200px; height:750px; margin:auto;">
                <div class="centerTitle" style="text-align: center; margin-top:20px;">
                    <h2 style="font-size:40px; font-weight:bold;]">찜목록</h2>
                </div>
                <br><br>

                <div class="centerDiv">
                  <div class="table-div">
                   <form action="<%=request.getContextPath() %>/deleteHeart.me?memberNo=<%=loginUser.getMemberNo() %>" method="post">
                    <table style="border:1px solid black;">
                        <tr class="t0">
                            <th>
                                카테고리명
                            </th>
                            <th>
                                이미지
                            </th>
                            <th>
                                이름
                            </th>
                            <th>
                                선택한 날짜
                            </th>
                            <th>
                                전체선택 <input type="checkbox" id="cbx_chkAll"></input>
                            </th>
                        </tr>
                        <% if(!htList.isEmpty()) { %>
							<% for(int i=0; i<htList.size(); i++){ %>
		                        <tr class="t1">
		                            <td><%=htList.get(i).getCategoryName() %></td>
		                            <!-- value값은 일부러 만들어 놓은거라 밑에 주석되어있는 코드를 쓰면 됨. -->
		                            <td style=" width: 400px; height:300px;"><img src="<%= request.getContextPath() %>/<%=htList.get(i).getFilePath()+htList.get(i).getChangeName() %>" style="width:100%; height:100%;"></td>
		                            <td><%=htList.get(i).getPlaceName() %></td>
		                            <td><%=htList.get(i).getHeartDate() %></td>
		                            <td><input type="checkbox" name="placeName" value="<%= htList.get(i).getPlaceName() %>"></td>
		                        </tr>
		                        <% } %>
		                  <% } %>
		                  <% if(!htList.isEmpty()){ %>
                    	 	<button type="submit" class="btn btn-danger" style="margin-left:90%; background-color: gray;">선택삭제</button> 
							<%} %>


                      
                        
                    </table>
						</form>
                  </div>                                      

                </div>
                <br>
                <!-- 모달창 -->
<!--                 <div class="main-bg"> -->
<!--                     <button id="login" class="btn btn-danger" style="margin-left:90%; background-color: gray;">선택삭제</button> -->
<!--                   </div> -->
              

<!--                 <div class="black-bg"> -->
<!--                   <div class="white-bg"> -->
            
<!--                     <h4>찜목록</h4> -->
                    
<!--                     <form action="#"> -->
<!--                       <div class="my-3"> -->
<!--                         <span>선택한 목록을 삭제하시겠습니까?</span> -->
<!--                         </div> -->
<!--                         <button type="submit" class="btn btn-primary btn-color1" id="send">확인</button> -->
<!--                         <button type="button" class="btn btn-danger btn-color2" id="close" style="background-color:grey;">취소</button> -->
<!--                     </form>  -->
                  
<!--                   </div> -->
<!--                 </div>  -->
            
            </div>
        </div>

	<br><br><br><br>

        <script>

            $('#login').on('click', function(){
              $('.black-bg').addClass('show-modal');
              $('.table-div').css('opacity', '0.3');
              $('.table-div').css('transition', '200ms');
            })
            $('#close').on('click', function(){
              $('.black-bg').removeClass('show-modal');
              $('.table-div').css('opacity', '1');
            })
      
          </script>
          
          <script type="text/javascript">
			$(document).ready(function() {
				$("#cbx_chkAll").click(function() {
					if($("#cbx_chkAll").is(":checked")) $("input[name=placeName]").prop("checked", true);
					else $("input[name=placeName]").prop("checked", false);
				});
				
				$("input[name=placeName]").click(function() {
					var total = $("input[name=placeName]").length;
					var checked = $("input[name=placeName]:checked").length;
					
					if(total != checked) $("#cbx_chkAll").prop("checked", false);
					else $("#cbx_chkAll").prop("checked", true); 
				});
			});

		</script>
</body>
</html>