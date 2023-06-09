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
		<h2 align="center">레시피 글 쓰기</h2><br>
		<form enctype="multipart/form-data" action="freeInsert">
			<div class="container innerbox">
					<div>
					<div>제목</div>
					<div><input type="text" id="subject" name="subject"></div>
					<div>분류</div>
					<div>
					<select id="category" name="category">
							<option value="">선택</option>
							<option value="korean">자유게시판</option>
							<option value="chinese">묻고 답하기</option>
							<option value="japanese">토론</option>
					</select>
					</div>
					</div>
					<div>본문</div>
					<div>
					<textarea></textarea>
					</div>
					<div>
					<input type="file">
					</div>

					<div>
					<div>
					<input type="text" placeholder="#태그입력"></div>
					<%-- 해시태그 보일곳 --%>
					<div></div>
					</div>

					<input type="submit" value="작성">
					<input type="reset" value="취소">
					<a href="freeList">목록</a>

			</div>
		</div>
</div>

</body>
</html>