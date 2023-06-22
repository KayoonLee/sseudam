
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
            <h1>내가 좋아요한 글</h1>
        </div><!-- End Page Title -->
        <br>
        <div class="card">
            <div class="card-body">
                <br>
                <table id="example" class="table is-striped" style="width:100%">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>게시글 제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>추천수</th>
                        <th>작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <td>1</td>
                    <td>test제목</td>
                    <td>test글쓴이</td>
                    <td>10</td>
                    <td>2</td>
                    <td>2023-06-21</td>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th>번호</th>
                        <th>게시글 제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>추천수</th>
                        <th>작성일</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>

    </main>


</body>
</html>

