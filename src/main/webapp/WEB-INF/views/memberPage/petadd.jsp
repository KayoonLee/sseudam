<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${result>0 }">
    <script>
        alert("작성 성공");
        location.href="memberpage_mypet";
    </script>
</c:if>
<c:if test="${result<=0 }">
    <script>
        alert("작성 실패");
        history.go(-1);
    </script>
</c:if>
</body>
</html>
