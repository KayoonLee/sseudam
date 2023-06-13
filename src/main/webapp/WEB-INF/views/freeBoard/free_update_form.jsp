<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file = "../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 작성폼</title>

</head>
<body>

<div class="bgcolor">
    <div class="outbox">
        <h2 align="center">레시피 글 수정</h2><br>
        <form enctype="multipart/form-data" action="freeUpdate" method="post">
            <input type="hidden" name="num" value="${fboard.num}">
            <input type="hidden" name="board_num" value="${fboard.board_num}">
            <div class="innerbox">
                <div>
                    <div>제목</div>
                    <div><input type="text" name="subject" value="${fboard.subject}"></div>
                    <div>분류</div>
                    <div>
                        <select id="category" name="category">
                            <option value="">선택</option>
                            <option value="1"<c:if test="${fboard.category == '1'}">selected</c:if>>
                                자유게시판</option>
                            <option value="2"<c:if test="${fboard.category == '2'}">selected</c:if>>
                                묻고 답하기</option>
                            <option value="3"<c:if test="${fboard.category == '3'}">selected</c:if>>
                                토론게시판</option>
                        </select>
                    </div>
                </div>
                <div>본문</div>
                <div>
                    <textarea name="content">${fboard.content}</textarea>
                </div>
                <div>
                    <input type="file" name="file1">
                </div>

                <div>
                    <div>
                        <input type="text" name="hashtag" placeholder="#태그입력"></div>
                    <%-- 해시태그 보일곳 --%>
                    <div>${fboard.hashtag}</div>
                </div>
                <input type="submit" value="수정">
                <input type="reset" value="취소">
            </div>
        </form>
    </div>
</div>

</body>
</html>