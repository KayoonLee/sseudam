<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>CatList</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/admin_header.jsp" %>

    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>
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
                <li class="breadcrumb-item"><a href="#">반려동물</a></li> <%-- adminCatPage --%>
                <li class="breadcrumb-item">고양이</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

<%-- 품종/동물프사/특이사항 --%>
    <table id="example" class="table is-striped" style="width:100%">
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
        <%-- 고양이일 경우 출력 --%>
        <c:if test="${pet.kind == 'C'}">
            <c:forEach var="cat" items="${cat_list}"> <%-- Controller 의 List 에서 수정할 것 --%>
                <tr>
                    <td>${cat.g_id}</td>
                    <td>${cat.p_id}</td>
                    <td>${cat.animal}</td>
                    <td>${cat.birth}</td>
                    <td>${cat.gender}</td>
                    <td>${cat.neutering}</td>
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
            <th>중성화여부</th>
        </tr>
        </tfoot>
    </table>

    <br><br>
    <hr>
    <br><br>

    <div class="pagetitle">
        <h1>고양이</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">반려동물</a></li> <%-- adminCatPage --%>
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
            <td>Jena Gaines</td>
            <td>Office Manager</td>
            <td>London</td>
            <td>30</td>
            <td>$90,560</td>
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

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="../navigator_footer/admin_footer.jsp" %>

</body>
</html>
