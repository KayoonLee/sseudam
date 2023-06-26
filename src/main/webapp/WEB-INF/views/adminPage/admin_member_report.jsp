<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header/header.jsp" %>

<html>
<head>
    <title>Member Report</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/admin_header.jsp" %>

    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>

    <script>
        function reportView(m_id, num, board_num) {
            $.ajax({
                url: "adminReportView",
                data: {m_id: m_id, num: num, board_num: board_num},
                success: function (response) {
                    $("#adminReportView").html(response);
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
        <h1>신고받은 회원관리</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">신고받은 회원관리</a></li>
                <%-- adminMemberReport --%>
                <%--<li class="breadcrumb-item">신고받은 회원관리</li>--%>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="card">
        <div class="card-body">
            <div class="card-title" align="center">신고받은 회원 리스트</div>
            <table id="example" class="table is-striped" style="width:100%">
                <thead>
                <tr>
                    <th>신고한 유저</th>
                    <th>글 제목</th>
                    <th>신고사유</th>
                    <th>신고일</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${report_list}">
                    <c:set var="m_id" value="${list.m_id}"/>
                    <tr onclick="reportView(${m_id}, ${list.num}, ${list.board_num})">
                        <td><img src="${list.profile_name}" alt="프로필">${list.nick}</td>
                        <td>${list.subject}</td>
                        <c:if test="${list.report_issue == 1}">
                            <td>주제에 맞지 않는 글</td>
                        </c:if>
                        <c:if test="${list.report_issue == 2}">
                            <td>과도한 욕설</td>
                        </c:if>
                        <c:if test="${list.report_issue == 3}">
                            <td>광고성 글</td>
                        </c:if>
                        <c:if test="${list.report_issue == 4}">
                            <td>음란물</td>
                        </c:if>
                        <c:if test="${list.report_issue == 5}">
                            <td>개인정보 노출</td>
                        </c:if>
                        <c:if test="${list.report_issue == 6}">
                            <td>기타</td>
                        </c:if>
                        <td><fmt:formatDate value="${list.report_date}"
                                            pattern="yyyy-MM-dd"/></td>
                            <c:if test="${list.state == 1}">
                        <td>미삭제</td>
                        </c:if>
                        <c:if test="${list.state == 0}">
                            <td>삭제</td>
                        </c:if>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <hr>

    <div id="adminReportView"></div>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="../navigator_footer/admin_footer.jsp" %>

</body>
</html>