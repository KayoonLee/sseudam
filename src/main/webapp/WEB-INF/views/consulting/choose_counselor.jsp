<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>상담사 소개</title>

    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/main_header.jsp" %>

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
            return true;
        }
    </script>

</head>
<body>

<!-- ======= Navigator ======= -->

<%@ include file="../navigator_footer/main_navigator.jsp" %>


    <div class="container" align="center">
        <div class="row">
            <table>
                <p>
                <p>
                <h2>상담사 목록</h2>
                <p>
                <h6>상담하기를 원하시는 상담사를 선택해주세요</h6>
                <p>
                <p>
                    <c:forEach var="counsel" items="${counselorList }">
                <div class="col-sm-3">
                    <div>
                        <div class="card">
                            <a href="choose_Consult_Time?m_id=${counsel.m_id}">
                            <c:if test="${!empty counsel.profile_num}">
                                <img class="card-img-top" src="memberImg/${counsel.profile_name}">

                            </c:if>
                            <c:if test="${empty counsel.profile_num}">
                                <img src="images/memberdefault.png" width="250" height="250">

                            </c:if>


                            <div class="card-body">
                                <h2 class="card-title">${counsel.name }</h2>
                                <h6 class="card-text">${counsel.license }</h6>
                                <h6 class="card-text">${counsel.career}</h6>
                            </div>
                        </div>
                        </a>
                    </div>
                </div>
                </c:forEach>
            </table>
        </div>
    </div>
</main>

    <%-- 상담사 선택 --%>
<%--    <div style="margin-top: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">--%>
<%--        <div class="col-lg-auto">--%>

<%--            <div class="card">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">상담사 목록</h5>--%>

<%--                    <!-- General Form Elements -->--%>
<%--                    <form action="choose_Consult_Time" method="POST" onsubmit="return checkCounselorSelection()">--%>
<%--                        <div class="row mb-3">--%>
<%--                            <div class="col-sm-10">--%>

<%--                                <select id="con_names_select" name="con_names">--%>
<%--                                    <option value="">상담사</option>--%>
<%--                                    <c:forEach var="counselor" items="${con_names}">--%>
<%--                                        <option value="${counselor.m_id}">${counselor.name}</option>--%>
<%--                                    </c:forEach>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="row mb-3">--%>

<%--                            <div class="col-sm-10">--%>
<%--                                <button type="submit" class="btn btn-primary" >상담사 선택</button>--%>
<%--                            </div>--%>

<%--                        </div>--%>

<%--                    </form><!-- End General Form Elements -->--%>

<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div> &lt;%&ndash; 상담사 선택 end &ndash;%&gt;--%>


<%--<section class="section">--%>
<%--<div class="row">--%>

<%--</div>--%>
<%--</section>--%>

<!-- ======= Footer ======= -->
<%@ include file="../navigator_footer/main_footer.jsp" %>

</body>
</html>
