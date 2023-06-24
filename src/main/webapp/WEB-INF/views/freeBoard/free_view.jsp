<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<html>
<head>
    <title>게시글 본문</title>

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
                                    var _width = '450';
                                    var _height = '520';

                                    var _left = Math.ceil(( window.screen.width - _width )/2);
                                    var _top = Math.ceil(( window.screen.height - _height )/2);

                                    window.open('reportAddForm?num=' + num + "&board_num=" + board_num + "&m_id=" + m_id,
                                        "_blank",
                                        "width="+_width+", height="+_height+", resizable=no left="+_left+",top="+_top);
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
<div class="bgcolor">
    <div class="outbox">

        <input type="hidden" id="num" name=num value="${fboard.num }">
        <input type="hidden" id="board_num" name=board_num value="${fboard.board_num }">
        <input type="hidden" id="m_id" name="m_id" value="${member.m_id }">
        <div>
            <h1>${fboard.subject }</h1>
            <div>카테고리 : ${fboard.category }</div>
            <div><c:if test="${not empty fboard.profile_num}">
                <img src="./memberImg/${fboard.profile_name}" class="profile_image"></c:if>${fboard.nick}</div>
            <div>조회수 ${fboard.readcount }</div>
        </div>
        <div>
            <c:forEach var="list" items="${img_list}">
                <p><img src="./img/${list.file_name}" class="thumbnail"></p>
            </c:forEach>
        </div>
        <div>
            <div>${fboard.content}</div>
            <div>해시태그</div>
            <div>${fboard.hashtag}</div>
        </div>


        <div>
            <div>추천클릭!</div>
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
        <div>
            <c:if test="${!empty member.m_id}">
                <button type="button" id="report_button">신고하기</button>
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
</body>
</html>