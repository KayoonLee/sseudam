<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin_member_del_view</title>
    <script>
        // 상태값 변경
        function adminSetState(m_id, state) {
            if (state == '1') {
                var text = "이 회원을 삭제하시겠습니까?";
            } else if (state == '0') {
                var text = "이 회원을 다시 복원시키겠습니까?";
            }
            if (confirm(text)) {
                $.ajax({
                    url: "adminDeleteBtn",
                    data: {m_id: m_id, state: state},
                    success: function (response) {
                        if (response == 1) {
                            alert("회원의 상태값이 변경되었습니다")
                            loadMemberPage(m_id);
                        } else {
                            alert("오류 발생. 다시 시도해주세요");
                        }
                    }
                });
            }
        }

        // 닉네임 변경
        function nickChange() {
            var nicktag = $("#nickTag");
            if (nicktag.css("display") == "none") {
                nicktag.css("display", "block");
            } else {
                nicktag.css("display", "none");
            }
        }

        function nickConfirm() {
            if ($("#nick").val() == "") {
                alert('변경될 닉네임을 작성하세요!');
                $("#nick").focus();
                return false;
            }
            var text = "해당 이름을 닉네임을 변경하시겠습니까?";
            if (confirm(text)) {
                var formData = $("#nick_frm").serialize();
                $.ajax({
                    type: "post",
                    url: "AdminNickChange",

                    data: formData,
                    success: function (response) {
                        if (response == 1) {
                            location.href = "adminMemberPage";
                        } else {
                            alert("오류 발생. 다시 시도해주세요");
                        }
                    }
                });
            }
        }

    </script>

    <style>
        #nickTag {
            display: none;
        }
    </style>
</head>
<body>

<table id="example" class="table is-striped" style="width:100%">
    <tr>
        <th>회원번호</th>
        <td>${memberDto.m_id}</td>
    </tr>
    <tr>
        <th>이름</th>
        <td>${memberDto.name}</td>
    </tr>
    <tr>
        <th>닉네임</th>
        <td>${memberDto.nick}</td>
    </tr>
    <tr>
        <th>이메일</th>
        <td>${memberDto.email}</td>
    </tr>
    <tr>
        <th>생일</th>
        <td>${memberDto.birth}</td>
    </tr>
    <tr>
        <th>전화번호</th>
        <td>${memberDto.tel}</td>
    </tr>

    <tr>
        <th>상태</th>
        <c:if test="${memberDto.state == 1}">
            <td>활동</td>
        </c:if>
        <c:if test="${memberDto.state == 0}">
            <td>탈퇴</td>
        </c:if>

    </tr>


</table>



<button type="button" class="btn btn-outline-secondary" onclick="nickChange()">닉네임 변경</button>

<div id="nickTag">
    <form id="nick_frm" method="" action="">
        <input type='hidden' name='m_id' value=${memberDto.m_id}>
        <input type="text" name="nick" id="nick">
        <button type="button" class="btn btn-outline-success" onclick="nickConfirm()">수정</button>
        <input type="reset" class="btn btn-outline-secondary" value="취소"/>
    </form>
</div>

<!-- 회원 삭제/복구-->
<c:if test="${memberDto.state == 1}">
    <button type="button" class="btn btn-outline-danger" onclick="adminSetState(${memberDto.m_id}, ${memberDto.state})">회원삭제</button>
</c:if>
<c:if test="${memberDto.state == 0}">
    <button type="button" class="btn btn-outline-primary" onclick="adminSetState(${memberDto.m_id}, ${memberDto.state})">회원복원</button>
</c:if>


<%--
<button onclick="location.href='adminDeleteBtn?m_id=${memberDto.m_id}'">활동</button>
--%>

</body>
</html>