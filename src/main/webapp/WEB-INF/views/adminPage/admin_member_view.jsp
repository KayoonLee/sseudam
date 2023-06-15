<%--
  Created by IntelliJ IDEA.
  User: E470
  Date: 2023-06-13
  Time: 오후 7:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin_member_view</title>
</head>
<body>
<!-- ===============수정중=================== -->
<table id="example" class="table is-striped" style="width:100%">
    <input type = "hidden" name="m_id" value="${memberDto.m_id}">
    <input type = "hidden" name="g_id" value="${pet.g_id}">

    <thead>
    <tr>
        <pre><th>회원번호</th>     <td>${memberDto.m_id}</td></pre>
    </tr>
    <tr>
        <th>이름</th>
        <th>이메일</th>
        <th>비밀번호</th>
    </tr>
        <th>닉네임</th>
        <th>생일</th>
        <th>전화번호</th>
        <th>회원</th>
        <th>상태</th>
        <th>가입날짜</th>
    </tr>
    </thead>
    <tbody>

    <td>이름</td>
    <td>이메일</td>
    <td>비밀번호</td>
    <td>닉네임</td>
    <td>생일</td>
    <td>전화번호</td>
    <td>회원</td>
    <td>상태</td>
    <td>가입날짜</td>
    </tbody>
</table>
<!-- ===============수정중=================== -->

</body>
</html>
