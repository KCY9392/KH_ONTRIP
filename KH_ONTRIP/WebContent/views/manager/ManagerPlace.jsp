<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer1{
        background-color: white;
        color: black;
        width: 1000px;
        height: 800px;
        margin: auto;
        margin-top: 150px;
        margin-left: 480px;
        box-sizing: border-box;
    }

    .table{
        width: 500px;
        height:200px;
        text-align: center;
        font-weight: bold;
    }

    .table thead{
        background: rgba(211, 211, 211, 0.326);
    }


    
    .selectTitle{
        text-align: center;
    }
    #mForm{
        border: none
    }
    #play , #eat , #sleep{
        width:315px;
        height: 53px;
        background-color: lightgray;
        border:none;
    }
    .box{
       size: big;
        width: 980px;
        height: 800px;
        margin: auto;
        display: none;
        margin: 10px;
        padding: 10px;
    }
    
    .num1{
       width:100px;   
    }
    
    .num2{
       width:600px;
    }
    
    .num3{
       width:400px;
    }

   #insertPlace{
      position: absolute;    /*절대값으로 위치를 설정*/
        left: 1330px;    /* x축 */
        top: 220px;
        width:130px;
        height: 40px;
        background-color:darkseagreen;
        border:none;
   }
   
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body> 
   <%@ include file="../common/adnavbar.jsp" %>
    <%@ include file="../common/managerNavbar.jsp" %>  
    
    <div class="outer1">
        <br>
        <h1 style = "text-align : center;">메인관리</h1>
        <br>&nbsp;
        <button type="button" class="btn btn-primary btn-lg" id="insertPlace" onclick="insertPlace();">작성하기</button>
        <br><br>


        <div>
            <fieldset id = "mForm">
                <div class = "selectTitle">
                    <button type="button" class="btn btn-primary btn-lg"id = "play" name="search" onclick="show(this);">놀거리</button>
                    <button type="button" class="btn btn-primary btn-lg"id = "eat" name="search" onclick="show(this);">맛집</button>
                    <button type="button" class="btn btn-primary btn-lg"id = "sleep" name="search" onclick="show(this);">숙소</button>
    
                    <div id = "playsearch" class = "box">
                        <table class="table, table table-bordered">
                            <thead>
                                <tr>
                                    <td class="num1">번호</td>
                                    <td class="num2">시설 이름</td>
                                    <td class="num3">등록 날짜</td>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider">
                                <tr>
                                    <th scope="row">1</th>
                                    <td>낚시장</td>
                                    <td>2022-11-12</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>캠핑장</td>
                                    <td>2022-11-13</td>
                                    </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>수영장</td>
                                    <td>2022-11-13</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>번지점프</td>
                                    <td>2022-11-13</td>
                                </tr>
                                <tr>
                                    <th scope="row">5</th>
                                    <td>번지점프</td>
                                    <td>2022-11-13</td>
                                </tr>
                            </tbody>
                          </table>
                        <br>
                        ◀&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;<strong>3</strong>&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;8&nbsp;&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;10&nbsp;&nbsp;&nbsp;▶
<!--                     <div align="center" class="paging-area"> -->
               
<%--                   <% if(currentPage != 1) { %> --%>
<%--                      <button onclick="doPageClick(<%= currentPage-1 %>)">&lt;</button> --%>
<%--                   <% } %> --%>
                  
<%--                   <% for(int i = startPage; i<= endPage; i++) { %> --%>
<%--                      <% if(i != currentPage) { %> --%>
<%--                         <button onclick="doPageClick(<%=i %>)"><%= i %></button> --%>
<%--                      <% } else { %> --%>
<%--                         <button disabled><%= i %></button>    --%>
<%--                      <% } %> --%>
<%--                   <% } %> --%>
                  
<%--                   <% if(currentPage != maxPage) { %> --%>
<%--                      <button onclick="doPageClick(<%= currentPage + 1 %>)">&gt;</button> --%>
<%--                   <% } %> --%>
<!--                </div> --> 
                    </div>
                
                    <div id = "eatsearch" class = "box"> 
                        <table class="table, table table-bordered">
                            <thead>
                                <tr>
                                    <td class="num1">번호</td>
                                    <td class="num2">시설 이름</td>
                                    <td class="num3">등록 날짜</td>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider">
                                <tr>
                                    <th scope="row">1</th>
                                    <td>강릉순두부</td>
                                    <td>2022-11-12</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>부산구석집</td>
                                    <td>2022-11-13</td>
                                    </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>강남맛집</td>
                                    <td>2022-11-13</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>용산맛집</td>
                                    <td>2022-11-13</td>
                                </tr>
                                <tr>
                                    <th scope="row">5</th>
                                    <td>용산맛집</td>
                                    <td>2022-11-13</td>
                                </tr>
                            </tbody>
                          </table>
                        <br>
                        ◀&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;<strong>3</strong>&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;8&nbsp;&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;10&nbsp;&nbsp;&nbsp;▶
                    
<!--                     <div align="center" class="paging-area"> -->
               
<%--                   <% if(currentPage != 1) { %> --%>
<%--                      <button onclick="doPageClick(<%= currentPage-1 %>)">&lt;</button> --%>
<%--                   <% } %> --%>
                  
<%--                   <% for(int i = startPage; i<= endPage; i++) { %> --%>
<%--                      <% if(i != currentPage) { %> --%>
<%--                         <button onclick="doPageClick(<%=i %>)"><%= i %></button> --%>
<%--                      <% } else { %> --%>
<%--                         <button disabled><%= i %></button>    --%>
<%--                      <% } %> --%>
<%--                   <% } %> --%>
                  
<%--                   <% if(currentPage != maxPage) { %> --%>
<%--                      <button onclick="doPageClick(<%= currentPage + 1 %>)">&gt;</button> --%>
<%--                   <% } %> --%>
<!--                </div> -->
                    </div>
                
                    <div id = "sleepsearch" class = "box">
                        <table class="table, table table-bordered">
                            <thead>
                                <tr>
                                    <td class="num1">번호</td>
                                    <td class="num2">시설 이름</td>
                                    <td class="num3">등록 날짜</td>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider">
                                <tr>
                                    <th scope="row">1</th>
                                    <td>강남호텔</td>
                                    <td>2022-11-12</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>강남호텔</td>
                                    <td>2022-11-13</td>
                                    </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>강남호텔</td>
                                    <td>2022-11-13</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>강남호텔</td>
                                    <td>2022-11-13</td>
                                </tr>
                                <tr>
                                    <th scope="row">5</th>
                                    <td>강남호텔</td>
                                    <td>2022-11-13</td>
                                </tr>
                            </tbody>
                          </table>
                        <br>
                        ◀&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;<strong>3</strong>&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;8&nbsp;&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;10&nbsp;&nbsp;&nbsp;▶
                    
<!--                     <div align="center" class="paging-area"> -->
               
<%--                   <% if(currentPage != 1) { %> --%>
<%--                      <button onclick="doPageClick(<%= currentPage-1 %>)">&lt;</button> --%>
<%--                   <% } %> --%>
                  
<%--                   <% for(int i = startPage; i<= endPage; i++) { %> --%>
<%--                      <% if(i != currentPage) { %> --%>
<%--                         <button onclick="doPageClick(<%=i %>)"><%= i %></button> --%>
<%--                      <% } else { %> --%>
<%--                         <button disabled><%= i %></button>    --%>
<%--                      <% } %> --%>
<%--                   <% } %> --%>
                  
<%--                   <% if(currentPage != maxPage) { %> --%>
<%--                      <button onclick="doPageClick(<%= currentPage + 1 %>)">&gt;</button> --%>
<%--                   <% } %> --%>
<!--                </div> -->
                    </div>
                </div>
            </fieldset>
        </div>
     
        <br><br><br>
    
        <script>
         function insertPlace(){
            location.href = "<%=request.getContextPath()%>/placeinsert.bo"
         }
        
        
            function show(element){
                let tag = document.getElementsByClassName("box");
    
                for(let i=0; i<tag.length; i++){
                    if(element.id+"search" == tag[i].id){
                        tag[i].style.display = "block";
                    }else{
                        tag[i].style.display = "none";
                    }
                }
            }

         $(function(){
            $(".list-area>tbody>tr").click(function(){
               // 클릭시 해당 공지사항의 번호를 넘겨야함.
               // 해당 tr요소의 자손중에서 첫번째 td의 영역의 내용이 필요.
               
               let bno = $(this).children().eq(0).text();// 1 , 2
               //현재내가클릭한tr의 자손들중 0번째에 위치한 자식의 textnode내용을 가져온다.
               
               //요청할 url?키=밸류&키=밸류&키=밸류
               // 물음표 뒤의 내요을 쿼리스트링이라고 부른다. => 직접 만들어서 넘겨야함.
<%--                location.href= '<%=contextPath %>/detail.bo?bno='+ bno;             --%>
            });
         })
         
         function doPageClick(currentPage){
<%--             location.href = "<%=contextPath%>/list.bo?currentPage="+currentPage; --%>
         }
         
      </script>
            
    </div>

</body>
</html>