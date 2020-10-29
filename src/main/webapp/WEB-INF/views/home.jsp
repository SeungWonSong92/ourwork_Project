<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<style>
.approval, .schedule, .notice, .board {

   width: 48%;
   height: 48%;
   margin: 20px 6px 0px 6px;
   box-sizing: border-box;
   display: inline-block;

}

/*--------------------------------------main--------------------------------------------*/
.content {
   width: 96%;
   height: 45%;
   margin: 2%;
}

.title {
   font-size: 20px;
   color: white;
   font-weight: bold;
   float: left;
   margin: 0px 0px;
   text-align: center;
}

.plus {
   width: 25px;
   height: 25px;
   float: right;
   cursor: pointer;
}

.tabletitle {
   height: 13%;
   background: #01579a;
   padding: 8px 15px;
   border-radius: 10px 10px 0px 0px
}

#profilediv {
   margin-top: 100px;
}

#mainpro {
   width: 150px;
   height: 150px;
   border-radius: 70px;
   margin-left: 35px;
}

#proname {
   margin: 15px 60px 0px 60px;
   font-size: 20px;
   font-weight: bold;
   color: gray;
}

#homename{
	margin: 10px 70px 0px 80px;
	font-weight: bold;
}


#procompany {
   margin: 0px 30px;
   color: gray;
}

#buttongroup {
   float: left;
}

#buttongroup button {
   border: none;
   background: none;
   font-size: 17px;
   font-weight: bold;
   color: rgb(107, 107, 107)
}

#buttongroup button:hover {
   background: #f1f1f1
}

#buttongroup img {
   width: 20px;
   height: 20px;
   margin-right: 5px;
}

#buttongroup {
   align: left;
   margin: 30px 8px;
}

#talk {
   width: 200px;
   height: 40px;
   margin: 15px 15px;
   font-size: 20px;
   background: #01579a;
   color: white;
   border-radius: 5px;
   border: white;
   text-align: center;
}

#talk:hover {
   background: #1e87e4;
}

/*-----------------modal------------------------*/
.mbody {
   width: 50%;
   float: left;
}

.mbody p {
   color: rgb(153, 153, 153);
   text-align: left;
   font-weight: bold;
   margin-top: 15px;
}

.mlist {
   padding-left: 15px;
}

.mlist input[type=radio] {
   position: absolute;
   display: none;
}

.mlist label {
   cursor: pointer;
   font-weight: bold;
   padding: 5px 20px;
}

.mlist input[type=radio]:checked+label {
   color: #1e87e4;
}

.cccd{
	display:block;
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
  width: 200px;
}

</style>
</head>
<body>
   <jsp:include page="common/menubar.jsp" />
   <div class="section">
      <br>
      <div class="aside">
         	<button id="selectedEmenu" onclick="location.href='receiveMailList.do'"><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
            <button onclick="location.href='ahome.do'"><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
            <button onclick="location.href='calview.do'"><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
            <button onclick="location.href='noticeMain.do'"><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
            <button onclick="location.href='ntInboxList.do'"><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
            <button onclick="location.href='eAddress.do'"><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
            <button onclick="insa();"><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
      </div>
      <div class="section1">
         <div id="profilediv">
         <c:if test="${ loginUser.profile.changeName eq null }">
        	<img id="mainpro" src="${ contextPath }/resources/images/common/profile_none.png" ></a>
        </c:if>
        
        <c:if test="${ loginUser.profile.changeName ne null }">
            <img id="mainpro" src="${ contextPath }/resources${ loginUser.profile.filePath }/${ loginUser.profile.changeName }">
        </c:if>
            <br><p id="homename"><c:out value="${ loginUser.eName }님 "/></p>            


            <p id="procompany">(주) Samsung Company</p>
            <div id="buttongroup">
               <button onclick="location.href='sendMail.do'"><img src="resources/images/common/mail2.png">메일쓰기</button>
               <button data-toggle="modal" data-target="#exampleModal"><img src="resources/images/common/briefcase.png">결재작성</button>
               <button style="margin-top: 10px" onclick="window.open('addpopup.do','일정 추가','width=400, height=600,location=no,status=no,scrollbars=yes')"><img src="resources/images/common/calendar2.png">일정등록</button>
               <button onclick="location.href='eMypage.do'"><img src="resources/images/common/checklist.png">마이페이지</button>
            </div>
            <button id="talk" onclick="location.href='ntwriteView.do'">ourTalk</button>
         </div>
      </div>

      <div class="section2">
         <div class="approval">
            <div class="tabletitle">
               <p class="title">결재대기함</p>
               <img class="plus" src="resources/images/common/plus.png" onclick="location.href='aWaitingList.do'">
            </div>
            <table class="table table-hover">
               <tr>
                  <th>기안일</th>
                  <th>제목</th>
                  <th>기안자</th>
                  <th>첨부</th>
               </tr>
               <c:forEach var="a" items="${alist}">
                  <tr href="${ardetail}" style="color: black">
                     <c:if test="${alist eq null }">
                        <td colspan="6" style="text-align: center">
                        결재할 문서가 없습니다</td>
                     </c:if>
                     <td>${a.astartDate }</td>
                     <td><c:url var="ardetail" value="aRequestdetail.do?button=1">
                           <c:param name="aId" value="${ a.aId }" />
                           <c:param name="aName" value="${a.aName }" />
                           <c:param name="page" value="${ pi.currentPage }" />
                        </c:url> 
                        <c:if test="${a.aTitle eq null }">
                           <a href="${ardetail}" style="color: black">(제목 없음)</a>
                        </c:if> <c:if test="${a.aTitle ne null }">
                           <a href="${ardetail}" style="color: black">${a.aTitle}</a>
                        </c:if></td>
                     <td>${a.eName }</td>
                     <td>${a.atNum }</td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div class="schedule">
            <div class="tabletitle">
               <p class="title">받은 메일</p>
               <img class="plus" src="resources/images/common/plus.png" onclick="location.href='receiveMailList.do'">
            </div>
            <table class="table table-hover">
               <tr>
                  <th>보낸 사람</th>
                  <th style="text-align: center;">제목</th>
               </tr>
            <%-- <c:forEach var="i" begin="1" end="5" step="1"> --%>
            <c:forEach var="r" items="${ rlist }" begin="0" end="4" step="1">
               <tr>
                  <td style="width: 50px;">${ r.eeId }@ourwork.com</td>
                  	<c:url var="receiveEmailDetailView" value="receiveEmailDetailView.do">
						<c:param name="mId" value="${ r.mId }"/>
					</c:url>
                  <td style="text-align: center;"><a class="cccd" href="${ receiveEmailDetailView }" style="color: black;">${ r.mTitle }</a></td>
               </tr>
            </c:forEach>
            </table>
         </div>
         <div class="notice">
            <div class="tabletitle">
               <p class="title">공지사항</p>
               <img class="plus" src="resources/images/common/plus.png">
            </div>
            <table class="table">
               <tr>
                  <th>No.</th>
                  <th colspan="2">내용</th>
                  <th>글쓴이</th>
               </tr>
               <c:forEach var="bn" items="${ Blist }">
               <tr>
                     <td>${ bn.nNo }</td>
                     <c:url var="detail" value="detail.do">
                       <c:param name="nNo" value="${ bn.nNo }"/>
                       <c:param name="page"/>
                    </c:url>
                    <td class="ntitle" colspan="2"><a href="${ detail }" class="cccd" style="color:black">${ bn.nTitle }</a></td>
                     <td>${ bn.eId }</td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div class="board">
            <div class="tabletitle">
               <p class="title">게시판</p>
               <img class="plus" src="resources/images/common/plus.png" onclick="location.href='noticeMain.do'">
            </div>
            <table class="table">
               <tr class="midheader" text-align="center">
                  <th>No.</th>
                  <th colspan="2">내용</th>
                  <th>글쓴이</th>
               </tr>
               <c:forEach var="n" items="${ list }">
               <tr>
                     <td>${ n.nNo }</td>
                     <c:url var="detail" value="detail.do">
                       <c:param name="nNo" value="${ n.nNo }"/>
                       <c:param name="page"/>
                    </c:url>
                    <td colspan="2"><a href="${ detail }" class="cccd" style="color:black">${ n.nTitle }</a></td>
                     <td>${ n.eId }</td>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </div>
   </div>
   
   
      <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">결재양식 선택</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                    <form action="aFormView.do">
                  <input type="hidden" name="eId" value="${loginUser.eId}">             
                        <div class="mbody">
                            <p>인사</p>
                            <div class="mlist">
                                <input type="radio" name="insertform" id="1" value="1"><label for="1">경조금 지금 신청서</label><br>
                                <input type="radio" name="insertform" id="2" value="2"><label for="2">사직서</label><br>
                                <input type="radio" name="insertform" id="3" value="3"><label for="3">시말서</label><br>
                                <input type="radio" name="insertform" id="4" value="4"><label for="4">증명서 발급</label><br>
                            </div>
            
                            <p >휴가</p>
                            <div class="mlist">
                                <input type="radio" name="insertform" id="5" value="5"><label for="5">복직원</label><br>
                                <input type="radio" name="insertform" id="6" value="6"><label for="6">휴직원</label><br>
                                <input type="radio" name="insertform" id="7" value="7"><label for="7">휴가원</label><br>
                            </div>
                        </div>
                        
                        <div class="mbody"> 
                            <p>일반</p>
                            <div class="mlist">
                                <input type="radio" name="insertform" id="8" value="8"><label for="8">기안서</label><br>
                                <input type="radio" name="insertform" id="9" value="9"><label for="9">품의서</label><br>
                                <input type="radio" name="insertform" id="10" value="10"><label for="10">지출 결의서</label><br>
                            </div>
                            <br><br>
                            <p>출장</p>
                            <div class="mlist">
                                <input type="radio" name="insertform" id="11" value="11"><label for="11">출장 신청서</label><br>
                                <input type="radio" name="insertform" id="12"value="12"><label for="12">출장 보고서</label><br>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-secondary" id="enroll">확인</button>
                    </div>
                    </form>
                </div>
                </div>
            </div>
   <script>
      function insa() {
         if(${ loginUser.dId ==1 }){
            location.href="employeeE.do";
         }else{
            alert("인사팀이 아닙니다.");
         }
      }
   
   </script>
</body>
</html>