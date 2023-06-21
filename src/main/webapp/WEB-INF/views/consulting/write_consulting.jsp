
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <script>
        function validateForm() {
            var purposeSelect = document.getElementById("purpose");
            if (purposeSelect.value === "") {
                alert("상담목적을 선택하세요.");
                return false; // 폼 전송을 막기 위해 false 반환
            }
            return true; // 상담목적이 선택되었으면 폼 전송 허용
        }
    </script>

</head>
<body>

<%--<section class="section">--%>
<%--<div class="row">--%>
<%--<div class="col-lg-6">--%>

<div class="card">
    <div class="card-body">
        <h5 class="card-title">상담기록서</h5>

        <!-- General Form Elements -->
        <form action="insert_Consulting" method="POST">
            <input type="hidden" name="old_paper_num" value="${counselpaper.paper_num}">
            <input type="hidden" name="old_p_id" value="${counselpaper.p_id}">
            <input type="hidden" name="old_m_id" value="${counselpaper.m_id}">
            <input type="hidden" name="old_c_id" value="${counselpaper.c_id}">


            <div class="row mb-3">
                <label for="con_name" class="col-sm-2 col-form-label">상담사이름</label>
                <div class="col-sm-10">
                    <input type="text" id="con_name" name="con_name" class="form-control" value="${counselor.name}"
                           disabled>
                    <input type="hidden" name="c_id" value="${counselor.m_id}">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">회원 이름</label>
                <div class="col-sm-10">
                    <input type="text" id="name" name="name" class="form-control" value="${member.name}" disabled>
                    <input type="hidden" name="g_id" value="${member.m_id}">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">동물 이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="p_id" name="p_id" value="${pet.animal}" disabled>
                    <input type="hidden" name="p_id" value="${pet.p_id}">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">작성 날짜</label>
                <div class="col-sm-10">
                    <input type="text" id ="consulting_dates" name = "consulting_dates" value="${time}" class="form-control" readonly>
                </div>
            </div>
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">상담 제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id ="subject" name = "subject" maxlength="50">
                </div>
            </div>
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">상담 주제</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id ="topic" name = "topic" maxlength="50">
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담 기록</label>
                <div class="col-sm-10">
                    <textarea class="form-control" style="height: 100px" id="content" name="content" maxlength="2000" required></textarea>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담현황</label>
                <div class="col-sm-10">
                    <textarea class="form-control" style="height: 100px" id="consult_status" name="consult_status" maxlength="100" required></textarea>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">특이사항</label>
                <div class="col-sm-10">
                    <textarea class="form-control" style="height: 100px" id="etc" name="etc" maxlength="50" required></textarea>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label"></label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">상담 기록</button>
                </div>
            </div>

        </form><!-- End General Form Elements -->

    </div>
</div>

<%--</div>--%>
<%--</div>--%>
<%--</section>--%>

</body>
</html>