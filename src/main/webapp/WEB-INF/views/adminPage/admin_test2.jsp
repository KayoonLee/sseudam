<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Demo | Mark Your Calendar</title>
    <link rel="stylesheet" type="text/css" href="css/mark-your-calendar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/mark-your-calendar.js"></script>
</head>
<body>

<div id="picker"></div>
<div>
    <p>Selected date: <span id="selected-date"></span></p>
    <p>Selected time: <span id="selected-time"></span></p>
</div>

<%-- 실행 안될시 <head>의 javascript 3줄 여기로 옮기기 --%>
<script type="text/javascript">
    (function($) {
        $('#picker').markyourcalendar({
            availability: [
                ['1:00', '2:00', '3:00', '4:00', '5:00'],
                ['2:00'],
                ['3:00'],
                ['4:00'],
                ['5:00'],
                ['6:00'],
                ['7:00']
            ],
            startDate: new Date("2020-10-25"),
            onClick: function(ev, data) {
                // data is a list of datetimes
                var d = data[0].split(' ')[0];
                var t = data[0].split(' ')[1];
                $('#selected-date').html(d);
                $('#selected-time').html(t);
            },
            onClickNavigator: function(ev, instance) {
                var arr = [
                    [
                        ['4:00', '5:00', '6:00', '7:00', '8:00'],
                        ['1:00', '5:00'],
                        ['2:00', '5:00'],
                        ['3:30'],
                        ['2:00', '5:00'],
                        ['2:00', '5:00'],
                        ['2:00', '5:00']
                    ],
                    [
                        ['2:00', '5:00'],
                        ['4:00', '5:00', '6:00', '7:00', '8:00'],
                        ['4:00', '5:00'],
                        ['2:00', '5:00'],
                        ['2:00', '5:00'],
                        ['2:00', '5:00'],
                        ['2:00', '5:00']
                    ],
                    [
                        ['4:00', '5:00'],
                        ['4:00', '5:00'],
                        ['4:00', '5:00', '6:00', '7:00', '8:00'],
                        ['3:00', '6:00'],
                        ['3:00', '6:00'],
                        ['3:00', '6:00'],
                        ['3:00', '6:00']
                    ],
                    [
                        ['4:00', '5:00'],
                        ['4:00', '5:00'],
                        ['4:00', '5:00'],
                        ['4:00', '5:00', '6:00', '7:00', '8:00'],
                        ['4:00', '5:00'],
                        ['4:00', '5:00'],
                        ['4:00', '5:00']
                    ],
                    [
                        ['4:00', '6:00'],
                        ['4:00', '6:00'],
                        ['4:00', '6:00'],
                        ['4:00', '6:00'],
                        ['4:00', '5:00', '6:00', '7:00', '8:00'],
                        ['4:00', '6:00'],
                        ['4:00', '6:00']
                    ],
                    [
                        ['3:00', '6:00'],
                        ['3:00', '6:00'],
                        ['3:00', '6:00'],
                        ['3:00', '6:00'],
                        ['3:00', '6:00'],
                        ['4:00', '5:00', '6:00', '7:00', '8:00'],
                        ['3:00', '6:00']
                    ],
                    [
                        ['3:00', '4:00'],
                        ['3:00', '4:00'],
                        ['3:00', '4:00'],
                        ['3:00', '4:00'],
                        ['3:00', '4:00'],
                        ['3:00', '4:00'],
                        ['4:00', '5:00', '6:00', '7:00', '8:00']
                    ]
                ]
                var rn = Math.floor(Math.random() * 10) % 7;
                instance.setAvailability(arr[rn]);
            }
        });
    })(jQuery);
</script>

</body>
</html>