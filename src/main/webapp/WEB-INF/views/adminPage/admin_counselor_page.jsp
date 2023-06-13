<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Counselor Manage</title>

    <!-- ======= Table ======= -->
    <jsp:include page="../navigator_footer/admin_table.jsp"></jsp:include>
</head>
<body>

<!-- ======= Header ======= -->
<jsp:include page="../navigator_footer/admin_navigator.jsp"></jsp:include>

<!-- ======= Sidebar ======= -->
<jsp:include page="../navigator_footer/admin_sidebar.jsp"></jsp:include>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>상담사</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="adminCounselorPage">상담사</a></li>
                <li class="breadcrumb-item active">상담사 정보</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <table id="example" class="table is-striped" style="width:100%">
        <thead>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Age</th>
            <th>Salary</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Tiger Nixon</td>
            <td>System Architect</td>
            <td>Edinburgh</td>
            <td>61</td>
            <td>$320,800</td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Age</th>
            <th>Salary</th>
        </tr>
        </tfoot>
    </table>

    <br><br>
    <hr>
    <br><br>

    <div class="pagetitle">
        <h1>상담사</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="adminCounselorPage">상담사</a></li>
                <li class="breadcrumb-item active">하위페이지</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <table id="example2" class="table is-striped" style="width:100%">
        <thead>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Age</th>
            <th>Salary</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Jena Gaines</td>
            <td>Office Manager</td>
            <td>London</td>
            <td>30</td>
            <td>$90,560</td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Age</th>
            <th>Salary</th>
        </tr>
        </tfoot>
    </table>
</main><!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="../navigator_footer/admin_footer.jsp"></jsp:include>

</body>
</html>
