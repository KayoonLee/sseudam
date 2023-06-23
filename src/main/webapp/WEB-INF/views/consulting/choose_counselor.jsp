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
<%-- 상담사 선택 타이틀 --%>
<div class="pagetitle">
    <h1>상담사 선택</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">상담신청</a></li>
            <%-- adminMain/adminDashboard --%>
            <li class="breadcrumb-item">상담사 선택</li>
        </ol>
    </nav>
</div><!-- End Page Title -->


<%--<section class="section">--%>
<%--<div class="row">--%>

<div style="margin-top: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
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
                                    <option value="${counselor.m_id}">${counselor.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">

                        <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary" onclick="checkCounselorSelection()">상담사 선택
                            </button>
                        </div>

                    </div>

                </form><!-- End General Form Elements -->

            </div>
        </div>

    </div>
</div>

<%--</div>--%>
<%--</section>--%>

<%-- 상담사 선택 --%>
<div style="margin-top: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
    <div class="col-lg-auto">

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">상담사 목록</h5>

                <!-- General Form Elements -->
                <form>
                    <div class="row mb-3">
                        <label for="inputText" class="col-sm-2 col-form-label">Text</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control">
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
                        <label for="inputPassword" class="col-sm-2 col-form-label">Textarea</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" style="height: 100px"></textarea>
                        </div>
                    </div>

                    <fieldset class="row mb-3">
                        <legend class="col-form-label col-sm-2 pt-0">Radios</legend>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1"
                                       value="option1" checked="">
                                <label class="form-check-label" for="gridRadios1">
                                    First radio

                                    <%-- 카드 형태의 선택 --%>
                                    <div class="card mb-3">
                                        <div class="row g-5">
                                            <div class="col-md-4">
                                                <img src="images/logo.png" class="img-fluid rounded-start" alt="...">
                                            </div>
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card with an image on left</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                                        content. This content is a little bit longer.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div><%-- 카드 형태의 선택 end --%>

                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2"
                                       value="option2">
                                <label class="form-check-label" for="gridRadios2">
                                    Second radio
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios"
                                       value="option" disabled="">
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
                                <input class="form-check-input" type="checkbox" id="gridCheck2" checked="">
                                <label class="form-check-label" for="gridCheck2">
                                    Example checkbox 2
                                </label>
                            </div>

                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Disabled</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" value="Read only / Disabled" disabled="">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Select</label>
                        <div class="col-sm-10">
                            <select class="form-select" aria-label="Default select example">
                                <option selected="">Open this select menu</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Multi Select</label>
                        <div class="col-sm-10">
                            <select class="form-select" multiple="" aria-label="multiple select example">
                                <option selected="">Open this select menu</option>
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

            </div>
        </div>
    </div>
</div>

<%-- 상담사 선택 예제는 밑에 --%>
<div style="margin-top: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 20px;">
    <div class="col-lg-auto">

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">상담사 목록</h5>

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
                            <input type="color" class="form-control form-control-color" id="exampleColorInput"
                                   value="#4154f1" title="Choose your color">
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
                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1"
                                       value="option1" checked="">
                                <label class="form-check-label" for="gridRadios1">
                                    First radio
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2"
                                       value="option2">
                                <label class="form-check-label" for="gridRadios2">
                                    Second radio
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios"
                                       value="option" disabled="">
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
                                <input class="form-check-input" type="checkbox" id="gridCheck2" checked="">
                                <label class="form-check-label" for="gridCheck2">
                                    Example checkbox 2
                                </label>
                            </div>

                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Disabled</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" value="Read only / Disabled" disabled="">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Select</label>
                        <div class="col-sm-10">
                            <select class="form-select" aria-label="Default select example">
                                <option selected="">Open this select menu</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Multi Select</label>
                        <div class="col-sm-10">
                            <select class="form-select" multiple="" aria-label="multiple select example">
                                <option selected="">Open this select menu</option>
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

            </div>
        </div>
    </div>
</div>

<%--</main>--%>

<section class="section dashboard">
    <div class="row">

        <div class="col-lg-12">
            <div class="row">

                <!-- 일반회원 Card -->
                <div class="col-xxl-4 col-xl-12">

                    <div class="card info-card customers-card">
                        <div class="card-body">

                            <h5 class="card-title">일반회원 <span>| This Year</span></h5>
                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-people"></i>
                                </div>
                                <div class="ps-3">
                                    <%--<h6>${totalMember}명</h6>--%>
                                    <c:if test="${totalMember == 0}">
                                        <h6>0명</h6>
                                    </c:if>
                                    <c:if test="${totalMember > 0}">
                                        <h6>${totalMember}명</h6>
                                    </c:if>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <%-- End 일반회원 Card --%>
            </div>
        </div>
    </div>
</section>

<%-- 카드 형태의 선택 --%>
<div class="card mb-3">
    <div class="row g-5">
        <div class="col-md-4">
            <img src="images/logo.png" class="img-fluid rounded-start" alt="...">
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <h5 class="card-title">Card with an image on left</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                    content. This content is a little bit longer.</p>
            </div>
        </div>
    </div>
</div><%-- 카드 형태의 선택 end --%>


</body>
</html>