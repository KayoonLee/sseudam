

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>

    <%-- 달력 테스트 --%>
    <div class="container">
        <h1>상담사 예약시간 정하기</h1>
        <div id="picker"></div>
        <div>
            <p>Selected dates / times:</p>
            <%--<div id="selected-dates" ></div>--%>
        </div>
    </div>

    <title>상담예약서 작성</title>

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

    <%-- 달력 테스트 --%>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/mark-your-calendar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script type="text/javascript" src="js/mark-your-calendar.js"></script>


    <style>
        body {
            background-color: #fafafa;
        }

        .container {
            margin: 50px auto;

        }
        #myc-available-time-container {
            width: auto;
            height: 450px;
        }


    </style>

    <!-- DATE -->
    <script>


    </script>


</head>
<body>

<!-- ======= Navigator ======= -->
<%--<%@ include file="../navigator_footer/main_navigator.jsp" %>--%>

<%--
<section class="section">
<div class="row">
<div class="col-lg-12">
--%>

<%--<main id="main" class="main">--%>

<div class="card" style="margin: 50px">
    <div class="card-body">
        <h5 class="card-title">상담예약서 수정(회원)</h5>

        <!-- General Form Elements -->

        <form action="update_Consult" method="POST" onsubmit="return validateForm()">

            <input type="hidden" id="nowdate" name="nowdate" value="${nowtime}">
            <input type="hidden" name="paper_num" value="${counselpaper.paper_num}">

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담사이름</label>
                <div class="col-sm-10">
                    <input type="text" id="con_name" name="con_name" class="form-control" value="${counselor.name}"
                           readonly>
                    <input type="hidden" name="c_id" value="${counselor.m_id}">
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">회원이름</label>
                <div class="col-sm-10">
                    <input type="text" id="name" name="name" class="form-control" value="${gen.name}" readonly>
                    <input type="hidden" name="g_id" value="${gen.m_id}">
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">반려 동물</label>
                <div class="col-sm-10">
                    <select id="p_id" name="p_id" class="form-select" aria-label="Default select example" required>
                        <option value="">반려동물 선택</option>
                        <c:forEach var="p_name" items="${pet_list}">
                            <option value="${p_name.p_id}"
                                    <c:if test="${pet.animal eq p_name.animal}">selected="selected"</c:if> >${p_name.animal}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">예약 시간</label>
                <div class="col-sm-10">
                    <%-- 달력 테스트 --%>
                    <div id="selected-dates"  onchange="removeMinutes()">
                        <p>
                          <fmt:formatDate value="${counselpaper.request_time}" pattern='yyyy-MM-dd hh:00' />
                        </p>
                    </div>
                    <input type="hidden" id="request_times" name="request_times" value="">
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담 목적</label>
                <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" id="purpose" name="purpose">
                        <option value="">상담목적을 선택하세요</option>
                        <option value="산책문제">산책문제</option>
                        <option value="분리불안">분리불안</option>
                        <option value="공격성">공격성 문제</option>
                        <option value="배변문제">배변문제</option>
                        <option value="훈련고민">훈련고민</option>
                        <option value="비용고민">비용고민</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
            </div>

                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">상담 사유</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" style="height: 100px" id="reason" name="reason" maxlength="2000" required>${counselpaper.reason}</textarea>
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">요청사항</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" style="height: 100px" id="wish_list" name="wish_list" maxlength="2000" required>${counselpaper.wish_list}</textarea>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"></label>
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary">상담예약 수정하기</button>
                    </div>
                </div>

        </form><!-- End General Form Elements -->

    </div>
</div>
<%--</main>--%>


<script type="text/javascript">

    (function ($) {
        $('#picker').markyourcalendar({
            availability: [
                ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
            ],
            isMultiple: false,


            onClick: function (ev, data) {
                // data is a list of datetimes
                console.log(data);
                var html = ``;
                $.each(data, function () {
                    var d = this.split(' ')[0];
                    var t = this.split(' ')[1];
                    html += `<p>` + d + ` ` + t + `</p>`;
                });
                if (validate_date(data)) {
                    $('#selected-dates').html(html);
                }
            },
            onClickNavigator: function (ev, instance) {
                var arr = [
                    [
                        ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                        ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                        ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                        ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                        ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                        ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                        ['10:00', '11:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
                    ]
                ]
                // var rn = Math.floor(Math.random() * 10) % 7;
                instance.setAvailability(arr[0]);
            }
        });
    })(jQuery);


    function removeMinutes() {
        var selectedDatesDiv = document.getElementById("selected-dates"); /* request_times */
        var dateString = selectedDatesDiv.querySelector("p").innerText; // <p> 태그 내부의 텍스트 값을 가져옵니다.

        // 분 짜르기
        var dateTime = dateString.value;
        var dateTimeWithoutMinutes = dateTime.slice(0, -3) + ":00";
        dateString.value = dateTimeWithoutMinutes;
        // 분 짜르기

        var dateTimeString = dateString.value;
        <!-- 수정중입니다 !!!!!!!!!!!!!!!!!!!!!!!!-->
    }

    // 유효성 검사
    function validateForm() {
        var petSelect = document.getElementById("p_id");


        var purposeSelect = document.getElementById("purpose");
        var reasonInput = document.getElementById("reason");
        var wishListInput = document.getElementById("wish_list");



        // 각 필드의 유효성 검사 로직을 구현하고, 필요한 조건에 맞지 않는 경우 알림을 표시하거나 작업을 수행합니다.
        if (petSelect.value === "") {
            alert("반려동물을 선택해주세요.");
            return false;
        }


        if (purposeSelect.value === "") {
            alert("상담 목적을 선택해주세요.");
            return false;
        }

        if (reasonInput.value === "") {
            alert("상담 사유를 입력해주세요.");
            return false;
        }

        if (wishListInput.value === "") {
            alert("요청 사항을 입력해주세요.");
            return false;
        }

        // 필요한 유효성 검사를 모두 통과한 경우에는 true를 반환하여 폼이 제출됩니다.
        return true;
    }


    function validate_date(data) {
        // var selectedDatesDiv = document.getElementById("selected-dates"); /* request_times */
        //var dateString = selectedDatesDiv.querySelector("p").innerText; // <p> 태그 내부의 텍스트 값을 가져옵니다.
        //var dateTimeString = dateString.value;
        // reservation_time 목록을 JavaScript 배열로 변환
        var reservationTimeArray = [<c:forEach items="${reservation_time}" var="time">${time.getTime()}, </c:forEach>];
        // dateTimeInput의 값을 가져와서 JavaScript Date 객체로 변환
        var selectedDateTime = (new Date(data)).getTime();
        console.log("selectedDateTime" + selectedDateTime);
        // 선택된 날짜와 reservation_time 목록의 값을 비교하여 중복 여부 확인
        var isDuplicate = reservationTimeArray.includes(selectedDateTime);
        var nowdate = document.getElementById("nowdate");


        if (selectedDateTime.value === "") {
            alert("예약 시간을 입력해주세요.");
            return false;
        }

        if (selectedDateTime.value <= nowdate.value) {
            alert("예약 시간을 현재시간 이후로 설정해주세요.");
            data.value = "";
            console.log(data);
            return false;
        }

        if (isDuplicate) {
            alert("이미 예약된 시간입니다.");
            data.value = "";
            console.log(data);
            return false;
        }
        //selectedDateTime = new Date(data);
        var checkbull = isDuplicate;
        var dateclick = selectedDateTime;
        var arraytest = reservationTimeArray;
        console.log("checkbull" + checkbull);
        console.log("dateclick" + dateclick);
        console.log("arraytest" + arraytest);
        var inputElement = document.getElementById("request_times");

        // 선택된 날짜와 시간 값을 input 요소의 값으로 설정
        inputElement.value = selectedDateTime;
        return true;
    }


</script>
<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-36251023-1']);
    _gaq.push(['_setDomainName', 'jqueryscript.net']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();

</script>

<script>
    try {
        fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", {
            method: 'HEAD',
            mode: 'no-cors'
        })).then(function (response) {
            return true;
        }).catch(function (e) {
            var carbonScript = document.createElement("script");
            carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
            carbonScript.id = "_carbonads_js";
            document.getElementById("carbon-block").appendChild(carbonScript);
        });
    } catch (error) {
        console.log(error);
    }
</script>


<%--
</div>
</div>
</section>
--%>

<!-- ======= Footer ======= -->
<%--<%@ include file="../navigator_footer/main_footer.jsp" %>--%>

</body>
</html>
