<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Admin_Sidebar</title>
    <%--
        <style>
            .active {
                background-color: mediumpurple;
            }
        </style>
    --%>
</head>
<body>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <%-- 왼쪽 사이드바 구분하는 말 --%>
        <li class="nav-heading">DashBoard</li>

        <%-- 대시보드: 총 일반회원수, 상담자수, 방문자수 통계 페이지 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" href="adminMain"> <%-- adminMain || adminDashboard --%>
                <i class="bi bi-grid"></i>
                <span id="ad_dashboard">회원수 통계</span>
            </a>
        </li>
        <%-- End Dashboard Nav --%>

        <%-- 왼쪽 사이드바 구분하는 말 --%>
        <li class="nav-heading">일반회원</li>

        <%-- 일반회원 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" href="adminMemberPage"> <%-- adminMemberPage --%>
                <i class="bi bi-menu-button-wide"></i>
                <span id="ad_member_page">일반회원</span>
            </a>
        </li><!-- End Components Nav -->

        <%-- 신고받은 일반회원 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" href="adminMemberReport"> <%-- adminMemberReport --%>
                <i class="bi bi-menu-button-wide"></i>
                <span id="ad_member_report">신고받은 회원관리</span>
            </a>
        </li><!-- End Components Nav -->

        <%-- 왼쪽 사이드바 구분하는 말 --%>
        <li class="nav-heading">동물회원</li>

        <%-- 동물회원 조회 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>반려동물</span>
                <i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="adminDogPage"> <%-- adminDogPage --%>
                        <%--<i class="bi bi-circle active"></i>--%>
                        <span id="ad_dog_page">강아지</span>
                    </a>
                </li>
                <li>
                    <a href="adminCatPage"> <%-- adminCatPage --%>
                        <%--<i class="bi bi-circle"></i>--%>
                        <span id="ad_cat_page">고양이</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Tables Nav -->

        <%-- 왼쪽 사이드바 구분하는 말 --%>
        <li class="nav-heading">상담사</li>

        <%-- 상담사 조회 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-journal-text"></i><span>상담사</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="adminCounselorPage"> <%-- adminCounselorPage --%>
                        <%--<i class="bi bi-circle"></i>--%>
                        <span id="ad_counselor_page">상담사 정보</span>
                    </a>
                </li>
                <li>
                    <a href="adminCounselorApply"> <%-- adminCounselorApply --%>
                        <%--<i class="bi bi-circle"></i>--%>
                        <span id="ad_counselor_apply">상담사 신청관리</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Forms Nav -->

        <%-- 왼쪽 사이드바 구분하는 말 --%>
        <%--<li class="nav-heading">Admin Pages</li>--%>

        <%-- 관리자 마이페이지/프로파일 --%> <%-- adminProfile --%>
<%--
        <li class="nav-item">
            <a class="nav-link collapsed" href="adminProfile">
                <i class="bi bi-person"></i><span id="ad_profile">관리자 프로필</span>
            </a>
        </li>
--%>

        <%-- 관리자 등록 --%> <%-- adminRegister --%>
<%--
        <li class="nav-item">
            <a class="nav-link collapsed" href="adminRegister">
                <i class="bi bi-card-list"></i><span id="ad_register">관리자 등록</span>
            </a>
        </li>
--%>

        <%-- 쪽지는 보류 --%>
<%--
                <li class="nav-item">
                    <a class="nav-link collapsed" href="note_contact.html">
                        <i class="bi bi-envelope"></i>
                        <span>Contact</span>
                    </a>
                </li><!-- End Contact Page Nav -->
--%>
    </ul>

</aside><%-- End Sidebar--%>

</body>
</html>
