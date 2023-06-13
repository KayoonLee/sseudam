<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file = "../header/header.jsp" %>

<html>
<head>
    <title>게시글 본문</title>

<script>

$(document).ready(function(){
    var num=$("#num").val();
    var board_num = $("#board_num").val();
    var m_id = $("#m_id").val();
    // 초기 추천 수 로딩
/*    $.ajax({
        type: "GET",
        url: "countRecom",
        data: {"num":num, "board_num":board_num},
        success: function(count) {
            // 추천 수 업데이트
            $("#recom_block").text(count);
        }
    })*/;
    //추천 클릭
    $("#recom_image").click(function(){
        if(m_id == "0"){
            alert("로그인이 필요합니다");
        }else{
            $.ajax({
                type: "post",
                url: "recomBoard",
                data:{"num":num, "board_num":board_num, "m_id":m_id},
                success: function (data) {
                    $("#recom_block").html(data);
                }
            });
        }
    });
    //신고 클릭
    $("#report_button").click(function(){
        if(m_id== "0"){
            alert("로그인이 필요합니다");
        }else{
            var text = "이 글을 신고하시겠습니까?";
            if (confirm(text)) {
                $.ajax({
                    type: "post",
                    url: "reportBoard",
                    data:{"num":num, "board_num":board_num, "m_id":m_id},
                    success: function (data) {
                        if(data == 0){
                            window.open('reportAddForm?num='+num+"&board_num="+board_num+"&m_id="+m_id,
                                "_blank",
                                "top=20, left=30, width=450, height=400, resizable=no");

                        }else{
                            alert("이미 신고한 글입니다");
                        }
                    }
                });
            }
        }
    });

});

function delete_check(){
    var text = "정말로 삭제하시겠습니까?";
    if (confirm(text)) {
        var num=$("#num").val();
        var board_num = $("#board_num").val();
        $.ajax({
            type : "post",
            url : "freeDelete",
            data : {"num":num, "board_num":board_num},
            success :function(data){
                if(data == 1){
                    alert("글이 삭제되었습니다");
                    location.href="freeList?num="+num;
                }else{
                    alert("다시 시도해주세요");
                }
            }
        });
    }
}

</script>

    <style>
        .thumbnail{
            max-width: 500px;
            max-height: 400px;
            margin: 5px;
        }
    </style>

</head>
<body>
<div class="bgcolor">
    <div class="outbox">

        <input type="hidden" id="num" name=num value="${fboard.num }">
        <input type="hidden" id="board_num" name=board_num value="${fboard.board_num }">
        <input type="hidden" id="m_id" value="${m_id }">
        <div>
            <h1>${fboard.subject }</h1>
            <div>카테고리 : ${fboard.category }</div>
            <div>조회수 ${fboard.readcount }</div>
        </div>
        <div>
            <c:forEach var="list" items="${img_list}">
                <p><img src="./img/${list.file_name}" name="thumbnail"></p>
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


        <c:if test="${!empty m_id and m_id == fboard.m_id}">
            <div align="center">
                <button type="button" onclick="location.href=
                        'freeUpdateForm?num=${fboard.num}&board_num=${fboard.board_num}'">글 수정</button>
                <button type="button" onClick="delete_check()">글 삭제</button>
            </div>
        </c:if>
        <div>
            <c:if test="${!empty m_id}">
                <button type="button" id="report_button">신고하기</button>
            </c:if>
        </div>
        <div>
            <a href="freeList?&num=${fboard.num}&pageNum=${pageNum }&category=${fboard.category}">목록</a>
        </div>


        <c:if test="${!empty m_id}">
            <div>
                <form id="frm" name="frm" enctype="multipart/form-data">
                    <!-- method="post" enctype="multipart/form-data" action="r_insertRe" -->
                    <input type="hidden" name=num value="${fboard.num }">
                    <input type="hidden" name="pageNum" value="${pageNum}">
                    <input type="file" name="re_file1"> 댓글 :
                    <textarea rows=3 cols=30 name="re_content"></textarea>
                    <input type="button" value="댓글입력" id="reple_insert">
                </form>
            </div>
        </c:if>
        <div id="listRe"></div>
    </div>

</div>
</body>
</html>
