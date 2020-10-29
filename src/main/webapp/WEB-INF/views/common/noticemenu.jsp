<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#selectedEmenu {
	background: #1e87e4;
}
</style>
</head>
<body>
<div class="aside">
        <button onclick="location.href='receiveMailList.do'"><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
            <button onclick="location.href='ahome.do'"><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
            <button onclick="location.href='calview.do'"><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
            <c:url var="noticeMain" value="noticeMain.do"/>
            <button id="selectedEmenu"  onclick="location.href='noticeMain.do'"><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
            <button onclick="location.href='ntInboxList.do'"><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
            <button onclick="location.href='eAddress.do'"><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
            <button onclick="insa();"><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
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