<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>보낸 쪽지 목록</title>

    <!-- Image CSS -->
    <link rel="stylesheet" href="css/image_image.css">
    <style>
        .profile_image {
            width: 30px;
            height: 30px;
        }
    </style>

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <script>
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
<div>
    <div>
        <table>
            <tr>
                <td>보낸 사람</td>
                <td>제목</td>
                <td>날짜</td>
                <td>읽기 여부</td>
            </tr>
            <c:if test="${empty note_list}">
                <tr>
                    <td colspan="4">받은 쪽지가 없습니다</td>
                </tr>
            </c:if>
            <c:if test="${not empty note_list}">
                <c:forEach var="list" items="${note_list}">
                    <tr onclick="changeState(${list.note_num})">
                        <a href="#">
                            <td><img class="profile_image" src="./memberImg/${list.profile_name}">${list.nick}</td>
                            <td>${list.subject}</
                            ></td>
                            <td><fmt:formatDate value="${list.time }"
                                                pattern="yyyy-MM-dd HH시mm분"/>
                            <td><c:if test="${list.checking == 1}">미확인</c:if>
                                <c:if test="${list.checking == 0}">확인</c:if></td>
                        </a>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
    </div>
</div>


</body>
</html>
