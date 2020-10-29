<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	width: 75%;
	height: 100%;
	float: left;
}

.content2 {
	width: 25%;
	height: 100%;
	float: left;
	padding-left:40px;
}

.btn1 {
	border: none;
	background: none;
}

.btn1:hover {
	background: #f1f1f1 	
}

.icon1 {
	width: 25px;
	height: 25px;
	margin-right: 5px;
}

#buttongroup {
	align: left;
	margin: 20px 0px;
}

#radiobox input[type=radio] {
	position: absolute;
	display: none;
}

#radiobox label {
	cursor: pointer;
	color: gray;
	font-weight: bold;
	text-align: center;
	padding: 20px 30px;
}

#radiobox input[type=radio]:checked+label {
	color: #1e87e4;
}

.peopleinfo img {
	width: 60px;
	height: 60px;
	float: left;
	margin-right: 10px;
}

.name1, .name2 {
	font-weight: bold;
	color: rgb(51, 51, 51);
	font-size: 15px;
}


.deptname {
	margin: 0px;
	font-size: 13px;
	color: rgb(117, 117, 117);
}

.status {
	font-size: 13px;
	color: rgb(117, 117, 117);
}


.dropdown-container div {
	margin: 2px 0px 0px 20px;
	font-weight: bold;
	cursor: pointer;
}

#select {
	overflow: auto;
	border: none;
}
.user1, .user2, .dBtn{
	display:none;
}
#menu1{
	color: #1e87e4;
	font-weight:bold;	
}
#notice{
	font-size:13px;	
}
.notice{
	font-weight:bold;
}
.pimg{
	border-radius:50px;
}
#atdbtnImg{
     width: 10px;
     height: 10px;
}
.atdbtn{
     background: none;
     border: none;
}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	    <div class="section"><br>
        <jsp:include page="../common/approvalmenu.jsp"/>
	<div class="section2">
	<form name="fm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="eId" value="${apeople.eId}${a.eId}">
	<input type="hidden" name="aId" value="${a.aId}">
	<input type="hidden" name="aName" value="품의서">
		<div class="content1">
			<div id="buttongroup">
				<button class="btn1" id="btn1" type="button">
					<img class="icon1" src="resources/images/approval/edit.png">결재요청
				</button>
				<button type="submit"class="btn1" id="btn2" onclick="javascript: form.action='draftInsert.do?aStatus=S'">
					<img class="icon1" src="resources/images/approval/save.png">임시저장
				</button>
				<button type="button" class="btn1" onclick="history.back();">
					<img class="icon1" src="resources/images/approval/close.png">취소
				</button>
				<button type="button" class="btn1" onclick="openAddr();">
					<img class="icon1" src="resources/images/approval/people.png">결재선
				</button>
			</div>
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

					<span
						style="font-family: &amp; amp; quot; 맑은 고딕&amp;amp; quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
						<table
							style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
							<!-- Header -->
							<colgroup>
								<col width="310">
								<col width="490">
							</colgroup>
							<tbody>
								<tr>
									<td
										style="background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;"
										colspan="2"
										class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">품의서</td>
								</tr>
								<tr>
									<td
										style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">

										<table
											style="border: 1px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
											<!-- User -->
											<colgroup>
												<col width="100">
												<col width="220">
											</colgroup>
											<tbody>
												<tr>
													<td
														style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

														기안자</td>
													<td
														style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
														<span class="comp_item"
														style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
															${apeople.eName}${a.eName }</span><br>
													</td>
												</tr>
												<tr>
													<td
														style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

														기안부서</td>
													<td
														style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
														<span class="comp_item"
														style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
															${apeople.dName}${a.dName }</span><br>
													</td>
												</tr>
												<tr>
													<td
														style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

														기안일</td>
													<td
														style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
														<span class="comp_item"
														style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
															<c:out value="${today}" />
													</span><br>
													</td>
												</tr>
												<tr>
													<td
														style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

														문서번호</td>
													<td
														style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
														<span class="comp_item"
														style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">${a.aId }</span><br>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td
										style="background: white; padding: 0px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
										<!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. -->
									</td>
								</tr>
							</tbody>
						</table>
					<table
							style="width: 800px; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; margin-top: 10px; border-collapse: collapse; height: 385px;">
							<colgroup>
								<col width="140">
								<col width="660">
							</colgroup>

							<tbody>
								<tr>
									<td
										style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

										제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
									<td
										style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
										<input class="ipt_editor" size="80px" type="text" name="aTitle" value="${a.aTitle }"><br>
									</td>
								</tr>
								<tr>
									<td
										style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"
										colspan="2">상&nbsp;&nbsp;세&nbsp;&nbsp;내&nbsp;&nbsp;용</td>
								</tr>
								<tr>
									<td
										style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;"
										colspan="2">
										<textarea rows="14" cols="130" name="dContent" style="resize:none">${d.dContent }</textarea><br></td>
								</tr>
							</tbody>
						</table>
					</span>
			<br>
            <input multiple="multiple" type="file" name="uploadFile">
            <c:if test="${ !empty at }">
            <c:forEach var="at" items="${at}">
			<p name="file" id="af">&nbsp;${ at.originName }
	         	<button type="button" class="atdbtn" id="atdbtn">
	         		<img id="atdbtnImg" src="resources/images/approval/trash.png">
	         	</button>
         		<input type="hidden" name="fdata" value="${ at.changeName }">
          	</p>
            </c:forEach>
            </c:if> 
		</div>
		<div class="content2">
			<div id="radiobox">
				<input type="radio" name="info" id="info1" onchange="setDisplay()" checked="checked"><label for="info1">결재선</label> 
				<input type="radio" name="info" id="info2" onchange="setDisplay()"><label for="info2">참조</label>
			</div>
			<div id="approvalinfo"><c:forEach var="l" items="${llist}"><c:if test="${l.lLevel ne 0 }"><div class="peopleinfo"><div id="line"><c:if test="${l.changeName ne null}"><img class="pimg" src='resources/images/profileUploadFiles/${l.changeName }'></c:if><c:if test="${l.changeName eq null}"><img src='resources/images/common/profile_none.png'></c:if><span class="name1"><span calss="ename">${l.eName}${l.rName}</span><p class="deptname">${l.dName }</p><button type="button" class="dBtn" id="deleteImg"><input type="hidden" name="leId" class="user1" value=${ l.leId }><img id='dbtn' src='resources/images/approval/trash.png'></button><input type="hidden" name="lLevel" value="결재"><span class="status">결재</span></span></div></div></c:if></c:forEach></div>
			
			<div id="referenceinfo" style="display: none">
			<c:forEach var="l" items="${llist}">
			<c:if test="${l.lLevel eq 0 }">
				<div class="peopleinfo">
					<div id="line">
						<c:if test="${l.changeName ne null}">
							<img class="pimg" src='resources/images/profileUploadFiles/${l.changeName }'>
						</c:if>
						<c:if test="${l.changeName eq null }">
							<img src='resources/images/common/profile_none.png'>
						</c:if>
					<span class="name2">
						<span calss="ename">${l.eName}${l.rName}</span>
						<p class="deptname">${l.dName }</p>
						<button type="button" class="dBtn" id="deleteImg">
						<input type="hidden" name="leId" class="user1" value=${ l.leId }>
						<img id='dbtn' src='resources/images/approval/trash.png'>
						</button>
						<input type="hidden" name="lLevel" value="참조">
						<span class="status">참조</span>
					</span>
					</div>
				</div>
			</c:if>
			</c:forEach>
			</div>
        </form>
	</div>
</div>
	<script>
        function setDisplay() {
            if ($('input:radio[id=info1]').is(':checked')) {
                $('#approvalinfo').show();
                $('#referenceinfo').hide();
            } else {
                $('#referenceinfo').show();
                $('#approvalinfo').hide();
            }
        }
        
        function openAddr(){
            	var popupWidth = 900;
                var popupHeight = 600;
                var popupX = (window.screen.width / 2) - (popupWidth / 2);
                var popupY = (window.screen.height / 2) - (popupHeight / 2);
                // window.open('addr.html','window_name','width=850,height=600,location=no,status=no,scrollbars=yes');
                window.open('lList.do', '조직도', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
        }
        
        $(document).on("click", ".atdbtn", function(){
            console.log( $(this).parents("p"));
            $(this).parents("p").remove();
        });
        
        $('#btn1').on('click', function() { 
        	if( $('#approvalinfo').is(':empty') ) {
        		alert("결재선이 지정되지 않았습니다. 결재선을 지정해주세요");
        	}else{
        		if(confirm("결재를 요청하시겠습니까?")==false){
        			return false;
        		}
        		var formObj = $("form[name='fm']");  
        		formObj.attr("action", "draftInsert.do?aStatus=I");   
        		formObj.submit(); 
        	}
        });
        


        $('#btn2').on('click', function() {
               	if(confirm("임시저장 하시겠습니까?")==false){
               		return false;
               	}else{
               		return true;
               	}
        });
    </script>
</body>

</html>