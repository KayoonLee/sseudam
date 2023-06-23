<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
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
       var email_chk = false;
       var nick_chk = false;

     function isValidId(email) {
       		var idRegex = /^[a-zA-Z0-9._%+-]+@(naver\.com|gmail\.com|nate\.com|daum\.net)$/i;

             return idRegex.test(email);
     }


     $(document).ready(function(){
           $("form").on("submit", function(){

             if(nick_chk  == false){
                 alert("닉네임 중복검사 버튼을 클릭하세요.");
                 return false;
               }

             if(email_chk  == false){
                 alert("이메일 중복검사 버튼을 클릭하세요.");
                 return false;
               }
            });


             // 닉네임 중복검사
            $('#nickChk').click(function(){
              var nick = $("#nick").val();

                 if($("#nick").val() == "") {
                   alert("닉네임을 입력해주세요");
                   $("#nick").focus();
                   return false;
                 }

                 $.ajax({
                 type : 'POST',
                   data : {"nick": nick},
                   url : "nickChk.do",
                   success : function (cnt){
                      if(cnt != 1){
                         alert("사용가능한 닉네임 입니다.")
                         $('email').focus();
                         nick_chk = true;

                      } else{
                         alert("중복된 닉네임 입니다.")
                         $('#nick').focus();
                         $('#nick').val("");
                      }
                   }
                 }); //ajax end
             });

             // email중복검사
             $("#emailChk").click(function(){
                var email = $("#email").val();

                if($("#email").val() == "") {
                      alert("email을 입력해주세요");
                      $("#email").focus();
                      return false;
                }
                 if(!isValidId(email)) {
                     alert("유효한 이메일 형식이 아닙니다.");
                     return false;
                 }

                $.ajax({
                    type : 'POST',
                      data : {"email": email},
                      url : "emailChk.do",
                      success : function (cnt){
                         if(cnt != 1){
                            alert("사용가능한 email 입니다.")
                            $('tel').focus();
                            email_chk = true;

                         } else{
                            alert("중복된 이메일 아이디 입니다.")
                            $('#email').focus();
                            $('#email').val("");
                         }
                      }
                });
             });
     });
       </script>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">

        <h4 class="mb-3">일반 회원 회원가입</h4>
        <form class="validation-form" novalidate action="insertMember" method="post">
         <input type="hidden" name="identifier" value="1"><!--일반회원 구분코드 1-->
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" name="name" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="birth">생년월일</label>
              <input type="text" class="form-control" id="birth" name="birth" placeholder="6자로 입력하세요" required>
              <div class="invalid-feedback">
                생년월일을 입력해주세요.
              </div>
             <p id="checkBirth"></p>
            </div>
             <div class="col-md-6 mb-3">
                <label for="birth">닉네임</label>
                <input type="text" class="form-control" id="nick" name="nick" placeholder="닉네임을 입력하세요" required>
                <input type="button" id="nickChk" value="중복 확인">
                <div class="invalid-feedback">
                  닉네임을 입력해주세요.
                 </div>
            </div>
             <div class="col-md-6 mb-3">
                <label for="birth">비밀번호</label>
                <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호 입력하세요" required>
                <div class="invalid-feedback">
                  비밀번호를 입력해주세요.
                 </div>
            </div>
            <div class="col-md-6 mb-3">
                <label for="email">이메일</label>
                <input type="text" class="form-control" id="email" name="email" placeholder="you@example.com" required>
                <input type="button" id="emailChk" value="중복 확인">
                 <div class="invalid-feedback">
                 이메일을 입력해주세요.
                 </div>
            </div>
             <div class="col-md-6 mb-3">
                <label for="auth">인증문자</label>
                <input type="text" class="form-control" id="auth" name="auth" placeholder="인증번호를 입력하세요" required>
                <input type="button" id="auth_btn" value="인증 메일 받기" onClick="authMail()">
                <div class="invalid-feedback">
                인증번호를 입력해주세요.
                </div><p>
                <span id="checkAuth"></span>
             </div>

          </div>


          <div class="mb-3">
             <label for="tel">휴대폰</label>
             <input type="text" class="form-control" id="tel" name="tel" placeholder="하이픈(-)없이 입력해주세요" required>
             <div class="invalid-feedback">
              전화번호를 입력해주세요.
             </div>
             <p id="checkTel"></p>
            </div>


          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="agreement" required>
            <label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2023 SSEUDAM </p>
    </footer>
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

    $( '#tel' ).on( 'focus keyup', function() {
        var brn = document.getElementById( "tel" ).value;
            if ( /^010[0-9]{4}[0-9]{4}$/.test( brn ) ) {
              document.getElementById( "checkTel" ).innerText = "유효한 휴대전화번호입니다.";
              } else {
              document.getElementById( "checkTel" ).innerText = "유효하지 않은 휴대전화번호입니다.";
              document.getElementById('checkTel').style.color = 'red';
              }
           } );


     $( '#birth' ).on( 'focus keyup', function() {
        var brn = document.getElementById( "birth" ).value;
            if ( /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/.test( brn ) ) {
              document.getElementById( "checkBirth" ).innerText = "올바른 형식입니다.";
              } else {
              document.getElementById( "checkBirth" ).innerText = "올바르지 않은 형식입니다.";
              document.getElementById('checkBirth').style.color = 'red';
              }
           } );


function authMail(){

   $.ajax({
           type:"POST",
           url: "mailCheck",
           data : {"email" : $("#email").val()},
           success:function(data){

             if(data){
               alert("인증 이메일이 전송되었습니다. 메일을 확인해주세요.");
                        //if(data == $("#auth").val()){

                         $( '#auth' ).on( 'focus keyup', function() {
                                 if ( data == $("#auth").val() ) {
                                   $("#checkAuth").text("인증되었습니다.");
                                   } else {
                                    $("#checkAuth").text("올바르지 않은 형식입니다.");
                                   document.getElementById('checkAuth').style.color = 'red';
                                   }
                          } );

                        //}


                      }
               }

         });

}





  </script>
</body>

</html>