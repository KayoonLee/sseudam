<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <%-- 유효성 검사 세욱--%>
    <script src="./js/free.js"></script>

    <script>
        // $(document).ready(function() {
        //     $.ajax({
        //         url: "countNote",
        //         type: "post",
        //         success: function(response) {
        //             showCountNote(response);
        //         }
        //     });
        // });
        //
        // function showCountNote(countNote) {
        //     var messageSpan = $("#unreadMessageContent");
        //     var countSpan = $("#unreadMessageCount");
        //     if (countNote === 0) {
        //         messageSpan.text("받은 쪽지가 없습니다");
        //     } else {
        //         messageSpan.text(countNote + "개의 미확인 쪽지가 있습니다.");
        //         countSpan.text(countNote);
        //     }
        // }

        $(document).ready(function () {
            $.ajax({
                url: "noteRecentList",
                type: "post",
                success: function (response) {
                    showUnreadNotes(response);
                }
            });
        });

        function showUnreadNotes(unreadNotes) {
            var messageSpan = $("#unreadMessageContent");
            var countSpan = $("#unreadMessageCount");

            if (unreadNotes.length === 0) {
                messageSpan.text("받은 쪽지가 없습니다");
            } else {
                messageSpan.text(unreadNotes.length + "개의 미확인 쪽지가 있습니다.");
                countSpan.text(unreadNotes.length);

                var notesList = $("<ul></ul>");
                $.each(unreadNotes, function (index, note) {
                    var noteItem = $("<li></li>");
                    var noteLink = $("<a></a>")
                        .text(note.subject)
                        .attr("href", "javascript:void(0);") // 클릭 이벤트 핸들러를 위해 href를 설정합니다.
                        .click(function () {
                            changeState(note.note_num); // 쪽지 확인 상태 변경 및 상세 페이지로 이동하는 함수를 호출합니다.
                        });
                    var nickItem = $("<p></p>").text(note.nick);

                    noteItem.append(noteLink);
                    noteItem.append(nickItem);

                    if (index !== unreadNotes.length - 1) {
                        noteItem.append("<hr>");
                    }
                    notesList.append(noteItem);
                });
                $("#unreadNotesList").html(notesList);
            }
        }

        function changeState(note_num) {
            $.ajax({
                type: "post",
                url: "changeChecking",
                data: {note_num: note_num},
                success: function (response) {
                    location.href = "noteView?note_num=" + note_num;
                }
            });
        }

    </script>

</head>

<body>
<!--::header start::-->
<header class="main_menu">
    <div class="sub_menu">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-12 col-md-6">
                    <div class="sub_menu_right_content">

                        <span>Welcome To SSEUDAM</span>


                    </div>
                </div>
                <div class="col-lg-6 col-sm-12 col-md-6">
                    <div class="sub_menu_social_icon">

                        <c:if test="${empty sessionScope.member.m_id and empty sessionScope.admin.a_email}">
                            <a href="separate_join">회원가입</a>
                            <a href="login_form">로그인</a>
                        </c:if>

                        <c:if test="${!empty sessionScope.member.m_id or !empty sessionScope.admin.a_email}">
                            <a href="logout">로그아웃</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main_menu_iner">
        <div class="container">
            <div class="row align-items-center ">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                        <!--로고-->
                        <a class="navbar-brand" href="main_page"> <img src="./images/mainlogo.png" width=100 height=50>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item justify-content-center"
                             id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <!--상단 메뉴 카테고리-->
                                <li class="nav-item">
                                    <a class="nav-link" href="main_page">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="intro_counsel">쓰담쓰담이란</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="counsel_list">상담사 소개</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" onclick="select_counselor(${member.identifier})"
                                       href="#">상담신청</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="freeList?num=2" id="navbarDropdown"
                                       role="button" data-toggle="dropdown" aria-haspopup="true"
                                       aria-expanded="false">
                                        커뮤니티
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="freeList?num=2&category=1">자유게시판</a>
                                        <a class="dropdown-item" href="freeList?num=2&category=2">질문게시판</a>
                                        <a class="dropdown-item" href="freeList?num=2&category=3">토론게시판</a>
                                    </div>
                                </li>
                                <c:if test="${!empty sessionScope.member.m_id or !empty sessionScope.admin.a_email}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
                                           role="button" data-toggle="dropdown" aria-haspopup="true"
                                           aria-expanded="false">
                                            My Page
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1" href="#">

                                            <c:if test="${sessionScope.member.identifier == 1}">
                                                <a class="dropdown-item" href="memberpage_main">일반회원 마이페이지</a>
                                            </c:if>
                                            <c:if test="${sessionScope.member.identifier == 2}">
                                                <a class="dropdown-item" href="counselorpage_main">상담사 마이페이지</a>
                                            </c:if>
                                            <c:if test="${!empty sessionScope.admin.a_email}">
                                                <a class="dropdown-item" href="adminMain">관리자 페이지</a>
                                            </c:if>
                                        </div>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <c:if test="${!empty sessionScope.member.m_id or !empty sessionScope.admin.a_email}">
                            <%-- 알림창 --%>
                            <nav class="header-nav ms-auto">
                                <ul class="d-flex align-items-center">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                                            <i class="bi bi-bell"></i>
                                            <span class="badge bg-primary badge-number" id="unreadMessageCount"></span>
                                        </a><!-- End Notification Icon -->

                                            <%-- 알림 시작 --%>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                                            <li class="dropdown-header">
                                                <span id="unreadMessageContent"></span>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li class="notification-item">
                                                <i class="bi bi-exclamation-circle text-warning"></i>
                                                <div>
                                                    <ul id="unreadNotesList"></ul>
                                                </div>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li class="dropdown-footer">
                                                <a href="noteReceiveList">쪽지함 확인하기</a>
                                            </li>

                                        </ul><!-- End Notification Dropdown Items -->
                                    </li><!-- End Notification Nav -->
                                </ul>
                            </nav>
                            <!-- End Icons Navigation -->
                        </c:if>
                        <c:if test="${!empty member.m_id}">
                            <a href="#" class="btn_1 d-none d-lg-block">${member.nick} 님</a>
                        </c:if>
                        <c:if test="${!empty sessionScope.admin.a_email}">
                            <a href="#" class="btn_1 d-none d-lg-block">${sessionScope.admin.name} 님</a>
                        </c:if>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- header part(헤더 끝) end-->

</body>
</html>