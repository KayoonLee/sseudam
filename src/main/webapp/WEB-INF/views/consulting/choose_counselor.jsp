<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <!-- 상담사 선택 이벤트 -->
    <script>
        function checkCounselorSelection() {
            var counselorSelect = document.getElementById("con_names_select");
            if (counselorSelect.value == "") {
                alert("상담사를 선택해주세요.");
                return false; // 폼 전송을 막기 위해 false 반환
            }
        }
    </script>

</head>
<body>

<%--<main id="main" class="main">--%>
<%--<section class="section">--%>
<%--<div class="row">--%>

    <div style="margin-top: 250px; margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
        <div class="col-lg-auto">

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">상담사 목록</h5>

                    <!-- General Form Elements -->
                    <form action="choose_Consult_Time" method="POST">
                        <div class="row mb-3">
                            <div class="col-sm-10">

                                <select id="con_names_select" name="con_names">
                                    <option value="">상담사</option>
                                    <c:forEach var="counselor" items="${con_names}">
                                        <option value="${counselor.m_id}" >${counselor.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">

                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary" onclick="checkCounselorSelection()">상담사 선택</button>
                            </div>
                        </div>

                    </form><!-- End General Form Elements -->

                </div>
            </div>

        </div>
    </div>

<%--</div>--%>
<%--</section>--%>
<%--</main>--%>


</body>
</html>