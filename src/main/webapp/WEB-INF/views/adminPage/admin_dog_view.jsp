<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Admin_Dog_View</title>
</head>
<body>

<table id="example2" class="table is-striped" style="width:100%">

    <div class="pagetitle">
        <h1>강아지</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">반려동물</a></li>
                <%-- adminDogPage --%>
                <li class="breadcrumb-item">하위페이지</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <tr>
        <h3>회원 ${pet.g_id} 번의 동물</h3> <%-- me --%>
        <h3>${memberDto.name}의 동물</h3>
    </tr>
    <tr>
        <th>품종</th>
        <th>특이사항</th>
        <th>상태값</th>
    </tr>
    <tr>
        <td>${pet.breed}</td>
        <td>${pet.feature}</td>
        <c:if test="${pet.state == 1}">
            <td>탈퇴</td>
        </c:if>
        <c:if test="${pet.state == 0}">
            <td>활동중</td>
        </c:if>
    </tr>
</table>

<%--<div class="row">--%>
<%--<div class="col-lg-6">--%>
<div class="card">
    <div class="card-body">
        <h5 class="card-title">Default Tabs</h5>

        <!-- Default Tabs -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button"
                        role="tab" aria-controls="home" aria-selected="true">Home
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button"
                        role="tab" aria-controls="profile" aria-selected="false">Profile
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button"
                        role="tab" aria-controls="contact" aria-selected="false">Contact
                </button>
            </li>
        </ul>
        <div class="tab-content pt-2" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                Sunt est soluta temporibus accusantium neque nam maiores cumque temporibus. Tempora libero non est unde
                veniam est qui dolor. Ut sunt iure rerum quae quisquam autem eveniet perspiciatis odit. Fuga sequi sed
                ea saepe at unde.
            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                Nesciunt totam et. Consequuntur magnam aliquid eos nulla dolor iure eos quia. Accusantium distinctio
                omnis et atque fugiat. Itaque doloremque aliquid sint quasi quia distinctio similique. Voluptate nihil
                recusandae mollitia dolores. Ut laboriosam voluptatum dicta.
            </div>
            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                Saepe animi et soluta ad odit soluta sunt. Nihil quos omnis animi debitis cumque. Accusantium quibusdam
                perspiciatis qui qui omnis magnam. Officiis accusamus impedit molestias nostrum veniam. Qui amet ipsum
                iure. Dignissimos fuga tempore dolor.
            </div>
        </div><!-- End Default Tabs -->

    </div>
</div>
<%--</div>--%>
<%--</div>--%>

</body>
</html>
