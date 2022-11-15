<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온트립(OnTrip) - 후기관리</title>
    <link rel="stylesheet" href="resources/css/review_manager.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%@ include file="../common/managerNavbar.jsp" %>  

      <br><br><br><br>
      
      <h1 style="font-weight:900; margin-left:50%; margin-top:-20px;">후기 관리</h1><br>
        <button class="btn-click" id="q" name="tb" onclick="show(this);" style="margin-left:26%;">놀거리</button>
        <button class="btn-click" id="w" name="tb" onclick="show(this);">숙소</button>
        <button class="btn-click" id="e" name="tb" onclick="show(this);">맛집</button>
       
        <div class="table1" id="qtb">
            <table class="table" id="qtb" style="width:1000px;">

                <thead>
                <tr class="table-secondary">
                    <th scope="col">번호</th>
                    <th scope="col">이용시설</th>
                    <th scope="col">날짜</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>세미프로젝트입니다1</td>
                    <td>2022-10-31 ~ 2022-10-31</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>세미프로젝트입니다2</td>
                    <td>2022-11-31 ~ 2022-10-28</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">5</th>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">6</th>
                    <td></td>
                    <td></td>
                </tr>
                <!-- 여기에 
                    <tr>
                        <th scope="row">3</th>
                        <td>kh호텔</td>
                        <td>2022-12-24 ~ 2022-12-25</td>
                    </tr>

                    이 양식으로 추가되면 됩니당.
                -->
                </tbody>
            </table>

            <br><br><br><br><br><br>

            <button class="btn btn-num1"><</button>
            <button class="btn btn-num2">1</button>
            <button class="btn btn-num3">2</button>
            <button class="btn btn-num4">3</button>
            <button class="btn btn-num5">4</button>
            <button class="btn btn-num6">></button>

        </div>


        <div class="table1 table2" id="wtb">
        <table class="table" id="wtb" style="width:1000px">
        
            
            <thead>
            <tr class="table-secondary">
                <th scope="col">번호</th>
                <th scope="col">이용시설</th>
                <th scope="col">날짜</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>세미프로젝트</td>
                <td>2022-10-31 ~ 2022-10-31</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>세미프로젝</td>
                <td>2022-11-31 ~ 2022-10-28</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">6</th>
                <td></td>
                <td></td>
            </tr>
            <!-- 여기에 
                <tr>
                    <th scope="row">3</th>
                    <td>kh호텔</td>
                    <td>2022-12-24 ~ 2022-12-25</td>
                </tr>

                이 양식으로 추가되면 됩니당.
            -->
            </tbody>
        </table>

        <br><br><br><br><br><br>

        <button class="btn btn-num1"><</button>
        <button class="btn btn-num2">1</button>
        <button class="btn btn-num3">2</button>
        <button class="btn btn-num4">3</button>
        <button class="btn btn-num5">4</button>
        <button class="btn btn-num6">></button>

    </div>


      <div class="table1 table2" id="etb">
        <table class="table" id="etb" style="width:1000px">
        
            
            <thead>
            <tr class="table-secondary">
                <th scope="col">번호</th>
                <th scope="col">이용시설</th>
                <th scope="col">날짜</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>세미프로젝트입니다1111</td>
                <td>2022-10-31 ~ 2022-10-31</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>세미프로젝트입니다2124124</td>
                <td>2022-11-31 ~ 2022-10-28</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">6</th>
                <td></td>
                <td></td>
            </tr>
            <!-- 여기에 
                <tr>
                    <th scope="row">3</th>
                    <td>kh호텔</td>
                    <td>2022-12-24 ~ 2022-12-25</td>
                </tr>

                이 양식으로 추가되면 됩니당.
            -->
            </tbody>
        </table>

        <br><br><br><br><br><br>

        <button class="btn btn-num1"><</button>
        <button class="btn btn-num2">1</button>
        <button class="btn btn-num3">2</button>
        <button class="btn btn-num4">3</button>
        <button class="btn btn-num5">4</button>
        <button class="btn btn-num6">></button>

    </div>

    <script>
        function show(element){
            let tag = document.getElementsByClassName("table1");

            for(let i=0; i<tag.length; i++){
                if(element.id+"tb" == tag[i].id){
                    tag[i].style.display = "block";
                }else{
                    tag[i].style.display = "none";
                    
                }
            }
        }
    </script>

</body>
</html>