<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>개인근태 조회</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <style>


        .profile{
            width: 80px;
            height: 80px;
            margin-right: 30px;
        }
        .approval, .schedule, .notice, .board{
            width: 48%;
            height: 48%;
            margin: 6px;
            box-sizing: border-box;
            display: inline-block;
        }
        .icons{
            width: 50%;
            height: 50%;
            
        }
        .aside button{
            width: 100%;
            height: 11%;
            background: none;
            border: none;
            color: white;
            float: left;
        }
        .aside button:hover{
            background: #1e87e4;
        }
        .top_profile button{
            margin-top: 30px;
            margin-right: 20px;
        }
        .dropdown-toggle{
            border: none;
            background: none;
        }
        .menubar button{
            border: none;
            background: none;
            width: 100%;
            height: 50px;
            margin-top: 20px;
        }
        .menubar button:hover{
            color: #1e87e4;
            font-weight: bold;
        }
        #selectedMenu{
            background: #1e87e4;  
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }
        /* 페이징바 */
        .page_wrap {
        text-align:center;
        font-size:0;
        }
        .page_nation {
        display:inline-block;
        }
        .page_nation .none {
        display:none;
        }
        .page_nation a {
        display:block;
        margin:0 3px;
        float:left;
        border:1px solid #e6e6e6;
        width:28px;
        height:28px;
        line-height:28px;
        text-align:center;
        background-color:#fff;
        font-size:13px;
        color:#999999;
        text-decoration:none;
        }
        .page_nation .arrow {
        border:1px solid #ccc;
        }
        .page_nation .pprev {
        background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
        margin-left:0;
        }
        .page_nation .prev {
        background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
        margin-right:7px;
        }
        .page_nation .next {
        background:#f8f8f8 url('img/page_next.png') no-repeat center center;
        margin-left:7px;
        }
        .page_nation .nnext {
        background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
        margin-right:0;
        }
        .page_nation a.active {
        background-color:#42454c;
        color:#fff;
        border:1px solid #42454c;
        }
        .list{
            float: left;
            width: 50%;
            height: 500px;
            text-align: center;
            margin-top: 20px;
        }
        .list1{
            text-align: left;
        }
        .pasing{
            text-align: center;
        }
        tr,td{
            text-align: center;
        }
        #test{
            margin-top: 10px;
        }
        .cal{
        	width: 250px;
        }

    </style>
</head>

<body>
    <jsp:include page="../common/menubar.jsp" />
    <div class="section"><br>
       <jsp:include page="../common/pteammenu.jsp" />
        <div class="section1">
            <div class="menubar">
                <div class="menubar">
                    <button  onclick="location.href='employeeE.do'">사원 관리</button>
                    <button onclick="location.href='dept.do'">부서 관리</button>
                    <button id="selected" onclick="location.href='attend.do'">근태 관리</button>
                </div>
            </div>
        </div>
        <div class="section2">
            
            <div id="mainContent">
                <div class="list">
                <form action="searchAttend.do" name="Form" method="get">
                    <br><br><br><br><br><br>
                    <jsp:useBean id="now" class="java.util.Date" />
         			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                    <input type="date" name="date" class="cal" max="${today}">
                    <br><br>
					<select id="dName" class="Name" name="dName">
						<option>----</option>
						<c:forEach var="d" items="${ dList }">
							<option class="ops" value="${ d.dName }">${ d.dName }</option>
						</c:forEach>
					</select>
                	<br>
                	<button type="submit" class="btn btn-secondary btn-sm">검색</button>
                	</form>
                </div>
                
                <div class="list list1">
                        <p class="title" ><br><br>근태 조회</p>
                        <table class="table table-hover">
                                <thead class="thead-light">
                                    <tr>
                                        <th colspan="4">날짜 : ${ day }</th>
                                    </tr>
                                </thead>
                                <thead class="thead-light">
                                    <tr>
                                        <th>부서명</th>
                                        <th>이름</th>
                                        <th>출근</th>
                                        <th>퇴근</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                    <c:forEach var="e" items="${ Ylist }">
                                    <c:if test="${ e eq null }">
                                    	<th colspan="4">검색된 결과가 없습니다.</th>
                                    </c:if>
                                        <td>${ e.dName }</td>
                                        <td>${ e.eName }</td>
                                        <td>${ e.wIn }</td>
                                        <td>${ e.wOut }</td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                              </table>
                              <div class="pasing">
                              <div class="page_nation">
                                    <c:if test="${ pi.currentPage <= 1 }">
                            	<a class="arrow prev"><</a>
                            </c:if>
                            <c:if test="${ pi.currentPage > 1 }">
                            	<c:url var="before" value="searchAttend.do">
                            		<c:param name="page" value="${ pi.currentPage -1 }"/>
                            		<c:param name="dName" value="${ Ylist.dName }"/>
                            		<c:param name="date" value="${ Ylist.wIn }"/>
                            	</c:url>
                            	<a class="arrow prev" href="${ before }"><</a>
                            </c:if>
                            
                            <!-- 페이징 숫자 -->
                            <c:forEach var="p" begin="${ pi.startPage }"  end="${ pi.endPage }">
                            	<c:if test="${ p eq pi.currentPage }">
                            		<a class="active">${ p }</a>
                            	</c:if>
                            	<c:if test="${ p ne pi.currentPage }">
                            		<c:url var="pagination" value="searchAttend.do">
                            			<c:param name="page" value="${ p }"/>
                            			<c:param name="dName" value="${ Ylist.dName }"/>
                            			<c:param name="date" value="${ Ylist.wIn }"/>
                            		</c:url>
                            		<a href="${ pagination }" class="active">${ p }</a>
                            	</c:if>
                            </c:forEach>
                            
                            <c:if test="${ pi.currentPage >= pi.maxPage }">
                            	<a class="arrow next">></a>
                            </c:if>
                            <c:if test="${ pi.currentPage < pi.maxPage }">
                            	<c:url var="after" value="searchAttend.do">
                            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
                            		<c:param name="dName" value="${ Ylist.dName }"/>
                            		<c:param name="date" value="${ Ylist.wIn }"/>
                            	</c:url>
                            	<a class="arrow next" href="${ after }">></a>
                            </c:if>
                                </div>
                            </div>
                </div>
                    
        </div>
    </div>

</body>

</html>