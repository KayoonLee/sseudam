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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

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
                        <h6>홍은희</h6>
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
                <a class="nav-link" href="memberpage_mypet">
                    <i class="bi bi-balloon"></i><span>동물페이지</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>나의 활동내역</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="memberPost">
                            <i class="bi bi-circle"></i><span>내가 쓴 글</span>
                        </a>
                    </li>
                    <li>
                        <a href="memberReply">
                            <i class="bi bi-circle"></i><span>내가 쓴 댓글</span>
                        </a>
                    </li>
                    <li>
                        <a href="memberLike">
                            <i class="bi bi-circle"></i><span>내가 좋아요한 글</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="bi bi-circle"></i><span>상담신청내역</span>
                        </a>
                    </li>
                </ul>
            </li><!-- End Components Nav -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="memberCounselor">
                    <i class="bi bi-grid"></i>
                    <span>즐겨찾는 상담사</span>
                </a>
            </li>

        </ul>
    </aside>

    <!-- 레시피 조의 레시피 리스트 형식-->
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
                                <div>
                                    <div class="card">
                                        <a href="memberpage_petview?p_id=${pet.p_id }&pageNum=${pageNum}">
                                            <img class="card-img-top" src="images/yang.jpg">
                                        </a>
                                        <td>${pet.profile}</td>
                                        <br>
                                        <td>${pet.animal}</td>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                </c:if>
            </div>

            <a href="memberpage_petadd">
                <img src="images/add.png" width="50" id="modal-image">
            </a>

            <div id="modal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <h2>반려동물추가폼</h2>
                    <form>
                        <div class="row mb-3">
                            <label for="profile" class="col-md-4 col-lg-3 col-form-label">반려동물 사진</label>
                            <div class="col-md-8 col-lg-9">
                                <img src="assets/img/profile-img.jpg" alt="Profile">
                                <div class="pt-2">
                                    <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="petName" class="col-md-4 col-lg-3 col-form-label">이름</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="petName" type="text" class="form-control" id="petName" value="">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="birth" class="col-md-4 col-lg-3 col-form-label">생일</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="birth" type="text" class="form-control" id="birth" value="">
                            </div>
                        </div>

                        <!-- 강아지 고양이 라디오 버튼-->
                        <div><input type="radio" name="kind" value="dog">강아지</div>
                        <div><input type="radio" name="kind" value="cat">고양이</div>

                        <div class="row mb-3">
                            <label for="about" class="col-md-4 col-lg-3 col-form-label">특이사항</label>
                            <div class="col-md-8 col-lg-9">
                                <textarea name="about" class="form-control" id="about" style="height: 100px"></textarea>
                            </div>
                        </div>

                        <!-- 성별 구분 라디오 버튼 -->
                        <div><input type="radio" name="sex" value="female">암컷</div>
                        <div><input type="radio" name="sex" value="male">수컷</div>


                        <!-- 중성화 체크 박스-->
                        <div><input type="checkbox" name="neutering" value="done">중성화</div>

                        <div class="row mb-3">
                            <label for="breed" class="col-md-4 col-lg-3 col-form-label">품종</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="breed" type="text" class="form-control" id="breed" value="">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Country" class="col-md-4 col-lg-3 col-form-label">Country</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="country" type="text" class="form-control" id="Country" value="">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="address" type="text" class="form-control" id="Address" value="">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                            <div class="col-md-8 col-lg-9">
                                <input name="phone" type="text" class="form-control" id="Phone" value="">
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">저장</button>
                        </div>
                        <!-- 글 작성 폼 요소들을 추가합니다. -->
                    </form>
                </div>
            </div>


        </div>

    </main>

</body>
</html>
