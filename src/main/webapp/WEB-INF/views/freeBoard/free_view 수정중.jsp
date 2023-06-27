<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 수정 폼</title>

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
        $(document).ready(function () {
            // 페이지 로딩 시 댓글 목록 출력
            loadReplies();

            var num = $("#num").val();
            var board_num = $("#board_num").val();
            var m_id = $("#m_id").val();

            // 추천 클릭
            $("#recom_image").click(function () {
                if (m_id == "") {
                    alert("로그인이 필요합니다");
                } else {
                    $.ajax({
                        type: "post",
                        url: "recomBoard",
                        data: {"num": num, "board_num": board_num, "m_id": m_id},
                        success: function (data) {
                            $("#recom_block").html(data);
                        }
                    });
                }
            });

            // 신고 클릭
            $("#report_button").click(function () {
                if (m_id == "0") {
                    alert("로그인이 필요합니다");
                } else {
                    var text = "이 글을 신고하시겠습니까?";
                    if (confirm(text)) {
                        $.ajax({
                            type: "post",
                            url: "reportBoard",
                            data: {"num": num, "board_num": board_num, "m_id": m_id},
                            success: function (data) {
                                if (data == 0) {
                                    window.open('reportAddForm?num=' + num + "&board_num=" + board_num + "&m_id=" + m_id,
                                        "_blank",
                                        "top=20, left=30, width=450, height=400, resizable=no");
                                } else {
                                    alert("이미 신고한 글입니다");
                                }
                            }
                        });
                    }
                }
            });

            // 댓글 등록 버튼 클릭
            $("#repl_insert").click(function () {
                var fileInput = document.getElementsByName("files")[0];
                var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|webp)$/;
                var maxSize = 1 * 1024 * 1024;

                if ($("#re_content").val() == "") {
                    alert('댓글 입력 후에 클릭하시오');
                    $("#re_content").focus();
                    return false;
                }

                var files = fileInput.files;
                if (files.length > 0) {
                    var file = files[0];

                    if (!file.name.match(fileForm)) {
                        alert("이미지 파일만 업로드 가능합니다.");
                        return false;
                    }

                    if (file.size > maxSize) {
                        alert("파일 사이즈는 1MB까지 가능합니다.");
                        return false;
                    }
                }
                var formData = new FormData($('#frm')[0]);
                $.ajax({
                    type: "post",
                    url: "FreeReInsert",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data == '') {
                            alert("다시 시도해주세요");
                        } else {
                            // document.getElementById("re_content").value = '';
                            $("#re_content").val("");
                            $("#files").val("");
                            // $("#previewContainer").innerHTML = '';
                            document.getElementById("previewContainer").innerHTML = '';
                            loadReplies(); // 댓글 목록 다시 로드
                        }
                    }
                });
            });

            // 댓글 목록을 가져와서 출력하는 함수
            function loadReplies() {
                var num = $("#num").val();
                var board_num = $("#board_num").val();
                var rpageNum = "${rpageNum}";
                $('#listRe').load('FreeReList?num=' + num + '&board_num=' + board_num + '&rpageNum=' + rpageNum);
            }
        });
        // 댓글 삭제 확인
        function delete_check() {
            var text = "정말로 삭제하시겠습니까?";
            if (confirm(text)) {
                var num = $("#num").val();
                var board_num = $("#board_num").val();
                $.ajax({
                    type: "post",
                    url: "freeDelete",
                    data: {"num": num, "board_num": board_num},
                    success: function (data) {
                        if (data == 1) {
                            alert("글이 삭제되었습니다");
                            location.href = "freeList?num=" + num;
                        } else {
                            alert("다시 시도해주세요");
                        }
                    }
                });
            }
        }

        //사진 미리보기
        function previewImage(input) {
            var previewContainer = document.getElementById("previewContainer");
            previewContainer.innerHTML = ""; // 기존의 미리보기 이미지 초기화

            if (input.files && input.files.length > 0) {
                for (var i = 0; i < input.files.length; i++) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var preview = document.createElement("img");
                        preview.src = e.target.result;
                        preview.className = "re_thumbnail";
                        previewContainer.appendChild(preview);
                    };
                    reader.readAsDataURL(input.files[i]);
                }
            }
        }
    </script>
    <link rel="stylesheet" href="css/image_image.css">
    <style>
        .re_thumbnail {
            width: 200px;
            height: 150px;
            margin: 5px;
        }

        .thumbnail {
            max-width: 700px;
            max-height: 550px;
            margin: 5px;
        }

        .profile_image {
            width: 30px;
            height: 30px;
        }
    </style>
</head>
<body>

<!-- ======= Navigator ======= -->
<%@ include file="../navigator_footer/main_navigator.jsp" %>

<p><p><p>
<h2 align="center">게시판 글 상세페이지</h2>

<%--<main id="main" class="main">--%>
<div class="card" style="margin-top: 50px; margin-right: 200px; margin-bottom: 50px; margin-left: 200px">
    <div class="card-body">
        <h5 class="card-title">글 상세 보기</h5>

        <input type="hidden" id="num" name=num value="${fboard.num}">
        <input type="hidden" id="board_num" name="board_num" value="${fboard.board_num}">
        <input type="hidden" id="m_id" name="m_id" value="${member.m_id}">

        <%-- 제목 --%>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-10">
                ${fboard.subject}
            </div>
        </div>

        <%-- 카테고리 --%>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">카테고리</label>
            <div class="col-sm-10" align="center">
                        <c:if test="${fboard.category == 1}">자유주제</c:if>
                        <c:if test="${fboard.category == 2}">묻고 답하기</c:if>
                        <c:if test="${fboard.category == 3}">토론</c:if>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="subject" name="subject" value="${fboard.nick}">
            </div>
        </div>

        <div>
            <c:forEach var="list" items="${img_list}">
                <p><img src="./img/${list.file_name}" class="thumbnail"></p>
            </c:forEach>
        </div>


<%-- ---------------------------------------------------------------------------------------------------- --%>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">본문</label>
            <div class="col-sm-10">
                <input type="file" id="imageInput" name="files" onchange="previewImage(this)" multiple>
                <textarea class="form-control" id="content" name="reason"
                          style="height: 150px" maxlength="2000">${fboard.content}</textarea><br>
            </div>
        </div>

        <%-- 태그 --%>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">태그#</label>
            <div class="col-sm-10">
                <input type="hidden" id="tag" name="hashtag" value="">
                <input type="text" id="hashtag" placeholder="#태그입력" class="form-control">
            </div>
        </div>
            <div>${fboard.hashtag}</div>

        <div>
            <img id="recom_image" src="images/muzik2.jpg" width="50" height="50"/>
            <div id="recom_block">${fboard.recom}</div>
        </div>

        <c:if test="${!empty member.m_id and member.m_id == fboard.m_id}">
            <div align="center">
                <button type="button" onclick="location.href=
                        'freeUpdateForm?num=${fboard.num}&board_num=${fboard.board_num}'">글 수정
                </button>
                <button type="button" onclick="delete_check()" >글 삭제</button>
            </div>
        </c:if>

        <div class="row mb-3">
            <label class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-primary" onclick="location.href=
                        'freeUpdateForm?num=${fboard.num}&board_num=${fboard.board_num}'">글 수정</button>
                <button type="submit" class="btn btn-primary" onclick="delete_check()>글 삭제</button>
                <a class="btn btn-primary" href="freeList">목록</a>
            </div>
        </div>

        <div>
            <c:if test="${!empty member.m_id}">
                <button type="button" id="report_button" class="btn btn-primary">신고하기</button>
            </c:if>
        </div>

        <div>
            <a href="freeList?&num=${fboard.num}&pageNum=${pageNum}">목록</a>
        </div>


        <c:if test="${!empty member.m_id}">
            <div>
                <form id="frm" name="frm" enctype="multipart/form-data" onsubmit="return free_check()">
                    <input type="hidden" name=num value="${fboard.num }">
                    <input type="hidden" name=board_num value="${fboard.board_num }">
                    <input type="hidden" name=m_id value="${member.m_id }">
                    댓글 :
                    <textarea rows=3 cols=30 id="re_content" name="re_content"></textarea>
                    <div id="previewContainer"></div>
                    <input type="file" id="files" name="files" onchange="previewImage(this)">
                    <input type="button" value="댓글입력" id="repl_insert">
                </form>
            </div>
        </c:if>
        <div id="listRe"></div>

    </div>
</div>

<!-- ======= Footer ======= -->
<%@ include file="../navigator_footer/main_footer.jsp" %>








<div class="bgcolor">
    <div class="outbox">



</body>
</html>