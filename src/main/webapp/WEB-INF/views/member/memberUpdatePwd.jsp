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
    
    <title>개인정보 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
    
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"> </script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <style>
        body {
            width: 1400px;
            height: 800px;
        }
        .section {
            width: 100%;
            height: 85%;
        }

        .aside {
            height: 100%;
            width: 6%;
            background: #01579a;
        }

        .section1 {
            width: 14%;
            height: 100%;
            
        }

        .section2 {
            text-align: center;
            width: 80%;
            height: 100%;
            margin-left: 50px;
            margin-top: 80px;
            float: left;
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;    
        }

        .section,
        .section1 {
            display: flex;
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
        }
        .aside button:hover{
            background: #1e87e4;
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
                /* 내용 td */
                td{
            font-size: 15px;
            /*font-weight : bold;*/
            height: 50px;
        }
        h4{
            font-weight : bold;
        }

        input,#postcodify_search_button {
        
        padding: 9px;
        border: 1px solid rgb(182, 181, 181);
        border-radius: 4px;
        margin: 5px 0;
        opacity: 0.85;
        display: inline-block;
        font-size: 12px;
        line-height: 20px;
        text-decoration: none; /* remove underline from anchors */
        }
        
        #add{
        width: 310px;
        }


       /* style the submit button */

        input[type=button] {
        background-color: #2a7fc0;
        color: white;
        cursor: pointer; 
        }

        input[type=button]:hover {
        background-color: #2670a8;
        }

        input[type=submit] {
        background-color: #2a7fc0;
        color: white;
        cursor: pointer; 
        }

        input[type=submit]:hover {
        background-color: #2670a8;
        }
        
       tr,td{
            text-align: center;
            }
            
        #postcodify_search_button{
        background-color: #2a7fc0;
        color: white;
        cursor: pointer; 
        }
        
        #postcodify_search_button :hover{
         background-color: #2670a8;
         }
    /* ajax 적용 이후 */
	span.guide {
		display: none;
		font-size: 12px;
		top: 12px;
		right: 10px;
	}
	
	span.ok {
		color: green;
	}
	
	span.error {
		color: red;
	}
	table{
		margin-left: 370px;
	}
                
    </style>
</head>

<body>

	<jsp:include page="../common/menubar.jsp"/>

    <div class="section"><br>
 	<div class="aside">
		<button onclick="location.href='receiveMailList.do'"><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
       	<button onclick="location.href='ahome.do'"><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
     	<button onclick="location.href='calview.do'"><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
       	<button onclick="location.href='noticeMain.do'"><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
  		<button onclick="location.href='ntInboxList.do'"><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
       	<button id="selectedEmenu" onclick="location.href='eAddress.do'"><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
        <button><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
	</div>
        <div class="section1">
        </div>
        <div class="section2">
        <form action="memberUpdatePwd.do" method="post" id="updateForm" enctype="multipart/form-data">
          <br><br>
            <p>비밀번호 수정</p>

            <table align="center">
            
 							<tr>
								<td>새로운 비밀번호 :</td>
								<td><input type="password" name="ePwd" id="ePwd" minlength="4" maxlength="16" placeholder=" 8-16자 영문,숫자 조합" required>
								</td>
							</tr>
							<tr>
								<td>새로운 비밀번호 확인 :</td>
								<td><input type="password" name="ePwd2" id="ePwd2" minlength="4" maxlength="16" placeholder="비밀번호 확인" required></td>
								<td><font name="check" size="2" color="red"></font></td>								
							</tr>

            </table>
            <br><br><input type="button" onclick="location.href='eMypage.do'" value="취소" required>&emsp;           
            <input type="submit" id="update" value="수정완료" required>
			</form>
        </div>      
    </div>


<script> 

//PWD 일치여부
$(function() {
	$('#ePwd').keyup(function() {
		$('font[name=check]').text('');
	}); //#user_pass.keyup

	$('#ePwd2').keyup(function() {
		if ($('#ePwd').val() != $('#ePwd2').val()) {
			$('font[name=check]').text('');
			$('font[name=check]').html("불일치합니다.");
			$('font[name=check]').css('color', 'red');
		} else {
			$('font[name=check]').text('');
			$('font[name=check]').html("일치합니다.");
			$('font[name=check]').css('color', 'blue');
		}
		return false;
	}); 
});


$(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 
		
    	$("#update").click(function(){
    		if(confirm("비밀번호를 수정하시겠습니까?") == false){
    			return false;
    		}
    	});
						
</script>

</body>

</html>