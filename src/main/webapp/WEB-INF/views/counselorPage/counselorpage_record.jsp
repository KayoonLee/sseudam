<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>
  <%@ include file="../navigator_footer/counselor_header.jsp" %>

  <!-- ======= Table ======= -->
  <%@ include file="../navigator_footer/admin_table.jsp" %>

</head>
<body>
<!-- ======= Header ======= -->
<%@ include file="../navigator_footer/counselor_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/counselor_sidebar.jsp" %>

<main id="main" class="main">
  <div class="pagetitle">
    <h1>상담기록서</h1>
  </div>
  <br>
  <div class="card">
    <div class="card-body">
      <br>
      <table id="example" class="table is-striped" style="width:100%">
        <thead>
        <tr>
          <th>반려동물</th>
          <th>상담제목</th>
          <th>상담주제</th>
          <th>상담날짜</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty recordList}">
          <tr>
            <td>유효한 상담기록이 없습니다.</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </c:if>
        <c:forEach var="counsel_record" items="${recordList}">
          <tr onclick="location.href='get_Consulting_Details?record_num=${counsel_record.record_num}'">
            <td>${counsel_record.animal}</td>
            <td>${counsel_record.subject}</td>
            <td>${counsel_record.topic}</td>
            <td><fmt:formatDate value="${counsel_record.consulting_date}"
                                pattern="yyyy년 MM월 dd일"/></td>
          </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
          <th>반려동물</th>
          <th>상담제목</th>
          <th>상담주제</th>
          <th>상담날짜</th>
        </tr>
        </tfoot>
        </tbody>
      </table>
    </div>
  </div>
</main>
</body>
</html>