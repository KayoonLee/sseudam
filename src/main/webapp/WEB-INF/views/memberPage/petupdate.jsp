<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2023-06-15
  Time: 오전 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${result > 0 }">
    <script type="text/javascript">
        alert("수정 완료");
        location.href="memberpage_mypet"
        console.log("여기까지")
    </script>
</c:if>
<c:if test="${result <= 0 }">
    <script type="text/javascript">
        alert("수정 실패");
        history.go(-1);
    </script>
</c:if>

</body>
</html>
