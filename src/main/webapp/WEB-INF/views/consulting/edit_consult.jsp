
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
        <h5 class="card-title">상담예약서 수정(회원)</h5>

        <!-- General Form Elements -->
        <form action="update_Consult" method="POST">
            <input type="hidden" name="old_paper_num" value="${counselpaper.paper_num}">

            <div class="row mb-3">
                <label for="con_name" class="col-sm-2 col-form-label">상담사이름</label>
                <div class="col-sm-10">
                    <input type="text" id="con_name" name="con_name" class="form-control" value="${counselor.name}"
                           readonly>
                    <input type="hidden" name="c_id" value="${counselor.m_id}">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">회원 이름</label>
                <div class="col-sm-10">
                    <input type="text" id="name" name="name" class="form-control" value="${gen.name}" readonly>
                    <input type="hidden" name="g_id" value="${gen.m_id}">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">동물 이름</label>
                <div class="col-sm-10">
                    <select id="p_id" name="p_id" class="form-select" aria-label="Default select example" required>
                        <option value="">반려동물 선택</option>
                        <c:forEach var="p_name" items="${pet_list}">
                            <option value="${p_name.p_id}"
                                    <c:if test="${pet.animal eq p_name.animal}">selected="selected"</c:if> >${p_name.animal}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">상담예약시간</label>
                <div class="col-sm-10">
                    <input class="form-control" type="datetime-local" id="request_times" name="request_times" required><br>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담 목적</label>
                <div class="col-sm-10">
                    <select class="form-select" id="purpose" name="purpose" aria-label="Default select example" >
                        <option value="">상담목적을 선택하세요</option>
                        <option value="반려동물상담">반려동물상담</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담 사유</label>
                <div class="col-sm-10">
                    <textarea class="form-control" style="height: 100px" id="reason" name="reason" maxlength="2000" required>${counselpaper.reason}</textarea>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">요청사항</label>
                <div class="col-sm-10">
                    <textarea class="form-control" style="height: 100px" id="wish_list" name="wish_list" maxlength="2000" required>${counselpaper.wish_list}</textarea>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label"></label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">상담예약 수정하기</button>
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
