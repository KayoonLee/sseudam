<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>상담예약서 작성</title>
    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <!-- DATE -->
    <script>
        function removeMinutes() {
            var datetimeInput = document.getElementById("request_times");
            var dateTime = datetimeInput.value;
            var dateTimeWithoutMinutes = dateTime.slice(0, -3) + ":00";
            var dateTimeString = datetimeInput.value;
            datetimeInput.value = dateTimeWithoutMinutes;
            var dateTime1 = new Date(dateTimeString);
        }
    </script>
</head>
<body>

<!-- ======= Header ======= -->
<%--<%@ include file="../navigator_footer/admin_header.jsp" %>--%>

<%--
<section class="section">
<div class="row">
<div class="col-lg-12">
--%>

<div class="card" style="margin: 200px">
    <div class="card-body">
        <h5 class="card-title">상담예약서 작성</h5>

        <!-- General Form Elements -->
        <form action="submit_Insert_Consult" method="POST" onsubmit="return validateForm()">
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담사이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"id="con_name" name="con_name" value = "${con_name}"  disabled >
                    <input type="hidden"  name="c_id" value="${c_id}">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">회원이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  id="name" name="name" value="${gen_name}" disabled>
                    <input type="hidden" name="g_id" value="${g_id}">
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">반려 동물</label>
                <div class="col-sm-10">
                    <select id="p_id" name="p_id" class="form-select" aria-label="Default select example">
                        <option value="">반려동물 선택</option>
                        <c:forEach var="p_name" items="${pet_list}">
                            <option value="${p_name.p_id}">${p_name.animal}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">예약 시간</label>
                <div class="col-sm-10">
                    <input type="datetime-local" id="request_times" value="${nowtime}" name="request_times" onchange="removeMinutes()">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담 목적</label>
                <div class="col-sm-10">
                    <select  class="form-select" aria-label="Default select example" id="purpose" name="purpose">
                        <option value="">상담목적을 선택하세요</option>
                        <option value="반려동물상담">반려동물상담</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담 사유</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="reason" name="reason" style="height: 150px" maxlength="2000"></textarea>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">요청 사항</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="wish_list" name="wish_list" style="height: 50px" maxlength="900"></textarea>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label"></label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">상담 예약서 작성</button>
                </div>
            </div>

        </form><!-- End General Form Elements -->

    </div>
</div>

<%--
</div>
</div>
</section>
--%>

<!-- ======= Table ======= -->
<%--<%@ include file="../navigator_footer/admin_table.jsp" %>--%>

</body>
</html>
