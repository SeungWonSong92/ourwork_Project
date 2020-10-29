<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인 메뉴</title>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<style>
        
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
      .noticeList{
         text-align: center;
      }
        
    </style>
    
</head>

<body>
   <jsp:include page="../common/menubar.jsp" />
    <div class="section"><br>
       <jsp:include page="../common/noticemenu.jsp" />
        <div class="section1">
            <div class="menubar">
                    <button id="selected" onclick="location.href='noticeMain.do'">사내 게시판</button>
                    <button onclick="location.href='tBoardMain.do'">팀별 게시판</button>
                    <button onclick="location.href='tnoticeMain.do'">팀별 공지사항</button>
        </div>
        </div>
        <div class="section2">
            <div id="test" align="right">
                <p class="title">사내 게시판</p>
                <form action="nsearch.do" name="searchForm" method="get">
                <select id="searchCondition" name="searchCondition">
                    <option value="all"
                  <c:if test="${search.searchCondition == 'all' }">selected
                  </c:if>>전체</option>
                    <option value="writer"
               <c:if test="${search.searchCondition == 'eName'}">selected
                  </c:if>>작성자</option>
               <option value="title"
                  <c:if test="${search.searchCondition == 'nTitle'}">selected
               </c:if>>제목</option>
                </select>
                <input type="search" name="searchValue" value="${ search.searchValue }">
                <input type="hidden" name="page" value="${ pi.currentPage }"/>
                <button type="submit" class="btn btn-secondary btn-sm">검색</button>
                <c:if test="${ loginUser.dId == 1 }">
                   <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='noticeInsert.do'">작성</button>
                </c:if>
                </form>
                
                
            </div>
            <div id="mainContent">
                <div class="noticeList">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>직급</th>
                            <th>작성자</th>
                            <th id="mContentHead">제목</th>
                            <th scope="col">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="n" items="${ list }">
                        <tr>
                            <td scope="row">
                               ${ n.rName }
                            </td>
                            <td>${ n.eName }</td>
                            <td id="mContent">
                               <c:url var="detail" value="detail.do">
                                  <c:param name="nNo" value="${ n.nNo }"/>
                                  <c:param name="page" value="${ pi.currentPage }"/>
                               </c:url>
                               <a href="${ detail }">${ n.nTitle }</a>
                            </td>
                            <td>${ n.nDate }</td>
                            
                        </tr>
                       </c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- 페이징 처리! -->
                    <div class="page_wrap">
                        <div class="page_nation">
                               <a class="arrow prev"><<</a>
                            <c:if test="${ pi.currentPage <= 1 }">
                               <a class="arrow prev"><</a>
                            </c:if>
                            <c:if test="${ pi.currentPage > 1 }">
                               <c:url var="before" value="noticeMain.do">
                                  <c:param name="page" value="${ pi.currentPage -1 }"/>
                               </c:url>
                               <a class="arrow prev" href="${ before }"><</a>
                            </c:if>
                            
                            <!-- 페이징 숫자 -->
                            <c:forEach var="p" begin="${ pi.startPage }"  end="${ pi.endPage }">
                               <c:if test="${ p eq pi.currentPage }">
                                  <a class="active">${ p }</a>
                               </c:if>
                               <c:if test="${ p ne pi.currentPage }">
                                  <c:url var="pagination" value="noticeMain.do">
                                     <c:param name="page" value="${ p }"/>
                                  </c:url>
                                  <a href="${ pagination }">${ p }</a>
                               </c:if>
                            </c:forEach>
                            
                            <c:if test="${ pi.currentPage >= pi.maxPage }">
                               <a class="arrow next">></a>
                            </c:if>
                            <c:if test="${ pi.currentPage < pi.maxPage }">
                               <c:url var="after" value="noticeMain.do">
                                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
                               </c:url>
                               <a class="arrow next" href="${ after }">></a>
                            </c:if>
                               <a class="arrow next" href="${ after }">>></a>
                        </div>
                    </div>
        </div>
    </div>

</body>

<script>

   $(document).ready(function(){
       //최상단 체크박스 클릭
       $("#allCheck").click(function(){
           //클릭되었으면
           if($("#allCheck").prop("checked")){
               //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
               $("input[name=chk]").prop("checked",true);
               //클릭이 안되있으면
           }else{
               //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
               $("input[name=chk]").prop("checked",false);
           }
       });
   });

  
   function nsdelete(){
      var check ="";
       $(".checkRow:checked").each(function(){
          check = check + $(this).val() + ",";
       });
       check = check.substring(0, check.lastIndexOf(","));
       console.log("check : " + check);
       
       if(check == ""){
          alert("삭제할 게시글을 선택해주세요");
          return false;
       }else{
          confirm("선택한 게시글을 삭제하시겠습니까?");
          location.href = "noticesDelete.do?check="+ check;
      }
         alert("선택된 게시글가 삭제되었습니다");
      }
   </script>


</html>