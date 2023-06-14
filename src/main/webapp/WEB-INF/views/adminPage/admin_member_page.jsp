<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Member Page</title>

    <!-- ======= Table ======= -->
    <jsp:include page="../navigator_footer/admin_table.jsp"></jsp:include>

</head>
<body>

<!-- ======= Header ======= -->
<jsp:include page="../navigator_footer/admin_navigator.jsp"></jsp:include>

<!-- ======= Sidebar ======= -->
<jsp:include page="../navigator_footer/admin_sidebar.jsp"></jsp:include>

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
        <tbody>
        <c:if test="${not empty admin_list}">
            <c:forEach var="member" items="${admin_list}">
                <tr>
                    <td>${member.m_id}</td>
                    <td>${member.name}</td>
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
                        <td>전직 대기</td>
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
    <br><br>

    <div class="pagetitle">
        <h1>일반회원</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="adminMemberPage">일반회원</a></li>
                <li class="breadcrumb-item active">하위페이지</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <table id="example2" class="table is-striped" style="width:100%">
        <thead>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Age</th>
            <th>Salary</th>
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
        <tr>
            <td>Haley Kennedy</td>
            <td>Senior Marketing Designer</td>
            <td>London</td>
            <td>43</td>
            <td>$313,500</td>
        </tr>
        <tr>
            <td>Tatyana Fitzpatrick</td>
            <td>Regional Director</td>
            <td>London</td>
            <td>19</td>
            <td>$385,750</td>
        </tr>
        <tr>
            <td>Michael Silva</td>
            <td>Marketing Designer</td>
            <td>London</td>
            <td>66</td>
            <td>$198,500</td>
        </tr>
        <tr>
            <td>Bradley Greer</td>
            <td>Software Engineer</td>
            <td>London</td>
            <td>41</td>
            <td>$132,000</td>
        </tr>
        <tr>
            <td>Angelica Ramos</td>
            <td>Chief Executive Officer (CEO)</td>
            <td>London</td>
            <td>47</td>
            <td>$1,200,000</td>
        </tr>
        <tr>
            <td>Suki Burks</td>
            <td>Developer</td>
            <td>London</td>
            <td>53</td>
            <td>$114,500</td>
        </tr>
        <tr>
            <td>Prescott Bartlett</td>
            <td>Technical Author</td>
            <td>London</td>
            <td>27</td>
            <td>$145,000</td>
        </tr>
        <tr>
            <td>Timothy Mooney</td>
            <td>Office Manager</td>
            <td>London</td>
            <td>37</td>
            <td>$136,200</td>
        </tr>
        <tr>
            <td>Bruno Nash</td>
            <td>Software Engineer</td>
            <td>London</td>
            <td>38</td>
            <td>$163,500</td>
        </tr>
        <tr>
            <td>Hermione Butler</td>
            <td>Regional Director</td>
            <td>London</td>
            <td>47</td>
            <td>$356,250</td>
        </tr>
        <tr>
            <td>Lael Greer</td>
            <td>Systems Administrator</td>
            <td>London</td>
            <td>21</td>
            <td>$103,500</td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Age</th>
            <th>Salary</th>
        </tr>
        </tfoot>
    </table>

</main>

<!-- ======= Footer ======= -->
<jsp:include page="../navigator_footer/admin_footer.jsp"></jsp:include>

</body>
</html>