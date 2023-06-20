<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

                    // 두 번째 AJAX 호출
                    $.ajax({
                        url: "adminDelete",
                        data: {m_id: m_id},
                        success: function (response) {
                            $("#adminDeleteView").html(response);
                        }
                    });
                }
            });
        }
    </script>
</head>
<body>

<!-- ======= Navigator ======= -->
<%@ include file="../navigator_footer/admin_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/admin_sidebar.jsp" %>

<main id="main" class="main">

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
                <input type="hidden" name="m_id" value="${m_id}">
                <tr id="memberView" onclick="loadMemberPage(${member.m_id})"> <!-- onClick 으로 조회하는거 걸기 -->
                    <td>${member.row_num}</td>
                    <td>${member.m_id}</td>
                    <td>${member.name}</td>
                    <td>${member.email}</td>
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
            <td></td>
            <th>회원번호</th>
            <th>이름</th>
            <th>이메일</th>
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
            <td></td>
            <th>회원번호</th>
            <th>이름</th>
            <th>이메일</th>
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
    <%--<div class="row">--%>
    <%--<div class="col-lg-6">--%>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"></h5>

            <!-- Default Tabs -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home"
                            type="button" onclick="loadMemberPage(${m_id})" role="tab" aria-controls="home"
                            aria-selected="true">동물목록
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile"
                            type="button" onclick="loadMemberPage(${m_id})" role="tab" aria-controls="profile"
                            aria-selected="false">회원정보
                    </button>
                </li>
            </ul>
            <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div id="adminResultView"></div>
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div id="adminDeleteView"></div>
                </div>
            </div><!-- End Default Tabs -->

        </div>
    </div>
    <%--</div>--%>
    <%--</div>--%>
    <!-- 상세페이지 출력 -->

    <br>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="../navigator_footer/admin_footer.jsp" %>

</body>
</html>