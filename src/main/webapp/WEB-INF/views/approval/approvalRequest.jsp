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
	height: 80%;
	margin: 0 2%
}

#menu2{
	color: #1e87e4;
	font-weight:bold;	
}

#radiobox {
	margin: 0 2%;
}

#radiobox input[type=radio] {
	position: absolute;
	display: none;
}

#radiobox label {
	cursor: pointer;
	font-weight: bold;
	color: gray;
	padding: 5px 20px;
	margin: 0px;
}

#radiobox input[type=radio]:checked+label {
	color: #1e87e4;
	border-bottom: 2px solid #1e87e4;
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
				<p class="title">기안문서함</p>
				<form action="asearch.do" name="searchForm" method="get">
					<input type="text" placeholder="통합검색" name="search" minlegth="2">
					<button type="submit" class="btn btn-secondary btn-sm" >검색</button>
				</form>				
			</div>
			<div id="radiobox">
				<input type="radio" name="tab" class="tab" id="tab1" onchange="setDisplay()" value="a" ><label for="tab1">전체</label> 
				<input type="radio" name="tab" class="tab" id="tab2" onchange="setDisplay()" value="i"><label for="tab2">진행</label> 
				<input type="radio" name="tab" class="tab" id="tab3" onchange="setDisplay()" value="y"><label for="tab3">완료</label> 
				<input type="radio" name="tab" class="tab" id="tab4" onchange="setDisplay()" value="n"><label for="tab4">반려</label>
			</div>
			<div class="content2" id="all">
			<div id="listt">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>기안일</th>
							<th>결제양식</th>
							<th>제목</th>
							<th>첨부</th>
							<th>완료일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${!empty list }">
					<c:forEach var="a" items="${list}">
						<tr>
							<td>${a.astartDate}</td>
							<td>${a.aName}</td>
							<td>
							<c:url var="ardetail" value="aRequestdetail.do?button=0">
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
					<c:if test="${empty list}">
							<tr>
                            <td colspan="6" style="text-align: center">
                                <br>기안한 문서가 없습니다
                            </td>
                         	</tr>
                            </c:if>
					</tbody>
				</table>
				</div>
				  <div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#">&lt;&lt;</a>
						
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<a class="arrow prev" onclick="setValue('${ pi.currentPage - 1 }');"> &lt; </a>
						</c:if>
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<a href="#" class="active">[${ p }]</a>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<a href="#" onclick="setValue('${ p }');">${ p }</a> &nbsp;
							</c:if>
						</c:forEach>
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							&gt;
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<a class="arrow next" onclick="setValue('${pi.currentPage}');"> &gt; </a>
						</c:if>
						<a class="arrow nnext" href="#">&gt;&gt;</a>
					</div>
				</div>
			</div>
			<div class="content2" id="proceed" style="display: none">
			<div id="listt">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>기안일</th>
							<th>결제양식</th>
							<th>제목</th>
							<th>첨부</th>
							<th>완료일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${!empty ilist }">
						<c:forEach var="i" items="${ilist}">
						<tr>
							<td>${i.astartDate}</td>
							<td>${i.aName}</td>
							<td>
							<c:url var="ardetail" value="aRequestdetail.do?button=0">
								<c:param name="aId" value="${ i.aId }"/>
								<c:param name="aName" value="${i.aName }"/>
			                    <c:param name="page" value="${ ipi.currentPage }"/>
			                </c:url>
			                <c:if test="${i.aTitle eq null }">
			                	<a href="${ardetail}" style="color:black">(제목 없음)</a>
			                </c:if>
			                <c:if test="${i.aTitle ne null }">
			                	<a href="${ardetail}" style="color:black">${a.aTitle}</a>
			                </c:if>
							</td>
							<c:if test="${ i.atNum ne 0 }">
							<td>${i.atNum }</td>
							</c:if>
							<c:if test="${i.atNum eq 0 }">
							<td></td>
							</c:if>
							<td>${i.aendDate }</td>
							<td style="color: green;">진행중</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${ilist eq null }">
                            <td colspan="6" style="text-align: center">
                                <br>진행중인 문서가 없습니다
                            </td>
                            </c:if>
					</tbody>
				</table>
				</div>
				<div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#">&lt;&lt;</a>
						<!-- [이전] -->
						<c:if test="${ ipi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
						<c:if test="${ ipi.currentPage > 1 }">
							<a class="arrow prev" onclick="setValue('${ ipi.currentPage - 1 }');"> &lt; </a>
						</c:if>
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ ypi.startPage }" end="${ ipi.endPage }">
							<c:if test="${ p eq ipi.currentPage }">
								<a href="#" class="active">[${ p }]</a>
							</c:if>
							<c:if test="${ p ne ipi.currentPage }">
								<a href="#" onclick="setValue('${ p }');">${ p }</a> &nbsp;
							</c:if>
						</c:forEach>
						<!-- [다음] -->
						<c:if test="${ ipi.currentPage >= ipi.maxPage }">
							&gt;
						</c:if>
						<c:if test="${ ipi.currentPage < ipi.maxPage }">
							<a class="arrow next" onclick="setValue('${ipi.currentPage}');"> &gt; </a>
						</c:if>
						<a class="arrow nnext" href="#">&gt;&gt;</a>
					</div>
				</div>
			</div>
			<div class="content2" id="complete" style="display: none">
			<div id="listt">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>기안일</th>
							<th>결제양식</th>
							<th>제목</th>
							<th>첨부</th>
							<th>완료일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${!empty ylist}">
						<c:forEach var="y" items="${ylist}">
						<tr>
							<td>${y.astartDate}</td>
							<td>${y.aName}</td>
							<td>
							<c:url var="ardetail" value="aRequestdetail.do?button=0">
								<c:param name="aId" value="${ y.aId }"/>
								<c:param name="aName" value="${y.aName }"/>
			                    <c:param name="page" value="${ ypi.currentPage }"/>
			                </c:url>
			                <c:if test="${y.aTitle eq null }">
			                	<a href="${ardetail}" style="color:black">(제목 없음)</a>
			                </c:if>
			                <c:if test="${y.aTitle ne null }">
			                	<a href="${ardetail}" style="color:black">${a.aTitle}</a>
			                </c:if>
							</td>
							<c:if test="${ y.atNum ne 0 }">
							<td>${y.atNum }</td>
							</c:if>
							<c:if test="${y.atNum eq 0 }">
							<td></td>
							</c:if>
							<td>${y.aendDate }</td>
							<td style="color: gray;">완료</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty ylist}">
                            <td colspan="6" style="text-align: center">
                                <br>진행중인 문서가 없습니다
                            </td>
                            </c:if>
					</tbody>
				</table>
				</div>
				<div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#">&lt;&lt;</a>
						<!-- [이전] -->
						<c:if test="${ ypi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
						<c:if test="${ ypi.currentPage > 1 }">
							<a class="arrow prev" onclick="setValue('${ ypi.currentPage - 1 }');"> &lt; </a>
						</c:if>
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ ypi.startPage }" end="${ ypi.endPage }">
							<c:if test="${ p eq ypi.currentPage }">
								<a href="#" class="active">[${ p }]</a>
							</c:if>
							<c:if test="${ p ne ypi.currentPage }">
								<a href="#" onclick="setValue('${ p }');">${ p }</a> &nbsp;
							</c:if>
						</c:forEach>
						<!-- [다음] -->
						<c:if test="${ ypi.currentPage >= ypi.maxPage }">
							&gt;
						</c:if>
						<c:if test="${ ypi.currentPage < ypi.maxPage }">
							<a class="arrow next" onclick="setValue('${ypi.currentPage}');"> &gt; </a>
						</c:if>
						<a class="arrow nnext" href="#">&gt;&gt;</a>
					</div>
				</div>
			</div>
			<div class="content2" id="companion" style="display: none">
			<div id="listt">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>기안일</th>
							<th>결제양식</th>
							<th>제목</th>
							<th>첨부</th>
							<th>완료일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${!empty nlist}">
						<c:forEach var="n" items="${nlist}">
						<tr>
							<td>${n.astartDate}</td>
							<td>${n.aName}</td>
							<td>
							<c:url var="ardetail" value="aRequestdetail.do?button=0">
								<c:param name="aId" value="${ n.aId }"/>
								<c:param name="aName" value="${n.aName }"/>
			                    <c:param name="page" value="${ npi.currentPage }"/>
			                </c:url>
			                <c:if test="${n.aTitle eq null }">
			                	<a href="${ardetail}" style="color:black">(제목 없음)</a>
			                </c:if>
			                <c:if test="${n.aTitle ne null }">
			                	<a href="${ardetail}" style="color:black">${a.aTitle}</a>
			                </c:if>
							</td>
							<c:if test="${ n.atNum ne 0 }">
							<td>${n.atNum }</td>
							</c:if>
							<c:if test="${n.atNum eq 0 }">
							<td></td>
							</c:if>
							<td>${n.aendDate }</td>
							<td style="color: red;">반려</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty nlist}">
                            <td colspan="6" style="text-align: center">
                                <br>진행중인 문서가 없습니다
                            </td>
                            </c:if>
					</tbody>
				</table>
				</div>
				<div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#">&lt;&lt;</a>
						
						<!-- [이전] -->
						<c:if test="${ npi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
						<c:if test="${ npi.currentPage > 1 }">
							<a class="arrow prev" onclick="setValue('${ npi.currentPage - 1 }');"> &lt; </a>
						</c:if>
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ npi.startPage }" end="${ npi.endPage }">
							<c:if test="${ p eq npi.currentPage }">
								<a href="#" class="active">[${ p }]</a>
							</c:if>
							<c:if test="${ p ne npi.currentPage }">
								<a href="#" onclick="setValue('${ p }');">${ p }</a> &nbsp;
							</c:if>
						</c:forEach>
						<!-- [다음] -->
						<c:if test="${ npi.currentPage >= npi.maxPage }">
							&gt;
						</c:if>
						<c:if test="${ npi.currentPage < npi.maxPage }">
							<a class="arrow next" onclick="setValue('${npi.currentPage}');"> &gt; </a>
						</c:if>
						<a class="arrow nnext" href="#">&gt;&gt;</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <script>
	 window.onload = function(){
		 var tabValue = "${tabValue}";
		 		if (tabValue == "i") {
	                $('#all').hide();
	                $('#proceed').show();
	                $('#complete').hide();
	                $('#companion').hide();
	                $("input:radio[name='tab'][value='i']").prop('checked', true);
	            }else if (tabValue == "y") {
	                $('#all').hide();
	                $('#proceed').hide();
	                $('#complete').show();
	                $('#companion').hide();
	                $("input:radio[name='tab'][value='y']").prop('checked', true);
	            }else if (tabValue == "n") {
	                $('#all').hide();
	                $('#proceed').hide();
	                $('#complete').hide();
	                $('#companion').show();
	                $("input:radio[name='tab'][value='n']").prop('checked', true);
	            }else {
	                $('#all').show();
	                $('#proceed').hide();
	                $('#complete').hide();
	                $('#companion').hide();
	                $("input:radio[name='tab'][value='a']").prop('checked', true);
	            } 
		}  
	 	
         function setDisplay() {
            if ($('input:radio[id=tab1]').is(':checked')) {
            	location.href="aRequestList.do?tabValue=a&page=1";
                $('#all').show();
                $('#proceed').hide();
                $('#complete').hide();
                $('#companion').hide();
            }else if ($('input:radio[id=tab2]').is(':checked')) {
            	location.href="aRequestList.do?tabValue=i&page=1";
                $('#all').hide();
                $('#proceed').show();
                $('#complete').hide();
                $('#companion').hide();
            }else if ($('input:radio[id=tab3]').is(':checked')) {
            	location.href="aRequestList.do?tabValue=y&page=1";
                $('#all').hide();
                $('#proceed').hide();
                $('#complete').show();
                $('#companion').hide();
            }else{
            	location.href="aRequestList.do?tabValue=n&page=1";
                $('#all').hide();
                $('#proceed').hide();
                $('#complete').hide();
                $('#companion').show();
            }
        }
         
         function setValue(page){
        	 var tabValue = $("input[name='tab']:checked").val();
        	 location.href="aRequestList.do?tabValue="+tabValue+"&page="+page;
         }
    </script>
</body>
</html>