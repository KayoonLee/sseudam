<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2023-06-12
  Time: 오전 9:38
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2023-06-11
  Time: 오후 6:02
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>
    <title>Title</title>

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
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

</head>
<body>
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="#" class="logo d-flex align-items-center">
            <img src="images/muzik5.jpg" alt="">
            <span class="d-none d-lg-block">쓰담</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->


    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">
            <li class="nav-item dropdown">
                <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                    <i class="bi bi-bell"></i>
                    <span class="badge bg-primary badge-number">4</span>
                </a><!-- End Notification Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                    <li class="dropdown-header">
                        You have 4 new notifications
                        <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li class="notification-item">
                        <i class="bi bi-exclamation-circle text-warning"></i>
                        <div>
                            <h4>Lorem Ipsum</h4>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>30 min. ago</p>
                        </div>
                    </li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li class="notification-item">
                        <i class="bi bi-x-circle text-danger"></i>
                        <div>
                            <h4>Atque rerum nesciunt</h4>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>1 hr. ago</p>
                        </div>
                    </li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li class="notification-item">
                        <i class="bi bi-check-circle text-success"></i>
                        <div>
                            <h4>Sit rerum fuga</h4>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>2 hrs. ago</p>
                        </div>
                    </li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li class="notification-item">
                        <i class="bi bi-info-circle text-primary"></i>
                        <div>
                            <h4>Dicta reprehenderit</h4>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>4 hrs. ago</p>
                        </div>
                    </li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li class="dropdown-footer">
                        <a href="#">Show all notifications</a>
                    </li>

                </ul><!-- End Notification Dropdown Items -->

            </li><!-- End Notification Nav -->


            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <span class="d-none d-md-block dropdown-toggle ps-2">홍은희</span>
                </a><!-- End Profile Iamge Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>Kevin Anderson</h6>
                        <span>Web Designer</span>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                            <i class="bi bi-person"></i>
                            <span>My Profile</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                            <i class="bi bi-gear"></i>
                            <span>Account Settings</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                            <i class="bi bi-question-circle"></i>
                            <span>Need Help?</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Sign Out</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header>
<!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link collapsed" href="counselorpage_main">
                <i class="bi bi-person"></i>
                <span>나의 프로필</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link " href="counselorpage_request">
                <i class="bi bi-balloon"></i><span>상담요청목록</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>나의 활동내역</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="counselorpage_mypost">
                        <i class="bi bi-circle"></i><span>내가 쓴 글</span>
                    </a>
                </li>
                <li>
                    <a href="counselorpage_myreply">
                        <i class="bi bi-circle"></i><span>내가 쓴 댓글</span>
                    </a>
                </li>
                <li>
                    <a href="counselorpage_mylike">
                        <i class="bi bi-circle"></i><span>내가 좋아요한 글</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Components Nav -->
    </ul>
</aside>
<main id="main" class="main">
<div class="pagetitle">
    <h1>상담요청내역</h1>
</div>
<!-- End Page Title -->
<br>
<div class="card">
<div class="card-body">
<br>
<table id="example" class="table is-striped" style="width:100%">
<thead>
<tr>
    <th>신청자</th>
    <th>상담목적</th>
    <th>신청날짜</th>
    <th>상담요청시간</th>
    <th>진행현황</th>
</tr>
</thead>
<tbody>
<c:if test="${empty requestList}">
    <tr>
        <td>상담요청 내역이 없습니다.</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</c:if>
<c:forEach var="counsel_paper" items="${requestList}">
    <tr onclick="location.href='get_Consult_Details?paper_num=${counsel_paper.paper_num}'">
    <td>${counsel_paper.nick}</td>
    <td>${counsel_paper.purpose}</td>
    <td><fmt:formatDate value="${counsel_paper.application_date}"
                        pattern="yyyy년 MM월 dd일"/></td>
    <td><fmt:formatDate value="${counsel_paper.request_time}"
                        pattern="HH시 mm분"/></td>
    <td>
            <c:if test="${counsel_paper.confirmed == '0'}">대기</c:if>
            <c:if test="${counsel_paper.confirmed == '1'}">확정</c:if>
            <c:if test="${counsel_paper.confirmed == '2'}">완료</c:if>
            <c:if test="${counsel_paper.confirmed == '3'}">거절</c:if>
    </tr>
</c:forEach>
    </tbody>
    <tfoot>
    <tr>
    <th>신청자</th>
    <th>상담목적</th>
    <th>신청날짜</th>
    <th>상담요청시간</th>
    <th>진행현황</th>
    </tr>
    </tfoot>
    </table>
    </div>
    </div>

    </main>


    </body>
    </html>


