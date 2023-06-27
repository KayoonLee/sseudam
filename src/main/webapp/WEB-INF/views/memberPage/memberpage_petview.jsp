<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>
    <%@ include file="../navigator_footer/member_header.jsp" %>
    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>
</head>
<body>
<!-- ======= Header ======= -->
<%@ include file="../navigator_footer/counselor_navigator.jsp" %>
<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/member_sidebar.jsp" %>

<form method="post" enctype="multipart/form-data" attribute>
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>내 반려동물</h1>
            <br>
        </div><!-- End Page Title -->
        <section class="section profile">
            <input type=hidden value="${pet.p_id }" id="p_id" name="p_id">
            <input type=hidden value="${pageNum }" id="pageNum">
            <div class="row">
                <div class="col-xl-8">
                    <div class="card">
                        <div class="card-body pt-3">
                            <div class="tab-content pt-2">
                                <div class="tab-pane fade show active profile-overview" id="pet-overview">
                                    <br>
                                    <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                                        <c:if test="${empty pet.profile_num}">
                                            <img src="/images/petdefault.png">
                                        </c:if>
                                        <c:if test="${!empty pet.profile_num}">
                                            <img src="./petimg/${pet.profile_name }" alt="Profile" class="rounded-circle" width="250" >
                                        </c:if>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label ">이름</div>
                                        <div class="col-lg-9 col-md-8">${pet.animal}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">종류</div>
                                        <div class="col-lg-9 col-md-8">
                                            <c:if test="${pet.kind == 'd'}">
                                                강아지
                                            </c:if>
                                            <c:if test="${pet.kind == 'c'}">
                                                고양이
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">품종</div>
                                        <div class="col-lg-9 col-md-8">${pet.breed}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">생일</div>
                                        <div class="col-lg-9 col-md-8">${pet.birth} (${birthYear}살)</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">성별</div>
                                        <div class="col-lg-9 col-md-8">
                                            <c:if test="${pet.gender == 0}">
                                                암컷
                                            </c:if>
                                            <c:if test="${pet.gender == 1}">
                                                수컷
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">중성화</div>
                                        <div class="col-lg-9 col-md-8">
                                            <c:if test="${pet.neutering == 0}">
                                                안했음
                                            </c:if>
                                            <c:if test="${pet.neutering == 1}">
                                                했음
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">특이사항</div>
                                        <div class="col-lg-9 col-md-8">${pet.feature}</div>
                                    </div>
                                    <div class="text-center">
                                        <button type="button" class="btn btn-primary rounded-pill" onclick="location.href='/memberpage_petupdate.do?p_id=${pet.p_id}&pageNum=${pageNum}'">수정</button>
                                    </div>
                                </div>
                            </div><!-- End Bordered Tabs -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</form>
</body>
</html>

