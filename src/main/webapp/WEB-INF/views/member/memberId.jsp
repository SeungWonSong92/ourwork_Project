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
  <title>아이디찾기</title>
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

/* bottom container */
.bottom-container {
  width: 50%;
  text-align: center;
  /*background-color: #01579a;*/
   background-color: hsl(0, 0%, 95%);
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
      font-size: 17px;
      text-decoration: none; /* remove underline from anchors */
   }
   /* #btnc{
   	background-color: #73b8ec;
   	color: white;
   } */
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
  width: 50%;
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
/* Clear floats after the columns */
.row2 {
  margin: auto;
}

/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
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

    </style>

</head>

<body>
   <div id='wrapper' align="center">
      <br>
      <br>
      <div class="container">
         <form>
            <div class="row">
               <h2 style="text-align: center">아이디찾기</h2>

               <div class="col">
                  <table>
                     <tr>
                        "${ eName }"님의 ID는
                        <br>
                        <td><input type="text" name="eId" value="${ eId }" required>
                        </td>
                     </tr>
                  </table>
                  
               </div>
               <div class="bottom-container">
                     <div class="row2">
                        <div class="bottom">
                           <input type="submit" value="로그인하기" id="btnc"
                              onclick="location.href='main.do'" required>
                        </div>
                     </div>
                  </div>
            </div>
         </form>
      </div>
      <br><br><br><br>
   </div>




</body>

</html>