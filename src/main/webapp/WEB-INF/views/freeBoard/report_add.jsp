<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file = "../header/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title> </title>

  <!-- Latest compiled and minified CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

  <%--네이버 폰트--%>
  <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">

  <style>
    .bgcolor{
      background-color: #f8f9fa;
    }

    .outbox{
      position: relative;
      width:350px;					/* 수평방향 크기 */
      border: 1px solid #ccc;			/* 선굵기 */
      border-radius: 10px;			/* 바깥선 굴곡 */
      outline: 1px solid #ccc;		/* 바깥선 노출 */
      margin: 0 auto;				/* 화면 가운데 위치 */
      padding: 20px;					/* 안쪽여백 */
      background-color: white;
    }

    .innerbox{
      width:310px;					/* 수평방향 크기 */
      border: 1px solid #ccc;			/* 선굵기 */
      border-radius: 10px;			/* 바깥선 굴곡 */
      outline: 1px solid #ccc;		/* 바깥선 노출 */
      margin: 5px auto;
      padding: 14px;

      font-family: 'NanumSquareNeoBold';

    }

    textarea {
      resize: none;
    }
  </style>

  <script>
    function close_this(){
      window.close();
    }
  </script>
</head>
<body>

<div class="bgcolor container">
  <div class="outbox">
  <form method="post" action="reportAdd" onsubmit="return report_check()">
    <input type="hidden" name="num" value="${reportboard.num}" />
    <input type="hidden" name="board_num" value="${reportboard.board_num}" />
    <input type="hidden" name="m_id" value="${reportboard.m_id}" />
    <div class="innerbox">
      <h2 align="center">불량 게시글 신고</h2>
    </div>
    <br>
    <div>
      <select name="report_issue">
        <option value="1">주제에 맞지 않는 글</option>
        <option value="2">과도한 욕설</option>
        <option value="3">광고성 글</option>
        <option value="4">음란물</option>
        <option value="5">개인정보 노출</option>
        <option value="6">기타</option>
      </select>
    </div>
    <div class="innerbox">
      <textarea id="report_content" name="report_content" maxlength="100" rows="6" cols="29"
                placeholder="이유를 상세히 적어 제출하시면 관리자 검토 후 조치하겠습니다."></textarea>
    </div>
    <br>
    <div align="center">
    <button type="submit" class="btn btn-danger">제출</button>
    <button type="button" class="btn btn-success" onclick="close_this()">취소</button>
    </div>
  </form>
  </div>
</div>

</body>
</html>