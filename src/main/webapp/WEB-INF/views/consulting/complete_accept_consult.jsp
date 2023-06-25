<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Consultation Deletion Complete</title>
  <script>
    function redirectToMypage() {
      window.location.href = "get_Consult_Details?paper_num=${paper_num}";
    }

    window.onload = function() {
      alert("상담을 수락했습니다.");
      redirectToMypage();
    };
  </script>
</head>
<body>
</body>
</html>
