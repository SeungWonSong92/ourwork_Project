<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>OurWork</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <style>
       
       .sec{
          margin-top: 90px;
       }

        #selectedMenu{
            background: #1e87e4;  
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }

        /* 메뉴바 */
        /* 여기 a 태그*/
        .menubar a{
            padding: 6px 8px 6px 16px;
            text-decoration: none;
            font-size: 15px;
            color: rgb(52, 53, 77);
            display: block;
            border: none;
            background: none;
            width: 100%;
            text-align: left;
            cursor: pointer;
            outline: none;
            margin-top: 20px;
        }

        .approval, .schedule, .notice, .board{
            width: 48%;
            height: 48%;
            margin: 6px;
            box-sizing: border-box;
            display: inline-block;
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
        .title{
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;
            float: left;
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

        .btn-secondary{
            background: white;
            color:black;
            height: 30px;
            font-size: 14px;
            
        }
        .la1{
            text-align: left;
        }
        .select{
            width: 50%;
            display:block;
            float: left;
            height: 34px;
        }
        .sel{
            text-align: right;
        }
        .tab{
            display: none;
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
                    <button id="selected" onclick="location.href='employeeE.do'">사원 관리</button>
                    <button onclick="location.href='dept.do'">부서 관리</button>
                    <button onclick="location.href='attend.do'">근태 관리</button>
                </div>
            </div>
        </div>
        <div class="section2 sec">
            <div id="test">
                <div  class="select">
                    <input type="radio" name="tab" class="tab" id="tab1" onchange="setDisplay()" value="a">
                   <label class="btn btn-secondary la1" for="tab1">재직사원</label>
                    
                    <input type="radio" name="tab" class="tab" id="tab2" onchange="setDisplay()" value="i">
                   <label class="btn btn-secondary la1" for="tab2">퇴사사원</label>
                </div>
                <div class="select sel">
                <form action="esearch1.do" name="searchForm" method="get">
                   <input type="hidden" name="page" value="${ pi.currentPage }"/>
                   <select id="searchCondition" name="searchCondition">
                    <option value="eName"
                  <c:if test="${search.searchCondition == 'eName' }">selected
                  </c:if>>이름</option>
                    <option value="dName"
               <c:if test="${search.searchCondition == 'dName'}">selected
                  </c:if>>부서</option>
               <option value="rName"
                  <c:if test="${search.searchCondition == 'rName'}">selected
               </c:if>>직급</option>
                </select>
                    <input type="search" name="searchValue" value="${ search.searchValue }">
                   <button type="submit" class="btn btn-secondary btn-sm">검색</button>
                   <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#staticBackdrop">신입사원 승인</button>
                </form>
                </div>
            </div>
            
            <div class="content2" id="all">
                <div>
                    <table class="table table-hover">
                        <thead class="thead-light">
                            <tr>
                                <th></th>
                                <th>직급</th>
                                <th>부서</th>
                                <th>이름</th>
                                <th scope="col">입사날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                         <c:forEach var="ey" items="${ Ylist }">
                            <tr>
                                <td></td>
                                <td>
                                   ${ ey.rName }
                                </td>
                                <td>${ ey.dName }</td>
                                <td id="mContent">
                                   <c:url var="detail" value="edetail.do">
                                      <c:param name="eId" value="${ ey.eId }"/>
                                      <c:param name="page" value="${ pi.currentPage }"/>
                                   </c:url>
                                   <a href="${ detail} ">${ ey.eName }</a>
                                </td>
                                <td>${ ey.join_date }</td>
                            </tr>
                         </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <!-- 페이징 처리! -->
                <div class="page_wrap">
                        <div class="page_nation">
                            <c:if test="${ pi.currentPage <= 1 }">
                               <a class="arrow prev"><</a>
                            </c:if>
                            <c:if test="${ pi.currentPage > 1 }">
                                  <a class="arrow prev" onclick="setValue('${ pi.currentPage - 1 }');"> &lt; </a>
                            </c:if>
                            
                            <!-- 페이징 숫자 -->
                            <c:forEach var="p" begin="${ pi.startPage }"  end="${ pi.endPage }">
                               <c:if test="${ p eq pi.currentPage }">
                                  <a class="active">${ p }</a>
                               </c:if>
                               <c:if test="${ p ne pi.currentPage }">
                                  <a href="#" onclick="setValue('${ p }');">${ p }</a> &nbsp;
                               </c:if>
                            </c:forEach>
                            <!-- [다음] -->
                            <c:if test="${ pi.currentPage >= pi.maxPage }">
                               <a class="arrow next">></a>
                            </c:if>
                            <c:if test="${ pi.currentPage < pi.maxPage }">
                        <a class="arrow next" onclick="setValue('${pi.currentPage}');"> &gt; </a>
                            </c:if>
                        </div>
                   </div>
           
        
        
        <!-- 여기부터 퇴사사원입니다1!!!!!!!!!!!!!!!!!!!!!!!! -->
             </div>
            <div id="proceed" style="display: none">
                 <div>
                    <table class="table table-hover">
                        <thead class="thead-light">
                            <tr>
                                <th></th>
                                <th>직급</th>
                                <th>부서</th>
                                <th>이름</th>
                                <th scope="col">입사날짜</th>
                                <th>이메일</th>
                            </tr>
                        </thead>
                        <tbody>
                         <c:forEach var="en" items="${ Nlist }">
                            <tr>
                                <td></td>
                                <td>
                                   ${ en.rName }
                                </td>
                                <td>${ en.dName }</td>
                                <td id="mContent">
                                   ${ en.eName }
                                </td>
                                <td>${ en.join_date }</td>
                                <td>${ en.email }</td>
                            </tr>
                         </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- 페이징 처리! -->
                
                <div class="page_wrap">
                        <div class="page_nation">
                            <c:if test="${ pin.currentPage <= 1 }">
                               <a class="arrow prev"><</a>
                            </c:if>
                            <c:if test="${ pin.currentPage > 1 }">
                               <a class="arrow prev" onclick="setValue('${ pin.currentPage - 1 }');"> &lt; </a>
                            </c:if>
                            
                            <!-- 페이징 숫자 -->
                            <c:forEach var="p" begin="${ pin.startPage }"  end="${ pin.endPage }">
                               <c:if test="${ p eq pin.currentPage }">
                                  <a class="active">${ p }</a>
                               </c:if>
                               <c:if test="${ p ne pin.currentPage }">
                                  <a href="#" onclick="setValue('${ p }');">${ p }</a> &nbsp;
                               </c:if>
                            </c:forEach>
                            
                            <c:if test="${ pin.currentPage >= pin.maxPage }">
                               <a class="arrow next">></a>
                            </c:if>
                            <c:if test="${ pin.currentPage < pin.maxPage }">
                        <a class="arrow next" onclick="setValue('${pin.currentPage}');"> &gt; </a>
                            </c:if>
                        </div>
                   </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">신입사원 승인</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead class="thead-light">
                                <tr>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>버튼</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="il" items="${ Ilist }">
                                <tr>
                                    <td>${ il.eId }</td>
                                    <td>${ il.eName }</td>
                                    <td><button type="button" onclick="eao(this.value);" value="${ il.eId }" class="btn btn-secondary btn-sm">승인</button></td>
                                </tr>
                             </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        <script>
        
        function eao(eId) {
           location.href='ea.do?eId='+eId;
      }
        
          window.onload = function() {
         var tabValue = "${tabValue}";
         if(tabValue == "i"){
            $('#all').hide();
            $('#proceed').show();
            $("input:radio[name='tab'][value='i']").prop('checked', true);
         }else if(tabValue == "a"){
            $('#all').show();
            $('#proceed').hide();
            $("input:radio[name='tab'][value='a']").prop('checked', true);
         }
         
      }
          
          
          function setDisplay() {
             if($('input:radio[id=tab1]').is(':checked')){
                location.href="employeeE.do?tabValue=a&page=1";
                $('#all').show();
                $('#proceed').hide();
             }else{
                location.href="employeeE.do?tabValue=i&page=1";
                $('#all').hide();
                $('#proceed').show();
             }
      }
          
          function setValue(page) {
         var tabValue =$("input[name='tab']:checked").val();
         location.href="employeeE.do?tabValue="+tabValue+"&page="+page;
      }
          
      </script>

</body>

</html>