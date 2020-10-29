<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>

<style>
.fa-caret-down {
	float: right;
	padding-right: 8px;
}

#mainContent {
	text-align: center;
	width: 968Fpx;
	margin: 0px 2%;
}

#test {
	margin: 20px 2%;
	padding: 0px 0px;
}

#mContent {
	width: 550px;
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	cursor: pointer;
}

td {
	font-size: 12px;
}

th {
	font-size: 14px;
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
#email2 {
	color: #1e87e4;
	font-weight: bold;
}
#cp{
	text-decoration: none;
    color: black;
}
#messageList{
	height: 478px;
}
</style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="section"><br>
		<jsp:include page="../common/emailMenubar.jsp" />
		<div class="section2">
			<div id="test" align="right">
				<p class="title">받은 메일함</p>
				<form name="searchForm" method="get">
					<input type="search" name="searchValue" placeholder="제목, 내용, 보낸사람" value="">
					<button type="submit" class="btn btn-secondary btn-sm" onclick="javascript: form.action='searchR.do'">검색</button>
					<button type="button" onclick="rdelete();" class="btn btn-secondary btn-sm">선택삭제</button>
				</form>
			</div>
			
			<div id="mainContent">
				<div id="messageList">
					<table class="table table-hover">
						<thead>
							<tr>
								<th><input class="check" type="checkbox" id="checkall" onclick="allChk(this);"></th>
								<th>보낸 사람</th>
								<th id="mContentHead">제목</th>
								<th scope="col">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${ !empty list }">
							<c:forEach var="e" items="${ list }">
								<tr>
									<td><input class="checkRow" type="checkbox" name="chk" value="${ e.mId }"></td>
									<!-- <td id="replyBtn">인사팀 최유빈&lt;abcd@ourwork.com&gt;</td> -->
									<td><button class="dropdown-toggle" type="button"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">${ e.dName } ${ e.eName }&lt;${ e.eeId }@ourwork.com&gt;</button>
										
										<c:url var="sEmailWithId" value="sendEmailGoId.do">
											<c:param name="eId" value="${ e.eeId }@ourwork.com"/>
										</c:url>
										
										<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
											<a class="dropdown-item" href="${ sEmailWithId }">메일 쓰기</a>
										</div></td>
										<c:url var="receiveEmailDetailView" value="receiveEmailDetailView.do">
											<c:param name="mId" value="${ e.mId }"/>
										</c:url>
									<td id="mContent"><a href="${ receiveEmailDetailView }" id="cp">${ e.mTitle }</a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ e.sendDate }"/></td>
								</tr>
							</c:forEach>
							</c:if>
							<c:if test="${ empty list }">
								<tr>
									<td colspan="4">
										받은 메일이 존재하지 않습니다.
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				
				<hr>
				<c:if test="${ se eq null }">
					<div class="page_wrap">
						<div class="page_nation">
							<!-- << 버튼 눌렀을 때 1페이지로 이동 -->
		                	<c:url var="first" value="receiveMailList.do">
		                		<c:param name="page" value="${ 1 }"/>
		                	</c:url>
		                	<a class="arrow pprev" href="${ first }">&lt;&lt;</a>
							
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="arrow prev">&lt;</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="receiveMailList.do">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<a class="arrow prev" href="${ before }">&lt;</a>
							</c:if>
							<!-- 페이지 숫자 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<a href="#" class="active">[${ p }]</a>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="receiveMailList.do">
										<c:param name="page" value="${ p }"/>
									</c:url>
									<a href="${ pagination }">${ p }</a> &nbsp;
								</c:if>
							</c:forEach>
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								<a class="arrow next">&gt;</a>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="receiveMailList.do">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url>
								<a class="arrow next" href="${ after }">&gt;</a>
							</c:if>
							<!-- 마지막 페이지로 -->
		                    <c:url var="last" value="receiveMailList.do">
		                    	<c:param name="page" value="${ pi.maxPage }"/>
		                    </c:url>
		                    <a class="arrow nnext" href="${ last }">&gt;&gt;</a>
						</div>
					</div>
				</c:if>
				<c:if test="${ se ne null }">
					<div class="page_wrap">
						<div class="page_nation">
							<!-- << 버튼 눌렀을 때 1페이지로 이동 -->
		                	<c:url var="first" value="searchR.do">
		                		<c:param name="page" value="${ 1 }"/>
		                		<c:param name="searchValue" value="${ se.searchValue }"/>
		                	</c:url>
		                	<a class="arrow pprev" href="${ first }">&lt;&lt;</a>
							
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="arrow prev">&lt;</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="searchR.do">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
									<c:param name="searchValue" value="${ se.searchValue }"/>
								</c:url>
								<a class="arrow prev" href="${ before }">&lt;</a>
							</c:if>
							<!-- 페이지 숫자 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<a href="#" class="active">[${ p }]</a>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="searchR.do">
										<c:param name="page" value="${ p }"/>
										<c:param name="searchValue" value="${ se.searchValue }"/>
									</c:url>
									<a href="${ pagination }">${ p }</a> &nbsp;
								</c:if>
							</c:forEach>
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								<a class="arrow next">&gt;</a>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="searchR.do">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
									<c:param name="searchValue" value="${ se.searchValue }"/>
								</c:url>
								<a class="arrow next" href="${ after }">&gt;</a>
							</c:if>
							<!-- 마지막 페이지로 -->
		                    <c:url var="last" value="searchR.do">
		                    	<c:param name="page" value="${ pi.maxPage }"/>
		                    	<c:param name="searchValue" value="${ se.searchValue }"/>
		                    </c:url>
		                    <a class="arrow nnext" href="${ last }">&gt;&gt;</a>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<script>
	   $(document).ready(function(){
	       //최상단 체크박스 클릭
	       $("#checkall").click(function(){
	           //클릭되었으면
	           if($("#checkall").prop("checked")){
	               //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	               $("input[name=chk]").prop("checked",true);
	               //클릭이 안되있으면
	           }else{
	               //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	               $("input[name=chk]").prop("checked",false);
	           }
	       });
	   });
		
		function rdelete(){
		      var check ="";
		       $(".checkRow:checked").each(function(){
		          check = check + $(this).val() + ",";
		       });
		       check = check.substring(0, check.lastIndexOf(","));
		       console.log("check : " + check);
		       
		       if(check == ""){
		          alert("삭제할 이메일을 선택해주세요");
		          return false;
		       }else{
		          if(confirm("선택한 이메일을 삭제하시겠습니까?") == false){
		        	  return false;
		          }
		          location.href = "rEmailDelete.do?check="+ check;
		      }
		         alert("선택된 이메일이 삭제되었습니다");
		      }
	</script>
</body>
</html>