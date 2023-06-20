<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Admin_Member_Delete_View</title>
  <script>

    // 상태값 변경
    function adminSetState(m_id, state) {
      if (state == '1') {
        var text = "이 회원을 삭제하시겠습니까?";
      } else if (state == '0') {
        var text = "이 회원을 다시 복원시키겠습니까?";
      }
      if (confirm(text)) {
        $.ajax({
          url: "adminDeleteBtn",
          data: {m_id: m_id, state: state},
          success: function (response) {
            if (response == 1) {
              alert("회원의 상태값이 변경되었습니다");
            } else {
              alert("오류 발생. 다시 시도해주세요");
            }
          }
        });
      }
    }
  </script>

</head>
<body>
<h1>${memberDto.state}</h1>

<c:if test="${memberDto.state == 1}">
  <button type="button" onclick="adminSetState(${memberDto.m_id}, ${memberDto.state})">회원삭제</button>
</c:if>

<c:if test="${memberDto.state == 0}">
  <button type="button" onclick="adminSetState(${memberDto.m_id}, ${memberDto.state})">회원복원</button>
</c:if>

<%--
<button onclick="location.href='adminDeleteBtn?m_id=${memberDto.m_id}'">활동</button>
--%>

</body>
</html>