<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header/header.jsp" %>

<html>
<head>
    <title>admin_counselor_view</title>
    <style>
        #nickTag {
            display: none;
        }
    </style>

    <script>
        var email = $("#email").val();
        var nick = $("#nick").val();
        function acceptCounselor(m_id) {
            var text = "이 회원을 상담사로 승인하시겠습니까?";
            alert(email);
            if (confirm(text)) {
                $.ajax({
                    url: "adminCounselorAccept",
                    data: {m_id: m_id, identifier: 2, email: email, nick: nick},
                    success: function (response) {
                        if (response == 1) {
                            alert("성공");
                            location.href = "adminCounselorApply";
                            loadCounselorPage(m_id);
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
                    data: {m_id: m_id, email: email, nick: nick},
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
</head>
<body>

<div class="pagetitle">
    <h1>상담사 신청관리</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">상담사 신청관리</a></li>
            <%-- adminCatPage --%>
            <li class="breadcrumb-item">하위페이지</li>
        </ol>
    </nav>
</div><%-- End Page Title --%>

<div class="card">
    <div class="card-body">
        <div class="card-title" align="center">상담사 정보</div>
        <table id="example" class="table is-striped" style="width:100%">

            <tr>
                <th>프로필 사진</th>
                <td colspan="3">사진 출력</td>
            </tr>
            <tr>
                <th>이름</th>
                <td colspan="3">${member.name}</td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td colspan="3">${member.nick}</td>
            </tr>
            <tr>
                <th>생일</th>
                <td colspan="3">${member.birth}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td colspan="3">${member.tel}</td>
            </tr>
            <tr>
                <th>경력사항</th>
                <td colspan="3">${member.career}</td>
            </tr>
            <tr>
                <th>자격증</th>
                <td>${member.license}</td>
            </tr>
            <tr>
                <th>상태</th>
                <c:if test="${member.state == 1}">
                    <td>활동</td>
                </c:if>
                <c:if test="${member.state == 0}">
                    <td>탈퇴</td>
                </c:if>
            </tr>

        </table>

        <c:if test="${member.identifier == '3'}">
            <button type="button" onclick="acceptCounselor(${member.m_id})" class="btn btn-outline-primary">승인</button>
            <button type="button" onclick="declineCounselor(${member.m_id})" class="btn btn-outline-danger">거절</button>
        </c:if>

        <c:if test="${member.identifier == '2'}">
            <button type="button" onclick="nickChange()" class="btn btn-outline-primary">닉네임 변경</button>
            <c:if test="${member.state == 0}">
                <button type="button" onclick="stateChange(${member.m_id}, ${member.state})" class="btn btn-outline-primary">회원 복원</button>
            </c:if>
            <c:if test="${member.state == 1}">
                <button type="button" onclick="stateChange(${member.m_id}, ${member.state})" class="btn btn-outline-danger">회원 삭제</button>
            </c:if>
        </c:if>

    </div>
</div>

<input type="hidden" id="email" value="${member.email}">
<input type="hidden" id="nick" value="${member.nick}">

<div id="nickTag">
    <form id="nick_frm" method="" action="">
        <input type='hidden' name='m_id' value=${member.m_id}>
        <%-- id값 겹침 --%>
        <input type="text" name="nick" id="nick">
        <button type="button" onclick="nickConfirm()">수정</button>
        <input type="reset" value="취소" />
    </form>
</div>

</body>
</html>