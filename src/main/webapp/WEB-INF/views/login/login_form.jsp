<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
 <link rel="icon" href="images/logo.png">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script>
    $(document).ready(function() {
    		var popupX = ((window.screen.width-600)/2);
        var popupY = ((window.screen.height-400)/2);
         $("#findEmail").on('click', function(){
             window.open("findEmail.do", "ID 찾기창", "resizeable=no, location=0, status=0, width=600, height=650, left="+popupX+", top="+popupY);
         });
    });

   $(document).ready(function() {
   			var popupX = ((window.screen.width-600)/2);
             var popupY = ((window.screen.height-400)/2);
              $("#findPasswd").on('click', function(){
                  window.open("findPasswd.do", "비밀번호 찾기창", "resizeable=no, location=0, status=0, width=600, height=650, left="+popupX+", top="+popupY);
              });
  });


  </script>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">로그인</h4>
        <form class="validation-form" novalidate method="post" action="login">

          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>

         <div class="mb-3">
           <label for="address">비밀번호</label>
            <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요" required>
             <div class="invalid-feedback">
                 비밀번호를 입력해주세요.
             </div>
         </div>

          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">로그인</button>
          <br><br>
         <div class="mb-3" align="center">
                <button type="button" class="btn btn-secondary" id="findEmail">ID 찾기</button>
                <button type="button" class="btn btn-secondary" id="findPasswd">비밀번호 찾기</button>
                <button type="button" class="btn btn-info" onclick="location.href='admin_login'">관리자 로그인</button>
         </div>
        </form>
     <footer class="my-3 text-center text-small">
            <p class="mb-1">&copy; 2023 SSEUDAM</p>
     </footer>
      </div>
   </div>

  </div>
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>

</html>