<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        width: 1000px;
        height: 800px;
        /* border: 1px solid black; */
        margin: auto;
		margin-top:120px;
        box-sizing: border-box;
        text-align: center;
    }
    input{
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
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
<script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">j10
</script>
</head>
<body>
<%@ include file="../common/mypageNewNavbar.jsp" %>
<br><br><br><br>

	<div class="uk-section uk-section-default" style="min-width: 90vw; height:28vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="font-size:40px; font-weight:600;">OnTrip</div><br>
                <div style="color:darkgray">MAKE YOUR ROUTE OPTIMIZED</div> <br><br>
                <div>
                	<span>회원정보</span> > <span style="color: coral; font-size:16px; font-weight:600;">비밀번호 확인</span>
                </div>
            </div>
        </div>
    </div>

    <div class="outer1">
        <h1 style = "text-align : center;">비밀번호 확인</h1>
        <br><br><br>
        <form>
            <div align="center">
                <table align="center">
                    <tr>
                        <td>비밀번호 : &nbsp;</td>
                        <td><input type="password" name="checkPwd"></td>
                    </tr>
                </table>
            </div>
            <div align = "center">
                <br><br>
                <button type = "button" name = "checkPwdb" class = "btn btn-secondary btn-sm btn-alert" 
                	style="font-size:17px; width:100px; height:40px;">확인</button>
            </div>
        </form>
    </div>
    
    <script>
    
	    
    
    	$(function(){
    		$("[name=checkPwdb]").click(function(){
    			
    			if($("input:password[name=checkPwd]").val() == "<%=loginUser.getMemberPwd()%>"){

    			            Swal.fire({
    			                icon: 'success',
    			                title: '회원정보가 확인되었습니다',
    			                text: '다음페이지로 이동합니다.',
    			            });
    			
						$('.swal2-confirm').click(function(){
    						location.href = "<%=request.getContextPath()%>/update.me";							
						});				

    			} else {
    				
    			            Swal.fire({
    			                icon: 'error',
    			                title: '회원정보가 일치하지않습니다.',
    			                text: '비밀번호를 다시 입력해주세요.',
    			            });
    			        
    				
    				$("input:password[name=checkPwd]").focus();
                    $("input:password[name=checkPwd]").val("");
    			}
    		});
    	})
    	
    </script>

</body>
</html>