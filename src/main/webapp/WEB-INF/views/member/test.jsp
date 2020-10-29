<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!doctype html>
<html lang="ko">

<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>손만두</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <!-- c:set 설정 -->
    <c:set var="contextPath"
   value="${ pageContext.servletContext.contextPath }" scope="application" />
    
    
    
    

     <!-- 합쳐지고 최소화된 최신 CSS -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

     <!-- 부가적인 테마 -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
     <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- 캘린더 전용 -->
     <script src="https://code.jquery.com/jquery-3.2.1.js"></script>

        <link rel="stylesheet" href="${ contextPath }/resources/css/jquery-ui.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>


        <script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>



        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

        <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

        <script src="${ contextPath }/resources/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
     
        <!-- 바로 위까지 -->
        <script type='text/javascript'>

            $(function(){
        
                $('.input-group.date').datepicker({
        
                    calendarWeeks: false,
        
                    todayHighlight: true,
        
                    autoclose: true,
        
                    format: "yyyy/mm/dd",
        
                    language: "kr"
        
                });
        
            });

         
        
            </script>

            


    <style>
        header,
        nav,
        section,
        article,
        aside,
        footer {
            /*border: 1px solid rgb(236, 159, 159);*/
            box-sizing: border-box;
            display: block;
        }

        body {
            width: 100%;
            background: white;
            margin: auto;
        }

        header {
            width: 100%;
            height: 150px;
        }

        nav {
            width: 100%;
            height: 70px;
        }

        #content {
            width: 100%;
            /* border: 1px rgb(236, 159, 159) solid; */
        }

        footer {
            width: 100%;
            height: 150px;
            float: left;
            background: rgb(145, 145, 145);
        }

        header>section {
            float: left;
        }


        #footer1 {
            width: 80%;
            height: 30%;
            padding: 1px;
            width: 80%;
            float: left;
        }

        #footer2 {
            width: 80%;
            height: 70%;
            width: 80%;
            float: left;
        }

        #footer3 {
            width: 20%;
            height: 70%;
            float: left;
        }

        .content1 {
            width: 100%;
            height: 1000px;
            /* border: 1px rgb(236, 159, 159) solid;  */

        }

        #img1,
        #img2,
        #img3 {
            width: 500px !important;
            height: 400px !important;
            margin: auto;
        }

        .carousel {
            width: 100%;
        }


      
      

        /* 로고 */
        #logo_img {
            display: block;
            margin: auto;
            margin-top: 20px;
        }

        /* 로고 */
       

        /* 하단 풋터 부분 */
        #footer1>a {
            text-decoration: none;
            font-weight: 600;
            line-height: 25px;
            color: black;
            margin: 0 10px;
        }

        #footer1>a:hover {
            color: deepskyblue;
        }

        #footer2>p {
            margin: 0;
            font-size: 12px;
        }

        #footer_logo {
            float: left;
            margin-right: 30px;
            width: 300px;
            height: 50px;
        }

        #footer3>* {
            margin-left: 25px;
        }

        /* 하단 풋터 부분 */

        /* 영역 나누기 */
        #stay1 {
            width: 100%;
            border: 1px white solid;
            background: rgb(145, 145, 145);
        }

        #stay2 {
            width: 100%;
            border: 1px white solid;
            background: rgb(197, 197, 197);
        }

        #stay_footer {
            width: 100%;
            height: 500px;
            border: 1px black solid;
            background: rgb(145, 145, 145);
        }

        #wrap_stay {
            width: 1500px;
            margin: auto;
        }

        #manager01 {
            width: 80%;
            height: 80%;
            border: 3px solid black;
            margin: auto;
            margin-top: 40px;
            background: white;
        }

        #content1-1 {
            width: 80%;
            margin: auto;
            margin-top: 130px;
        }

        #content1-h1-1 {
            width: 290px;
            align-content: center;
            margin: auto;
        }

        .manager-formQ1 {
            width: 20%;
            height: 100%;
            display: block;
            float: left;
            text-align: center;
        }

        .manager-formQ1 p{
            font-size: 20px;
            margin-top: 30px;
        }

        #manager02 {
            width: 700px;
            height: 667px;
            margin-top: 50px;
            margin-left: 50px;
            display: block;


        }

        #manager03 {
            width: 350px;
            height: 180px;
            display: block;
            margin-left: 50px;
            margin-top: 50px;
        }

        #manager04 {
            width: 350px;
            height: 180px;
            display: block;
            margin-left: 50px;
            margin-top: 50px;
            border: none;
            
        }

        /* manager04 의 내부 4개 div */
        
        .manager04-class{
            height: 50%;
            float: left;
            border: 1px solid black;
            
        }

        #manager04-1, #manager04-3{
            width: 30%;
        }
        #manager04-2, #manager04-4{
            width: 70%;
        }

        #manager04-5{
            width:30%;
            height: 20%;
            border: 1px solid black;
            float: left;
            margin-left: 50px;
            margin-top: 100px;
        }


            /* 위 까지가 캘린더 */

        /* 영화 상영 선택 */

      

        /* 상영 취소 버튼 */
        #button-1{
            margin-left: 90%;
            margin-top: -50px;
        }

        /* 드롭 바 */
        #dropdownMenu1{
            width: 100%;
        }
        #dropdown-a{
            width: 330px;
        }

        /* 달력 부분 */

        #container-1{
            width: 100%;
            height: 100%;
        }

        .datepicker{
            top:420px !important;
            width: 650px;
            height: 620px;
        }

        .datepicker table tr td, .datepicker table tr th {
        text-align: center;
        width: 30px;
        height: 30px;
        border-radius: 4px;
        border: none;
        font-size: 30px;
        }

        .datepicker .datepicker-switch {
            width: 550px;
        }

        .table-condensed>tbody>tr>td, .table-condensed>tbody>tr>th, .table-condensed>tfoot>tr>td, .table-condensed>tfoot>tr>th, .table-condensed>thead>tr>td, .table-condensed>thead>tr>th {
            padding: 5px;
            padding-top: 25px;
        }

        
    </style>
</head>



<body>
   
     
    <section id="content">
        <div id="stay2">
            <div id="wrap_stay">
                <div class="content1">
                    <!-- 내부 시작 부분 -->
                    <div id="content1-1">
                        <h1 id="content1-h1-1" style="align-content: center">지점 수익 관리</h1>
                    </div>
                    <div id="manager01">
                        <div class="manager-formQ1" id="manager02">
                               
                            <!--아래부터 캘린더 코드-->
                            <div id="calendar-wrap">
                                    <div class="container" id="container-1">

                                            <div class="input-group date">
                                    
                                                <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    
                                            </div>
                                    
                                        </div>
                            </div>
                        </div>
                        <!-- 위 까지가 캘린더 코드 -->
            
                        <div class="manager-formQ1" id="manager04">
                            <!-- 지점 선택 영역 -->
                            <div class="manager04-class" id="manager04-1"> <!-- 총 매출 -->
                               <p>총 매출</p>
                            </div>
                            <div class="manager04-class" id="manager04-2">
                                <p>123,123,322원</p>
                            </div>
                            <div class="manager04-class" id="manager04-3"> <!-- 기간 매출 -->
                                <p>기간 매출</p>
                            </div>
                            <div class="manager04-class" id="manager04-4">
                                <p>123,123,322원</p>
                            </div>

                           
                        </div>

                        <div id="manager04-5">
                              <select id ="dropdownMenu1" name="dd2" onmousedown="this.value='';" onchange="jsFunction(this.value);">
                                <option value='강남' id="dropdown-a">강남</option>
                                <option value='건대' id="dropdown-a">건대</option>
                                <option value='서울대입구' id="dropdown-a">서울대입구</option>
                                <option value='홍대입구' id="dropdown-a">홍대입구</option>
                             </select>

                        </div>
                        <!-- 위 까지가 지점 선택 영역-->

                        <button type="button" class="btn btn-primary" id="button-1">상영 취소</button>

                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="stay_footer">
        <div id="wrap_stay">
            <footer>
                <div id="footer1">
                    <a href="#">회사소개</a> |
                    <a href="#">이용약관</a> |
                    <a href="#">개인정보이용방침</a> |
                    <a href="#">고객센터</a>
                </div>
                <div id="footer2">
                    <img src="${ contextPath }/resources/images/logo_white.png" id="footer_logo">
                    <p>
                        서울 특별시 테헤란로 10길 9 (우)06234 ARS 1544-XXXX<br>
                        대표자명 안태상 개인정보보호책임자 안태상 사업자등록번호 XXX-XX-XXXXX · 통신판매업신고번호 제 833호<br>
                        COPYRIGHT@Kasscinema, Inc, All rights reserved
                    </p>
                </div>
                <div id="footer3">
                    <a>F</a>
                    <a>Y</a>
                    <a>I</a>
                </div>
            </footer>
        </div>
    </div>



</body>

</html> --%>