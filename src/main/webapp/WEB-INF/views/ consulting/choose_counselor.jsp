
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="background-color: white; padding: 20px;">
  <h3>상담 예약하기</h3>

  <form action="상담_예약_처리_페이지" method="POST">
    <p>상담사 선택:</p>

    <!-- for:each 문을 사용하여 상담사 데이터를 반복하여 표출 -->
    <!-- 데이터가 배열 'counselors'에 저장되어 있다고 가정합니다 -->
    <!-- counselors 배열의 각 항목은 객체로 상담사의 정보를 포함합니다 -->
    <!-- 객체의 'id'는 상담사의 고유 식별자, 'name'은 상담사의 이름입니다 -->
    <!-- 이 예시에서는 'id'를 라디오 버튼의 값으로 사용하고, 'name'을 라벨에 표시합니다 -->
    <div>
      <input type="radio" id="counselor1" name="counselor" value="1">
      <label for="counselor1">상담사 1</label>
      <a href="상담_시간_결정_페이지">상담 시간 결정하기</a>
    </div>

    <div>
      <input type="radio" id="counselor2" name="counselor" value="2">
      <label for="counselor2">상담사 2</label>
      <a href="상담_시간_결정_페이지">상담 시간 결정하기</a>
    </div>

    <!-- for:each 문을 사용하여 상담사 데이터를 반복하여 표출 -->
    <!-- counselors 배열의 각 항목은 객체로 상담사의 정보를 포함합니다 -->
    <!-- 객체의 'id'는 상담사의 고유 식별자, 'name'은 상담사의 이름입니다 -->
    <!-- 객체의 속성을 실제 데이터 속성으로 변경해주셔야 합니다 -->

    <div for:each="counselor in counselors">
      <input type="radio" id="{counselor.id}" name="counselor" value="{counselor.id}">
      <label for="{counselor.id}">{counselor.name}</label>
    </div>
  </form>
</div>


</body>
</html>
