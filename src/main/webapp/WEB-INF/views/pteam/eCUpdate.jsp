<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>OurWork</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <style>
        
        .approval, .schedule, .notice, .board{
            width: 48%;
            height: 48%;
            margin: 6px;
            box-sizing: border-box;
            display: inline-block;
        }
        .icons{
            width: 50%;
            height: 50%;
            
        }
        .aside button{
            width: 100%;
            height: 11%;
            background: none;
            border: none;
            color: white;
            float: left;
            margin-bottom: 4px;
        }
        .aside button:hover{
            background: #1e87e4;
        }
        .top_profile button{
            margin-top: 30px;
            margin-right: 20px;
        }
        .dropdown-toggle{
            border: none;
            background: none;
        }
        .menubar button{
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

        #selectedMenu{
            background: #1e87e4;  
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }
        
        /* 테이블 */
        #boardTable {
      margin:auto;
      border:solid 1px white;
      width: 830px;
      margin-top: 30px;
   }
   
   #boardTable th, #boardTable td {
      border:solid 1px white;
      text-align:center;
      font-size: 15px;
      padding: 10px;
      width: 800px;
   }
   .in{
       padding: 0px;
       width: 650px;
       height: 30px;
       margin-bottom: 20px;
   }
   .int{
    padding: 0px;
    margin-bottom: 20px;
    width: 650px;
    height: 250px;
   }
   .division{
       width: 50px;
   }

   .in{
       padding: 0px;
       width: 300px;
       height: 30px;
       margin-bottom: 20px;
       text-align: center;
   }
   .int{
    padding: 0px;
    margin-bottom: 20px;
    width: 300px;
    height: 100px;
   }

   .btn1{
       text-align: center;
   }
   /* 모달 */
   .mo1{
       width: 150px 
   }
   .mo2{
       padding: 5px;
   }

   .b12{
       margin-left: 500px;
       margin-top: 30px;
   }
   .modal-content{
       width: 500px;
   }
   .Name{
      width: 95%;
      height: 30px;
   }
   .ops{
      text-align: center;
   }
        
    </style>
</head>

<body>
    <jsp:include page="../common/menubar.jsp" />
    <div class="section"><br>
       <jsp:include page="../common/pteammenu.jsp" />
        <div class="section1">
            <div class="menubar">
                    <button id="selected" onclick="location.href='employeeE.do'">사원 관리</button>
                    <button onclick="location.href='dept.do'">부서 관리</button>
                    <button  onclick="location.href='attend.do'">근태 관리</button>
        </div>
        </div>
        <div class="section2">
        <form action="updemployee.do" method="post" enctype="multipart/form-data">
            <table id="boardTable">
            <input type="hidden" value="${ currentPage }" name="page">
            <input type="hidden" value="${ employee.eId }" name="eId">
            <%-- <input type="hidden" value='${ employee.status }' name="status"> --%>
            <br>
               <h4>${ employee.eName }님의 회원 정보 수정</h4>
                <tr>
                    <td class="division">이름</td>
                    <input type="hidden" value="${ employee.status }" name="status">
                    <td class="in"><input type="text" textalign="center" name="eName" size="50" class="in" value="${ employee.eName }" readonly="readonly"></td>
                    <td class="division">직급</td>
                    <td class="in">
                       <select id="rName" class="Name" name="rId">
                  <option class="ops" value="${ employee.rId }">${ employee.rName }</option>
                  <c:forEach var="r" items="${ rName }">
                     <option class="ops" value="${ r.rId }">${ r.rName }</option>
                  </c:forEach>
                  </select>
                    </td>    
                </tr>
                <tr>
                    <td class="tel1">연락처</td>
                    <td class="in"><input type="tel" name="phone" size="50" class="in" value="${ employee.phone }"></td>
                    <td class="division">자격증</td>
                    <td class="in">
                           <c:if test="${ !empty at.originName }">
                           파일 : ${ at.originName }
                        </c:if>
                        <c:if test="${ empty at.originName }">
                           등록된 파일이<br> 없습니다.
                        </c:if>
                           <input type="file" name="uploadFile" class="in">
                        </td>
                </tr>
                <tr>
                    <td class="division">주소</td>
                    <td class="in"><input type="text" name="address" class="in" value="${ employee.address }" readonly></td>
                    
                    <td class="division">자격증 수기</td>
                        <td class="in"><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#staticBackdrop2">수정</button></textarea></td>
                </tr>
                <tr>
                    <td class="division">부서</td>
                    <td class="in">
                  <select id="dName" class="Name" name="dId">
                  <option class="ops"  value="${ employee.dId }">${ employee.dName }</option>
                  <c:forEach var="d" items="${ dName }">
                     <option class="ops" value="${ d.dId }">${ d.dName }</option>
                  </c:forEach>
                  </select>
               </td>
                        <td class="division">학력</td>
                    <td class="in"><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#staticBackdrop">수정</button></td>
                </tr>
                <tr>
                        <td class="division">입사일</td>
                        <td class="in"><input type="date" class="in" name="join_date" value="${ employee.join_date }"></td>
                        <td class="division">경력</td>
                    <td class="in"><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#staticBackdrop1">수정</button></td>
                        
                    </tr>
                    <tr>
                            <td colspan="4" class="btn1">
                                <button type="submit" class="btn btn-secondary btn-sm">수정</button>
                                <button type="button" class="btn btn-secondary btn-sm">취소</button>
                            </td>
                    </tr>
            </table>
            </form>
        </div>
    </div>

    <!-- Modal학력 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel">학력</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-secondary">
                              <input type="radio" name="tap" id="high" onchange="setDisplay()" checked>고등학교
                            </label>
                            <label class="btn btn-secondary">
                              <input type="radio" name="tap" onchange="setDisplay()" id="University">대학교
                            </label>
                          </div>
                          <div id="high1">
                             <form action="edhinsert.do" name="edForm" method="get">
                             <input type="hidden" value="${ currentPage }" name="page">
                        <input type="hidden" value="${ employee.eId }" name="eId">
                                <table>
                                      <tr class="mo2">
                                          <td class="mo1">학교이름</td>
                                          <td><input type="text" name="sName" value="${ ed2.sName }"></td>
                                      </tr>
                                      <tr class="mo2">
                                          <td class="mo1">학교유형</td>
                                          <td><input type="text" name="sType" value="${ ed2.sType }"></td>
                                      </tr>
                                      <tr class="mo2">
                                          <td class="mo1">입학일</td>
                                          <td><input type="text" name="admissonDate" value="${ ed2.admissonDate }"></td>
                                      </tr>
                                      <tr class="mo2">
                                          <td class="mo1">졸업일</td>
                                          <td><input type="text" name="graduationDay" value="${ ed2.graduationDay }"></td>
                                      </tr>
                                  </table>
                                  <button type="submit" class="btn btn-primary btn-secondary">수정</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                </form>
                              </div>
                              <div id="University1">
                              <form action="ed3Uinsert.do" name="ed3Form" method="get">
                              <input type="hidden" value="${ currentPage }" name="page">
                           <input type="hidden" value="${ employee.eId }" name="eId">
                                      <table>
                                            <tr class="mo2">
                                          <td class="mo1">학교이름</td>
                                          <td><input type="text" name="sName" value="${ ed3.sName }"></td>
                                      </tr>
                                      <tr class="mo2">
                                          <td class="mo1">학교유형</td>
                                          <td><input type="text" name="sType" value="${ ed3.sType }"></td>
                                      </tr>
                                      <tr class="mo2">
                                          <td class="mo1">학과</td>
                                          <td><input type="text" name="department" value="${ ed3.department }"></td>
                                      </tr>
                                      <tr class="mo2">
                                          <td class="mo1">입학일</td>
                                          <td><input type="text" name="admissonDate" value="${ ed3.admissonDate }"></td>
                                      </tr>
                                      <tr class="mo2">
                                          <td class="mo1">졸업일</td>
                                          <td><input type="text" name="graduationDay" value="${ ed3.graduationDay }"></td>
                                      </tr>
                                        </table>
                                        <button type="submit" class="btn btn-primary btn-secondary">수정</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                    </form>
                                    </div>
                    
            </div>
          </div>
        </div>
      </div>

      <!-- Modal경력 -->
<div class="modal fade" id="staticBackdrop1" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel">경력</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                    <form action="cainsert.do" name="caForm" method="get">
            <input type="hidden" value="${ currentPage }" name="page">
            <input type="hidden" value="${ employee.eId }" name="eId">
                    <table>
                            <tr class="mo2">
                                <td class="mo1">직장</td>
                                <td><input type="text" name="rectal" value="${ ca.rectal }"></td>
                            </tr>
                            <tr class="mo2">
                                <td class="mo1">부서</td>
                                <td><input type="text" name="c_Department" value="${ ca.c_Department }"></td>
                            </tr>
                            <tr class="mo2">
                                <td class="mo1">직급</td>
                                <td><input type="text" name="rnak" value="${ ca.rnak }"></td>
                            </tr>
                            <tr class="mo2">
                                    <td class="mo1">입사일</td>
                                    <td><input type="text" name="employmentDate" value="${ ca.employmentDate }"></td>
                                </tr>
                            <tr class="mo2">
                                <td class="mo1">퇴사일</td>
                                <td><input type="text" name="resignation" value="${ ca.resignation }"></td>
                            </tr>
                        </table>
                        <button type="submit" class="btn btn-primary btn-secondary">등록</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Modal 자격증 수기 -->
<div class="modal fade" id="staticBackdrop2" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel">자격증</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form action="ceupdate.do" name="cForm" method="get">
            <input type="hidden" value="${ currentPage }" name="page">
            <input type="hidden" value="${ employee.eId }" name="eId">
                <table>
                    <tr class="mo2">
                        <td class="mo1">자격증명</td>
                        <td><input type="text" name="ce_Name" value="${ c.ce_Name }"></td>
                    </tr>
                    <tr class="mo2">
                        <td class="mo1">등급</td>
                        <td><input type="text" name="rating" value="${c.rating}"></td>
                    </tr>
                    <tr class="mo2">
                        <td class="mo1">발급기관</td>
                        <td><input type="text" name="agency" value="${c.agency }"></td>
                    </tr>
                    <tr class="mo2">
                            <td class="mo1">발급날짜</td>
                            <td><input type="text" name="issueDate" value="${c.issueDate }"></td>
                        </tr>
                    <tr class="mo2">
                        <td class="mo1">만료기간</td>
                        <td><input type="text" name="exprationDate" value="${c.exprationDate }"></td>
                    </tr>
                </table>
                    <button type="submit" class="btn btn-primary btn-secondary">닫기</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">수정</button>
                </form>
            </div>
          </div>
        </div>
      </div>
      <script>
        $(function(){
            $('#University1').hide();
        });


       function setDisplay() {
            if ($('input:radio[id=high]').is(':checked')) {
                $('#high1').show();
                $('#University1').hide();
            }else if ($('input:radio[id=University]').is(':checked')) {
                $('#high1').hide();
                $('#University1').show();
            }
        }
      </script>
</body>

</html>