<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%-- 유효성 검사 세욱--%>
    <script src="./js/free.js"></script>

    <script>


        $(document).ready(function() {
            $.ajax({
                url: "noteRecentList",
                type: "post",
                success: function(response) {
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
                $.each(unreadNotes, function(index, note) {
                    var noteItem = $("<li></li>");
                    var noteLink = $("<a></a>")
                        .text(note.subject)
                        .attr("href", "javascript:void(0);") // 클릭 이벤트 핸들러를 위해 href를 설정합니다.
                        .click(function() {
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
                data: { note_num: note_num },
                success: function(response) {
                    location.href = "noteView?note_num=" + note_num;
                }
            });
        }

    </script>
</head>
<body>
<header id="header" class="header fixed-top d-flex align-items-center">


    <div class="d-flex align-items-center justify-content-between">
        <a href="main_page" class="logo d-flex align-items-center">
            <img src="images/muzik5.jpg" alt="">
            <span class="d-none d-lg-block">쓰담</span>
        </a>
    </div>

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">
            <li class="nav-item dropdown">
                <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                </a><!-- End Notification Icon -->
            </li><!-- End Notification Nav -->

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

                            <!-- 알림2 -->
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-exclamation-circle text-warning"></i>
                                <div>
                                    <ul id="unreadNotesList"></ul>
                                </div>
                            </li>

                            <%-- 알림창 맨 밑 --%>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li class="dropdown-footer">
                                <a href="noteReceiveList">쪽지함 확인하기</a>
                            </li>

                        </ul><!-- End Notification Dropdown Items -->
                    </li><!-- End Notification Nav -->
                </ul>
            </nav><!-- End Icons Navigation -->


            <li class="nav-item">
                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="logout" >
                    <span class="d-none d-md-block ">로그아웃</span> &nbsp;&nbsp;&nbsp;
                </a><!-- End Profile Iamge Icon -->
            </li><!-- End Profile Nav -->
        </ul>
    </nav><!-- End Icons Navigation -->
</header>
</body>
</html>