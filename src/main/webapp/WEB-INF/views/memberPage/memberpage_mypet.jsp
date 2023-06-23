<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>
   <%@ include file="../navigator_footer/member_header.jsp" %>

</head>
<body>
<!-- ======= Header ======= -->
<%@ include file="../navigator_footer/counselor_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/member_sidebar.jsp" %>

    <main id="main" class="main">
        <div class="container" align="center">
            <div class="row">
                <c:if test="${empty list}">
                    <div class="col-sm-12 text-bg-secondary">
                        <b>등록된 반려동물이 없습니다</b>
                    </div>
                </c:if>
                <c:if test="${not empty list}">
                    <c:forEach var="pet" items="${list }">
                            <div class="col-sm-3">
                                <div>
                                    <div class="card" >
                                        <c:if test="${!empty pet.profile_num}">
                                            <a href="memberpage_petview?p_id=${pet.p_id }&pageNum=${pageNum}">
                                                <img class="card-img-top" src="./petimg/${pet.profile_name}">
                                            </a>
                                        </c:if>
                                        <c:if test="${empty pet.profile_num}">
                                            <a href="memberpage_petview?p_id=${pet.p_id }&pageNum=${pageNum}">
                                                <img src="/images/petdefault.png" width="250" height="250">
                                            </a>
                                        </c:if>
                                        <div class="card-body" >
                                            <h4 class="card-title">${pet.animal }</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                </c:if>
                <a href="memberpage_petadd">
                    <img src="./images/add.png" width="50" height="50">
                </a>
            </div>
        </div>
    </main>

</body>
</html>
