
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>

    <!-- ======= Table ======= -->
<%@ include file="../navigator_footer/admin_table.jsp" %>
<%@ include file="../navigator_footer/member_header.jsp" %>

</head>
<body>
<!-- ======= Header ======= -->
<%@ include file="../navigator_footer/counselor_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/member_sidebar.jsp" %>


  <main id="main" class="main">
      <div class="pagetitle">
          <h1>상담신청내역</h1>
      </div><!-- End Page Title -->
      <br>
      <div class="card">
          <div class="card-body">
              <br>
              <table id="example" class="table is-striped" style="width:100%">
                  <thead>
                  <tr>
                      <th>작성자</th>
                      <th>제목</th>
                      <th>상담사</th>
                      <th>작성일</th>
                  </tr>
                  </thead>
                  <tbody>
                  <td>test작성자</td>
                  <td>우리애가이상해요</td>
                  <td>test상담사</td>
                  <td>2023-06-21</td>
                  </tbody>
                  <tfoot>
                  <tr>
                      <th>작성자</th>
                      <th>제목</th>
                      <th>상담사</th>
                      <th>작성일</th>
                  </tr>
                  </tfoot>
              </table>
          </div>
      </div>

  </main>


</body>
</html>


