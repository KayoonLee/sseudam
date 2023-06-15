<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendar Example</title>
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 사용자 정의 CSS -->
    <style>
        .calendar {
            margin: 50px auto;
            max-width: 400px;
        }

        .calendar table {
            width: 100%;
            border-collapse: collapse;
        }

        .calendar th, .calendar td {
            text-align: center;
            padding: 5px;
        }

        .calendar .current-month {
            background-color: #f0f0f0;
            font-weight: bold;
        }

        .calendar .current-date {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="calendar">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th colspan="3">
                    <button id="prevMonthBtn" class="btn btn-primary">Prev</button>
                </th>
                <th colspan="1" id="currentMonthHeader" class="current-month"></th>
                <th colspan="3">
                    <button id="nextMonthBtn" class="btn btn-primary">Next</button>
                </th>
            </tr>
            <tr>
                <th>Sun</th>
                <th>Mon</th>
                <th>Tue</th>
                <th>Wed</th>
                <th>Thu</th>
                <th>Fri</th>
                <th>Sat</th>
            </tr>
            </thead>
            <tbody id="calendarBody">
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>1</td>
                <td>2</td>
                <td>3</td>
            </tr>
            <tr>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>11</td>
                <td>12</td>
                <td>13</td>
                <td>14</td>
                <td>15</td>
                <td>16</td>
                <td>17</td>
            </tr>
            <tr>
                <td>18</td>
                <td>19</td>
                <td>20</td>
                <td>21</td>
                <td>22</td>
                <td>23</td>
                <td>24</td>
            </tr>
            <tr>
                <td>25</td>
                <td>26</td>
                <td>27</td>
                <td>28</td>
                <td>29</td>
                <td>30</td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- 부트스트랩 JS 및 jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // 현재 날짜 객체 생성
    var currentDate = new Date();

    // 이전 달로 이동하는 함수
    function prevMonth() {
        currentDate.setMonth(currentDate.getMonth() - 1);
        renderCalendar();
    }

    // 다음 달로 이동하는 함수
    function nextMonth() {
        currentDate.setMonth(currentDate.getMonth() + 1);
        renderCalendar();
    }

    // 달력을 렌더링하는 함수
    function renderCalendar() {
        var calendarBody = document.getElementById("calendarBody");
        calendarBody.innerHTML = "";

        var year = currentDate.getFullYear();
        var month = currentDate.getMonth();
        var date = new Date(year, month, 1);

        var row, cell;
        var daysInMonth = new Date(year, month + 1, 0).getDate();
        var dayOfWeek = date.getDay();

        // 첫 주의 빈 칸 생성
        row = document.createElement("tr");
        for (var i = 0; i < dayOfWeek; i++) {
            cell = document.createElement("td");
            row.appendChild(cell);
        }
        calendarBody.appendChild(row);

        // 날짜 채우기
        var currentDay = 1;
        while (currentDay <= daysInMonth) {
            // 주 생성
            row = document.createElement("tr");
            for (var j = 0; j < 7; j++) {
                // 날짜 셀 생성
                if (currentDay > daysInMonth) {
                    break;
                }
                cell = document.createElement("td");
                if (j === 0 || j === 6) {
                    cell.classList.add("weekend");
                }
                if (currentDay === currentDate.getDate() && month === currentDate.getMonth()) {
                    cell.classList.add("current-date");
                }
                cell.textContent = currentDay;
                row.appendChild(cell);
                currentDay++;
            }
            calendarBody.appendChild(row);
        }

        // 초기 달력 렌더링
        renderCalendar();

        // Prev 버튼 클릭 이벤트 처리
        document.getElementById("prevMonthBtn").addEventListener("click", prevMonth);

        // Next 버튼 클릭 이벤트 처리
        document.getElementById("nextMonthBtn").addEventListener("click", nextMonth);
</script>
</body>
</html>
