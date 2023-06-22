<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>상담사 예약 테스트</title>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Noto+Sans+KR:wght@100;300;700&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="css/counselor1.css">
    <link rel="stylesheet" type="text/css" href="css/counselor2.css">
    <link rel="stylesheet" type="text/css" href="css/counselor3.css">

<%--
        <link rel="stylesheet" href="/style.b9196a18.css">
        <link rel="stylesheet" href="/header.7e71fc9f.css">
        <link rel="stylesheet" href="/main.54076d02.css">
--%>
</head>
<body>

<div id="All"></div>

<%--<hr>--%>

<%--<header class="header">
    <div class="title-name">
        <h1>상담사 상담 신청</h1>
    </div>

    <nav class="list-navigation">
        <ul class="professorList">
            <li><a href="#" class="proA">누군가</a></li>
            <li><a href="#" class="">who</a></li>
        </ul>
    </nav>
</header>--%>



<%--<header class="header">--%>
<%--    <div class="title-name">--%>
<%--        <h1>학생 상담 신청</h1>--%>
<%--    </div>--%>
<%--    <nav class="list-navigation">--%>
<%--        <ul class="professorList">--%>
<%--            <li><a href="#" class="proA">이준</a></li>--%>
<%--            <li><a href="#" class="proB">선주연</a></li>--%>
<%--            <li><a href="#" class="proC">최수환</a></li>--%>
<%--        </ul>--%>
<%--    </nav>--%>
<%--    <p>상담 가능 시간은 <br><em>오전 10 : 00 ~ 12 : 00, 오후 2 : 00 ~ 4 : 00</em>입니다.<br>--%>
<%--        이외 시간에는 상담이 불가하오니 이 점 유의해주세요.</p>--%>
<%--</header>--%>
<%--<section class="section">--%>
<%--    <div class="content">--%>
<%--        <div class="consult-con">--%>
<%--            <h2>상담내용</h2>--%>
<%--            <ul class="consult-list">--%>
<%--                <li><a href="" class="select01">진로</a></li>--%>
<%--                <li><a href="" class="select02">학업</a></li>--%>
<%--                <li><a href="" class="select03">개인사유</a></li>--%>
<%--                <li><a href="" class="select04">기타 :</a></li>--%>
<%--                <input class="select05" type="text" disabled="" placeholder="기타를 선택하고 입력해주세요.">--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <div class="select-day">--%>
<%--            <h2>상담 날짜 및 시간</h2>--%>
<%--            <div class="monthBtn">--%>
<%--                <div class="mPrevBtn">--%>
<%--                    <span class="prevMonth material-icons">arrow_back_ios</span>--%>
<%--                </div>--%>
<%--                <h3 class="calendarMonth">Jun</h3>--%>
<%--                <div class="mNextBtn">--%>
<%--                    <span class="nextMonth material-icons">arrow_forward_ios</span>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="calendar">--%>
<%--                <div class="calendar-con">--%>
<%--                    <table>--%>
<%--                        <thead class="monthTitle">--%>
<%--                        <tr>--%>
<%--                            <th>Sun</th>--%>
<%--                            <th>Mon</th>--%>
<%--                            <th>Tue</th>--%>
<%--                            <th>Wed</th>--%>
<%--                            <th>Thu</th>--%>
<%--                            <th>Fri</th>--%>
<%--                            <th>Sat</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody class="dayList">--%>
<%--                        <tr></tr>--%>
<%--                        <tr>--%>
<%--                            <td></td>--%>
<%--                            <td></td>--%>
<%--                            <td></td>--%>
<%--                            <td></td>--%>
<%--                            <td class="Ahalf"><p>1</p></td>--%>
<%--                            <td class="pickday"><p>2</p></td>--%>
<%--                            <td class="xday"><p>3</p></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="xday"><p>4</p></td>--%>
<%--                            <td class="pickday"><p>5</p></td>--%>
<%--                            <td class="Ahalf"><p>6</p></td>--%>
<%--                            <td class="pickday"><p>7</p></td>--%>
<%--                            <td class="Ahalf"><p>8</p></td>--%>
<%--                            <td class="pickday"><p>9</p></td>--%>
<%--                            <td class="xday"><p>10</p></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="xday"><p>11</p></td>--%>
<%--                            <td class="pickday"><p>12</p></td>--%>
<%--                            <td class="Ahalf"><p>13</p></td>--%>
<%--                            <td class="pickday"><p>14</p></td>--%>
<%--                            <td class="Ahalf"><p>15</p></td>--%>
<%--                            <td class="pickday"><p>16</p></td>--%>
<%--                            <td class="xday"><p>17</p></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="xday"><p>18</p></td>--%>
<%--                            <td class="pickday"><p>19</p></td>--%>
<%--                            <td class="Ahalf"><p>20</p></td>--%>
<%--                            <td class="pickday"><p>21</p></td>--%>
<%--                            <td class="Ahalf"><p>22</p></td>--%>
<%--                            <td class="pickday"><p>23</p></td>--%>
<%--                            <td class="xday"><p>24</p></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="xday"><p>25</p></td>--%>
<%--                            <td class="pickday"><p>26</p></td>--%>
<%--                            <td class="Ahalf"><p>27</p></td>--%>
<%--                            <td class="pickday"><p>28</p></td>--%>
<%--                            <td class="Ahalf"><p>29</p></td>--%>
<%--                            <td class="pickday"><p>30</p></td>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="select-con">--%>
<%--                <p>오전은 10시부터 12시, 오후는 2시부터 4시까지 상담시간입니다.</p>--%>
<%--                <div class="info"></div>--%>
<%--                <div class="time">--%>
<%--                    <span class="after">오전</span>--%>
<%--                    <span class="before">오후</span>--%>
<%--                </div>--%>

<%--                <div class="emailForm">--%>
<%--                    <span>이메일 입력 :</span>--%>
<%--                    <input class="emailCon" type="email" placeholder="상담 확정 메일을 받을 주소를 입력해주세요.">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<%--<section class="check">
    <button>확인</button>
</section>--%>

<script type="text/javascript" src="js/counselorJS.js"></script>
<%--text/javascript--%>
<%--<script type="module" src="/main.bd289d0c.js"></script>--%>

</body>
</html>

