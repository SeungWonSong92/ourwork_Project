<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 상세 조회</title>
<style>
        .menubar button{
            border: none;
            background: none;
            width: 100%;
            height: 50px;
            margin-top: 20px;
        }
        .menubar button:hover{
            font-weight: bold;  
            color:#1e87e4;
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }
        .table-detail th{
            font-size: 14px;  
            text-align: center;
            border-right: 1px solid lightgray;
            background: lightgrey;
            width: 400px;
        }
	
        td{
            font-size: 12px;
        }

        table{
            border: 1px solid lightgrey;
            margin-top: 20px;
        }
        .table-update td{
            text-align: center;
        }
        .buttons{
            
        }
        .title{
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;
            float: left;
            margin-top: 20px;
        }
        .table-update th{
           	font-size: 14px;  
        	background: lightgrey;
        	text-align:center;
        }
        #preview{
        	z-index: 1;
        	position: absolute;
        	background: #999999;
        	padding: 2px;
        }
</style>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="section"><br>
	<c:import url="../common/clientmenu.jsp"/>
        <div class="section1">
            <div class="menubar">
                <button>주소록 조회</button>
                <button id="selected" onclick="location.href='clist.do'">거래처 조회</button>
                <button onclick="location.href='cinsertView.do'">거래처 등록</button>
            </div>
        </div>
        <div class="section2">
            <p class="title">거래처 조회</p>
            <div id="clientTable">
                <table class="table table-detail">
                    <tbody>
                        <tr>
                            <th>거래처명</th>
                            <td>${ c.cName }</td>
                        </tr>
                        <tr>
                            <th>구분</th>
                            <c:if test="${ c.cSort == 1 }">
                            	<td>법인</td>
                            </c:if>
                            <c:if test="${ c.cSort == 2 }">
                            	<td>개인</td>
                            </c:if>
                        </tr>
                        <tr>
                            <th>대표자명</th>
                            <td>${ c.represent }</td>
                        </tr>
                        <tr>
                            <th>사업자등록번호/주민등록번호</th>
                            <td>${ c.bNum }</td>
                        </tr>
                        
                        <c:forTokens var="addr" items="${ c.cAddress }" delims="+" varStatus="status">
                        	<c:if test="${ status.index eq 0 }">
                        		<c:set var="addr1" value="${ addr }"/>
                        	</c:if>
                        	<c:if test="${ status.index eq 1 }">
                        		<c:set var="addr2" value="${ addr }"/>
                        	</c:if>
                        	<c:if test="${ status.index eq 2 }">
                        		<c:set var="addr3" value="${ addr }"/>
                        	</c:if>
                        </c:forTokens>
                        <tr>
                            <th>우편번호</th>
                            <td>${ addr1 }</td>
                        </tr>
                        <tr>
                            <th>도로명주소</th>
                            <td>${ addr2 }</td>
                        </tr>
                        <tr>
                            <th>상세주소</th>
                            <td>${ addr3 }</td>
                        </tr>
                        <tr>
                            <th>대표전화</th>
                            <td>${ c.cPhone }</td>
                        </tr>
                        <tr>
                            <th>FAX번호</th>
                            <td>${ c.fax }</td>
                        </tr>
                        <tr>
                            <th>업태</th>
                            <td>${ c.business }</td>
                        </tr>
                        <tr>
                            <th>담당자</th>
                            <td>${ c.manager }</td>
                        </tr>
                        <tr>
                            <th>담당자 부서</th>
                            <td>${ c.mDepartment }</td>
                        </tr>
                        <tr>
                            <th>담당자 전화</th>
                            <td>${ c.mPhone }</td>
                        </tr>
                        <tr>
                            <th>담당자 이메일</th>
                            <td>${ c.mEmail }</td>
                        </tr>
                        <tr>
                            <th>사업자등록증</th>
                            <td>
                            	<c:if test="${ !empty at.originName }">
                            		<button id="thumbBtn" class="btn btn-secondary btn-sm" type="button" onclick="window.open('${contextPath}/resources/images/clientUploadFiles/${ at.changeName }', '미리보기','width=500, height=700, location=no,status=no,scrollbars=yes')">미리보기</button>
                            		
                            		<br>
                            		다운로드 : <a class="pic" href="${ contextPath }/resources/images/clientUploadFiles/${ at.changeName }" download>${ at.originName }</a>
                            	</c:if>               
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table class="table table-update">
                    <tr>
                        <!-- <th>No.</th> -->
                        <th>거래처 수정사유</th>
                        <th>수정자</th>
                        <th>수정일</th>
                    </tr>
                    <c:forEach var="uc" items="${ list }">
                    	<tr>
                    		<%-- <td>${ uc.ucId }</td> --%>
                    		<td>${ uc.reason }</td>
                    		<td>${ uc.eId }</td>
                    		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ uc.modifyDate }"/></td>
                    	</tr>
                    </c:forEach>
                    
                </table>
                <div class="buttons" align="right">
                	<c:url var="cupView" value="cupView.do">
                		<c:param name="clId" value="${ c.clId }"/>
                		<c:param name="page" value="${ currentPage }"/>
                	</c:url>
                	<c:url var="clist" value="clist.do">
                		<c:param name="page" value="${ currentPage }"/>
                	</c:url>	
                	<c:url var="cdelete" value="cdelete.do">
                		<c:param name="clId" value="${ c.clId }"/>
                	</c:url>
                    <!-- 수정, 삭제 버튼은 관리권한 있는 사람에게만 보임 -->
                    <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${ cupView }'">수정</button>
					<button type="button" class="btn btn-secondary btn-sm" id="delete" onclick="return validate();">삭제</button>                    
					<button type="button" class="btn btn-secondary btn-sm" onclick="history.back();">목록으로</button>
                </div>
                <br><br>
            </div>
             <br>
        </div>
    </div>
    
    <script>
	   function validate(){
        	if(confirm("거래처를 삭제하시겠습니까?") == false){
        		return false;
        	}else{
        		location.href='${ cdelete }';
        	}
        }
    </script>
</body>
</html>