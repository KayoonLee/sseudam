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
      <a class="nav-link " href="adminMain">
        <i class="bi bi-grid"></i>
        <span>Dashboard</span>
      </a>
    </li>
    <%-- End Dashboard Nav --%>

    <%-- 일반회원 조회 --%>
    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-menu-button-wide"></i><span>회원</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <li>
          <a href="memberPage">
            <i class="bi bi-circle"></i><span>회원정보<%-- 일반회원 조회 --%></span>
          </a>
        </li>
        <li>
          <a href="memberReport">
            <i class="bi bi-circle"></i><span>신고받은 회원<%-- 신고받은 회원 조회 --%></span>
          </a>
        </li>
      </ul>
    </li><!-- End Components Nav -->

    <%-- 상담사 조회 --%>
    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-journal-text"></i><span>상담사</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <li>
          <a href="counselorPage">
            <i class="bi bi-circle"></i><span>상담사 정보<%-- 상담사 관리 Counselor Page--%></span>
          </a>
        </li>
        <li>
          <a href="counselorApply">
            <i class="bi bi-circle"></i><span>상담사 신청관리<%-- 상담사 신청관리 Counselor Apply--%></span>
          </a>
        </li>
      </ul>
    </li><!-- End Forms Nav -->

    <%-- 동물회원 조회를 따로 만들어야 하나..? 아니면 신고? --%>
    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-layout-text-window-reverse"></i><span>동물</span><i
              class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <li>
          <a href="dogPage">
            <i class="bi bi-circle"></i><span>강아지's<%-- 강아지 --%></span>
          </a>
        </li>
        <li>
          <a href="catPage">
            <i class="bi bi-circle"></i><span>고양이's<%-- 고양이 --%></span>
          </a>
        </li>
      </ul>
    </li><!-- End Tables Nav -->

    <%-- 왼쪽 사이드바 구분하는 말 --%>
    <li class="nav-heading">Admin Pages</li>

    <%-- 관리자 마이페이지/프로파일 --%>
    <li class="nav-item">
      <a class="nav-link collapsed" href="adminProfile">
        <i class="bi bi-person"></i>
        <span>관리자 프로필?</span>     <!-- 필요함까? -->
      </a>
    </li><!-- End Profile Page Nav -->

    <%-- 관리자 등록 --%>
    <li class="nav-item">
      <a class="nav-link collapsed" href="adminRegister">
        <i class="bi bi-card-list"></i>
        <span>관리자 등록?</span>
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
