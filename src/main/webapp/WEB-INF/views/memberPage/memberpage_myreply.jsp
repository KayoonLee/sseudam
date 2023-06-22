<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2023-06-11
  Time: 오후 5:13
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

</header><!-- End Header -->

<!-- ======= Sidebar ======= -->

 <aside id="sidebar" class="sidebar">
     <ul class="sidebar-nav" id="sidebar-nav">
         <li class="nav-item">
             <a class="nav-link " href="memberpage_main">
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
      <div class="pagetitle">
          <h1>내가 쓴 댓글</h1>
      </div><!-- End Page Title -->
      <br>
      <div class="card">
          <div class="card-body">
              <br>
              <table id="example" class="table is-striped" style="width:100%">
                  <thead>
                  <tr>
                      <th>구분</th>
                      <th>게시글 제목</th>
                      <th>작성자</th>
                      <th>조회수</th>
                      <th>추천수</th>
                      <th>작성일</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:if test="${empty myreplyList}">
                      <tr>
                          <td>내가 쓴 댓글이 없습니다.</td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                      </tr>
                  </c:if>
                  <c:forEach var="board" items="${myreplyList}">
                      <tr>
                          <td>
                              <c:if test="${board.category == '1'}">자유</c:if>
                              <c:if test="${board.category == '2'}">질문</c:if>
                              <c:if test="${board.category == '3'}">토론</c:if>
                          </td>
                          <td>${board.subject}</td>
                          <td>${board.nick}</td>
                          <td>${board.readcount}</td>
                          <td>${board.recom}</td>
                          <td><fmt:formatDate value="${board.reg_date}"
                                              pattern="yyyy년 MM월 dd일"/></td>
                      </tr>
                  </c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                      <th>구분</th>
                      <th>게시글 제목</th>
                      <th>작성자</th>
                      <th>조회수</th>
                      <th>추천수</th>
                      <th>작성일</th>
                  </tr>
                  </tfoot>
              </table>
          </div>
      </div>
  </main>
</body>
</html>

