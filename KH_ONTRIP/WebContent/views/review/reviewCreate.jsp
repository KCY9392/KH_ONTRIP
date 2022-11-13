<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
    .outer{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 500px;
        height: 800px;
        /* border: 1px solid black;  */
        margin: auto;
        margin-top: 50px;
        box-sizing: border-box;
        text-align: center;
    }
    body{
        line-height:2em;        
        font-family:"맑은 고딕";
    }
    ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:14pt;
        height:40px;
        vertical-align:middle;
        line-height:30px;
    }

    #ulTable {margin-top:10px;}
    

    #ulTable > li:first-child > ul > li {
        background-color:#c9c9c9;
        font-weight:bold;
        text-align:center;
    }

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
    }
    #ulTable > li > ul > li { 
        float:left;
        font-size:10pt;
        border-bottom:1px solid silver;
        vertical-align:baseline;
    }    

    #ulTable > li > ul > li:first-child               {width:10%;} /*No 열 크기*/
    #ulTable > li > ul > li:first-child +li           {width:45%;} /*제목 열 크기*/
    #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성자 열 크기*/
    #ulTable > li > ul > li:first-child +li+li+li+li{width:10%;} /*조회수 열 크기*/

    #divPaging {
        clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
    }

    #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
    }

    #liSearchOption {clear:both;}
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px;

    }
    #title{
        font-size: 30px;
    }
    #btn{
        height: 30px;
        width: 100px;
    }
</style>

</head>
<body>
    <br>
    <div class="outer">
        <ul>
            <p id="title"><strong>♥&nbsp;찜 수   : 539</strong></p> 
            <hr width="90%" style="float: left;"><br>
            <button class = "btn btn-secondary btn-sm" id="btn">후기작성</button><br><br>
            <li><strong>2022-11-13 후기들</strong></li>
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>번호</li>
                            <li>이용시설</li>
                            <li>날짜</li>
                            <li>작성자</li>
                        </ul>
                    </li>
                    <li>
                        <ul>
                            <li>1</li>
                            <li>신라호텔</li>
                            <li>2022-11-13</li>
                            <li>송지호</li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>2</li>
                            <li>롯데호텔</li>
                            <li>2022-11-12</li>
                            <li>백지호</li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>3</li>
                            <li>조선호텔</li>
                            <li>2022-11-11</li>
                            <li>한지호</li>
                        </ul>
                    </li>                                       
                </ul>
            </li>
            <br><br>
            <li>
                <div id="divPaging">
                    <div>◀</div>
                       <div><b>1</b></div>
                    <div>2</div>
                    <div>3</div>
                    <div>4</div>
                    <div>5</div>
                    <div>▶</div>
                </div>
            </li>
        </ul>
    </div>
</body>
</html>