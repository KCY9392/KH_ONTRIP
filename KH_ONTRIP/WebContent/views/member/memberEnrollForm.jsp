<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립 : 회원가입</title>
    <script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>
    <style>
        body{
            margin:0;
            text-align: center;
        }
        p{
            font-weight: bold;
        }
        h1{
            color:rgb(155, 205, 138);
            font-size:40px;
        }
        input{
            margin: 10px;
        }
        textarea{
            resize: none;
            border: solid 2px rgb(155, 205, 138);
            border-radius: 5px;
            color:rgb(121, 119, 119);
        }
        span{
            font-weight: 600;
        }
        .btn-1{
            background-color:rgb(155, 205, 138) ;
            border:none;
            width:150px;
            height:40px;
            margin-left: 10px;
            margin-right: 10px;
            font-weight: 900;
            border-radius: 5px;
        }

        .btn-1:hover{
            cursor: pointer;
            background-color: rgb(139, 190, 127);
        }
        .btn-1:active{
            background-color: rgb(164, 224, 150);
        }
        .centerText{
            margin: 0px;

        }
        .centerText>input{
            height:30px;
            border:1px solid #999;
            border-radius: 5px;
        }
        .select_gender{
            width:65px;
            padding: .6em .5em;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: 1px solid #999;
            border-radius: 5px;
        }
        .select_birth{
            width: 97px;
            padding: .4em .5em;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: 1px solid #999;
            border-radius: 5px;
        }
        .span_name{
            margin-left: -14px;
        }
        .span_birth{
            margin-left: 5px;
        }
        .span_id{
            margin-left:70px;
        }
        .span_pwd{
            margin-left: -35px;
        }
        .span_pwd2{
            margin-left: -72px;
        }
        .span_phone{
            margin-left: -35px;
        }
        .input{
            width:250px;
        }
        .btn_2{
            background-color:rgb(155, 205, 138);
            border:1px solid black;
            border-radius: 5px;
            width:80px;
            height:33px;
            font-weight: 400;
        }
        .btn_3{
            margin-top: 40px;
            background-color:rgb(155, 205, 138) ;
            border:1px solid black;
            width:150px;
            height:40px;
            margin-left: 10px;
            margin-right: 10px;
            font-weight: 900;
            border-radius: 5px;
        }
        .btn_2:hover{
            cursor: pointer;
            background-color:rgb(194, 232, 181);
        }
        .btn_2:active{
            background-color:rgb(173, 222, 155);
        }
        .btn_3:hover{
            cursor: pointer;
            background-color:rgb(194, 232, 181);
        }
        .btn_3:active{
            background-color:rgb(173, 222, 155);
        }


    </style>
</head>
<body>
    <div class="container">
        <h1>On Trip</h1> 
        <br>
        <form action="<%=request.getContextPath() %>/insert.me" id="enroll-form" method="post">
           <div class="centerText">
               <span class="span_name">여행자 이름</span>
               <input type="text" placeholder="여행자 이름" size="14" name="memberName" required>  &nbsp; &nbsp; &nbsp; &nbsp;
               <span>성별</span> &nbsp;
               <select class="select_gender" name="gender">
                   <option>성별</option>
                   <option value="남">남</option>
                   <option value="여">여</option>
               </select> <br><br>
   
               <span class="span_birth">생년월일</span> &nbsp;
               <input type="date" name="birthDate"/> <br><br>
   
               <span class="span_id">아이디</span>
               <input class="input" type="text" placeholder="아이디" name="memberId" required>
               <button class="btn_2" type="button" onclick="idCheck();">중복확인</button><br><br>
               <span class="span_pwd">비밀번호</span>
               <input class="input" type="password" placeholder="비밀번호" name="memberPwd" required><br><br>
               <span class="span_pwd2">비밀번호 확인</span>
               <input class="input" type="password" placeholder="비밀번호 확인"  required> <br><br>
               <span class="span_phone">휴대전화</span>
               <input class="input" type="text" placeholder="휴대전화번호 ( ' - ' 포함 )" name="phone" required><br>
               
               <button type="reset" class="btn_3">초기화</button>
               <button type="submit" class="btn_3" disabled name="checkSelct">가입</button>
   
               
           </div>
      </form>
    </div>
    
      <script>
         function idCheck(){
            // 아이디 입력하는 input 요소 객체
            let $memberId = $("#enroll-form input[name=memberId]");
            
            $.ajax({
               url : "idCheck.me",
               data : {checkId : $memberId.val()},
               success : function(result){
            	   if($memberId.val() == "") {
                 	  alert("아이디를 입력해주세요");
                       $memberId.focus();
                   }else if(result == "NNNNN"){ // 사용불가능한 아이디
                     alert("이미 존재하거나 회원탈퇴한 아이디입니다.");
                     $memberId.focus();
                  }else{
                     if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
                        $("button:button[name=checkSelct]").attr("disabled",false);
                     }else{ // 사용안함
                        $memberId.focus();
                     }
                  }
               },
               error : function(){
                  alert("아이디 중복체크용 ajax 통신 실패");
               }
            })
         }
      </script>
</body>
</html>