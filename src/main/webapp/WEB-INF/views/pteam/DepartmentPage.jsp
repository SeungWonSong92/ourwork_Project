<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인 메뉴</title>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<style>
        
        #selectedMenu{
            background: #1e87e4;  
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }

        /* 메뉴바 */
        /* 여기 a 태그*/
        .menubar a{
            padding: 6px 8px 6px 16px;
            text-decoration: none;
            font-size: 15px;
            color: rgb(52, 53, 77);
            display: block;
            border: none;
            background: none;
            width: 100%;
            text-align: left;
            cursor: pointer;
            outline: none;
            margin-top: 20px;
        }

        .approval, .schedule, .notice, .board{
            width: 48%;
            height: 48%;
            margin: 6px;
            box-sizing: border-box;
            display: inline-block;
        }
        .menubar button{
            border: none;
            background: none;
            width: 100%;
            height: 50px;
            margin-top: 20px;
        }
        .menubar button:hover{
            color: #1e87e4;
            font-weight: bold;
        }
        .title{
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;
            float: left;
        }
        /* 페이징바 */
        .page_wrap {
        text-align:center;
        font-size:0;
        }
        .page_nation {
        display:inline-block;
        }
        .page_nation .none {
        display:none;
        }
        .page_nation a {
        display:block;
        margin:0 3px;
        float:left;
        border:1px solid #e6e6e6;
        width:28px;
        height:28px;
        line-height:28px;
        text-align:center;
        background-color:#fff;
        font-size:13px;
        color:#999999;
        text-decoration:none;
        }
        .page_nation .arrow {
        border:1px solid #ccc;
        }
        .page_nation .pprev {
        background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
        margin-left:0;
        }
        .page_nation .prev {
        background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
        margin-right:7px;
        }
        .page_nation .next {
        background:#f8f8f8 url('img/page_next.png') no-repeat center center;
        margin-left:7px;
        }
        .page_nation .nnext {
        background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
        margin-right:0;
        }
        .page_nation a.active {
        background-color:#42454c;
        color:#fff;
        border:1px solid #42454c;
        }
		.noticeList{
			text-align: center;
		}
		.table{
		text-align: center;
		width: 400px;
		}
		
		.ta{
		text-align: center;
		width: 400px;
		}
		.list{
			width: 500px;
		}
        
    </style>
    
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />
    <div class="section"><br>
       <jsp:include page="../common/pteammenu.jsp" />
        <div class="section1">
            <div class="menubar">
                    <button  onclick="location.href='employeeE.do'">사원 관리</button>
                    <button id="selected" onclick="location.href='dept.do'">부서 관리</button>
                    <button onclick="location.href='attend.do'">근태 관리</button>
        </div>
        </div>
        <div class="section2">
            <div id="mainContent">
                <div class="list">
                    <br>
                    <br>
                    <h5>부서 추가</h5>
                    <form action="deptinsert.do">
                    <input type="text" class="did" name="dName">
                    <button type="submit" class="btn btn-secondary btn-sm">추가</button>
                    </form>
                    <br>
                    <br>
                    <table class="table table-hover ta">
                            <thead class="thead-light">
                                <tr>
                                    <th>부서 list</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="d" items="${ dList }">
                                <tr>
                                    <td>${ d.dName }</td>
                                    <%-- <td><button onclick="location.href='deptd.do?dId='+${d.dId}">삭제</button></td> --%>
                                    <td><button onclick="ddelete(this.value);" value="${ d.dId }">삭제</button></td>
                                </tr>
                            </c:forEach>    
                            </tbody>
                          </table>
                </div>
                    
        </div>
    </div>

</body>
	<script>
		window.onload = function() {
			if(${result1} == 1){
				alert("삭제 성공했습니다.");
				location.href="dept.do";
			}else if(${result1} == 2){
				alert("부서에 사람이 있습니다.");
				location.href="dept.do";
			}else{
			}
		}
	
		function ddelete(num){
			var test = confirm("부서를 삭제하시겠습니까?");
			console.log(test);
			var dId = num;
			console.log(dId);
			
			if(test = "true"){
				location.href = "deptd.do?dId="+ dId;
			}else{
				alert("실패하였습니다.");
			}
		}
	</script>

</html>