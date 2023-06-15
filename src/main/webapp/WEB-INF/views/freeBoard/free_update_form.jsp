<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 수정</title>

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
            max-width: 500px;
            max-height: 400px;
            margin: 5px;
        }
    </style>

</head>
<body>

<div class="bgcolor">
    <div class="outbox">
        <h2 align="center">게시판 글수정</h2><br>
        <form enctype="multipart/form-data" action="freeUpdate" method="post" onSubmit="return free_check()">
            <input type="hidden" name="num" value="${fboard.num}">
            <input type="hidden" name="board_num" value="${fboard.board_num}">
            <input type="hidden" name="file_num" value="${fboard.file_num}">
            <div class="container innerbox">
                <div>
                    <div>제목</div>
                    <div><input type="text" id="subject" name="subject" value="${fboard.subject}"></div>
                    <div>분류</div>
                    <div>
                        <select id="category" name="category">
                            <option value="">선택</option>
                            <option value="1" <c:if test="${fboard.category == '1'}">selected</c:if>>자유게시판</option>
                            <option value="2" <c:if test="${fboard.category == '2'}">selected</c:if>>묻고 답하기</option>
                            <option value="3" <c:if test="${fboard.category == '3'}">selected</c:if>>토론 게시판</option>
                        </select>
                    </div>
                </div>
                <div>본문</div>
                <div>
                    <input type="file" id="imageInput" name="files" onchange="previewImage(this)" multiple>
                    <textarea id="content" name="content" rows="5" cols="50">${fboard.content}</textarea><br>
                    <div id="previewContainer">
                        <c:forEach var="list" items="${img_list}">
                            <p><img src="./img/${list.file_name}" class="thumbnail"></p>
                        </c:forEach>
                    </div>
                </div>
                <div>
                    <button type="button" onclick="uploadImage()">이미지 업로드</button>
                </div>

                <div>
                    <div class="tr_hashTag_area">
                        <div class="form-group">
                            <input type="hidden" id="tag" name="hashtag" value=""> <input
                                type="text" id="hashtag" placeholder="#태그입력"
                                class="form-control">
                        </div>
                        <ul id="tag-list">
                            <c:forEach var="hash" items="${hashtag}">
                                <li>${hash}<span class="del-btn">x</span></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <input type="submit" value="작성">
                <input type="reset" value="취소">
                <a href="freeList">목록</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
