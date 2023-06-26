<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

${count}
<div>
    <input type="hidden" id="count" value="${count}">
</div>
</body>
<c:if test="${result == 1}">
    <script>
        var count = document.getElementById("count").value;
        console.log(count);
        // alert(count);
        alert("신고를 작성하였습니다.");
        if (count == 1) {
            <%--location.href="freeList?num=${num}";--%>
            window.close();
            window.opener.location.href = "freeList?num=${num}";
        } else if (count == null) {
            // window.close();
        }
    </script>
</c:if>

<c:if test="${result != 1}">
    <script>
        alert("신고가 작성되지 않았습니다.");
    </script>
</c:if>
</html>