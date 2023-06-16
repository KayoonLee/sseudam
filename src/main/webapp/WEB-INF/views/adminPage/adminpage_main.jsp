<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>
    <title>Admin_Page</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/admin_header.jsp" %>

    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>

    <%-- 관리자 첫화면
        <script>
            // 관리자 첫화면 = 대시보드(회원수 통계)
            $(function() {
                $("#adminmain").load("adminDashboard"); // 아래의 태그 안의 id="" // load(Controller 에서 사용하는 매핑값)
                //return false;

                // 대시보드
                $("#ad_dashboard").click(function() {
                    $("#adminmain").load("adminDashboard");
                });

                // 일반회원
                $("#ad_member_page").click(function() {
                    $("#adminmain").load("adminMemberPage");
                });

                // 신고받은 회원관리
                $("#ad_member_report").click(function() {
                    $("#adminmain").load("adminMemberReport");
                });

                // 반려동물 -> 강아지
                $("#ad_dog_page").click(function() {
                    $("#adminmain").load("adminDogPage");
                });

                // 반려동물 -> 고양이
                $("#ad_cat_page").click(function() {
                    $("#adminmain").load("adminCatPage");
                });

                // 상담사 -> 상담사 정보
                $("#ad_counselor_page").click(function() {
                    $("#adminmain").load("adminCounselorPage");
                });

                // 상담사 -> 상담사 신청관리 테스트중
                $("#ad_counselor_apply").click(function() {
                    alert("ㅋ")
                    $("#adminmain").load("adminCounselorApply")
                });

                // 관리자 프로필
                $("#ad_profile").click(function() {
                    $("#adminmain").load("adminProfile");
                });

                // 관리자 등록
                $("#ad_register").click(function() {
                    $("#adminmain").load("adminRegister");
                });
            });
        </script>
    --%>
</head>
<body>

<!-- ======= Navigator ======= -->
<%--<jsp:include page="../navigator_footer/admin_navigator.jsp"></jsp:include>--%>
<%@ include file="../navigator_footer/admin_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%--<jsp:include page="../navigator_footer/admin_sidebar.jsp"></jsp:include>--%>
<%@ include file="../navigator_footer/admin_sidebar.jsp" %>

<!-- ======= Main ======= -->
<%-- <head>태그의 sidebar 주석처리한 부분 --%>
<%--1. <div id="adminmain"></div>--%>

<%--2. <main id="main"class="main">
    <div id="adminmain"></div>
</main>--%><!-- End #main -->

<!-- ======= Header ======= -->
<!-- ======= Sidebar ======= -->

<!-- ======= Dashboard ======= -->
<main id="main" class="main">
    <%-- 나중에 삭제할 부분 --%>
    <a href="adminTest">토스트ui 테스트</a>
    <a href="adminTest2">calendar test1</a>
    <a href="adminTest3">calendar test2</a>

    <div class="pagetitle">
        <h1>Dashboard</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <%-- adminMain/adminDashboard --%>
                <li class="breadcrumb-item">Dashboard</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <div class="col-lg-8">
                <div class="row">

                    <!-- Customers Card -->
                    <div class="col-xxl-4 col-xl-12">

                        <div class="card info-card customers-card">
                            <div class="card-body">

                                <h5 class="card-title">Customers <span>| This Year</span></h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>1244</h6>
                                        <span class="text-danger small pt-1 fw-bold">12%</span> <span
                                            class="text-muted small pt-2 ps-1">decrease</span>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div><!-- End Customers Card -->

                    <!-- Customers Card -->
                    <div class="col-xxl-4 col-xl-12">

                        <div class="card info-card customers-card">
                            <div class="card-body">

                                <h5 class="card-title">Customers <span>| This Year</span></h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>1244</h6>
                                        <span class="text-danger small pt-1 fw-bold">12%</span> <span
                                            class="text-muted small pt-2 ps-1">decrease</span>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div><!-- End Customers Card -->

                </div>
            </div><!-- End Left side columns -->

        </div>
    </section>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%--<jsp:include page="../navigator_footer/admin_footer.jsp"></jsp:include>--%>
<%@ include file="../navigator_footer/admin_footer.jsp" %>

</body>
</html>
