<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file = "../header/header.jsp" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${result == 1}">
    <script>
        alert("글이 수정되었습니다");
        location.href="freeList?num=${num}";
    </script>
</c:if>

<c:if test="${result != 1}">
    <script>
        alert("수정 실패!!!!");
        history.go(-1);
    </script>
</c:if>

</body>
</html>