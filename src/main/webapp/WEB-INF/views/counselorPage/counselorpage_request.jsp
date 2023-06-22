

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>
    <title>Title</title>

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">z
    <link href="vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>


    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>
<%@ include file="../navigator_footer/counselor_header.jsp" %>

</head>
<body>

<!-- ======= navigator ======= -->
<%@ include file="../navigator_footer/counselor_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/counselor_sidebar.jsp" %>


<main id="main" class="main">
    <div class="pagetitle">
        <h1>상담요청내역</h1>
    </div><!-- End Page Title -->
    <br>
    <div class="card">
        <div class="card-body">
            <br>
            <table id="example" class="table is-striped" style="width:100%">
                <thead>
                <tr>
                    <th>신청자</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>진행현황</th>
                </tr>
                </thead>
                <tbody>
                <td>test작성자</td>
                <td>우리애가이상해요</td>
                <td>2023-06-21</td>
                <td>확정</td>
                </tbody>
                <tfoot>
                <tr>
                    <th>신청자</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>진행현황</th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>

</main>



</body>
</html>


