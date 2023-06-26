<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" pageEncoding="UTF-8" %>

<%@ include file="../navigator_footer/member_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>보낸 쪽지 목록</title>

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>


    <!-- ======= Header ======= -->


    <style>
        .profile_image {
            width: 30px;
            height: 30px;
        }
    </style>

    <script>
        $(document).ready(function() {
            var popupX = (window.screen.width - 600) / 2;
            var popupY = (window.screen.height - 400) / 2;
            $(".note-link").on("click", function(e) {
                e.preventDefault();
                window.open(
                    $(this).attr("href"),
                    "받은쪽지함",
                    "resizeable=no, location=0, status=0, width=400, height=300, left=" +
                    popupX +
                    ", top=" +
                    popupY
                );
            });
        });
    </script>



</head>
<body>
<div>
    <%@ include file="../navigator_footer/counselor_navigator.jsp" %>

    <!-- ======= Sidebar ======= -->
    <%@ include file="../navigator_footer/member_sidebar.jsp" %>

    <div class="card" style="margin-top: 50px; margin-right: 200px; margin-bottom: 50px; margin-left: 330px">

        <div class="card-body">
            <h6 class="card-title">보낸 쪽지 리스트</h6>
        <table class="table table-hover">
            <tr>
                <td>받는 사람</td>
                <td>제목</td>
                <td>날짜</td>
                <td>읽기 여부</td>
            </tr>
            <c:if test="${empty note_list}">
                <tr>
                    <td colspan="4">쪽지가 없습니다</td>
                </tr>
            </c:if>
            <c:if test="${not empty note_list}">
                <c:forEach var="list" items="${note_list}">
                    <tr>
                        <td><img class="profile_image" src="./memberImg/${list.profile_name}"
                        >${list.receiver}</td>
                        <td><a href="noteView?note_num=${list.note_num}" class="note-link">${list.subject}</a></td>
                        <td><fmt:formatDate value="${list.time }"
                                            pattern="yyyy-MM-dd HH시mm분"/>
                        <td><c:if test="${list.checking == 1}">미확인</c:if>
                        <c:if test="${list.checking == 0}">확인</c:if></td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
    </div>
</div>


</body>
</html>
