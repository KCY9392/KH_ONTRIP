<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <!-- animate.style -->
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
  
    <title>아이디 찾기 / 비밀번호 찾기</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
		margin-top:0px;
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 30px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
	.title{
			font-size: 60px;
			margin-top: -20px;
			font-weight: 900;
			color: rgb(130, 202, 164);
			text-align: center;
		}
    #Id, #Pwd{
        background-color: #b9bdb7;
        font-weight: 900;
        font-size: large;
        border: 1px solid lightgray;
    }

    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}

    .card-body{
        margin-left: 150px;
    }
    #btn-Yes{
        background-color: rgb(130, 202, 164);
        border: none;
    }
    
    #btn-log{
    	background-color: rgb(214, 214, 214);
        border: none;
    }

	#btn_group{
        display:flex;
    }

	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}

    .text2{
    	color : rgb(0, 0, 0);
    }

    .box2{
        display: none;
    }

    p{
        font-size: large;
    }
    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
    <script>
		let msg = "<%= alertMsg %>";
		
		if(msg != "null"){
			alert(msg);
			// 알림창을 띄워준후 session에 담긴 해당메세지는 지워줘야함.
			// 안그러면 menubar.jsp가 로딩될때마다 매번 alert가 계속 뜰것
			
			<% session.removeAttribute("alertMsg");%>
		}
	</script>

<br><br>
	<div class="card align-middle" style="width:50rem; height: 46rem; margin-top:0;">
		
		<div style="margin-top:60px; text-align: center;">
			<p  class="title"
			style="font-size: 60px;
					font-weight: 1000;
					color: rgb(130, 202, 164);">On Trip</p>
		</div>
        
        <br>
        
        <div class = "selectTitle">
            <div id="btn_group" style="text-align:center;">
                <button type="button" class="btn btn-sm btn-primary btn-block" style="height:50px" id = "Id" name="find" onclick="show(this); ">아이디 찾기</button>
                <button type="button" class="btn btn-sm btn-primary btn-block" style="height:50px; margin-top:-0.1px;" id = "Pwd" name="find" onclick="show(this);">비밀번호 찾기</button>
            </div>
            <br>
        </div>
        
        <br>
        
		<div class="card-body" style="width:30rem; text-align:center">
		      
		      <form action="<%=request.getContextPath() %>/findId.me" id="find-id" method="post" class="form-signin">
		  		 
		        <div id="Idmember" class="box">
		            <b><p class="text2">아이디 찾기</p></b>
		            <input type="text" name="memberName" id="name" class="form-control" placeholder="이름" required autofocus><BR>
		            <input type="text2" id="phone" name="phone" class="form-control" placeholder="휴대전화" required><br>
		                <p class="check" id="check1">${check}</p><br/>
		            <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">아이디 찾기</button>
		            <button id="btn-log" class="btn btn-lg btn-primary btn-block" type="button" onclick="goLogin();">로그인 하러가기</button>
		        </div>
		
		      </form>

		       <form action="<%=request.getContextPath() %>/findPwd.me" id="find-pwd" method="post" class="form-signin">
		            <div id = "Pwdmember" class = "box box2"> 
		                <b><p class="text2">비밀번호 찾기</p></b>
		                <input type="text" name="memberName" id="pname"class="form-control" placeholder="이름"><br>
		                <input type="text2" name="memberId" id="pId" class="form-control" placeholder="아이디"><br>
		                <input type="text2" name="phone" id="pphone" class="form-control" placeholder="휴대전화"><br>
		                    <p class="check" id="check2">${check}</p><br/>
		                <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">비밀번호 찾기</button>
		                <button id="btn-log" class="btn btn-lg btn-primary btn-block" type="button" onclick="goLogin();">로그인 하러가기</button>
		            </div>
		       </form>
		       
    	</div>
    	</div>
    	<p class="mt-5 mb-3 text-muted" style="text-align:center; margin-top:0">© Ontrip</p>
  		</div>
	</div>
   
  </body>

  <script type="text/javascript">

         $(function(){
            $("#Id").click();

         });

         function show(element){
        let tag = document.getElementsByClassName("box");

        if(element.id+"member" == "Idmember"){
            $('#check1').text('이름을 입력해주세요');
            $('#check1').css('color', 'red');

            $("#name").focusout(function(){
  			
              if($('#name').val() == ""){
                    $('#check1').text('이름을 입력해주세요.');
                      $('#check1').css('color', 'red');
            
              }else{
                  $('#check1').hide();
              }
              });
              
               $("#phone").focusout(function(){
              if($('#phone').val() == ""){
                    $('#check1').text('전화번호를 입력해주세요');
                      $('#check1').css('color', 'red');
              }else{
                  $('#check1').hide();
              }
              });
        }
        
        if(element.id+"member" == "Pwdmember"){
            $('#check2').text('이름을 입력해주세요');
            $('#check2').css('color', 'red');

            $("#pname").focusout(function(){
  			
              if($('#pname').val() == ""){
                    $('#check2').text('이름을 입력해주세요.');
                      $('#check2').css('color', 'red');
            
              }else{
                  $('#check2').hide();
              }
              });
            

              $("#pId").focusout(function(){
              if($('#pId').val() == ""){
                    $('#check2').text('아이디를 입력해주세요');
                      $('#check2').css('color', 'red');
              }else{
                  $('#check2').hide();
              }
              });

               $("#pphone").focusout(function(){
              if($('#pphone').val() == ""){
                    $('#check2').text('전화번호를 입력해주세요');
                      $('#check2').css('color', 'red');
              }else{
                  $('#check2').hide();
              }
              });
        }

        for(let i=0; i<tag.length; i++){
            if(element.id+"member" == tag[i].id){
                tag[i].style.display = "block";
                tag[i].style.animation = "fadeIn";
                tag[i].style.animationDuration = "1s";
            }else{
                tag[i].style.display = "none";
            }
        }

    }
         
         function goLogin(){
        	 
        	 location.href = "<%=request.getContextPath()%>";
         }
  </script>
</html>