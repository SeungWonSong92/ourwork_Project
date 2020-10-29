<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보관한 쪽지 상세 조회</title>
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
		.icons{
            width: 50%;
            height: 50%;
            
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }
        /* 쪽지 창 */
        #saveboxMessage{
            width: 500px;
            height: 380px;
            /* border: 1px solid gray; */
        }
        #sender{
            margin-top: 30px;
            width: 100%;
            height: 15%;
        }
        #mContent{
            margin: auto;
            width: 100%;
            height: 85%;
        }
        textarea{
            resize:none;
        }
        #person{
        	font-size: 15px;
        }
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
            <div id="saveboxMessage">
                <div id="sender" align="center">
                	<c:if test="${ loginUser.eId eq nt.eId }">
                    	받는 사람 
                    	<input type="text" size="40" value="${ nt.receiver }" readonly>
                    </c:if>
                    <c:if test="${ loginUser.eId eq nt.receiver }">
                    	<span>보낸 사람</span>
                    	<input type="text" size="40" value="${ nt.eId }" readonly>
                    </c:if>
                </div>
                <div id="mContent" align="center">
                    <textarea cols="55" rows="10" id="contentArea" readonly>${ nt.ntContent }</textarea>
                    <br>
                    <div id="buttons">
                    	<c:url var="ntSaveDelete" value="ntSaveDelete.do">
                    		<c:param name="ntId" value="${ nt.ntId }"/>
                    		<c:param name="page" value="${ currentPage }"/>
                    	</c:url>
                    	<c:url var="toList" value="ntsaveList.do">
                    		<c:param name="page" value="${ currentPage }"/>
                    	</c:url>
                        <button type="button" id="delete" class="btn btn-secondary btn-sm" onclick="location.href='${ntSaveDelete}'">삭제</button>
                        <button type="button" id="toList" class="btn btn-secondary btn-sm" onclick="history.back();">목록으로</button>
                    </div>
                </div>
            </div>
        </div>
        </div>
    <script>
	   	$("#delete").click(function(){
	   		if(confirm("쪽지를 삭제하시겠습니까?") == false){
	   			return false;
	   		}
	   	});
    </script>	
</body>
</html>