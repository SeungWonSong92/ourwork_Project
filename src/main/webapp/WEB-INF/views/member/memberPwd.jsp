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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
      crossorigin="anonymous"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
  <title>비밀번호 찾기</title>
  <style>
    * {box-sizing: border-box}

        #wrapper {
            width: 1200px;
            margin: auto;   
            margin-top:10%;
                    
        }
        
/* style the container */
.container {
  width: 50%;
  position: relative;
  border-radius: 5px;
  background-color: hsl(0, 0%, 95%);
  padding: 20px 0 30px 0;
}

.bottom-container {
  width: 50%;
  text-align: center;
  background-color: #01579a;
  border-radius: 0px 0px 4px 4px;
  display: flex;
}

/* style inputs and link buttons */
.btn {
  width: 100%;
  padding: 12px;
  border: none;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}

   input{
      width: 170px;
      padding: 9px;
      border: none;
      border-radius: 4px;
      margin: 5px 0;
      opacity: 0.85;
      display: inline-block;
      line-height: 20px;
      font-size: 15px;
      text-decoration: none; /* remove underline from anchors */
   }
/* style the submit button */
input[type=submit] {
  background-color: #01579a;
  color: white;
  cursor: pointer; 
}

input[type=submit]:hover {
  background-color: #5e9ece;
}

/* Two-column layout */
.col {  
  width: 100%;
  margin: auto;
  padding: 0 50px;
  margin-top: 6px;
}

.bottom{  
  width: 100%;
  margin: auto;
  padding: 0 50px;
  margin-top: 6px;
  
}

.row2 {
  margin: auto;
}

@media screen and (max-width: 650px) {
  .col {
    width: 100%;
  }
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
   

    </style>

</head>

<body>
  <div id='wrapper' align="center">
    <br><br>
      <div class="container">

         <div class="row">
            <h2 style="text-align: center">비밀번호 찾기</h2>

            <div class="col">
               <form action="findPwdUp.do" method="post">
                  <table>
                     <tr>
                        "${ check.eName }"님의 비밀번호를 변경해주세요.
                        <br>
                        <br>
                        <td id="new">새로운 비밀번호 :</td>
                        <td><input type="password" name="ePwd" id="ePwd"
                           minlength="4" maxlength="16" placeholder=" 8-16자 영문,숫자 조합"
                           required></td>
                     </tr>
                     <tr>
                        <td id="new">새로운 비밀번호 확인 :</td>
                        <td><input type="password" name="ePwd2" id="ePwd2"
                           minlength="4" maxlength="16" placeholder="비밀번호 확인" required></td>
                        <td><font name="check" size="2" color="red"></font></td>
                        <input type="hidden" value="${ eId }" id="eId" name="eId">
                     </tr>

                  </table>
                  <div class="bottom">
                     <input type="submit" id="update" value="수정완료" required>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <br> <br> <br> <br>
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
                  $('font[name=check]').html("일치하지 않습니다.");
               } else {
                  $('font[name=check]').text('');
                  $('font[name=check]').html("일치합니다.");
               }
               return false;
            });
         });
      </script>
  

</body>

</html>