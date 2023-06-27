<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Admin_Cat_View</title>

    <script>
        // 고양이 상태값 변경
        function adminCatStateChange(p_id, state) {
            if (state == '1') {
                var text = "이 고양이를 삭제하시겠습니까?";
            } else if (state == '0') {
                var text = "이 고양이를 다시 복원시키겠습니까?";
            }
            if (confirm(text)) {
                $.ajax({
                    url: "adminCatState",
                    data: {p_id: p_id, state: state},
                    success: function (response) {
                        if (response == 1) {
                            alert("고양이 회원의 상태값이 변경되었습니다.");
                            loadCatPage(p_id);
                        } else {
                            alert("오류 발생! 다시 시도해주세요.");
                        }
                    }
                });
            }
        }
    </script>
</head>
<body>

<div class="pagetitle">
    <h1>고양이</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">반려동물</a></li>
            <%-- adminCatPage --%>
            <li class="breadcrumb-item">하위페이지</li>
        </ol>
    </nav>
</div><%-- End Page Title --%>

<div class="card">
    <div class="card-body">
        <table id="example2" class="table is-striped" style="width:100%">

            <tr>
                <h5 class="card-title">회원 ${pet.g_id}번 / ${memberDto.name}님의 동물</h5>
            </tr>
            <tr>
                <th>품종</th>
                <th>특이사항</th>
                <th>중성화여부</th>
                <th>상태값</th>
            </tr>
            <tr>
                <td>${pet.breed}</td>
                <td>${pet.feature}</td>
                <%--<td>${pet.neutering}</td>--%>
                <%-- neutering(중성화) --%>
                <c:if test="${pet.neutering == 0}">
                    <td>중성화x</td>
                </c:if>
                <c:if test="${pet.neutering == 1}">
                    <td>중성화o</td>
                </c:if>
                <c:if test="${pet.state == 1}">
                    <td>탈퇴</td>
                </c:if>
                <c:if test="${pet.state == 0}">
                    <td>활동중</td>
                </c:if>
            </tr>
        </table>

        <!-- 고양이 삭제/복구-->
        <c:if test="${pet.state == 1}">
            <button type="button" class="btn btn-outline-primary"
                    onclick="adminCatStateChange(${pet.p_id}, ${pet.state})">복원</button>
        </c:if>

        <c:if test="${pet.state == 0}">
            <button type="button" class="btn btn-outline-danger"
                    onclick="adminCatStateChange(${pet.p_id}, ${pet.state})">삭제</button>
        </c:if>

    </div>
</div>

</body>
</html>
