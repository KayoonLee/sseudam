<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>CatList</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/admin_header.jsp" %>

    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>

    <script>
        function loadCatPage(p_id) {
            $.ajax({
                url: "adminCatViewPage",
                data: {p_id: p_id},
                success: function (response) {
                    $("#adminCatResultView").html(response);
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
        <h1>고양이</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">반려동물</a></li>
                <%-- adminCatPage --%>
                <li class="breadcrumb-item">고양이</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="card">
        <div class="card-body">
            <div class="card-title" align="center">고양이 리스트</div>
            <table id="example" class="table is-striped" style="width:100%">
                <thead>
                <tr>
                    <th></th>           <!--정렬용 -->
                    <th>회원번호</th>
                    <th>동물번호</th>
                    <th>동물이름</th>
                    <th>생일</th>
                    <th>성별</th>
                    <%--<th>중성화여부</th>--%>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty cat_list}">
                    <c:forEach var="cat" items="${cat_list}">
                        <c:set var="p_id" value="${cat.p_id}"/>
                        <%--<c:set var="g_id" value="${cat.g_id}"/>--%>
                        <tr id="catView"
                            onclick="loadCatPage(${p_id})"> <%-- onClick 으로 조회하는 방법으로 하기(<a>태그로 감싸도 되고 안감싸도 됨) --%>
                            <td>${cat.row_num}</td>
                            <td>${cat.g_id}</td>
                            <td>${cat.p_id}</td>
                            <td>${cat.animal}</td>
                            <td>${cat.birth}</td>
                            <c:if test="${cat.gender == 1}">
                                <td>Male</td>
                            </c:if>
                            <c:if test="${cat.gender == 0}">
                                <td>Female</td>
                            </c:if>
                            <%-- neutering(중성화) --%>
<%--
                            <c:if test="${cat.neutering == 0}">
                                <td>중성화x</td>
                            </c:if>
                            <c:if test="${cat.neutering == 1}">
                                <td>중성화o</td>
                            </c:if>
--%>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
                <tfoot>
                <tr>
                    <th></th>
                    <th>회원번호</th>
                    <th>동물번호</th>
                    <th>동물이름</th>
                    <th>생일</th>
                    <th>성별</th>
                    <%--<th>중성화여부</th>--%>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <hr>

    <%-- Cat 상세페이지 출력 --%>
    <div id="adminCatResultView"></div>
    <br><br>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="../navigator_footer/admin_footer.jsp" %>

</body>
</html>
