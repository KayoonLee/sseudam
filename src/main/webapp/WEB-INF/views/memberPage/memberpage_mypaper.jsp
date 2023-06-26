<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>

    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>
    <%@ include file="../navigator_footer/member_header.jsp" %>

</head>
<body>
<!-- ======= Header ======= -->
<%@ include file="../navigator_footer/counselor_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/member_sidebar.jsp" %>


<main id="main" class="main">
    <div class="pagetitle">
        <h1>상담신청내역</h1>
    </div>
    <!-- End Page Title -->
    <br>
    <div class="card">
        <div class="card-body">
            <br>
            <table id="example" class="table is-striped" style="width:100%">
                <thead>
                <tr>
                    <th>반려동물</th>
                    <th>상담목적</th>
                    <th>신청날짜</th>
                    <th>상담요청시간</th>
                    <th>진행현황</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty mypaperList}">
                    <tr>
                        <td>상담신청 내역이 없습니다.</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </c:if>
                <c:forEach var="counsel_paper" items="${mypaperList}">
                    <input type="hidden" name="paper_num" value="${paper_num}">
                    <tr  onclick="location.href='get_Consult_Details?paper_num=${counsel_paper.paper_num}'">
                        <td>${counsel_paper.animal}</td>
                        <td>${counsel_paper.purpose}</td>
                        <td><fmt:formatDate value="${counsel_paper.application_date}"
                                            pattern="yyyy년 MM월 dd일"/></td>
                        <td><fmt:formatDate value="${counsel_paper.request_time}"
                                            pattern="HH시 mm분"/></td>
                        <td>
                            <c:if test="${counsel_paper.confirmed == '0'}">대기</c:if>
                            <c:if test="${counsel_paper.confirmed == '1'}">확정</c:if>
                            <c:if test="${counsel_paper.confirmed == '2'}">완료</c:if>
                            <c:if test="${counsel_paper.confirmed == '3'}">취소</c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                    <th>반려동물</th>
                    <th>상담목적</th>
                    <th>신청날짜</th>
                    <th>상담요청시간</th>
                    <th>진행현황</th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>

</main>


</body>
</html>


