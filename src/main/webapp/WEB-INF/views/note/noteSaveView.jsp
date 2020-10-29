<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>쪽지 보관함</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <style>
       .menubar button {
		   border: none;
		   background: none;
		   width: 100%;
		   height: 50px;
		   margin-top: 20px;
		}
		
		.menubar button:hover {
		   color: #1e87e4;
		   font-weight: bold;
		}
		
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }
        textarea{
            resize:none;
        }
        
        /* Optional: Style the caret down icon */
        .fa-caret-down {
            float: right;
            padding-right: 8px;
        }
        #mainContent{
            text-align: center;
            margin: 0px 2%;
        }
        #searchMenu{
            margin: 20px 2%;
            padding: 0px 0px;
        }

        /* pagination */
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
        /* 내용 th */
        #mContentHead{
            width: 550px;
        }       
        td{
            font-size: 12px;
        }
        th{
            font-size: 14px;
        }
        p{
            font-size: 10px;
            text-align: left;
        }
        select{
            height: 30px;
            font-size: 12px;
        }
        
        .title{
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;
            float: left;
        }
        #receive{
        	color: blue;
        	margin-top: -2px;
        }
        #send{
        	color: red;
        }
       #toDetail{
        	color: black;
        	width: 300px;
            display: inline-block;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</head>

<body>
	<c:import url="../common/menubar.jsp"/>
    <div class="section"><br>
        <c:import url="../common/notemenu.jsp"/>
        <div class="section1">
            <div class="menubar">
                <button onclick="location.href='ntwriteView.do'">쪽지 쓰기</button>
                <button onclick="location.href='ntInboxList.do'">받은 쪽지함</button>
                <button onclick="location.href='ntOutboxList.do'">보낸 쪽지함</button>
                <button id="selected" onclick="location.href='ntsaveList.do'">쪽지 보관함</button>
            </div>
        </div>
        <div class="section2">
                <div id="searchMenu" align="right">
                    <p class="title">쪽지 보관함</p>
                    	<form action="ntSavesearch.do" name="searchForm" method="get">
	                        <select id="searchCondition" name="searchCondition">
	                            <option>------</option>
	                            <option value="receiver">받는사람</option>
	                            <option value="sender">보낸사람</option>
	                            <option value="content">내용</option>
	                        </select>
	                        <input type="text" class="searchMessage" name="searchValue">
	                        <button type="button" class="btn btn-secondary btn-sm">검색</button>
	                    </form>
                    </div>
                    <div id="mainContent">
                    	<c:if test="${ search ne null }">
                    		<div align="left">검색결과<a class="listcount">(${ listCount })</a> | <a class="listcount">${ search.searchValue }</a></div><br>
                    	</c:if>
                    	<form action="deleteSaveSelected.do" method="post">
	                        <table class="table table-hover">
	                            <thead>
	                                <tr>
	                                    <th><input type="checkbox" id="checkall"></th>
	                                    <th>받는 사람/보낸 사람</th>
	                                    <th>구분</th>
	                                    <th id="mContentHead">내용</th>
	                                    <th>날짜</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:if test="${ empty list }">
	                            		<tr>
	                            			<td colspan="4">보관한 쪽지가 없습니다.</td>
	                            		</tr>
	                            	</c:if>
	                            	<c:forEach var="nt" items="${ list }">
		                                <tr>
		                                    <td><input name="check" type="checkbox" value="${ nt.ntId }"></td>
		                                    <c:if test="${ nt.receiver eq loginUser.eId }">
		                                    	<td>${ nt.eId }</td>
		                                    </c:if>
		                                    <c:if test="${ nt.eId eq loginUser.eId }">
		                                    	<td>${ nt.receiver }</td>
		                                    </c:if>
		                                    	<c:url var="ntdetail" value="ntSavedetail.do">
		                                    		<c:param name="ntId" value="${ nt.ntId }"/>
		                                    		<c:param name="page" value="${ pi.currentPage }"/>
		                                    	</c:url>
		                                    	<c:if test="${ nt.eId eq loginUser.eId }">
		                                    		<td><a id="send">[보낸 쪽지]</a></td>
		                                    		<td><a href="${ ntdetail }" id="toDetail">${ nt.ntContent }</a></td>
		                                    	</c:if>
		                                    	<c:if test="${ nt.receiver eq loginUser.eId }">
		                                    		<td><a id="receive">[받은 쪽지]</a></td>
		                                    		<td><a href="${ ntdetail }" id="toDetail">${ nt.ntContent }</a></td>
		                                    	</c:if>
		                                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ nt.ntDate }"/></td>
		                                </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
	                        
	                        <button type="submit" class="btn btn-secondary btn-sm" id="deleteSelected">선택삭제</button>	   
                  
	                        </form>
                    	</div>
                    	<hr>
                        <c:if test="${ search eq null && !empty list}">
                    <div class="page_wrap">
	                	<div class="page_nation">
	                	<!-- << 버튼 눌렀을 때 1페이지로 이동 -->
		                	<c:url var="first" value="ntsaveList.do">
		                		<c:param name="page" value="${ 1 }"/>
		                	</c:url>
		                	<a class="arrow pprev" href="${ first }">&lt;&lt;</a>
		                	
		                	<!-- 이전 -->
		                	<c:if test="${ pi.currentPage <= 1 }">
		                		<a class="arrow prev">&lt;</a>
		                	</c:if>
		                	<c:if test="${ pi.currentPage > 1 }">
		                		<c:url var="before" value="ntsaveList.do">
		                			<c:param name="page" value="${ pi.currentPage - 1 }"/>
		                		</c:url>
		                	    <a class="arrow prev" href="${ before }">&lt;</a>
		                	</c:if>
		                    
		                    <!-- 페이지 숫자 표시 -->
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:if test="${ p eq pi.currentPage }">
		                    		<a href="${ pagination }" class="active">${ p }</a>
		                    	</c:if>
		                    	<c:if test="${ p ne pi.currentPage }">
		                    		<c:url var="pagination" value="ntsaveList.do">
		                    			<c:param name="page" value="${ p }"/>
		                    		</c:url>
		                    		<a href="${ pagination }">${ p }</a>
		                    	</c:if>
		                    </c:forEach>      
		                    
		                    <!-- 다음 -->
		                    <c:if test="${ pi.currentPage >= pi.maxPage }">
		                    	<a class="arrow next">&gt;</a>
		                    </c:if>
		                    <c:if test="${ pi.currentPage < pi.maxPage }">
		                    	<c:url var="after" value="ntsaveList.do">
		                    		<c:param name="page" value="${ pi.currentPage + 1 }"/>
		                    	</c:url>
		                    	<a class="arrow next" href="${ after }">&gt;</a>
		                    </c:if>
		                    
		                    <!-- 마지막 페이지로 -->
		                    <c:url var="last" value="ntsaveList.do">
		                    	<c:param name="page" value="${ pi.maxPage }"/>
		                    </c:url>
		                    <a class="arrow nnext" href="${ last }">&gt;&gt;</a>
	               		</div>
            		</div>
            		</c:if>
            		<c:if test="${ search ne null && !empty list}">
            		<div class="page_wrap">
	                	<div class="page_nation">
	                	<!-- << 버튼 눌렀을 때 1페이지로 이동 -->
		                	<c:url var="first" value="ntSavesearch.do">
		                		<c:param name="page" value="${ 1 }"/>
		                	</c:url>
		                	<a class="arrow pprev" href="${ first }">&lt;&lt;</a>
		                	
		                	<!-- 이전 -->
		                	<c:if test="${ pi.currentPage <= 1 }">
		                		<a class="arrow prev">&lt;</a>
		                	</c:if>
		                	<c:if test="${ pi.currentPage > 1 }">
		                		<c:url var="before" value="ntSavesearch.do">
		                			<c:param name="page" value="${ pi.currentPage - 1 }"/>
		                		</c:url>
		                	    <a class="arrow prev" href="${ before }">&lt;</a>
		                	</c:if>
		                    
		                    <!-- 페이지 숫자 표시 -->
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:if test="${ p eq pi.currentPage }">
		                    		<a href="${ pagination }" class="active">${ p }</a>
		                    	</c:if>
		                    	<c:if test="${ p ne pi.currentPage }">
		                    		<c:url var="pagination" value="ntSavesearch.do">
		                    			<c:param name="page" value="${ p }"/>
		                    		</c:url>
		                    		<a href="${ pagination }">${ p }</a>
		                    	</c:if>
		                    </c:forEach>      
		                    
		                    <!-- 다음 -->
		                    <c:if test="${ pi.currentPage >= pi.maxPage }">
		                    	<a class="arrow next">&gt;</a>
		                    </c:if>
		                    <c:if test="${ pi.currentPage < pi.maxPage }">
		                    	<c:url var="after" value="ntSavesearch.do">
		                    		<c:param name="page" value="${ pi.currentPage + 1 }"/>
		                    	</c:url>
		                    	<a class="arrow next" href="${ after }">&gt;</a>
		                    </c:if>
		                    
		                    <!-- 마지막 페이지로 -->
		                    <c:url var="last" value="ntSavesearch.do">
		                    	<c:param name="page" value="${ pi.maxPage }"/>
		                    </c:url>
		                    <a class="arrow nnext" href="${ last }">&gt;&gt;</a>
	               		</div>
            		</div>
            		</c:if>
            		<c:if test="${ empty list }">
            		
            		</c:if>
            	</div>
            </div>
             <script>
            	$("#deleteSelected").click(function(){
            		if(confirm("선택한 쪽지를 삭제하시겠습니까?") == false){
            			return false;
            		}
            	});
            	
            	$(document).ready(function(){
            	    $("#checkall").click(function(){
            	        if($("#checkall").prop("checked")){
            	            $("input[name=check]").prop("checked",true);
            	        }else{
            	            $("input[name=check]").prop("checked",false);
            	        }
            	    })
            	});
            </script>
		</body>
		
	</html>