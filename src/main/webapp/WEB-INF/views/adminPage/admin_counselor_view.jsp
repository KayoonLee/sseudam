<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header/header.jsp" %>


<html>
<head>
    <title>admin_counselor_view</title>
</head>

<script>
    function acceptCounselor(m_id) {
        var text = "이 회원을 상담사로 승인하시겠습니까?";
        if (confirm(text)) {
            $.ajax({
                url: "adminCounselorAccept",
                data: {m_id: m_id, identifier: 2},
                success: function (response) {
                    if (response == 1) {
                        alert("성공");
                        location.href = "adminCounselorApply";
                    } else {
                        alert("오류 발생. 다시 시도해주세요");
                    }
                }
            });
        }
    }

    function declineCounselor(m_id) {
        var text = "이 회원의 승인을 거부하고 정보를 삭제하시겠습니까?";
        if (confirm(text)) {
            $.ajax({
                url: "adminCounselorDecline",
                data: {m_id: m_id},
                success: function (response) {
                    if (response == 1) {
                        alert("성공");
                        location.href = "adminCounselorApply";
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
                        location.href = "adminCounselorPage?identifier=2";
                    } else {
                        alert("오류 발생. 다시 시도해주세요");
                    }
                }
            });
        }
    }

    // 상태값 변경
    function stateChange(m_id, state) {
        if (state == '1') {
            var text = "이 회원을 삭제하시겠습니까?";
        } else if (state == '0') {
            var text = "이 회원을 다시 복원시키겠습니까?";
        }
        if (confirm(text)) {
            $.ajax({
                url: "adminStateChange",
                data: {m_id: m_id, state: state},
                success: function (response) {
                    if (response == 1) {
                        alert("회원의 상태값이 변경되었습니다");
                        location.href = "adminCounselorPage?identifier=2";
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


<body>
<!-- ===============수정중=================== -->
<table id="example" class="table is-striped" style="width:100%">

    <tr>
        <td>프로필 사진</td>
        <td colspan="3">사진 출력</td>
    </tr>
    <tr>
        <td>이름</td>
        <td colspan="3">${member.name}</td>
    </tr>
    <tr>
        <td>닉네임</td>
        <td colspan="3">${member.nick}</td>
    </tr>
    <tr>
        <td>생일</td>
        <td colspan="3">${member.birth}</td>
    </tr>
    <tr>
        <td>전화번호</td>
        <td colspan="3">${member.tel}</td>
    </tr>
    <tr>
        <td>경력사항</td>
        <td colspan="3">${member.career}</td>
    </tr>
    <tr>
        <td>자격증</td>
        <td>${member.license}</td>
    </tr>
    <tr>
        <td>상태</td>
        <c:if test="${member.state == 1}">
            <td>활동</td>
        </c:if>
        <c:if test="${member.state == 0}">
            <td>탈퇴</td>
        </c:if>
    </tr>

</table>
<c:if test="${member.identifier == '3'}">
    <button type="button" onclick="acceptCounselor(${member.m_id})">승인</button>
    <button type="button" onclick="declineCounselor(${member.m_id})">거절</button>
</c:if>
<c:if test="${member.identifier == '2'}">
    <button type="button" onclick="nickChange()">닉네임 변경</button>
    <button type="button" onclick="stateChange(${member.m_id}, ${member.state})">회원 삭제/복원</button>
</c:if>
<div id="nickTag">
    <form id="nick_frm" method="" action="">
        <input type='hidden' name='m_id' value=${member.m_id}>
        <input type="text" name="nick" id="nick">
        <button type="button" onclick="nickConfirm()">수정</button>
        <input type="reset" value="취소"/>
    </form>
</div>

</body>
</html>