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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립 : 아이디/비밀번호 찾기</title>
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
    <style>
        .container{
            margin:auto;
            text-align: center;
            width: 700px;
            height: 700px;
            
        }
        h1{
            color:rgb(155, 205, 138);
            font-size:40px;
        }
        input{
            margin: 10px;
        }
        .box{
            width: 100%;
            height: 100%;
            margin: auto;
            display: none;
        }
        .selectTitlet>input{
            height:30px;
            border:1px solid #999;
            border-radius: 5px;
        }
        .btn{
            margin-top: 40px;
            background-color:rgb(196, 199, 195) ;
            border:1px solid black;
            width:150px;
            height:40px;
            margin-left: 10px;
            margin-right: 10px;
            font-weight: 900;
            border-radius: 5px;
        }
        .btn:hover{
            cursor: pointer;
            background-color:rgb(187, 190, 186) ;
        }
        .btn:active{
            background-color:rgb(156, 158, 155);
        }
        span{
            font-weight: 600;
        }
        .Id{
            margin-top: 40px;
            background-color:rgb(196, 199, 195) ;
            border:1px solid black;
            width:150px;
            height:40px;
            margin-right: -4px;
            font-weight: 900;
            border-radius: 2px;
        }
        .Id:hover{
            cursor: pointer;
            background-color:rgb(228, 231, 227) ;
        }
        .Id:active{
            background-color:rgb(156, 158, 155);
        }
        .Pwd{
            margin-top: 40px;
            background-color:rgb(196, 199, 195) ;
            border:1px solid black;
            width:150px;
            height:40px;
            margin-left: -3px;
            font-weight: 900;
            border-radius: 2px;
        }
        .Pwd:hover{
            cursor: pointer;
            background-color:rgb(228, 231, 227) ;
        }
        .Pwd:active{
            background-color:rgb(156, 158, 155);
        }
        .input{
            width:250px;
        }
        
    </style>
</head>
<body>
	<script>
		let msg = "<%= alertMsg%>"; // let msg = 성공적으로 로그인이 되었습니다.
		
		if(msg != "null"){
			alert(msg);
			// 알림창을 띄워준후 session에 담긴 해당메세지는 지워줘야함.
			// 안그러면 menubar.jsp가 로딩될때마다 매번 alert가 계속 뜰것
			
			<% session.removeAttribute("alertMsg");%>
		}
	</script>
    <div class="container">
    <h1>On Trip</h1> 
    <br>

        <div class = "selectTitle">
            <div id="btn_group">
                <button type="button" class = "Id" id = "Id" name="find" onclick="show(this); ">아이디 찾기</button>
                <button type="button" class = "Pwd" id = "Pwd" name="find" onclick="show(this);">비밀번호 찾기</button>
            </div>
            <form action="<%=request.getContextPath() %>/findId.me" id="find-id" method="post">
	              <div id = "Idmember" class = "box">
	                  <br><br>
	                  <span class="memberName">이름 :</span>
	                  <input type="text" id="name" name="memberName" placeholder="이름" required><br><br>
	                  <span class="phone">휴대전화 :</span>
	                  <input type="text" id="phone" name="phone" placeholder="휴대전화" required><br><br>
	
	                  <button type="submit" class="btn">조회</button>
	              </div>
              </form>
              <form action="<%=request.getContextPath() %>/findPwd.me" id="find-pwd" method="post">
	              <div id = "Pwdmember" class = "box box2"> 
	                  <br><br>
	                  <span class="memberName">이름 :</span>
	                  <input type="text" name="memberName"><br><br>
	                  <span class="memberId">아이디 :</span>
	                  <input type="text" name="memberId"><br><br>
	                  <span class="phone" >휴대전화번호 :</span>
	                  <input type="text" name="phone"><br><br>
	
	                  <button type="submit" class="btn">조회</button>
	              </div>
	          </form>
        </div>
    </div>

<br><br><br>

<script>
    function show(element){
        let tag = document.getElementsByClassName("box");

        for(let i=0; i<tag.length; i++){
            if(element.id+"member" == tag[i].id){
                tag[i].style.display = "block";
            }else{
                tag[i].style.display = "none";
            }
        }
    }
    
</script>


</body>
</html>