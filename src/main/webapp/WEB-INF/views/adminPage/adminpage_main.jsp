x`<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header/header.jsp" %>

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
    <link href="css/counselorTest.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
  <%--  <a href="adminTest">토스트ui 테스트</a>
    <a href="adminTest2">calendar test1</a>
    <a href="adminTest3">calendar test2</a>
    <a href="adminTest4">상담사 예약 테스트</a>
    <a href="adminTest5">상담사 예약 테스트2</a>
--%>
    <div class="pagetitle">
        <h1>회원수 통계</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <%-- adminMain/adminDashboard --%>
                <li class="breadcrumb-item">회원수 통계</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">

            <div class="col-lg-12">
                <div class="row">

                    <!-- 일반회원 Card -->
                    <div class="col-xxl-4 col-xl-12">

                        <div class="card info-card customers-card">
                            <div class="card-body">

                                <h5 class="card-title">일반회원 <span>| This Year</span></h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <%--<h6>${totalMember}명</h6>--%>
                                        <c:if test="${totalMember == 0}">
                                            <h6>0명</h6>
                                        </c:if>
                                        <c:if test="${totalMember > 0}">
                                            <h6>${totalMember}명</h6>
                                        </c:if>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <%-- End 일반회원 Card --%>

                    <%-- 상담사 Card --%>
                    <div class="col-xxl-4 col-xl-12">

                        <div class="card info-card customers-card">
                            <div class="card-body">

                                <h5 class="card-title">상담사 <span>| This Year</span></h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <%--<h6>${totalCounselor}명</h6>--%>
                                        <c:if test="${totalCounselor == 0}">
                                            <h6>0명</h6>
                                        </c:if>
                                        <c:if test="${totalCounselor > 0}">
                                            <h6>${totalCounselor}명</h6>
                                        </c:if>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <%-- End 상담사 Card --%>

                    <%-- 관리자 Card --%>
                    <div class="col-xxl-4 col-xl-12">

                        <div class="card info-card customers-card">
                            <div class="card-body">

                                <h5 class="card-title">관리자 <span>| This Year</span></h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <%--<h6>${totalAdmin}명</h6>--%>
                                        <c:if test="${totalAdmin == 0}">
                                            <h6>0명</h6>
                                        </c:if>
                                        <c:if test="${totalAdmin > 0}">
                                            <h6>${totalAdmin}명</h6>
                                        </c:if>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <%-- End 관리자 Card --%>

                </div>
            </div>
            <%-- End Left side columns --%>

        </div>
    </section>

    <hr>

    <%-- 오늘 방문자수 --%>
    <div class="pagetitle">
        <h1>방문자 추이</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <%-- adminMain/adminDashboard --%>
                <li class="breadcrumb-item">방문자 추이</li>
            </ol>
        </nav>
    </div>
    <%-- End Page Title --%>

    <section class="section">
        <div class="row">

            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <%--<h5 class="card-title">Chart1</h5>--%>

                        <div class="card-title" align="center">오늘 방문자 수</div>
                        <canvas id="Today" style="max-height: 400px;"></canvas>

                        <script>
                            const gtx = document.getElementById('Today');

                            new Chart(gtx, {
                                type: 'bar',
                                data: {
                                    labels: ['오늘 방문자수'],
                                    datasets: [{
                                        label: '방문자',
                                        data: [${todayCount}],
                                        borderWidth: 2,
                                        backgroundColor: [
                                            'rgba(153, 102, 255, 0.2)'
                                        ]
                                    }]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });

                        </script>
                        <!-- End Chart -->

                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <%--<h5 class="card-title">Chart2</h5>--%>

                        <div class="card-title" align="center">누적 방문자 수</div>
                        <canvas id="Total" style="max-height: 240px;"></canvas>

                        <script>
                            const ctx = document.getElementById('Total');

                            new Chart(ctx, {
                                type: 'pie',
                                data: {
                                    labels: ['누적 방문자'],
                                    datasets: [{
                                        label: '방문방문',
                                        data: [${totalCount}],
                                        backgroundColor: [
                                            'rgb(255, 205, 86)'
                                        ],
                                        hoverOffset: 4
                                    }]
                                },
                            });
                        </script>
                        <!-- End Chart -->

                    </div>
                </div>
            </div>

        </div>
    </section>

    <%-- 주간 방문자수 통계 --%>

    <hr>

    <div class="pagetitle">
        <h1>주간 방문자 추이</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <%-- adminMain/adminDashboard --%>
                <li class="breadcrumb-item">주간 방문자 추이</li>
            </ol>
        </nav>
    </div>
    <%-- End Page Title --%>

    <%-- 오늘자 방문수 통계 --%>
    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="pagetitle">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title" align="center">주간 방문자 추이</div>

                            <!-- Line Chart -->
                            <canvas id="lineChart" style="max-height: 400px;"></canvas>
                            <script>
                                const weekDays = [
                                    <c:forEach var="date" items="${weekDays}">
                                    '${fn:substring(date, 0, 4)}${fn:substring(date, 5, 7)}${fn:substring(date, 8, 10)}',
                                    </c:forEach>
                                ];

                                document.addEventListener("DOMContentLoaded", () => {
                                    new Chart(document.querySelector('#lineChart'), {
                                        type: 'line',
                                        data: {
                                            labels: weekDays,
                                            datasets: [{
                                                label: 'Line Chart',
                                                data: [${weekCount.get(0)}, ${weekCount.get(1)}, ${weekCount.get(2)}, ${weekCount.get(3)},
                                                    ${weekCount.get(4)}, ${weekCount.get(5)}, ${weekCount.get(6)}],
                                                fill: false,
                                                borderColor: 'rgb(75, 192, 192)',
                                                tension: 0.1
                                            }]
                                        },
                                        options: {
                                            scales: {
                                                y: {
                                                    beginAtZero: true
                                                }
                                            }
                                        }
                                    });
                                });
                            </script>
                            <!-- End Line CHart -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%--<jsp:include page="../navigator_footer/admin_footer.jsp"></jsp:include>--%>
<%@ include file="../navigator_footer/admin_footer.jsp" %>

</body>
</html>
