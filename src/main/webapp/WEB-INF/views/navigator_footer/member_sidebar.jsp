<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-item">
            <a class="nav-link" data-bs-target="#components-nav" data-bs-toggle="collapse" href="memberpage_main">
                <i class="bi bi-menu-button-wide"></i>
                <span>나의 프로필</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
    <ul id="components-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
         <li>
             <a href="memberpage_pwUpdateForm">
               <i class="bi bi-circle"></i><span>비밀번호 변경</span>
             </a>
         </li>
    </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="memberpage_mypet">
                <i class="bi bi-balloon"></i><span>동물페이지</span>
            </a>

        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
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
</body>
</html>