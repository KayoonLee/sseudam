<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>상담사 소개</title>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <%@ include file="../navigator_footer/main_header.jsp" %>

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>

</head>
<body>
<%@ include file="../navigator_footer/main_navigator.jsp" %>

    <main id="main" class="main">
        <div class="container" align="center">
            <div class="row">
                <table>
                <p>
                <p>
                    <h2>상담사 소개</h2>
                    <p>
                    <p>
                    <p>
                    <c:forEach var="counsel" items="${counselorList }">
                            <div class="col-sm-3">
                                <div>
                                    <div class="card">
                                        <c:if test="${!empty counsel.profile_num}">
                                                <img class="card-img-top" src="memberImg/${counsel.profile_name}">

                                        </c:if>
                                        <c:if test="${empty counsel.profile_num}">
                                                <img src="images/memberdefault.png" width="250" height="250">

                                        </c:if>


                                        <div class="card-body">
                                            <h4 class="card-title">${counsel.name }</h4>
                                            <h4 class="card-title">${counsel.license }</h4>
                                            <h4 class="card-title">${counsel.career}</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
               </table>
            </div>
        </div>
    </main>
<%@ include file="../navigator_footer/main_footer.jsp" %>
</body>
</html>
