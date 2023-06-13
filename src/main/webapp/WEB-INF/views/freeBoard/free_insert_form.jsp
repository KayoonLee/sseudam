<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file = "../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성폼</title>

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
				reader.onload = function(e) {
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
		<h2 align="center">레시피 글 쓰기</h2><br>
		<form enctype="multipart/form-data" action="freeInsert" method="post">
			<input type="hidden" name="num" value="2">
			<div class="container innerbox">
					<div>
					<div>제목</div>
					<div><input type="text" name="subject"></div>
					<div>분류</div>
					<div>
					<select id="category" name="category">
							<option value="">선택</option>
							<option value="1">자유게시판</option>
							<option value="2">묻고 답하기</option>
							<option value="3">토론 게시판</option>
					</select>
					</div>
					</div>
					<div>본문</div>
					<div>
						<input type="file" id="imageInput" name="files" onchange="previewImage(this)" multiple>
						<textarea id="content" name="content" rows="5" cols="50"></textarea><br>
						<div id="previewContainer"></div>
					</div>
					<div>
						<button type="button" onclick="uploadImage()">이미지 업로드</button>
					</div>

					<div>
					<div>
					<input type="text" name="hashtag" placeholder="#태그입력"></div>
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