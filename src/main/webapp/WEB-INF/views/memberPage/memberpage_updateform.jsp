<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>
<%@ include file="../navigator_footer/member_header.jsp" %>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

  <script>
    // 이미지 업로드를 위한 JavaScript 함수
    function uploadImage() {
      $("#imageInput").click();
    }

    function previewImage(input) {
      var previewContainer = document.getElementById("previewContainer");
      previewContainer.innerHTML = ""; // 기존의 미리보기 이미지 초기화

      if (input.files && input.files.length > 0) {
        for (var i = 0; i < input.files.length; i++) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var preview = document.createElement("img");
                preview.src = e.target.result;
                preview.className = "thumbnail";
                previewContainer.appendChild(preview);
            };
          reader.readAsDataURL(input.files[i]);
        }
      }
    };


  </script>
  <style type="text/css">
    input[type=file] {
      display: none;
    }

    .thumbnail {
      max-width: 500px;
      max-height: 400px;
      margin: 5px;
    }
  </style>



</head>
<body>
<!-- ======= Header ======= -->

<%@ include file="../navigator_footer/counselor_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/member_sidebar.jsp" %>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>내 정보 수정</h1>
      <br>
    </div><!-- End Page Title -->


  <form action="mypage_update" class="validation-form" method="post" enctype="multipart/form-data" attribute>
    <input type="hidden" id="profile_num" name="profile_num" value="${myModel.profile_num}">
    <section class="section profile">
        <div class="col-xl-8">
          <div class="card">
            <div class="card-body pt-3">
              <div class="tab-content pt-2">

                  <!-- Profile Edit Form -->

                  <!-- 프로필사진 수정하는 코드 들어가야됨-->
                <div class="row mb-3">
                  <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">프로필 이미지</label>
                  <div class="col-md-8 col-lg-9">
                    <div id="previewContainer">
                      <img src="./memberImg/${myModel.profile_name}" alt="Profile" class="thumbnail" >
                    </div>
                    <div class="pt-2">
                      <input type="file" id="imageInput" name="files"
                             onchange="previewImage(this)">
                      <%-- 이미지 업로드 하기 --%>
                      <button type="button" onclick="uploadImage()" class="btn btn-primary btn-sm"
                              title="Upload new profile image"><i class="bi bi-upload"></i>
                      </button>


                    </div>
                  </div>
                </div>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">이름</label>
                        <div class="col-md-8 col-lg-9">
                          <input name="name" type="text" class="form-control" id="name" value="${myModel.name}">
                        </div>
                    </div>

                     <div class="row mb-3">
                       <label for="company" class="col-md-4 col-lg-3 col-form-label">닉네임</label>
                           <div class="col-md-8 col-lg-9">
                            <input name="nick" type="text" class="form-control" id="nick" value="${myModel.nick}">
                            <br>
                            <input type="button" id="nickChk" value="중복 확인">
                               <div class="invalid-feedback">
                                  닉네임을 입력해주세요.
                               </div>
                           </div>
                     </div>

                     <div class="row mb-3">
                       <label for="Email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
                            <div class="col-md-8 col-lg-9">
                             <input name="email" type="text" class="form-control" id="email" value="${myModel.email}" readonly>
                            </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Country" class="col-md-4 col-lg-3 col-form-label">생년월일</label>
                         <div class="col-md-8 col-lg-9">
                            <input name="birth" type="text" class="form-control" id="birth" value="${myModel.birth}">
                             <div class="invalid-feedback">
                                  생년월일을 입력해주세요.
                             </div>
                             <p id="checkBirth"></p>
                        </div>
                    </div>

                    <div class="row mb-3">
                       <label for="tel" class="col-md-4 col-lg-3 col-form-label">휴대폰</label>
                         <div class="col-md-8 col-lg-9">
                           <input name="tel" type="text" class="form-control" id="tel" value="${myModel.tel}">
                            <div class="invalid-feedback">
                                전화번호를 입력해주세요.
                            </div>
                           <p id="checkTel"></p>
                         </div>
                    </div>

                    <div class="row mb-3">
                        <label for="join_date" class="col-md-4 col-lg-3 col-form-label">가입일</label>
                            <div class="col-md-8 col-lg-9">
                              <input name="join_date" type="text" class="form-control" id="join_date" value="${myModel.join_date}" readonly>
                            </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">수정 완료</button>
                       <input type="button" id="cancel" onClick="history.go(-1)" value="취소" class="btn btn-danger rounded-pill">
                    </div>


                </div>
              </div><!-- End Bordered Tabs -->
            </div>
          </div>
        </div>
      </div>
    </section>

    </form>
  </main>

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

    // 닉네임 중복검사 (닉네임 변경 안 한 경우에는 중복검사하라고 하면 안됨)
       var nick_chk = false;


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


  </script>
</body>
</html>
