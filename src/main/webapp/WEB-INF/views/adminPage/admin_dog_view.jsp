<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Admin_Dog_View</title>

    <script>
        // 강아지 상태값 변경
        function adminDogStateChange(p_id, state) {
            if (state == '1') {
                var text = "이 강아지를 삭제하시겠습니까?";
            } else if (state == '0') {
                var text = "이 강아지를 다시 복원시키겠습니까?";
            }
            if (confirm(text)) {
                $.ajax({
                    url: "adminDogState",
                    data: {p_id: p_id, state: state},
                    success: function (response) {
                        if (response == 1) {
                            alert("강아지 회원의 상태값이 변경되었습니다.");
                            loadDogPage(p_id);
                        } else {
                            alert("오류 발생! 다시 시도해주세요.");
                        }
                    }
                });
            }
        }
    </script>
</head>
<body>

<div class="pagetitle">
    <h1>강아지</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">반려동물</a></li>
            <%-- adminDogPage --%>
            <li class="breadcrumb-item">하위페이지</li>
        </ol>
    </nav>
</div>
<%-- End Page Title --%>

<div class="card">
    <div class="card-body">
        <table id="example2" class="table is-striped" style="width:100%">

            <tr>
                <h5 class="card-title">회원 ${pet.g_id}번 / ${memberDto.name}님의 동물</h5>
            </tr>
            <tr>
                <th>품종</th>
                <th>특이사항</th>
                <th>중성화여부</th>
                <th>상태값</th>
            </tr>
            <tr>
                <td>${pet.breed}</td>
                <td>${pet.feature}</td>
                <%--<td>${pet.neutering}</td>--%>
                <c:if test="${pet.neutering == 0}">
                    <td>중성화x</td>
                </c:if>
                <c:if test="${pet.neutering == 1}">
                    <td>중성화o</td>
                </c:if>
                <c:if test="${pet.state == 0}">
                    <td>활동중</td>
                </c:if>
                <c:if test="${pet.state == 1}">
                    <td>탈퇴</td>
                </c:if>
            </tr>
        </table>

        <!-- 강아지 삭제/복구-->
        <c:if test="${pet.state == 1}">
            <button type="button" class="btn btn-outline-primary"
                    onclick="adminDogStateChange(${pet.p_id}, ${pet.state})">복원</button>
        </c:if>

        <c:if test="${pet.state == 0}">
            <button type="button" class="btn btn-outline-danger"
                    onclick="adminDogStateChange(${pet.p_id}, ${pet.state})">삭제</button>
        </c:if>
<%--
        <button onclick="location.href='adminDeleteBtn?m_id=${memberDto.m_id}'">활동</button>
--%>
    </div>
</div>

<%-- -------------------------------------------------------------------------------------------------------------- --%>

<%--<div class="row">--%>
<%--<div class="col-lg-6">--%>
<%--<div class="card">
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
&lt;%&ndash;</div>&ndash;%&gt;
&lt;%&ndash;</div>&ndash;%&gt;

<button type="button" class="btn btn-outline-primary">Primary</button>

<div class="card">
    <div class="card-body">
        <h5 class="card-title">Outline Buttons</h5>

        <button type="button" class="btn btn-outline-primary">Primary</button>
        <button type="button" class="btn btn-outline-secondary">Secondary</button>
        <button type="button" class="btn btn-outline-success">Success</button>
        <button type="button" class="btn btn-outline-danger">Danger</button>
        <button type="button" class="btn btn-outline-warning">Warning</button>
        <button type="button" class="btn btn-outline-info">Info</button>
        <button type="button" class="btn btn-outline-light">Light</button>
        <button type="button" class="btn btn-outline-dark">Dark</button>
    </div>
</div>


&lt;%&ndash;<section class="section">&ndash;%&gt;
&lt;%&ndash;<div class="row">&ndash;%&gt;
&lt;%&ndash;<div class="col-lg-6">&ndash;%&gt;

<div class="card">
    <div class="card-body">
        <h5 class="card-title">General Form Elements</h5>

        <!-- General Form Elements -->
        <form>
            <div class="row mb-3">
                <label for="inputText" class="col-sm-2 col-form-label">Text</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control">
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control">
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputNumber" class="col-sm-2 col-form-label">Number</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control">
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputNumber" class="col-sm-2 col-form-label">File Upload</label>
                <div class="col-sm-10">
                    <input class="form-control" type="file" id="formFile">
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputDate" class="col-sm-2 col-form-label">Date</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control">
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputTime" class="col-sm-2 col-form-label">Time</label>
                <div class="col-sm-10">
                    <input type="time" class="form-control">
                </div>
            </div>

            <div class="row mb-3">
                <label for="inputColor" class="col-sm-2 col-form-label">Color Picker</label>
                <div class="col-sm-10">
                    <input type="color" class="form-control form-control-color" id="exampleColorInput" value="#4154f1"
                           title="Choose your color">
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputPassword" class="col-sm-2 col-form-label">Textarea</label>
                <div class="col-sm-10">
                    <textarea class="form-control" style="height: 100px"></textarea>
                </div>
            </div>
            <fieldset class="row mb-3">
                <legend class="col-form-label col-sm-2 pt-0">Radios</legend>
                <div class="col-sm-10">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1"
                               checked>
                        <label class="form-check-label" for="gridRadios1">
                            First radio
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                        <label class="form-check-label" for="gridRadios2">
                            Second radio
                        </label>
                    </div>
                    <div class="form-check disabled">
                        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios" value="option"
                               disabled>
                        <label class="form-check-label" for="gridRadios3">
                            Third disabled radio
                        </label>
                    </div>
                </div>
            </fieldset>
            <div class="row mb-3">
                <legend class="col-form-label col-sm-2 pt-0">Checkboxes</legend>
                <div class="col-sm-10">

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="gridCheck1">
                        <label class="form-check-label" for="gridCheck1">
                            Example checkbox
                        </label>
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="gridCheck2" checked>
                        <label class="form-check-label" for="gridCheck2">
                            Example checkbox 2
                        </label>
                    </div>

                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Disabled</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="Read only / Disabled" disabled>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Select</label>
                <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example">
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Multi Select</label>
                <div class="col-sm-10">
                    <select class="form-select" multiple aria-label="multiple select example">
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Submit Button</label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Submit Form</button>
                </div>
            </div>

        </form><!-- End General Form Elements -->

        <div class="card">
            <div class="card-body">
                <div class="card-title" align="center">자유게시판</div>

                <!-- Table with hoverable rows -->
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Position</th>
                        <th scope="col">Age</th>
                        <th scope="col">Start Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Brandon Jacob</td>
                        <td>Designer</td>
                        <td>28</td>
                        <td>2016-05-25</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Bridie Kessler</td>
                        <td>Developer</td>
                        <td>35</td>
                        <td>2014-12-05</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Ashleigh Langosh</td>
                        <td>Finance</td>
                        <td>45</td>
                        <td>2011-08-12</td>
                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td>Angus Grady</td>
                        <td>HR</td>
                        <td>34</td>
                        <td>2012-06-11</td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>Raheem Lehner</td>
                        <td>Dynamic Division Officer</td>
                        <td>47</td>
                        <td>2011-04-19</td>
                    </tr>
                    </tbody>
                </table>
                <!-- End Table with hoverable rows -->

            </div>
        </div>

    </div>


    <div class="card">
        <div class="card-body">
            <div class="card-title" align="center">자유게시판</div>

            <!-- Table with hoverable rows -->
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Position</th>
                    <th scope="col">Age</th>
                    <th scope="col">Start Date</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Brandon Jacob</td>
                    <td>Designer</td>
                    <td>28</td>
                    <td>2016-05-25</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Bridie Kessler</td>
                    <td>Developer</td>
                    <td>35</td>
                    <td>2014-12-05</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Ashleigh Langosh</td>
                    <td>Finance</td>
                    <td>45</td>
                    <td>2011-08-12</td>
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td>Angus Grady</td>
                    <td>HR</td>
                    <td>34</td>
                    <td>2012-06-11</td>
                </tr>
                <tr>
                    <th scope="row">5</th>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>47</td>
                    <td>2011-04-19</td>
                </tr>
                </tbody>
            </table>
            <!-- End Table with hoverable rows -->

        </div>
    </div>

</div>
</div>

<div class="pagetitle">
    <h1>자유게시판</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">커뮤니티</a></li>
            &lt;%&ndash; adminDogPage &ndash;%&gt;
            <li class="breadcrumb-item">자유게시판</li>
        </ol>
    </nav>
</div><!-- End Page Title -->

<div class="card">
    <div class="card-body">
        <div class="card-title" align="center">자유게시판</div>

        <!-- Table with hoverable rows -->
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Position</th>
                <th scope="col">Age</th>
                <th scope="col">Start Date</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Brandon Jacob</td>
                <td>Designer</td>
                <td>28</td>
                <td>2016-05-25</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Bridie Kessler</td>
                <td>Developer</td>
                <td>35</td>
                <td>2014-12-05</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Ashleigh Langosh</td>
                <td>Finance</td>
                <td>45</td>
                <td>2011-08-12</td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td>Angus Grady</td>
                <td>HR</td>
                <td>34</td>
                <td>2012-06-11</td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td>Raheem Lehner</td>
                <td>Dynamic Division Officer</td>
                <td>47</td>
                <td>2011-04-19</td>
            </tr>
            </tbody>
        </table>
        <!-- End Table with hoverable rows -->

    </div>
</div>--%>

<%--</div>--%>
<%--</div>--%>
<%--</section>--%>

</body>
</html>
