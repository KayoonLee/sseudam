<%--
  Created by IntelliJ IDEA.
  User: channy1942
  Date: 2023-06-20
  Time: 오후 4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
</head>
<body>
<%--<section class="section">--%>
<%--<div class="row">--%>
<%--<div class="col-lg-6">--%>

<div class="card">
    <div class="card-body">
        <h5 class="card-title">상담예약서 상세페이지(상담사)</h5>

        <!-- General Form Elements -->
        <form method="POST">
            <input type="hidden" name="paper_num" value="${counselpaper.paper_num}">

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담사이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="con_name" name="con_name" value="${counselor.name}" disabled>
                    <input type="hidden" name="c_id" value="${counselor.m_id}">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">회원이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" name="name" value="${genconsult.name}" disabled>
                    <input type="hidden" name="g_id" value="${genconsult.m_id}">
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
                <label  class="col-sm-2 col-form-label">예약 시간</label>
                <div class="col-sm-10">

                    <input type="text" class="form-control" value="<fmt:formatDate value="${counselpaper.request_time}" pattern="yyyy-MM-dd HH:00"/>" disabled>
                </div>
            </div>
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">상담 목적</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="${counselpaper.purpose}" disabled>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담 사유</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="reason" name="reason" style="height: 150px" maxlength="2000" disabled>${counselpaper.reason}</textarea>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">요청 사항</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="wish_list" name="wish_list" style="height: 50px" maxlength="900" disabled>${counselpaper.wish_list}</textarea>
                </div>
            </div>


            <div class="row mb-3">
                <label class="col-sm-2 col-form-label"></label>
                <div class="col-sm-10">
                    <input type="submit" class="btn btn-primary" value="상담 수락하기" onclick="javascript: form.action='accept_Consult';">
                    <input type="submit" class="btn btn-primary" value="상담 취소하기" onclick="javascript: form.action='delete_Consult';">

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
