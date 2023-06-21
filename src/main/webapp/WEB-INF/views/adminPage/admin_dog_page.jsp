<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>DogList</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/admin_header.jsp" %>

    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>

    <script>
        function loadDogPage(p_id) {
            $.ajax({
                url: "adminDogViewPage",
                data: {p_id: p_id/*, g_id: g_id*/},
                success: function (response) {
                    $("#adminDogResultView").html(response);
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
        <h1>강아지</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">반려동물</a></li>
                <%-- adminDogPage --%>
                <li class="breadcrumb-item">강아지</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="card">
        <div class="card-body">
            <div class="card-title" align="center">강아지 리스트</div>
            <div class="datatable-top"></div>
            <table id="example" class="table is-striped" style="width:100%">
                <thead>
                <tr>
                    <th>회원번호</th>
                    <th>동물번호</th>
                    <th>동물이름</th>
                    <th>생일</th>
                    <th>성별</th>
                    <%--<th>중성화여부</th>--%>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty dog_list}">
                    <c:forEach var="dog" items="${dog_list}">
                        <c:set var="p_id" value="${dog.p_id}"/>
                        <%--<c:set var="g_id" value="${dog.g_id}"/>--%>
                        <tr id="dogView"
                            onclick="loadDogPage(${p_id})"> <%-- onClick 으로 조회하는 방법으로 하기(<a>태그로 감싸도 되고 안감싸도 됨) --%>
                            <td>${dog.g_id}</td>
                            <td>${dog.p_id}</td>
                            <td>${dog.animal}</td>
                            <td>${dog.birth}</td>
                            <c:if test="${dog.gender == 0}">
                                <td>Male</td>
                            </c:if>
                            <c:if test="${dog.gender == 1}">
                                <td>Female</td>
                            </c:if>
                            <%-- neutering(중성화) --%>
<%--
                            <c:if test="${dog.neutering == 0}">
                                <td>중성화x</td>
                            </c:if>
                            <c:if test="${dog.neutering == 1}">
                                <td>중성화o</td>
                            </c:if>
--%>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
                <tfoot>
                <tr>
                    <th>회원번호</th>
                    <th>동물번호</th>
                    <th>동물이름</th>
                    <th>생일</th>
                    <th>성별</th>
                    <%--<th>중성화여부</th>--%>
                </tr>
                </tfoot>
            </table>
        </div><%-- End Card --%>
    </div><%-- End CardBody --%>

    <hr>

    <%-- Dog 상세페이지 출력 --%>
    <div id="adminDogResultView"></div>
    <br><br>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="../navigator_footer/admin_footer.jsp" %>

</body>
</html>
