<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Counselor_</title>

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
</head>
<body>

<div class="container">
    <h1>상담사 예약시간 정하기</h1>
    <div id="picker"></div>
    <div>
        <p>Selected dates / times:</p>
        <div id="selected-dates" <%--name="request_times" onchange="removeMinutes()"--%>></div>
    </div>
</div>

<%-- 실행 안될시 <head>의 javascript 3줄 여기로 옮기기 --%>
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

</body>
</html>
