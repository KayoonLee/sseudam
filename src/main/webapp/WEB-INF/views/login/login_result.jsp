<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 1}">
	<script>
		alert("등록되지 않은 회원 입니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 2}">
	<script>
		alert("회원정보가 틀렸습니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 3}">
	<script>
		alert("가입 심사 중입니다. 심사는 최대 5일 소요됩니다.");
		location = "main_page";
	</script>
</c:if>