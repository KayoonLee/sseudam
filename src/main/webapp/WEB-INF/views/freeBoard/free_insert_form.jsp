<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 작성하기 폼</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/main_header.jsp" %>

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <script src="./js/free.js"></script>

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
        }

        // 해시태그 처리
        $(document)
            .ready(
                function () {
                    var hashtag = [];
                    var counter = 0;

                    // 입력한 값을 태그로 생성한다.
                    function addTag(value) {
                        hashtag[counter] = value;
                        counter++; // del-btn의 고유 id가 된다.
                    }

                    // 서버에 제공
                    $("#hashtag").on("keyup", function (e) {

                        var tag = $("#tag-list").text();
                        console.log(tag);
                        $("#tag").val(tag);

                    });

                    $("#hashtag")
                        .on(
                            "keypress",
                            function (e) {
                                var self = $(this);

                                // 엔터나 스페이스바 눌렀을 때 실행
                                if (e.key === "Enter"
                                    || e.keyCode == 32) {
                                    var tagValue = self.val()
                                        .trim();

                                    // 해시태그 값이 없으면 실행하지 않음
                                    if (tagValue !== "") {
                                        // 같은 태그가 있는지 검사한다. 있다면 해당 값이 배열로 반환된다.
                                        var result = Object
                                            .values(hashtag)
                                            .filter(
                                                function (
                                                    word) {
                                                    return word === tagValue;
                                                });

                                        // 해시태그가 중복되지 않으면 추가
                                        if (result.length === 0) {
                                            $("#tag-list")
                                                .append(
                                                    "<li>"
                                                    + tagValue
                                                    + "<span class='del-btn' idx='" + counter + "'>x</span></li>");
                                            addTag(tagValue);
                                            self.val("");

                                            console
                                                .log("hashtag: "
                                                    + hashtag);
                                            console
                                                .log("tagValue: "
                                                    + tagValue);
                                        } else {
                                            alert("태그값이 중복됩니다.");
                                        }
                                    }
                                    e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
                                }
                            });

                    // 삭제 버튼
                    // 인덱스 검사 후 삭제
                    $(document).on("click", ".del-btn", function (e) {
                        var index = $(this).attr("idx");
                        hashtag[index] = "";
                        $(this).parent().remove();
                    });
                });
    </script>

    <style type="text/css">
        input[type=file] {
            display: none;
        }

        .thumbnail {
            max-width: 700px;
            max-height: 550px;
            margin: 5px;
        }
    </style>
</head>
<body>

<!-- ======= Navigator ======= -->
<%@ include file="../navigator_footer/main_navigator.jsp" %>

<p><p><p>
<h2 align="center">게시판 글 쓰기</h2>

<%--<main id="main" class="main">--%>
<div class="card" style="margin-top: 50px; margin-right: 200px; margin-bottom: 50px; margin-left: 200px">
    <div class="card-body">
        <h5 class="card-title">글작성</h5>

        <form enctype="multipart/form-data" action="freeInsert" method="post" onsubmit="return free_check()">
            <input type="hidden" name="num" value="2"> <%-- 공지 1번/자유 2번 --%>
            <input type="hidden" name="m_id" value="${member.m_id}">

            <%-- 제목 --%>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="subject" name="subject">
                </div>
            </div>

            <%-- 분류 --%>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">분류</label>
                <div class="col-sm-10">
                    <select id="category" name="category" class="form-select" aria-label="Default select example">
                        <option value="">선택</option>
                        <option value="1">자유게시판</option>
                        <option value="2">묻고 답하기</option>
                        <option value="3">토론 게시판</option>
                    </select>
                </div>
            </div>

            <%-- 본문 --%>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">본문</label>
                <div class="col-sm-10">
                    <input type="file" id="imageInput" name="files" onchange="previewImage(this)" multiple>
                    <textarea class="form-control" id="content" name="content"
                              style="height: 150px" maxlength="2000"></textarea><br>
                    <div id="previewContainer"></div>
                </div>
            </div>

            <%-- 이미지 업로드 --%>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">이미지 업로드</label>
                <div class="col-sm-10">
                    <input class="form-control" type="file" id="formFile">
                    <button type="button" onclick="uploadImage()" class="btn btn-outline-primary">이미지 업로드</button>
                </div>
            </div>

            <%-- 태그 --%>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">태그#</label>
                <div class="col-sm-10">
                    <input type="hidden" id="tag" name="hashtag" value="">
                    <input type="text" id="hashtag" placeholder="#태그입력" class="form-control">
                </div>
                <ul id="tag-list"></ul>
            </div>

            <%-- 작성/취소/목록 --%>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"></label>
                    <div class="col-sm-10">
                        <input type="submit" class="btn btn-primary" value="작성">
                        <input type="submit" class="btn btn-primary" value="취소">
                        <a class="btn btn-primary" href="freeList">목록</a>
                    </div>
                </div>

        </form><!-- End General Form Elements -->

    </div>
</div>
<%--</main>--%>

<!-- ======= Footer ======= -->
<%@ include file="../navigator_footer/main_footer.jsp" %>

</body>
</html>