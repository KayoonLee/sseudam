
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>상담 예약서</title>
</head>


<body>
<h1>상담 예약확인서</h1>

<form method="POST">
  <input type="hidden" name="paper_num" value="${counselpaper.paper_num}">

  <label for="name">상담사이름:</label>
  <input type="text" id="con_name" name="con_name" value = "${counselor.name}" readonly>
  <input type="hidden" name="c_id" value="${counselor.m_id}">
  <br>
  <label for="name">이름:</label>
  <input type="text" id="name" name="name" value="${member.name}" readonly>
  <input type="hidden" name="g_id" value="${member.m_id}">
  <br>
  <label for="p_id">동물이름:</label>
  <input type="text" id="p_id" name="p_id" value="${pet.animal}" readonly>
  <br>
  <label for="request_times">날짜 및 시간 선택:</label>
  <input type="datetime-local" id="request_times" name="request_times" value="${counselpaper.request_time}" required><br>
  <label for="purpose">상담목적:</label>
  <input type="text" id="purpose" name="purpose" value="${counselpaper.purpose}" readonly>
  <br>
  <label for="reason">상담 사유:</label>
  <textarea id="reason" name="reason" rows="5" cols="50" maxlength="2000" required>${counselpaper.reason}</textarea>
  <br>
  <label for="wish_list">요청사항:</label>
  <textarea id="wish_list" name="wish_list" rows="5" cols="50" maxlength="2000" required>${counselpaper.wish_list}</textarea>
  <br>
  <a href="confirm_Consult"><button>상담 신청 수락하기</button></a>  &nbsp
  <a href="delete"><button>상담 취소하기</button></a>
</form>
</body>
</html>