<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Admin_Cat_View</title>
</head>
<body>

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

<table id="example2" class="table is-striped" style="width:100%">
    <thead>
    <tr>
        <th>회원번호</th>
        <th>동물번호</th>
        <th>동물이름</th>
        <th>생일</th>
        <th>성별</th>
        <th>중성화여부</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
    <tfoot>
    <tr>
        <th>회원번호</th>
        <th>동물번호</th>
        <th>동물이름</th>
        <th>생일</th>
        <th>성별</th>
        <th>중성화여부</th>
    </tr>
    </tfoot>
</table>

</body>
</html>
