<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>정보 공유 리스트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        /*    * {
                font-family: 'Title_Medium';
            }*/
        .re_image{
            width:100px;
            height:100px;
        }

    </style>

    <script type="text/javascript">
        /*        $(function () {

                    // 수정버튼 클릭
                    $('.edit1').click(function () {
                        var id = $(this).attr('id');  // rno
                        var txt = $('#td_' + id).text(); // replytext
                        $('#td_' + id).html("<textarea rows='3' cols='30' id='tt_" + id + "'>" + txt
                            + "</textarea>");

                        // 수정, 삭제 버튼을 확인, 취소 버튼으로 수정
                        $('#btn_' + id).html(
                            "<input class='btn btn-outline-primary' type='button' value='확인' onclick='up(" + id + ")'> "
                            + "<input class='btn btn-outline-secondary' type='button' value='취소' onclick='lst()'>");
                    });
                });

                // 확인버튼을 클릭해서 내용을 수 정
                function up(id) {
                    var re_content = $('#tt_' + id).val();
                    var formData = "board_renum=" + id + "&re_content=" + re_content
                        + "&free_no=${freeBean.board_num}";
            // 댓글 내용 수정하는 요청
            $.post('repUpdate', formData, function (data) {
                $('#slist').html(data);
            });
        }

        // 취소 버튼 클릭
        function lst() {
            $('#slist').load('slist?num=${freeBean.board_num}');
        }

        // 댓글 삭제 요청
        function del(board_renum, board_num) {
            var formData = "board_num=" + board_renum + "&board_num=" + board_num;
            $.post("repDelete", formData, function (data) {
                $('#slist').html(data);
            });
        }*/

        $(document).ready(function () {
            var num = $("#num").val();
            var board_num = $("#board_num").val();
        });

        //댓글 삭제
        function r_delete_check(id) {
            var text = "리뷰를 삭제하시겠습니까?";
            var formData = $("#frm" + id).serialize();
            if (confirm(text)) {
                $.ajax({
                    type: 'post',
                    url: 'FreeReDelete',
                    data: formData,
                    success: function (result) {
                        alert("리뷰가 삭제되었습니다.");
                        $('#listRe').html(result);
                    }
                });
            }
        }

        // 댓글 수정버튼 클릭시
        $(function () {
            $('.r_update_check').click(function () {
                var id = $(this).attr('id');
                var content = $('#content_' + id).text(); // replytext / id:td_태그의 내용을 추출
                $('#content_' + id).html(
                    "<textarea rows='3' cols='30' name='re_content' id='content_" + id + "'>" + content + "</textarea>"
                    +"<input type='file' name='files' onchange='re_previewImage(this," + id + ")'>"
                );

                $('#btn_' + id).html(
                    "<div id='updatediv_" + id + "'>"
                    + "<input type='button' value='수정하기' onclick='update(" + id + ")'>"
                    + "<input type='button' value='취소' onclick='lst(" + id + ")'>"
                    + "</div>"
                );
            });
        });
        //사진 미리보기
        function re_previewImage(input, id) {
            var re_preview = document.getElementById("re_preview_"+id);
            re_preview.innerHTML = ""; // 기존의 미리보기 이미지 초기화

            if (input.files && input.files.length > 0) {
                for (var i = 0; i < input.files.length; i++) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var preview = document.createElement("img");
                        preview.src = e.target.result;
                        preview.className = "re_thumbnail";
                        re_preview.appendChild(preview);
                    };
                    reader.readAsDataURL(input.files[i]);
                }
            }
        }

        // 취소 버튼 클릭시
        function lst(id) {
            $('#listRe').load("FreeReList?num=${num}&board_num=${board_num}");
        }

        // 댓글 수정
        /*function update(id) {
            var text = "댓글을 수정하시겠습니까?";
            if (confirm(text)) {
                var formData = $("#frm" + id).serialize();
                $.ajax({
                    type: 'POST',
                    url: 'FreeReUpdate',
                    data: formData,
                    success: function (data) {
                        $('#listRe').html(data);
                    }
                });
            }
        }*/
        function update(id) {
            var text = "댓글을 수정하시겠습니까?";
            if (confirm(text)) {
                var content = $("#content_" + id).val().trim(); // 댓글 내용 가져오기

                /*if (content == "") {
                    alert('댓글을 입력하세요');
                    $("#content_" + id).focus();
                    return false;
                }*/

                // 수정할 데이터를 FormData에 추가
                var formData = new FormData($("#frm" + id)[0]);
                formData.append("re_content", content);

                $.ajax({
                    type: "post",
                    url: "FreeReUpdate",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data === '') {
                            alert("다시 시도해주세요");
                        } else {
                            $('#listRe').html(data); // 댓글 목록 다시 로드
                        }
                    }
                });
            }
        }

        function r_reply(id){

        }

    </script>
</head>
<body>
<div>
    <div class="row">
        <div>
            ${total }개의 리뷰가 있습니다
        </div>
        <c:if test="${empty reList}">
            <div>
                <b>리뷰를 새로 달아주세요</b>
            </div>
        </c:if>
        <c:if test="${not empty reList}">
            <c:forEach var="reBoard" items="${reList }">
                <c:if test="${reBoard.re_state == 0}">
                    <div>삭제된 댓글입니다.</div>
                    <br>
                </c:if>
                <c:if test="${reBoard.re_state != 0}">
                    <form id="frm${reBoard.board_renum }" name="frm" enctype="multipart/form-data">
                        <div>
                            <input type="hidden" name="board_renum" value="${reBoard.board_renum }">
                            <input type="hidden" name="num" value="${reBoard.num }">
                            <input type="hidden" name="board_num" value="${reBoard.board_num }">
                            <input type="hidden" name="file_num" value="${reBoard.file_num }">
                            <input type="hidden" name="ref" value="${reBoard.ref }">
                            <input type="hidden" name="re_seq" value="${reBoard.re_seq }">

                            <div id="re_preview_${reBoard.board_renum}">
                                <c:if test="${reBoard.file_num != 0}"><img src="./img/${reBoard.file_name}" class="re_image"></c:if>
                            </div>
                            <div id="content_${reBoard.board_renum }">${reBoard.re_content }</div>
                            <div><fmt:formatDate value="${reBoard.re_reg_date }" pattern="yyyy년 MM월 dd일"/></div>
                            <c:if test="${not empty member.m_id}">
                                <button type="button" onclick="r_reply(${reBoard.board_renum})">댓글</button>
                            </c:if>
                            <c:if test="${!empty member.m_id and member.m_id == reBoard.m_id}">
                                <div id="btn_${reBoard.board_renum }">
                                    <input type="button" id="${reBoard.board_renum }" value="댓글 수정"
                                           class="r_update_check">
                                    <input type="button" value="댓글 삭제" onClick="r_delete_check(${reBoard.board_renum})">
                                </div>
                            </c:if>
                        </div>
                    </form>
                </c:if>
            </c:forEach>
        </c:if>
    </div>

    <ul>
        <c:if test="${pp.startPage > pp.pagePerBlk }">
            <li><a href="freeView?num=${num}&board_num=${board_num}&pageNum=${pageNum}&rpageNum=${pp.startPage - 1}">이전</a></li>
        </c:if>


        <c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
            <c:if test="${pp.currentPage==i}">
                <li>
                    <a href="#">${i}</a>
                </li>
            </c:if>

            <c:if test="${pp.currentPage!=i}">
                <li>
                    <a href="freeView?num=${num}&board_num=${board_num}&pageNum=${pageNum}&rpageNum=${i}">${i}</a>
                </li>
            </c:if>
        </c:forEach>

        <c:if test="${pp.endPage < pp.totalPage}">
            <li>
                <a href="freeView?num=${num}&board_num=${board_num}&pageNum=${pageNum}&rpageNum=${pp.startPage + 1}">다음</a>
            </li>
        </c:if>

    </ul>


</div>
</body>
</html>