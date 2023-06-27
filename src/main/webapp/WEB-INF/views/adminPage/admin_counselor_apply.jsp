<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header/header.jsp" %>

<html>
<head>
    <title>counselor Page</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/admin_header.jsp" %>

    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>
    <script>
        function loadCounselorPage(m_id) {
            $.ajax({
                url: "adminCounselorView",
                data: {m_id: m_id},
                success: function (response) {
                    $("#adminResultView").html(response);
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
        <h1>상담사 신청관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admincounselorPage">상담사</a></li>
                <li class="breadcrumb-item">상담사 신청관리</li>
            </ol>
        </nav>
    </div>
    <%-- End Page Title --%>

    <div class="card">
        <div class="card-body">
            <div class="card-title" align="center">상담사 리스트</div>
            <table id="example" class="table is-striped" style="width:100%">
                <tbody>
                <c:if test="${empty apply_list}">

                </c:if>
                <c:if test="${not empty apply_list}">
                    <c:forEach var="counselor" items="${apply_list}">
                        <c:set var="m_id" value="${counselor.m_id}"/> <!--id = counselorView 값 넘겨주기-->
                        <tr id="counselorView" onclick="loadCounselorPage(${m_id})"> <!-- onClick 으로 조회하는거 걸기 -->
                            <td>${counselor.row_num}</td>
                            <td>${counselor.m_id}</td>
                            <td>${counselor.name}</td>
                            <td>${counselor.email}</td>
                            <td>${counselor.nick}</td>
                            <!-- identifier 회원 구분코드 -->
                            <c:if test="${counselor.identifier == '1'}">
                                <td>일반회원</td>
                            </c:if>
                            <c:if test="${counselor.identifier == '2'}">
                                <td>상담사</td>
                            </c:if>
                            <c:if test="${counselor.identifier == '3'}">
                                <td>승인 대기</td>
                            </c:if>
                            <c:if test="${counselor.identifier != '1' and  counselor.identifier != '2' and counselor.identifier != '3'}">
                                <td>Bug</td>
                            </c:if>
                            <c:if test="${counselor.state == 0}">
                                <td>탈퇴</td>
                            </c:if>
                            <td>${counselor.join_date}</td>
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
                    <th>회원</th>
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
                    <th>회원</th>
                    <th>가입날짜</th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <hr>

    <!-- 상세페이지 출력 -->

    <ul>
        <li>
            <div id="adminResultView"></div>
        </li>
<%--        <li>
            <div id="z"></div>
        </li>--%>
    </ul>
    <br>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="../navigator_footer/admin_footer.jsp" %>

</body>
</html>