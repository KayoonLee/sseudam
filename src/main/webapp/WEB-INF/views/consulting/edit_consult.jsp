
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상담 예약서</title>
</head>


<body>
<h1>상담 예약서(수정)</h1>

<form action="update_Consult" method="POST">
    <!--수정하고 상세페이지 보여주기 위한 paper_num hidden  -->
    <input type="hidden" name="old_paper_num" value="${counselpaper.paper_num}">
    <label for="con_name">상담사이름:</label>
    <input type="text" id="con_name" name="con_name" value = "${counselor.name}" readonly>
    <input type="hidden" name="c_id" value="${counselor.m_id}">
    <br>
    <label for="name">회원 이름:</label>
    <input type="text" id="name" name="name" value="${member.name}" readonly>
    <input type="hidden" name="g_id" value="${member.m_id}">
    <br>
    <label for="p_id">동물 이름:</label>
    <select id="p_id" name="p_id" required>
        <option value="">반려동물 선택</option>
        <c:forEach var="p_name" items="${pet_list}">
            <option value="${p_name.p_id}" <c:if test ="${pet.animal eq p_name.animal}">selected="selected"</c:if> >${p_name.animal}</option>
        </c:forEach>
    </select> <br><br>
    <label for="request_times">날짜 및 시간 선택:</label>
    <input type="datetime-local" id="request_times" name="request_times" required><br>
    <label for="purpose">상담목적:</label>
    <select id="purpose" name="purpose" required>
        <option value="">상담목적을 선택하세요</option>
        <option value="반려동물상담">반려동물상담</option>
        <option value="기타">기타</option>

    </select> <br><br>
    <label for="reason">상담 사유:</label>
    <textarea id="reason" name="reason" rows="5" cols="50" maxlength="2000" required></textarea>
    <br>
    <label for="wish_list">요청사항:</label>
    <textarea id="wish_list" name="wish_list" rows="5" cols="50" maxlength="2000" required></textarea>
    <br>
    <button type="submit">상담 수정하기</button>
</form>
</body>
</html>