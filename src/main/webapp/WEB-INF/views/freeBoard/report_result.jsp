<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${result == 1}">
    <script>
        alert("신고를 작성하였습니다.");
        window.close();
    </script>
</c:if>

<c:if test="${result != 1}">
    <script>
        alert("신고가 작성되지 않았습니다.");
    </script>
</c:if>

</body>
</html>