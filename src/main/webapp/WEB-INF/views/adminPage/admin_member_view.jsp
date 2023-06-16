<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: E470
  Date: 2023-06-13
  Time: 오후 7:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin_member_view</title>
</head>
<body>
<!-- ===============수정중=================== -->
<table id="example" class="table is-striped" style="width:100%">
    <tr>
        <th>회원이름</th>   <td colspan="3">${memberDto.name}</td> <td rowspan="4">${pet.profile}</td>
    </tr>
    <tr>
        <th>동물이름</th><td>${pet.animal}</td>
        <th>강아지/고양이</th><td>${pet.kind}</td>
    </tr>
    <tr>
    <th>품종</th>   <td>${pet.breed}</td>
        <c:if test="${pet.neutering ==0}">
            <th>중성화여부</th><td>NOT</td>
        </c:if>
        <c:if test="${pet.neutering ==1}">
            <th>중성화여부</th><td>YES</td>
        </c:if>
    </tr>

    <tr>
        <th>생일</th><td>${pet.birth}</td>
        <c:if test="${pet.gender==0}">
        <th>성별</th><td>남자</td>
        </c:if>
        <c:if test="${pet.gender==1}">
        <th>성별</th><td>여자</td>
        </c:if>
    </tr>

</table>
<!-- ===============수정중=================== -->

</body>
</html>
