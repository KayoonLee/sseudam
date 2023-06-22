<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2023-06-11
  Time: 오후 8:15
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

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>

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
                    <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.member.nick}</span>
                </a><!-- End Profile Iamge Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>${sessionScope.member.nick}</h6>
                        <span>닉네임</span>
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

</header><!-- End Header -->

<!-- ======= Sidebar ======= -->

    <aside id="sidebar" class="sidebar">
        <ul class="sidebar-nav" id="sidebar-nav">
            <li class="nav-item">
                <a class="nav-link collapsed" href="memberpage_main">
                    <i class="bi bi-person"></i>
                    <span>나의 프로필</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="memberpage_mypet">
                    <i class="bi bi-balloon"></i><span>동물페이지</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>나의 활동내역</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="memberpage_mypost">
                            <i class="bi bi-circle"></i><span>내가 쓴 글</span>
                        </a>
                    </li>
                    <li>
                        <a href="memberpage_myreply">
                            <i class="bi bi-circle"></i><span>내가 쓴 댓글</span>
                        </a>
                    </li>
                    <li>
                        <a href="memberpage_mylike">
                            <i class="bi bi-circle"></i><span>내가 좋아요한 글</span>
                        </a>
                    </li>
                    <li>
                        <a href="memberpage_mypaper">
                            <i class="bi bi-circle"></i><span>상담신청내역</span>
                        </a>
                    </li>
                </ul>
            </li><!-- End Components Nav -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="memberpage_mycounselor">
                    <i class="bi bi-grid"></i>
                    <span>즐겨찾는 상담사</span>
                </a>
            </li>

        </ul>
    </aside>

    <main id="main" class="main">
        <div class="container" align="center">
            <div class="row">
                <c:if test="${empty list}">
                    <div class="col-sm-12 text-bg-secondary">
                        <b>등록된 반려동물이 없습니다</b>
                    </div>
                </c:if>
                <c:if test="${not empty list}">
                    <c:forEach var="pet" items="${list }">
                            <div class="col-sm-3">
                                <div>member.m_id: ${sessionScope.member.m_id}<br>pet.g_id: ${pet.g_id}
                                    <div class="card">
                                        <c:if test="${!empty pet.profile_num}">
                                            <a href="memberpage_petview?p_id=${pet.p_id }&pageNum=${pageNum}">
                                                <img class="card-img-top" src="./petimg/${pet.profile_name}">
                                            </a>
                                        </c:if>
                                        <c:if test="${empty pet.profile_num}">
                                            <a href="memberpage_petview?p_id=${pet.p_id }&pageNum=${pageNum}">
                                                <img src="/images/petdefault.png" width="250" height="250">
                                            </a>
                                        </c:if>
                                        <div class="card-body">
                                            <h4 class="card-title">${pet.animal }</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                </c:if>
                <a href="memberpage_petadd">
                    <img src="./images/add.png" width="50" height="50">
                </a>
            </div>
        </div>
    </main>

</body>
</html>
