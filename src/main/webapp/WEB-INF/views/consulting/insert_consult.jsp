<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
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
            margin: 150px auto;
        }
    </style>

    <!-- DATE -->
    <script>
        function removeMinutes() {
            var datetimeInput = document.getElementById("selected-dates"); /* request_times */
            var dateString = selectedDatesDiv.querySelector("p").innerText; // <p> 태그 내부의 텍스트 값을 가져옵니다.

            var dateTime = datetimeInput.value;
            var dateTimeWithoutMinutes = dateTime.slice(0, -3) + ":00";
            datetimeInput.value = dateTimeWithoutMinutes;
            var dateTimeString = datetimeInput.value;
            var dateTime1 = new Date(dateTimeString);
            <!-- 수정중입니다 !!!!!!!!!!!!!!!!!!!!!!!!-->
        }

        // 유효성 검사
        function validateForm() {
            var petSelect = document.getElementById("p_id");
            var datetimeInput = document.getElementById("selected-dates"); /* request_times */
            var dateString = selectedDatesDiv.querySelector("p").innerText; // <p> 태그 내부의 텍스트 값을 가져옵니다.

            var purposeSelect = document.getElementById("purpose");
            var reasonInput = document.getElementById("reason");
            var wishListInput = document.getElementById("wish_list");
            var nowdate = document.getElementById("nowdate");

            // reservation_time 목록을 JavaScript 배열로 변환
            var reservationTimeArray = [<c:forEach items="${reservation_time}" var="time">${time.getTime()}, </c:forEach>];

            // dateTimeInput의 값을 가져와서 JavaScript Date 객체로 변환
            var selectedDateTime = new Date(dateTimeInput.value);

            // 선택된 날짜와 reservation_time 목록의 값을 비교하여 중복 여부 확인
            var isDuplicate = reservationTimeArray.includes(selectedDateTime.getTime());


            // 각 필드의 유효성 검사 로직을 구현하고, 필요한 조건에 맞지 않는 경우 알림을 표시하거나 작업을 수행합니다.
            if (petSelect.value === "") {
                alert("반려동물을 선택해주세요.");
                return false;
            }

            if (dateTimeInput.value === "") {
                alert("예약 시간을 입력해주세요.");
                return false;
            }

            if (dateTimeInput.value <= nowdate.value) {
                alert("예약 시간을 현재시간 이후로 설정해주세요.");
                dateTimeInput.value = "";
                return false;
            }

            if (isDuplicate) {
                alert("이미 예약된 시간입니다.");
                dateTimeInput.value = "";
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
        <h5 class="card-title">상담예약서 작성</h5>

        <!-- General Form Elements -->
        <form action="submit_Insert_Consult" method="POST" onsubmit="return validateForm()">

            <input type="hidden" id="nowdate" name="nowdate" value="${nowtime}">

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">상담사이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="con_name" name="con_name" value="${con_name}"
                           disabled>
                    <input type="hidden" name="c_id" value="${c_id}">
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">회원이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" name="name" value="${gen_name}" disabled>
                    <input type="hidden" name="g_id" value="${g_id}">
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">반려 동물</label>
                <div class="col-sm-10">
                    <select id="p_id" name="p_id" class="form-select" aria-label="Default select example">
                        <option value="">반려동물 선택</option>
                        <c:forEach var="p_name" items="${pet_list}">
                            <option value="${p_name.p_id}">${p_name.animal}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">예약 시간</label>
                <div class="col-sm-10">
                    <%-- 달력 테스트 --%>
                    <div id="selected-dates">
                        <input type="datetime-local" id="request_times" name="request_times" onchange="removeMinutes()">
                    </div>
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
                        <textarea class="form-control" id="reason" name="reason" style="height: 150px"
                                  maxlength="2000"></textarea>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">요청 사항</label>
                <div class="col-sm-10">
                        <textarea class="form-control" id="wish_list" name="wish_list" style="height: 50px"
                                  maxlength="900"></textarea>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label"></label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">상담 예약서 작성</button>
                </div>
            </div>

        </form><!-- End General Form Elements -->

    </div>
</div>
<%--</main>--%>

<%-- 달력 테스트 --%>
<div class="container">
    <h1>상담사 예약시간 정하기</h1>
    <div id="picker"></div>
    <div>
        <p>Selected dates / times:</p>
        <%--<div id="selected-dates" ></div>--%>
    </div>
</div>


<script type="text/javascript">
    (function ($) {
        $('#picker').markyourcalendar({
            availability: [
                ['1:00', '2:00', '3:00', '4:00', '5:00'],
                ['1:00', '2:00', '3:00', '4:00', '5:00'],
                ['1:00', '2:00', '3:00', '4:00', '5:00'],
                ['1:00', '2:00', '3:00', '4:00', '5:00'],
                ['1:00', '2:00', '3:00', '4:00', '5:00'],
                ['1:00', '2:00', '3:00', '4:00', '5:00'],
                ['1:00', '2:00', '3:00', '4:00', '5:00'],
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
                $('#selected-dates').html(html);
            },
            onClickNavigator: function (ev, instance) {
                var arr = [
                    [
                        ['1:00', '2:00', '3:00', '4:00', '5:00'],
                        ['1:00', '2:00', '3:00', '4:00', '5:00'],
                        ['1:00', '2:00', '3:00', '4:00', '5:00'],
                        ['1:00', '2:00', '3:00', '4:00', '5:00'],
                        ['1:00', '2:00', '3:00', '4:00', '5:00'],
                        ['1:00', '2:00', '3:00', '4:00', '5:00'],
                        ['1:00', '2:00', '3:00', '4:00', '5:00'],
                    ]
                ]
                // var rn = Math.floor(Math.random() * 10) % 7;
                instance.setAvailability(arr[0]);
            }
        });
    })(jQuery);
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