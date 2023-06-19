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
                    } else {
                        alert("오류 발생. 다시 시도해주세요");
                    }
                }
            });
        }
    }
</script>


<body>
<!-- ===============수정중=================== -->
<table id="example" class="table is-striped" style="width:100%">

    <tr>
        <th>경력사항</th>
        <td colspan="3">${counselor.career}</td>
    </tr>
    <tr>
        <th>자격증</th>
        <td>${counselor.license}</td>
    </tr>

</table>
<button type="button" onclick="acceptCounselor(${counselor.c_id})">승인</button>
<button type="button" onclick="declineCounselor(${counselor.c_id})">거절</button>
<!-- ===============수정중=================== -->

</body>
</html>