<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>

</head>
<body>

<form action="freeList">
<select name="search">
	<option value="subject"
		<c:if test="${search=='subject'}">selected="selected" </c:if>>제목</option>
		<option value="content"
			<c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
		<option value="subcon"
			<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select>
			<input type="text" name="keyword"> <input type="submit" value="확인">
</form>

<a href="freeInsertForm">글작성</a>

</body>
</html>

