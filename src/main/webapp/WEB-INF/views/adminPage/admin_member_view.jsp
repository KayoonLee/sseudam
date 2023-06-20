<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>admin_member_view</title>


</head>
<body>

<table id="example" class="table is-striped" style="width:100%">
    <tr>
        <h3> ${memberDto.name} 님의 동물목록</h3>
    </tr>
    <tr>
        <th>동물이름</th>
        <th>강아지/고양이</th>
        <th>품종</th>
        <th>중성화여부</th>
        <th>생일</th>
        <th>성별</th>
    </tr>
    <c:forEach var="pet" items="${pet}">
        <tr>
            <td>${pet.animal}</td>
            <c:if test="${pet.kind == 'c'}">
                <td>고양이</td>
            </c:if>
            <c:if test="${pet.kind == 'd'}">
                <td>강아지</td>
            </c:if>
            <td>${pet.breed}</td>
            <c:if test="${pet.neutering ==0}">
                <td>NOT</td>
            </c:if>
            <c:if test="${pet.neutering ==1}">
                <td>YES</td>
            </c:if>
            <td>${pet.birth}</td>
            <c:if test="${pet.gender==0}">
                <td>암컷</td>
            </c:if>
            <c:if test="${pet.gender==1}">
                <td>수컷</td>
            </c:if>
                <%--<td rowspan="4">${pet.profile}</td>--%>         <!--동물리스트를 띄우는건데 필요?-->
        </tr>
    </c:forEach>
</table>

<!-- ===============수정중=================== -->

<!-- ===============수정중=================== -->

</body>
</html>