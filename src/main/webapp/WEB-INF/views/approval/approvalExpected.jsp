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
.content1 {
	margin: 20px 2%;
	text-align: right;
}

.content2 {
	width: 96%;
	height: 85%;
	margin: 0px 2%
}

.btn1 {
	border: none;
	background: none;
	float: left;
}

.btn1:hover {
	background: #f1f1f1
}

.icon1 {
	width: 18px;
	height: 18px;
	margin-right: 5px;
}
#menu7{
	color: #1e87e4;
	font-weight:bold;	
}
/* 페이지!!!!!!!!!!!!!!!! */
.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}
#listt{
	height: 540px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="section">
		<br>
		<jsp:include page="../common/approvalmenu.jsp" />
		<div class="section2">
			<div class="content1">
				<p class="title">결재예정함</p>
				<form action="asearch.do" name="searchForm" method="get">
					<input type="text" placeholder="통합검색" name="search" minlegth="2">
					<button type="submit" class="btn btn-secondary btn-sm" >검색</button>
				</form>	
			</div>
			<div class="content2">
			<div id="listt">
				<table class="table table-hover">
					<thead class="thead">
						  <tr>
                            <th>기안일</th>
                            <th>결제양식</th>
                            <th>제목</th>
                            <th>기안자</th>
                            <th>기안부서</th>
                            <th>첨부</th>
                        </tr>
					</thead>
					<tbody>
					<c:if test="${!empty list }">
					<c:forEach var="a" items="${list}">
						<tr>
							<td>${a.astartDate }</td>
							<td>${a.aName }</td>
							<td>
							<c:url var="ardetail" value="aRequestdetail.do?button=7">
								<c:param name="aId" value="${ a.aId }"/>
								<c:param name="aName" value="${a.aName }"/>
			                    <c:param name="page" value="${ pi.currentPage }"/>
			                </c:url>
			                <c:if test="${a.aTitle eq null }">
			                	<a href="${ardetail}" style="color:black">(제목 없음)</a>
			                </c:if>
			                <c:if test="${a.aTitle ne null }">
			                	<a href="${ardetail}" style="color:black">${a.aTitle}</a>
			                </c:if>
			                </td>
			                <td>${a.eName }</td>
			                <td>${a.dName }</td>
			                <td>${a.atNum }</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<td colspan="6" style="text-align: center"><br>결재예정문서가 없습니다</td>
                    </c:if>
					</tbody>
				</table>
				</div>
					<div class="page_wrap">
						<div class="page_nation">
							<!-- << 버튼 눌렀을 때 1페이지로 이동 -->
							<c:url var="first" value="aExpected.do">
								<c:param name="page" value="${ 1 }" />
							</c:url>
							<a class="arrow pprev" href="${ first }">&lt;&lt;</a>

							<!-- 이전 -->
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="arrow prev">&lt;</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="aExpected.do">
									<c:param name="page" value="${ pi.currentPage - 1 }" />
								</c:url>
								<a class="arrow prev" href="${ before }">&lt;</a>
							</c:if>

							<!-- 페이지 숫자 표시 -->
							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<a href="${ pagination }" class="active">${ p }</a>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="aExpected.do">
										<c:param name="page" value="${ p }" />
									</c:url>
									<a href="${ pagination }">${ p }</a>
								</c:if>
							</c:forEach>

							<!-- 다음 -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								<a class="arrow next">&gt;</a>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="aExpected.do">
									<c:param name="page" value="${ pi.currentPage + 1 }" />
								</c:url>
								<a class="arrow next" href="${ after }">&gt;</a>
							</c:if>

							<!-- 마지막 페이지로 -->
							<c:url var="last" value="aExpected.do">
								<c:param name="page" value="${ pi.maxPage }" />
							</c:url>
							<a class="arrow nnext" href="${ last }">&gt;&gt;</a>
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>