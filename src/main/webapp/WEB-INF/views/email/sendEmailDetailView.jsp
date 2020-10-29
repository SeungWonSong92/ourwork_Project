<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<style>
#receiver {
	width: 800px;
	height: 30px;
}

.content {
	border: 1px solid grey;
	min-height: 400px;
	width: 960px;
	resize: none;
	overflow: auto;
}

.rc1:focus {
	outline: 1px solid #68a4ff;
}

.rc2:focus {
	outline: none;
}

#btn-wrapper {
	margin-top: 30px;
	margin-left: 50px;
}

#table-wrapper {
	margin-left: 50px;
	margin-top: 30px;
}

.aside button:first-child {
	background: #1e87e4;
}

p {
	font-size: 14px;
    font-weight: bold;
}

.mgr {
	margin-right: 5px;
}
td button {
    font-size: 14px;
}
.ms{
	margin: 0;
}
#dt {
	float: left;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="section">
		<br>
		<jsp:include page="../common/emailMenubar.jsp" />
		<div class="section2">
                <div id="btn-wrapper" align="left">
                    <c:url var="reply" value="replyEmailDetailForm.do">
						<c:param name="mId" value="${ email.mId }"/>
						<c:param name="sendId" value="${ sendId }"/>
					</c:url>
                    <a class="btn btn-secondary btn-sm" href="${ reply }">답장</a>
                    
                    <c:url var="del" value="delEmailDetailForm.do">
						<c:param name="mId" value="${ email.mId }"/>
					</c:url>
                    <a class="btn btn-secondary btn-sm" href="${ del }">전달</a>
                </div>
                
				<div id="table-wrapper">
					<table>
						<tr align="left">
							<td style="width: 80px;"><p class="ms">받는사람</p></td>
							<td>
								<c:forEach var="r" items="${ receiver }">
								<div id="dt">
								<button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${ r.eId }@ourwork.com</button>
                                
                                <c:url var="sEmailWithId" value="sendEmailGoId.do">
									<c:param name="eId" value="${ r.eId }@ourwork.com"/>
								</c:url>
								
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="${ sEmailWithId }">메일 쓰기</a>
                                </div>
                                </div>
                                </c:forEach>
                            </td>
						</tr>
						<tr align="left">
							<td><p class="ms">참조</p></td>
							<td>
								<c:forEach var="f" items="${ ref }">
								<div id="dt">
								<button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${ f.eId }@ourwork.com</button>
                                
                                <c:url var="sEmailWithId" value="sendEmailGoId.do">
									<c:param name="eId" value="${ f.eId }@ourwork.com"/>
								</c:url>
                                
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="${ sEmailWithId }">메일 쓰기</a>
                                </div>
                                </div>
                                </c:forEach>
                            </td>
						</tr>
						<tr align="left">
							<td><p class="ms">숨은참조</p></td>
							<td>
								<c:forEach var="d" items="${ hide }">
								<div id="dt">
								<button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${ d.eId }@ourwork.com</button>
                                
                                <c:url var="sEmailWithId" value="sendEmailGoId.do">
									<c:param name="eId" value="${ d.eId }@ourwork.com"/>
								</c:url>
								
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="${ sEmailWithId }">메일 쓰기</a>
                                </div>
                                </div>
                                </c:forEach>
                            </td>
						</tr>
						<tr>
							<td><p class="ms">제목</p></td>
							<td><span>${ email.mTitle }</span>
						</tr>
						<tr align="left">
							<td><p>파일첨부</p></td>
							<td>
							<c:if test="${ !empty alist }">
					            <c:forEach var="alist" items="${alist}">
					            <a href="${ contextPath }/resources/eUploadFiles/${alist.changeName}" download>${ alist.originName }</a><br>
					            </c:forEach>
					         </c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2"><div class="rc2 content" disabled>${ email.mContent }</div></td>
						</tr>
					</table>
				</div>
		</div>
	</div>
</body>
</html>