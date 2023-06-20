<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Admin_Cat_View</title>
</head>
<body>

<table id="example2" class="table is-striped" style="width:100%">

    <div class="pagetitle">
        <h1>고양이</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">반려동물</a></li>
                <%-- adminCatPage --%>
                <li class="breadcrumb-item">하위페이지</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <tr>
        <h3>회원 ${pet.g_id} 번의님의 동물</h3>
    </tr>
    <tr>
        <th>품종</th>
        <th>특이사항</th>
        <th>상태값</th>
    </tr>
    <tr>
        <td>${pet.breed}</td>
        <td>${pet.feature}</td>
        <c:if test="${pet.state == 1}">
            <td>탈퇴</td>
        </c:if>
        <c:if test="${pet.state == 0}">
            <td>활동중</td>
        </c:if>
    </tr>
</table>

</body>
</html>
