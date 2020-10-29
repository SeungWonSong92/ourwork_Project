<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>로그인</title>	
    <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<link rel="stylesheet" href="${ contextPath }/resources/css/menubar-style.css" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box
}

#wrapper {
	width: 1200px;
margin-left: 25%;
margin-top: 10%;
	/* margin: auto; */
	/*display: flex; */
	/* background-color: #5396c9; */
}

/* style the container */
.container {
	/* border: 1px solid gray; */
	width: 50%;
	position: relative;
	border-radius: 5px;
	/* background-color: hsl(0, 0%, 95%); */
	padding: 20px 0 30px 0;
	/*display: flex;*/
}

/* bottom container */
.bottom-container {
	width: 35%;
	text-align: center;
	border-radius: 5px;
	display: flex;
}

/* style inputs and link buttons */
input {
	width: 100%;
	padding: 12px;
	/* border: none; */
	border-radius: 4px;
	margin: 5px 0;
	opacity: 0.85;
	display: inline-block;
	font-size: 17px;
	line-height: 20px;
	text-decoration: none; /* remove underline from anchors */
}
.btn{
	width: 50%;
	padding: 12px;
	/* border: none; */
	border-radius: 4px;
	opacity: 0.85;
	display: inline-block;
	font-size: 17px;
	line-height: 20px;
	text-decoration: none;
	float: left;
	background-color: #01579a;
 }

/* style the submit button */
input[type=submit] {
	background-color: #73b8ec;
	color: white;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #5e9ece;
}

/* Two-column layout */
.col {
	align-content: center;
	width: 75%;
	/* margin: auto;
	padding: 0 50px; */
	margin-top: 6px;
}

.bottom {
	width: 100%;
	margin: auto;
	/* padding: 0 50px; */
	margin-top: 6px;
}
/* Clear floats after the columns */
/* .row2 {
	margin: auto;
} */

#button {
	background-color: #73b8ec;
	color: white;
	cursor: pointer;
}

/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 650px) {
	/* hide the vertical line */
	.vl {
		display: none;
	}

	/* show the hidden text on small screens */
	.hide-md-lg {
		display: block;
		text-align: center;
	}
}

/* 모달 */
.mo1 {
	width: 150px;
	text-align: center;
}

.mo2 {
	padding: 5px;
}

.b12 {
	margin-left: 500px;
	margin-top: 30px;
}

.modal-content {
	width: 500px;
}

.in {
	padding: 0px;
	width: 300px;
	height: 30px;
	margin-bottom: 20px;
}

.btn-group {
	width: 200px;
	text-align: center;
}

.btn-secondary {
	background: #01579a;
}

.modal-body {
	text-align: center;
}

#id, #pwd {
	margin-top: 16px;
	border: black;
}
#song{
	margin-right: 2px;
}
img:hover{
	cursor: default;
}
</style>

</head>

<body>
	<c:if test="${ !empty msg }">
      	<script>alert('${msg}');</script>
      	<c:remove var="msg"/>
   	</c:if>
	<div id='wrapper' align="center">
		<br> <br>
		<div class="container">
						<img class="logo" src="${ contextPath }/resources/images/common/main_logo.png"><br><br>
			
				<div class="row2">
					<form action="login.do" method="post" >
					<div class="col">
						<input type="text" name="eId" placeholder="ID" required> 
						<input type="password" name="ePwd" placeholder="Password" maxlength="20" required>
						<input type="submit" value="로그인">
					
					</div>
					</form>
				</div>
		</div>

		<div class="bottom-container">
			<!-- <div class="row2"> -->

					<button href="#" data-toggle="modal" style="color: white"
						class="btn" data-target="#staticBackdrop" id="song">ID/PWD 찾기</button>

					<button style="color: white" class="btn" onclick="location.href='eJoin.do'">회원가입</button>


			<!-- </div> -->
		</div>
		<br> <br>
	</div>
	</div>
	
	<!-- ModalID -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">ID/PWD찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-secondary active"> 
						<input type="radio" name="tap" id="findId" onchange="setDisplay()" checked>ID찾기
						</label> <label class="btn btn-secondary"> <input type="radio"
							name="tap" id="findPwd" onchange="setDisplay()">PW찾기
						</label>
					</div>
					<div id="id">
						<table>
							<tr class="mo2">
								<td class="mo1">이름</td>
								<td><input type="text" id="eName" name="eName"></td>
							</tr>
							<tr class="mo2">
								<td class="mo1">이메일</td>
								<td><input type="email" id="email" name="email"></td>
							</tr>
						</table>
						<button type="button" class="btn btn-secondary"	data-dismiss="modal" onclick="getId();">찾기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal" >닫기</button>
					</div>
					<div id="pwd">
						<table> 
							<tr class="mo2">
								<td class="mo1">이름</td>
								<td><input type="text" id="eeName" name="eName"></td>
							</tr>
							<tr class="mo2">
								<td class="mo1">아이디</td>
								<td><input type="text" id="eeId" name="eId"></td>
							</tr>
							<tr class="mo2">
								<td class="mo1">이메일</td>
								<td><input type="email" id="eemail" name="email"></td>
							</tr>

						</table>
					<button type="button" class="btn btn-secondary"	data-dismiss="modal" onclick="getPwd();">찾기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal" >닫기</button>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$('#pwd').hide();
		});

		function setDisplay() {
			if ($('input:radio[id=findId]').is(':checked')) {
				$('#id').show();
				$('#pwd').hide();
			} else if ($('input:radio[id=findPwd]').is(':checked')) {
				$('#id').hide();
				$('#pwd').show();
			}
		}
		function getId(){
			var eName = $("#eName").val();
			var email = $("#email").val();
			
			location.href="findId.do?eName="+eName+"&email="+email;
		}
		
		function getPwd(){
			var eeName = $("#eeName").val();
			var eeId = $("#eeId").val();
			var eemail = $("#eemail").val();
			
			location.href="findPwd.do?eName="+eeName+"&eId="+eeId+"&email="+eemail;
		}
	</script>


</body>


</html>

