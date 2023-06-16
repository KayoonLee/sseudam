
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>


<body>
<div style="background-color: white; padding: 20px;">
  <h3>상담사 선택</h3>

  <form action="choose_Consult_Time" method="POST">
    <p>상담사 선택:</p>
    <select name = "con_names">

      <option value="">상담사</option>
      <c:forEach var="counselor" items="${con_names}">
        <option value="${counselor.m_id}">${counselor.name}</option>

      </c:forEach>
    </select>

    <button type="submit">상담신청서 작성하기</button>
  </form>
</div>


</body>
</html>
