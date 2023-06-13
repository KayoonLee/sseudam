<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Member Page</title>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {
            $('table.display').DataTable();
        });
    </script>
    <style>
        div.dataTables_wrapper {
            margin-bottom: 3em;
        }
    </style>

</head>
<body>

<!-- ======= Header ======= -->
<jsp:include page="../navigator_footer/admin_navigator.jsp"></jsp:include>

<!-- ======= Sidebar ======= -->
<jsp:include page="../navigator_footer/admin_sidebar.jsp"></jsp:include>

<main id="main" class="main">

    <table id="" class="display" style="width:100%">
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
            <td>${member.identifier}</td>   <!-- 구분 코드 따라서 출력 바꿔주기 -->
            <td>${member.state}</td>
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

    <table id="" class="display" style="width:100%">
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
