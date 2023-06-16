<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%--
<script>
   location.href="home.do";
</script>
--%>

<!DOCTYPE html>
<html>
<head>
    <title>관리자/일반회원/상담사</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <style>
        body, h1, h5 {
            font-family: "Raleway", sans-serif
        }

        body, html {
            height: 100%
        }

        .bgimg {
            background-image: url('./images/muzik2.jpg');
            min-height: 100%;
            background-position: center;
            background-size: cover;
        }
    </style>
</head>
<body>

<div class="bgimg w3-display-container w3-text-white">
    <div class="w3-display-middle w3-jumbo">
        <p>반려동물 상담페이지</p>
        <div class="w3-display-middle w3-container"></div>
        <a href="main_page" class="w3-large">메인페이지 바로가기</a>
    </div>
    <div class="w3-display-topleft w3-container w3-xlarge">
        <p>
            <button onclick="document.getElementById('contact').style.display='block'" class="w3-button w3-black">
                contact
            </button>
        </p>
    </div>
    <div class="w3-display-bottomleft w3-container">
        <p class="w3-xlarge">프로젝트 준비기간: 2023-05-31 ~ 2023-06-28</p>
        <p class="w3-large">중앙정보처리학원</p>
        <p>powered by 모든 주인님들 &amp; 모든 집사들</p>
    </div>
</div>


<!-- Contact Modal -->
<div id="contact" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-black">
            <span onclick="document.getElementById('contact').style.display='none'"
                  class="w3-button w3-display-topright w3-large">x</span>
            <h1>Contact</h1>
        </div>
        <div class="w3-container">
            <p>메시지를 남겨주세요: </p>
            <form action="/action_page.php" target="_blank">
                <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required name="Name">
                </p>
                <p><input class="w3-input w3-padding-16 w3-border" type="number" placeholder="How many animal" required
                          name="People"></p>
                <p><input class="w3-input w3-padding-16 w3-border" type="datetime-local" placeholder="Date and time"
                          required name="date" value="2020-11-16T20:00"></p>
                <p><input class="w3-input w3-padding-16 w3-border" type="text"
                          placeholder="Message \ Special requirements" required name="Message"></p>
                <p>
                    <button class="w3-button" type="submit">메시지 전송</button>
                </p>
            </form>
        </div>
    </div>
</div>
<%-- 세욱이 추가한거 --%>

<div><a href="freeList">자유게시판 이동.</a></div>

<%-- 찬근 추가한거 --%>
<div><a href="hasAnimal">상담예약서 작성</a></div>



<%-- 은희 추가한거 --%>
<div><a href="memberMain">일반회원 마이페이지</a></div>
<div><a href="counselorMain">상담사회원 마이페이지</a></div>

<%-- 가윤 추가한거 --%>
<div><a href="adminMain">관리자 페이지 이동</a></div>
</body>
</html>
