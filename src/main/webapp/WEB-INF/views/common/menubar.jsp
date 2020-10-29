<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
<title>ourwork</title>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/menubar-style.css"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>

</head>
<body>
	<c:if test="${ !empty msg }">
      	<script>alert('${msg}');</script>
      	<c:remove var="msg"/>
   	</c:if>
	<div class="header">

        <a onclick="location.href='home.do'">
        <img class="logo" src="${ contextPath }/resources/images/common/main_logo.png" ></a>
        <div class="top_profile" align="right">
            <button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <c:out value="${ loginUser.eName }님 "/>
            
            
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <a class="dropdown-item" id="upIn"  name="wIn" onclick="upIn();">출근</a>
                <a class="dropdown-item" id="upOut" name="wOut" onclick="upOut();">퇴근</a>
                <a class="dropdown-item" href="#" onclick="location.href='eMypage.do'">마이페이지</a>
                <a class="dropdown-item" href="#" onclick="location.href='logout.do'">로그아웃</a>
            </div>
            
        </div>
        <c:if test="${ loginUser.profile.changeName eq null }">
           <img class="profile" src="${ contextPath }/resources/images/common/profile_none.png" >
        </c:if>
        
        <c:if test="${ loginUser.profile.changeName ne null }">
        <img  src="${ contextPath }/resources${ loginUser.profile.filePath }/${ loginUser.profile.changeName }" class="profile">
        </c:if>

    </div>
    <script> 
	   function upIn(){
	      if(confirm("출근 처리하시겠습니까?") == false){
	         return false;
	      }else{
	         location.href="employeeWIn.do";
	      }
	   }
	         
	   function upOut(){
	      if(confirm("퇴근 처리하시겠습니까?") == false){
	         return false;
	      }else{
	         location.href="employeeWOut.do";
	      }
	   }
	   
	      function insa() {
	         if(${ loginUser.dId ==1 }){
	            location.href="employeeE.do";
	         }else{
	            alert("인사팀이 아닙니다.");
	         }
	      }
	   
	</script>
</body>
</html>