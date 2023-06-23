<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

</head>
<body>
<aside id="sidebar" class="sidebar">
        <ul class="sidebar-nav" id="sidebar-nav">

            <li class="nav-item">
                <a class="nav-link" data-bs-target="#components-nav" data-bs-toggle="collapse" href="counselorpage_main">
                  <i class="bi bi-menu-button-wide"></i><span>나의 프로필</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
              <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                 <li>
                   <a href="counselorpage_main">
                      <i class="bi bi-circle"></i><span>나의 프로필 수정</span>
                   </a>
                 </li>
                 <li>
                   <a href="counselorpage_PwUpdateForm" >
                      <i class="bi bi-circle"></i><span>비밀번호 변경</span>
                   </a>
                 </li>
              </ul>
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
                        <a href="counselorpage_mypost" >
                            <i class="bi bi-circle"></i><span>내가 쓴 글</span>
                        </a>
                    </li>
                    <li>
                        <a href="counselorpage_myreply" >
                            <i class="bi bi-circle"></i><span>내가 쓴 댓글</span>
                        </a>
                    </li>
                    <li>
                        <a href="counselorpage_mylike" >
                            <i class="bi bi-circle"></i><span>내가 좋아요한 글</span>
                        </a>
                    </li>
                </ul>
            </li><!-- End Components Nav -->
        </ul>
    </aside>
</body>
</html>