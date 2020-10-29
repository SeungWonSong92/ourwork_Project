<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 쪽지 상세 조회</title>
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
        #outboxMessage{
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
        #contentArea{
            resize:none;
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
	                <button id="selected" onclick="location.href='ntOutboxList.do'">보낸 쪽지함</button>
	                <button onclick="location.href='ntsaveList.do'">쪽지 보관함</button>
	            </div>
	        </div>
		<div class="section2">
            <div id="outboxMessage">
                <div id="sender" align="center">
                    받는 사람 <input type="text" size="40" value="${ nt.receiver }" readonly>
                </div>
                <div id="mContent" align="center">
                    <textarea cols="55" rows="10" id="contentArea" readonly>${ nt.ntContent }</textarea>
                    <br>
                    <div id="buttons">
                    	<c:url var="ntsave" value="ntOutsave.do">
                    		<c:param name="ntId" value="${ nt.ntId }"/>
                    	</c:url>
                    	<c:url var="ntOutDelete" value="ntOutDelete.do">
                    		<c:param name="ntId" value="${ nt.ntId }"/>
                    		<c:param name="page" value="${ currentPage }"/>
                    	</c:url>
                    	<c:url var="returnNote" value="returnNote.do">
                    		<c:param name="ntId" value="${ nt.ntId }"/>
                    	</c:url>
                    	<c:url var="toList" value="ntOutboxList.do">
                    		<c:param name="page" value="${ currentPage }"/>
                    	</c:url>
                    	<button type="button" id="save" class="btn btn-secondary btn-sm" onclick="return saveNote();">보관</button>                        
                        <button type="button" id="delete" class="btn btn-secondary btn-sm" onclick="return deleteNote();">삭제</button>
                        <input type="hidden" value="${ nt.receiveDate }" id="receiveDate">
                        <input type="hidden" value="${ nt.status }" id="status">
                   		<button type="button" id="returnNote" class="btn btn-secondary btn-sm" onclick="return returnNote();">발송취소</button>
                        <button type="button" id="toList" class="btn btn-secondary btn-sm" onclick="history.back();">목록으로</button>
                    </div>
                </div>
            </div>
        </div>
        </div>
    <script>
	    var date = document.getElementById("receiveDate").value;
     	var status = document.getElementById("status").value;
     	
     	window.onload = function(){
     	
     		if(date == "" && status == 'Y'){
     			
     			$("#returnNote").show();
     		}else{
     			$("#returnNote").hide();
     		}
     	}
     	
	    function saveNote(){
	   		if(confirm("쪽지를 보관하시겠습니까?") == false){
	   			return false;
	   		}else{
	   			location.href='${ntsave}';
	   		}
	   	}
	   
	    function deleteNote(){
	    	if(confirm("쪽지를 삭제하시겠습니까?") == false){
	    		return false;
	    	}else{
	    		location.href='${ntOutDelete}';
	    	}
	    }
	    
	    function returnNote(){
	    	if(confirm("발송취소하시겠습니까?") == false){
	    		return false;
	    	}else{
	    		location.href='${ returnNote }';
	    	}
	    }
    </script>	
</body>
</html>