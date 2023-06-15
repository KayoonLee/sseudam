<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Member Page</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/admin_header.jsp" %>

    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>
    <script>
        function loadMemberPage(m_id) {
            $.ajax({
                url: "adminViewPage",
                data: {m_id: m_id},
                success: function (response) {
                    $("#adminResultView").html(response);
                }
            });
        }
    </script>

</head>
<body>

<!-- ======= Header ======= -->
<!-- ======= Sidebar ======= -->

<%--<main id="main" class="main">--%>

<div class="pagetitle">
    <h1>일반회원</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="adminMemberPage">일반회원</a></li>
            <%--<li class="breadcrumb-item active">하위페이지</li>--%>
        </ol>
    </nav>
</div><!-- End Page Title -->

<table id="example" class="table is-striped" style="width:100%">
    <tbody>
    <c:if test="${not empty admin_list}">
        <c:forEach var="member" items="${admin_list}">
            <tr>
                <c:set var="m_id" value="${member.m_id}" />     <!--id = memberView 값 넘겨주기-->

                <td>${member.m_id}</td>
                <td>
                    <button type="button" id="memberView" onclick="loadMemberPage(${m_id})">${member.name}</button>
                </td>
                <td>${member.email}</td>
                <td>${member.passwd}</td>
                <td>${member.nick}</td>
                <td>${member.birth}</td>
                <td>${member.tel}</td>
                <!-- identifier 회원 구분코드 -->
                <c:if test="${member.identifier == '1'}">
                    <td>일반회원</td>
                </c:if>
                <c:if test="${member.identifier == '2'}">
                    <td>상담사</td>
                </c:if>
                <c:if test="${member.identifier == '3'}">
                    <td>승인 대기</td>
                </c:if>
                <c:if test="${member.identifier != '1' and  member.identifier != '2' and member.identifier != '3'}">
                    <td>Bug</td>
                </c:if>
                <!-- 탈퇴회원 구분여부-->
                <c:if test="${member.state == 1}">
                    <td>활동</td>
                </c:if>
                <c:if test="${member.state == 0}">
                    <td>탈퇴</td>
                </c:if>
                <td>${member.join_date}</td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
    <thead>
    <tr>
        <th>번호</th>
        <th>이름</th>
        <th>이메일</th>
        <th>비밀번호</th>
        <th>닉네임</th>
        <th>생일</th>
        <th>전화번호</th>
        <th>회원</th>
        <th>상태</th>
        <th>가입날짜</th>
    </tr>
    </thead>
    <tfoot>
    <tr>
        <th>번호</th>
        <th>이름</th>
        <th>이메일</th>
        <th>비밀번호</th>
        <th>닉네임</th>
        <th>생일</th>
        <th>전화번호</th>
        <th>회원</th>
        <th>상태</th>
        <th>가입날짜</th>
    </tr>
    </tfoot>
</table>

<br><br>
<hr>
<!-- 상세페이지 출력 -->
<div id="adminResultView">
</div>

<br><br>


<!-- ======= Footer ======= -->

</body>
</html>