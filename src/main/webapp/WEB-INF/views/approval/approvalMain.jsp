

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<style>

/*--------------------------------------main--------------------------------------------*/
.content {
	width: 96%;
	height: 45%;
	margin: 2%;
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	    <div class="section"><br>
        <jsp:include page="../common/approvalmenu.jsp"/>

        <div class="section2">
            <div class="content">
                <p class="title">결재 대기 문서</p>
                <table class="table">
                    <thead>
                        <tr>
                            <th>기안일</th>
                            <th>결재양식</th>
                            <th>제목</th>
                            <th>기안자</th>
                            <th>기안부서</th>
                            <th>첨부</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${!empty wlist}">
                     <c:forEach var="a" items="${wlist}">
						<tr>
							<td>${a.astartDate }</td>
							<td>${a.aName }</td>
							<td>
							<c:url var="ardetail" value="aRequestdetail.do?button=1">
								<c:param name="aId" value="${ a.aId }"/>
								<c:param name="aName" value="${a.aName }"/>
			                    <c:param name="page" value="${ pi.currentPage }"/>
			                </c:url>
			                <a href="${ardetail}" style="color:black">${a.aTitle}</a>
			                </td>
			                <td>${a.eName }</td>
			                <td>${a.dName }</td>
			                <td>${a.atNum }</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty wlist}">
					<tr>
                            <td colspan="6" style="text-align: center">
                              	<br>결재할 문서가 없습니다
                            </td>
                            </tr>
                    </c:if>
                    </tbody>
                </table>

            </div>
            <div class="content">
                    <p class="title">최근 기안  문서</p>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>기안일</th>
                                <th>결재양식</th>
                                <th>제목</th>
                                <th>첨부</th>
                                <th>완료일</th>
                                <th>결재상태</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${!empty rlist}">
                       <c:forEach var="a" items="${rlist}">
						<tr>
							<td>${a.astartDate}</td>
							<td>${a.aName}</td>
							<td>
							<c:url var="ardetail" value="aRequestdetail.do?button=0">
								<c:param name="aId" value="${ a.aId }"/>
								<c:param name="aName" value="${a.aName }"/>
			                    <c:param name="page" value="${ pi.currentPage }"/>
			                </c:url>
			                <a href="${ardetail}" style="color:black">${a.aTitle}</a>
							</td>
							<c:if test="${ a.atNum ne 0 }">
							<td>${a.atNum }</td>
							</c:if>
							<c:if test="${a.atNum eq 0 }">
							<td></td>
							</c:if>
							<td>${a.aendDate }</td>
						<c:if test="${a.aStatus eq 'I' }">
							<td style="color: green;">진행중</td>
						</c:if>
						<c:if test="${a.aStatus eq 'Y' }">
							<td style="color: gray;">완료</td>
						</c:if>
						<c:if test="${a.aStatus eq 'N' }">
							<td style="color: red;">반려</td>
						</c:if>
						</tr>
					  </c:forEach>
					  </c:if>
					  <c:if test="${empty rlist }">
					  <tr>
                            <td colspan="6" style="text-align: center">
                                <br>기안 문서가 없습니다
                            </td>
                           </tr>
                            </c:if>
                        </tbody>
                    </table>
    
                </div>
            </div>
        </div>
</body>
</html>