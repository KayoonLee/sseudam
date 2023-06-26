
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="pagetitle">
            <h1>Profile</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Users</li>
                    <li class="breadcrumb-item active">Profile</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

<form enctype="multipart/form-data" method="post" attribute>
        <section class="section profile">
            <div class="row" align="center">
                <div class="col-xl-8">
                    <div class="card">
                        <div class="card-body pt-3">
                            <!-- Bordered Tabs -->
                            <ul class="nav nav-tabs nav-tabs-bordered">
                                <li class="nav-item">
                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview"
                                    onClick="location.href='memberpage_main'">프로필</button>
                                </li>

                                <!--<li class="nav-item">
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password"
                                    onClick="location.href='memberpage_pwUpdateForm'">비밀번호 변경</button>
                                </li>-->

                            </ul>
                            <div class="tab-content pt-2">

                                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                    <br>
                                   <div class="card">
                                     <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                                        <c:if test="${!empty myModel.profile_num}">
                                            <img src="./memberImg/${myModel.profile_name}" class="rounded-circle">
                                        </c:if>

                                        <c:if test="${empty myModel.profile_num}">
                                             <img src="./images/memberdefault.png" class="rounded-circle">
                                        </c:if>

                                       <h2>${myModel.name}</h2>


                                        </div>
                                   </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label ">이름</div>
                                        <div class="col-lg-9 col-md-8">${myModel.name}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">닉네임</div>
                                        <div class="col-lg-9 col-md-8">${myModel.nick}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">이메일</div>
                                        <div class="col-lg-9 col-md-8">${myModel.email}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">생년월일</div>
                                        <div class="col-lg-9 col-md-8">${myModel.birth}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">휴대폰</div>
                                        <div class="col-lg-9 col-md-8">${myModel.tel}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">가입일</div>
                                        <div class="col-lg-9 col-md-8">${myModel.join_date}</div>
                                    </div>
                                </div>
                             <div class="text-center">
                                 <button type="button" class="btn btn-primary"
                                  onclick="location='memberpage_updateform?email=${myModel.email}'">개인정보 수정</button>
                                 <button type="button" class="btn btn-danger"
                                 onclick="location='memberpage_deleteform?email=${myModel.email}'">탈퇴하기</button>

                             </div>


                            </div><!-- End Bordered Tabs -->

                        </div>
                    </div>

                </div>
            </div>
        </section>
</form>
    </main><!-- End #main -->

</body>
</html>
