<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Consultation Deletion Complete</title>
  <script>
    function redirectToMypage() {
      window.location.href = "counselorpage_request";
    }

    window.onload = function() {
      alert("상담을 취소했습니다.");
      redirectToMypage();
    };
  </script>
</head>
<body>
</body>
</html>