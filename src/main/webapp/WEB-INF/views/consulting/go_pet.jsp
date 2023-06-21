
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
  // 반려동물 등록 여부를 확인하는 함수
  function checkPetRegistration() {
    const isPetRegistered = false;

    return isPetRegistered;
  }

  // 페이지 로드 시 실행되는 함수
  function onPageLoad() {
    if (!checkPetRegistration()) {
      alert("먼저 반려동물을 등록해주세요.");
      // 메인 페이지로 이동하는 로직
      window.location.href = history.back(-1);
    }
  }

  // 페이지 로드 시 onPageLoad 함수 실행
  window.addEventListener("load", onPageLoad);



</script>

<body>

</body>
</html>
