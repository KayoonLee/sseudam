<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

   <%@ include file="../navigator_footer/member_header.jsp" %>

    <style>
        .profile_image {
            width: 30px;
            height: 30px;
        }
    </style>

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
    <!-- ======= Navigator ======= -->
  <%@ include file="../navigator_footer/counselor_navigator.jsp" %>

    <!-- ======= Sidebar ======= -->
    <%@ include file="../navigator_footer/member_sidebar.jsp" %>

    <div class="card" style="margin-top: 50px; margin-right: 200px; margin-bottom: 50px; margin-left: 330px">

        <div class="card-body">
            <h6 class="card-title" align="center">받은 쪽지 리스트</h6>
            <table class="table table-hover">
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
