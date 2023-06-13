<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Admin_Sidebar</title>
</head>
<body>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <%-- 대시보드: 총 일반회원수, 상담자수, 방문자수 통계 페이지 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" href="adminMain">
                <i class="bi bi-grid"></i>
                <span>회원수 통계(Dashboard)</span>
            </a>
        </li>
        <%-- End Dashboard Nav --%>

        <%-- 일반회원 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" href="adminMemberPage">
                <i class="bi bi-menu-button-wide"></i>
                <span>일반회원</span>
            </a>
        </li><!-- End Components Nav -->

        <%-- 신고받은 일반회원 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" href="adminMemberReport">
                <i class="bi bi-menu-button-wide"></i>
                <span>신고받은 회원관리</span>
            </a>
        </li><!-- End Components Nav -->

        <%-- 동물회원 조회 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>반려동물</span><i
                    class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="adminDogPage">
                        <i class="bi bi-circle"></i><span>강아지</span>
                    </a>
                </li>
                <li>
                    <a href="adminCatPage">
                        <i class="bi bi-circle"></i><span>고양이</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Tables Nav -->

        <%-- 상담사 조회 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-journal-text"></i><span>상담사</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="adminCounselorPage">
                        <i class="bi bi-circle"></i><span>상담사 정보</span>
                    </a>
                </li>
                <li>
                    <a href="adminCounselorApply">
                        <i class="bi bi-circle"></i><span>상담사 신청관리</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Forms Nav -->

        <%-- 왼쪽 사이드바 구분하는 말 --%>
        <li class="nav-heading">Admin Pages</li>

        <%-- 관리자 마이페이지/프로파일 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" href="adminProfile">
                <i class="bi bi-person"></i>
                <span>관리자 프로필</span>     <!-- 필요함까? -->
            </a>
        </li><!-- End Profile Page Nav -->

        <%-- 관리자 등록 --%>
        <li class="nav-item">
            <a class="nav-link collapsed" href="adminRegister">
                <i class="bi bi-card-list"></i>
                <span>관리자 등록</span>
            </a>
        </li><!-- End Register Page Nav -->

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

</aside><!-- End Sidebar-->

</body>
</html>