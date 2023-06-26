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
        <h1>내 반려동물</h1>
        <br>
    </div><!-- End Page Title -->
    <form action="petadd" method="post" enctype="multipart/form-data" attribute >
        <section class="section profile">
            <div class="row">
                <div class="col-xl-8">
                    <div class="card">
                        <div class="card-body pt-3">

                            <div class="row mb-3">
                                <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">프로필 이미지</label>
                                <div class="col-md-8 col-lg-9">
                                    <div id="previewContainer">
                                        <c:if test="${empty pet.profile_num}">
                                            <img src="/images/petdefault.png" width="250", height="250">
                                        </c:if>
                                        <c:if test="${!empty pet.profile_num}">
                                            <img src="./petimg/${pet.profile_name }" alt="Profile" class="rounded-circle" width="250" >
                                        </c:if>
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
                                <label for="animal" class="col-md-4 col-lg-3 col-form-label">이름</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="animal" type="text" class="form-control" id="animal"
                                           value="" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="kind" class="col-md-4 col-lg-3 col-form-label">종류</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="kind" type="radio" value="d" id="kind" checked>강아지
                                    <input name="kind" type="radio" value="c">고양이
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="breed" class="col-md-4 col-lg-3 col-form-label">품종</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="breed" type="text" class="form-control" id="breed"
                                           value="" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="birth" class="col-md-4 col-lg-3 col-form-label">생일</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="birth" type="date" class="form-control" id="birth"
                                           value="" required>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="gender" class="col-md-4 col-lg-3 col-form-label">성별</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="gender" type="radio" value="0" id="gender" checked>암컷
                                    <input name="gender" type="radio" value="1">수컷
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="neutering" class="col-md-4 col-lg-3 col-form-label">중성화</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="neutering" type="radio" id="neutering" value="0" checked>안했음
                                    <input name="neutering" type="radio" value="1">했음
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="feature" class="col-md-4 col-lg-3 col-form-label">특이사항</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="feature" type="text" class="form-control" id="feature"
                                           value="" required>
                                </div>
                            </div>
                            <div class=" text-center">
                                <button type="submit" class="btn btn-primary">추가</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</main>
</body>
</html>

