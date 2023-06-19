<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2023-06-13
  Time: 오후 7:58
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>
  <title>Title</title>

  <!-- Vendor CSS Files -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="css/tab" rel="stylesheet">
  <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <link href="css/member.css" rel="stylesheet">
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

    function deleteImage(){
        $("#imageInput").val("");
    }


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
<header id="header" class="header fixed-top d-flex align-items-center">

  <div class="d-flex align-items-center justify-content-between">
    <a href="#" class="logo d-flex align-items-center">
      <img src="images/muzik5.jpg" alt="">
      <span class="d-none d-lg-block">쓰담</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn"></i>
  </div><!-- End Logo -->


  <nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">
      <li class="nav-item dropdown">
        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-bell"></i>
          <span class="badge bg-primary badge-number">4</span>
        </a><!-- End Notification Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
          <li class="dropdown-header">
            You have 4 new notifications
            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="notification-item">
            <i class="bi bi-exclamation-circle text-warning"></i>
            <div>
              <h4>Lorem Ipsum</h4>
              <p>Quae dolorem earum veritatis oditseno</p>
              <p>30 min. ago</p>
            </div>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="notification-item">
            <i class="bi bi-x-circle text-danger"></i>
            <div>
              <h4>Atque rerum nesciunt</h4>
              <p>Quae dolorem earum veritatis oditseno</p>
              <p>1 hr. ago</p>
            </div>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="notification-item">
            <i class="bi bi-check-circle text-success"></i>
            <div>
              <h4>Sit rerum fuga</h4>
              <p>Quae dolorem earum veritatis oditseno</p>
              <p>2 hrs. ago</p>
            </div>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="notification-item">
            <i class="bi bi-info-circle text-primary"></i>
            <div>
              <h4>Dicta reprehenderit</h4>
              <p>Quae dolorem earum veritatis oditseno</p>
              <p>4 hrs. ago</p>
            </div>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>
          <li class="dropdown-footer">
            <a href="#">Show all notifications</a>
          </li>

        </ul><!-- End Notification Dropdown Items -->

      </li><!-- End Notification Nav -->


      <li class="nav-item dropdown pe-3">

        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
          <span class="d-none d-md-block dropdown-toggle ps-2">${myModel.nick}</span>
        </a><!-- End Profile Iamge Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
          <li class="dropdown-header">
            <h6>Kevin Anderson</h6>
            <span>Web Designer</span>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
              <i class="bi bi-person"></i>
              <span>My Profile</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
              <i class="bi bi-gear"></i>
              <span>Account Settings</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
              <i class="bi bi-question-circle"></i>
              <span>Need Help?</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="#">
              <i class="bi bi-box-arrow-right"></i>
              <span>Sign Out</span>
            </a>
          </li>

        </ul><!-- End Profile Dropdown Items -->
      </li><!-- End Profile Nav -->

    </ul>
  </nav><!-- End Icons Navigation -->

</header><!-- End Header -->

<!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="memberpage_main">
          <i class="bi bi-person"></i>
          <span>나의 프로필</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="memberpage_mypet">
          <i class="bi bi-balloon"></i><span>동물페이지</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>나의 활동내역</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse show " data-bs-parent="#sidebar-nav">
          <li>
            <a href="memberpage_mypost">
              <i class="bi bi-circle"></i><span>내가 쓴 글</span>
            </a>
          </li>
          <li>
            <a href="memberpage_myreply">
              <i class="bi bi-circle"></i><span>내가 쓴 댓글</span>
            </a>
          </li>
          <li>
            <a href="memberpage_mylike">
              <i class="bi bi-circle"></i><span>내가 좋아요한 글</span>
            </a>
          </li>
          <li>
            <a href="memberpage_mylike">
              <i class="bi bi-circle"></i><span>상담신청내역</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="memberpage_mycounselor">
          <i class="bi bi-grid"></i>
          <span>즐겨찾는 상담사</span>
        </a>
      </li>

    </ul>
  </aside>
  <main id="main" class="main">
    <div class="pagetitle">
      <h1>내 정보 수정</h1>
      <br>
    </div><!-- End Page Title -->
    <form action="mypage_update" method="post" enctype="multipart/form-data" attribute>
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
                      <img src="./memberImg/${member.profile_name}" alt="Profile" class="thumbnail" >
                    </div>
                    <div class="pt-2">
                      <input type="file" id="imageInput" name="files"
                             onchange="previewImage(this)">
                      <%-- 이미지 업로드 하기 --%>
                      <button type="button" onclick="uploadImage()" class="btn btn-primary btn-sm"
                              title="Upload new profile image"><i class="bi bi-upload"></i>
                      </button>
                      <%-- 이미지 삭제 하기 --%>
                      <button type="button" onclick="deleteImage()" class="btn btn-danger btn-sm"
                              title="Remove my profile image"><i class="bi bi-trash"></i>
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
                           </div>
                     </div>

                     <div class="row mb-3">
                       <label for="Email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
                            <div class="col-md-8 col-lg-9">
                             <input name="email" type="text" class="form-control" id="email" value="${myModel.email}">
                            </div>
                    </div>

                    <div class="row mb-3">
                        <label for="Country" class="col-md-4 col-lg-3 col-form-label">생년월일</label>
                            <div class="col-md-8 col-lg-9">
                            <input name="birth" type="text" class="form-control" id="birth" value="${myModel.birth}">
                            </div>
                    </div>

                    <div class="row mb-3">
                       <label for="Address" class="col-md-4 col-lg-3 col-form-label">휴대폰</label>
                           <div class="col-md-8 col-lg-9">
                           <input name="tel" type="text" class="form-control" id="tel" value="${myModel.tel}">
                           </div>
                    </div>

                    <div class="row mb-3">
                        <label for="Email" class="col-md-4 col-lg-3 col-form-label">가입일</label>
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

    </form><!-- End Profile Edit Form -->>
  </main>
</body>
</html>
