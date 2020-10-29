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
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
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
#notice{
	font-size:13px;	
}
.notice{
	font-weight:bold;
}

textarea:focus {
  outline: none;
}

#lcontent{
	background: none;
	border: 2px solid gray;
	border-radius: 5px;
	width:70px;
	font-size:13px;
	font-weight: bold;
	color: #01579a;
}

.pimg{
	border-radius:50px;
}

/* textarea {
    resize: none;
} */


</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	    <div class="section"><br>
        <jsp:include page="../common/approvalmenu.jsp"/>
	<div class="section2">
		<div class="content1">
			<div id="buttongroup">
				<c:if test="${button == 0 || button == 5}">
				<button class="btn1" id="btn1" type="button">
					<img class="icon1" src="resources/images/approval/close.png">상신취소
				</button>
				</c:if>
				<c:if test="${button == 1 || button == 6 || button == 7}">
					<button class="btn1" data-toggle="modal" data-target="#exampleModal1" id="yes" onclick="PopModal()"><img class="icon1" src="resources/images/approval/success.png">결재</button>
                    <button class="btn1" data-toggle="modal" data-target="#exampleModal1" id="no" onclick="PopModal()"><img class="icon1" src="resources/images/approval/close.png">반려</button>
				</c:if>
                <button class="btn1" type="button" id="downform">
                	<img class="icon1" src="resources/images/approval/download.png">문서저장
                </button>
                <c:if test="${button ==0 }">
                <button class="btn1" type="button"  onclick="location.href='aRequestList.do'">
                	<img class="icon1" src="resources/images/approval/list.png">목록
                </button>
                </c:if>
                <c:if test="${button == 1}">
                <button class="btn1" type="button"  onclick="location.href='aWaitingList.do'">
                	<img class="icon1" src="resources/images/approval/list.png">목록
                </button>
                </c:if>
                 <c:if test="${button == 2}">
                <button class="btn1" type="button"  onclick="location.href='aReceptionList.do'">
                	<img class="icon1" src="resources/images/approval/list.png">목록
                </button>
                </c:if>
                <c:if test="${button == 3}">
                <button class="btn1" type="button"  onclick="location.href='aRefList.do'">
                	<img class="icon1" src="resources/images/approval/list.png">목록
                </button>
                </c:if>
                <c:if test="${button == 4 || button == 5 || button == 6}">
                <button class="btn1" type="button"  onclick="history.back();">
                	<img class="icon1" src="resources/images/approval/list.png">목록
                </button>
                </c:if>
                <c:if test="${button == 4 || button == 5 || button == 7}">
                <button class="btn1" type="button"  onclick="location.href='aExpected.do'">
                	<img class="icon1" src="resources/images/approval/list.png">목록
                </button>
                </c:if>
 				
			</div>
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
			<div id="formContent">
			<span
				style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
				<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
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
								class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">휴가원</td>
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
												<span
													class="comp_item"
													style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
													${a.eName }</span><br>
											</td>
										</tr>
										<tr>
											<td
												style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

												기안부서</td>
											<td
												style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
												${a.dName }</span><br>
											</td>
										</tr>
										<tr>
											<td
												style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

												기안일</td>
											<td
												style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
												${a.astartDate }</span><br>
											</td>
										</tr>
										<tr>
											<td
												style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

												문서번호</td>
											<td
												style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">${a.aId }</span><br>
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
				<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
					<!-- 품의서 -->
					<colgroup>
						<col width="200">
						<col width="350">
						<col width="200">
						<col width="200">
					</colgroup>
					<tbody>
						<tr>
							<td
								style="padding: 5px; border: currentColor; height: 20px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);"
								colspan="4">
								<p
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;">
									<br>
								</p>
							</td>
						</tr>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

								휴가종류</td>
							<td
								style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
								colspan="3"> ${h.hdType }
								<br></td>
						</tr>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

								휴가기간</td>
							<td style="background: rgb(255, 255, 255); border: 1px solid black; ">
								${h.hstartDate } ~ ${h.hendDate }
							</td>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								사용일</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; ">
								<span class="ipt_editor">${h.hterm }일</span>
							</td>
						</tr>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

								휴가사유</td>
							<td
								style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
								colspan="3" class="dext_table_border_t">
								<textarea rows="5" cols="70" class="ipt_editor" style="border: none" name="hReason" readonly style="resize: none;">${h.hReason }</textarea><br></td>
						</tr>
						<tr>
							<td
								style="border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 100px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);"
								colspan="4" class="dext_table_border_t"><span
								style="font-weight: bold; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">휴가기준
									제 13조에 의거 휴가를 신청하오니 허락하여 주시기 바랍니다.</span></td>
						</tr>
					</tbody>
				</table>
			</span>
			<br>
			<p id="notice"><span class="notice">[당일 반차 신청시]</span> 시작일만 오전/오후 체크 (0.5일)<br>
			<span class="notice">[예비군/민방위 신청시]</span> 통지서 스캔하여 파일 첨부<br>
			<span class="notice">[경조휴가 신청시]</span> 증빙서류 스캔하여 파일 첨부 (예: 청첩장 등본 등)</p>
			</div>
           <c:if test="${ !empty at }">
            <c:forEach var="at" items="${at}">
				<a href="${contextPath }/resources/auploadFiles/${at.changeName}" download>${ at.originName }</a><br>
            </c:forEach>
			</c:if>
		</div>
		<div class="content2">
			<div id="radiobox">
				<input type="radio" name="info" id="info1" onchange="setDisplay()" checked="checked"><label for="info1">결재선</label> 
				<input type="radio" name="info" id="info2" onchange="setDisplay()"><label for="info2">참조</label>
			</div>
			<div id="approvalinfo">
			<c:forEach var="l" items="${llist}">
			<c:if test="${l.lLevel ne 0 }">
				<div class="peopleinfo">
					<div id="line">
						<c:if test="${l.changeName ne null}">
							<img class="pimg" src='resources/images/profileUploadFiles/${l.changeName }'>
						</c:if>
						<c:if test="${l.changeName eq null }">
							<img src='resources/images/common/profile_none.png'>
						</c:if>
						<span class="name1"><span calss="ename">${l.eName}${l.rName}</span>
						<c:if test="${l.lContent ne null }">
						<button type="button" id="lcontent" data-toggle="modal" data-target="#exampleModal11" class="openModal">결재의견
						<input type="hidden" id="leName" value="${l.eName }">
						<input type="hidden" id="lrName" value="${l.rName }">
						<input type="hidden" id="lContent" value="${l.lContent }">
						</button><br>
						</c:if>
						<p class="deptname">${l.dName }</p>
						<button type="button" class="dBtn" id="deleteImg">
						<input type="hidden" name="leId" class="user1" value=${ l.leId }>
						<img id='dbtn' src='resources/images/approval/trash.png'></button>
						<input type="hidden" name="lLevel" value="결재">
						<c:if test="${l.lStatus eq 'I' || l.lStatus eq 'O'}">
						<span class="status" id="check" style="color : gray" >결재 대기</span>
						</c:if>
						<c:if test="${l.lStatus eq 'Y' }">
						<span class="status" id="check" style="color : gray" >${l.lDate }</span>
						<span class="status" id="check" style="color : green" >승인</span>
						</c:if>
						<c:if test="${l.lStatus eq 'N' }">
						<span class="status" id="check" style="color : gray" >${l.lDate }</span>
						<span class="status" id="check" style="color : red" >반려</span>
						</c:if>
						</span>
					</div>
				</div>
			</c:if>
			</c:forEach>
			</div>
			
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
			
			 <!-- Modal -->
                <div class="modal fade" id="exampleModal11" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">결재의견</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="mbody" style="width:100%">
                                   <span> 결재자 :</span>  &nbsp; <span id="modalname"></span><br>
                                   <textarea id="modalcontent" style="width:100%" readonly style="resize: none;"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <!-- Modal -->
                      <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">결제처리</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mbody" style="width:100%">
                                        <form action="lupdate.do"  method="post">
                              				<input type="hidden" name="aId" value="${a.aId}">
                                           <table class="table">
                                               <tr>
                                                   <th>결재처리</th>
                                                   <td>
                                                       <!--  <input type="radio" name="approval1" id="approval1"><label for="approval1">결재</label>&nbsp;
                                                        <input type="radio" name="approval2" id="approval2"><label for="approval2">반려</label> -->
                                                        <input type="text" id="status" name="lStatus" style="border:none">
                                                    </td>
                                               </tr>
                                               <tr>
                                                    <th>결재의견</th>
                                                    <td><textarea class="form-control" id="message-text" name="lContent" style="resize: none;"></textarea></td>
                                               </tr>
                                           </table>
                                            <div class="modal-footer">
                                            <button type="submit" class="btn btn-secondary">확인</button>
                                            </div>
                                           </form>
                                        </div>
                                    </div>
                                   <!--  <div class="modal-footer">
                                        <button type="submit" class="btn btn-secondary" data-dismiss="modal">확인</button>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                
		</div>
	</div>
</div>
	<script>
	//결재선,참조
        function setDisplay() {
            if ($('input:radio[id=info1]').is(':checked')) {
                $('#approvalinfo').show();
                $('#referenceinfo').hide();
            } else {
                $('#referenceinfo').show();
                $('#approvalinfo').hide();
            }
        }
        
        //상신 취소
        $('#btn1').on('click', function() { 
        	var con_test = confirm("정말로 취소하시겠습니까?");
        	if(con_test == true){
        		if($('#check').text()=='결재 대기'){
        			window.location.href="<c:url value='cancle.do' />?aId="+${a.aId};
        			alert("삭제가 완료되었습니다");
        		}else{
        			alert("이미 결재된 문서는 취소할 수 없습니다");
        		}
        	}
        });
        
        //결재의견
        $(document).ready(function () {
            $(".openModal").click(function(e){
               $("#modalname").text($(this).children("#leName").val() + " " +$(this).children("#lrName").val());
               $("#modalcontent").text($(this).children("#lContent").val());
            });
        });
        
        //승인, 반려
        $("#yes").on("click", function(){
        	$("#status").val("결재");
		});
        
        $("#no").on("click", function(){
        	$("#status").val("반려");
		});
        
        /* var suffix = 1;
        function downloadAll(oFrm){
        	var oChk = oFrm.elements["file" + (suffix++)];
        	if(oChk){
        		if(oChk.checked){
        			location.href="/filepath" + oChk.value;
        			setTimeout(function(){
        				downloadAll(oFrm)
        			}, 1000);
        		}else{
        			downloadAll(oFrm);
        		}
        	}
        } */
        
        function PrintDiv(div){
        	div = div[0];
        	html2canvas(div).then(function(canvas){
        		var myImge = canvas.toDataURL();
        		downloadURI(myImge, "휴가원.png");
        	});
        }
        
        function downloadURI(uri, name){
        	var link = document.createElement("a");
        	link.download = name;
        	link.href = uri;
        	document.body.appendChild(link);
        	link.click();
        }
        
        $('#downform').click(function(){
        	PrintDiv($('#formContent'));
        })
         
    </script>
</body>

</html>