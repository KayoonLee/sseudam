<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">

        <%--나의 프로필--%>
        <li class="nav-heading">Profile</li>

    <li class="nav-item">
         <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="memberpage_main">
             <i class="bi bi-layout-text-window-reverse"></i>
             <span>나의 프로필</span>
             <i class="bi bi-chevron-down ms-auto"></i>
            </a>
      <ul id="components-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
         <li>
             <a href="memberpage_main">
               <i class="bi bi-circle"></i><span>나의 프로필 수정</span>
             </a>
         </li>
         <li>
             <a href="memberpage_pwUpdateForm">
               <i class="bi bi-circle"></i><span>비밀번호 변경</span>
             </a>
         </li>
       </ul>
    </li>

    <%-- 동물페이지 --%>
    <li class="nav-heading">PET</li>

       <li class="nav-item">
            <a class="nav-link collapsed" href="memberpage_mypet">
                <i class="bi bi-balloon"></i><span>동물페이지</span>
            </a>
      </li>


    <%-- 나의 활동 내역 --%>
    <li class="nav-heading">History</li>

            <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#history-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>나의 활동내역</span>
                <i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="history-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="memberpage_mypost">
                        <i class="bi bi-circle"></i>
                        <span>내가 쓴 글</span>
                    </a>
                </li>
                <li>
                    <a href="memberpage_myreply">
                        <i class="bi bi-circle"></i>
                        <span>내가 쓴 댓글</span>
                    </a>
                </li>
                <li>
                    <a href="memberpage_mylike">
                        <i class="bi bi-circle"></i><span>내가 추천한 글</span>
                    </a>
                </li>

            </ul>
        </li>

         <%-- 상담신청목록--%>
        <li class="nav-heading">Application</li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="memberpage_mypaper">
                <i class="bi bi-grid"></i>
                <span>상담신청내역</span>
            </a>
        </li>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link collapsed" href="noteInsertForm">--%>
<%--                <i class="bi bi-grid"></i>--%>
<%--                <span>쪽지 작성하기</span>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link collapsed" href="noteList">--%>
<%--                <i class="bi bi-grid"></i>--%>
<%--                <span>쪽지 확인하기</span>--%>
<%--            </a>--%>
<%--        </li>--%>

<li class="nav-heading">Message</li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#msg-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>나의 쪽지함</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="msg-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="noteInsertForm">
                        <i class="bi bi-circle"></i><span>쪽지 작성하기</span>
                    </a>
                </li>
                <li>
                    <a href="noteList">
                        <i class="bi bi-circle"></i><span>내가 쓴 쪽지함</span>
                    </a>
                </li>
                <li>
                    <a href="noteReceiveList">
                        <i class="bi bi-circle"></i><span>받은 쪽지함</span>
                    </a>
                </li>
            </ul>
        </li>

    </ul>
</aside>
</body>
</html>