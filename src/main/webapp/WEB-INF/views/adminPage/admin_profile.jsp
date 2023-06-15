<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header/header.jsp" %>

<html>
<head>
    <title>Title</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/admin_header.jsp" %>

    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>

    <%--세욱 추가--%>
    <script>
        // 이미지 업로드를 위한 JavaScript 함수
        function uploadImage() {
            $("#imageInput").click();
        }

        function removeImage() {
            $("#imageInput").src("./images/muzik5.jpg");
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
<!-- ======= Sidebar ======= -->

<%--<main id="main" class="main">--%>

<%-- 왼쪽 상단 --%>
<div class="pagetitle">
    <h1>프로필</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">관리자 페이지</a></li>
            <%-- adminProfile --%>
            <li class="breadcrumb-item">프로필</li>
        </ol>
    </nav>
</div><!-- End Page Title -->


<section class="section profile">
    <div class="row">
        <div class="col-xl-4">

            <%-- 관리자 왼쪽 박스 프로필 --%>
            <div class="card">
                <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                    <img src="images/muzik5.jpg" alt="Profile" class="rounded-circle">
                    <h2>관리자</h2>
                    <h3>개발자</h3>
                    <div class="social-links mt-2">
                        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
            </div>

        </div>

        <%-- 관리자 오른쪽 박스 프로필 --%>
        <div class="col-xl-8">

            <div class="card">
                <div class="card-body pt-3">

                    <%-- 프로필 탭 버튼 3개 --%>
                    <ul class="nav nav-tabs nav-tabs-bordered">

                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-overview">프로필
                            </button>
                        </li>

                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">프로필 수정하기
                            </button>
                        </li>

                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">비밀번호
                                변경하기
                            </button>
                        </li>

                    </ul>

                    <%-- 프로필 탭1(프로필) --%>
                    <div class="tab-content pt-2">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">

                            <h5 class="card-title">프로필 상세</h5>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">관리자 이름</div>
                                <div class="col-lg-9 col-md-8">${admin.name}</div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">관리자 아이디</div>
                                <div class="col-lg-9 col-md-8">${admin.a_id}</div>
                            </div>

                        </div>

                        <%-- 프로필 탭2(프로필 수정하기) --%>
                        <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                            <form>
                                <div class="row mb-3">
                                    <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">프로필 이미지</label>
                                    <div class="col-md-8 col-lg-9">
                                        <div id="previewContainer">
                                            <img src="./images/muzik5.jpg" alt="Profile" class="thumbnail">
                                        </div>
                                        <div class="pt-2">
                                            <input type="file" id="imageInput" name="files"
                                                   onchange="previewImage(this)">

                                            <%-- 이미지 업로드 하기 --%>
                                            <button type="button" onclick="uploadImage()" class="btn btn-primary btn-sm"
                                                    title="Upload new profile image"><i class="bi bi-upload"></i>
                                            </button>

                                            <%-- 이미지 삭제 하기 --%>
                                            <button type="button" onclick="removeImage()" class="btn btn-danger btn-sm"
                                                    title="Remove my profile image"><i class="bi bi-trash"></i>
                                            </button>

                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="fullName" class="col-md-4 col-lg-3 col-form-label">관리자 이름</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="fullName" type="text" class="form-control" id="adminName"
                                               value="관리자 이름 변경하기">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="fullName" class="col-md-4 col-lg-3 col-form-label">관리자 아이디</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="fullName" type="text" class="form-control" id="adminID"
                                               value="관리자 아이디 변경하기">
                                    </div>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">수정사항 변경하기</button>
                                </div>
                            </form><!-- End Profile Edit Form -->

                        </div>

                        <%-- 프로필 탭3(비밀번호 변경하기) --%>
                        <div class="tab-pane fade pt-3" id="profile-change-password">

                            <form>

                                <div class="row mb-3">
                                    <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">현재
                                        비밀번호</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="password" type="password" class="form-control"
                                               id="currentPassword">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="newpassword" type="password" class="form-control" id="newPassword">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">비밀번호 확인</label>
                                    <div class="col-md-8 col-lg-9">
                                        <input name="renewpassword" type="password" class="form-control"
                                               id="renewPassword">
                                    </div>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                                </div>
                            </form><!-- End Change Password Form -->

                        </div>

                    </div><!-- End Bordered Tabs -->

                </div>
            </div>

        </div>
    </div>
</section>

<%--</main>--%><!-- End #main -->

<!-- ======= Footer ======= -->

</body>
</html>
