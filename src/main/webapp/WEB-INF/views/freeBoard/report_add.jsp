<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file = "../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title> </title>

</head>
<body>

<div class="outbox">
  <form method="post" action="reportAdd">
    <input type="hidden" name="num" value="${reportboard.num}" />
    <input type="hidden" name="board_num" value="${reportboard.board_num}" />
    <input type="hidden" name="m_id" value="${reportboard.m_id}" />

  <div>
    <h2>불량 게시글 신고</h2>
  </div>
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
  <div>
    <textarea name="report_content" placeholder="이유를 상세히 적어 제출하시면 관리자 검토 후 조치하겠습니다."></textarea>
  </div>
    <button type="submit">제출</button>
    <button type="reset">취소</button>
  </form>
</div>

</body>
</html>