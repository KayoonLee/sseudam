<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>
    <title>Title</title>
    <%@ include file="../navigator_footer/member_header.jsp" %>


    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>

</head>
<body>
<!-- ======= Header ======= -->

<%@ include file="../navigator_footer/counselor_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/member_sidebar.jsp" %>



    <main id="main" class="main">
        <div class="pagetitle">
            <h1>내가 좋아요한 글</h1>
        </div><!-- End Page Title -->
        <br>
        <div class="card">
            <div class="card-body">
                <input type="hidden" id="num" name=num value="${fboard.num }">
                <input type="hidden" id="board_num" name=board_num value="${fboard.board_num }">
                <input type="hidden" id="m_id" name="m_id" value="${member.m_id }">
                <br>
                <table id="example" class="table is-striped" style="width:100%">
                    <thead>
                    <tr>
                        <th>구분</th>
                        <th>게시글 제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>추천수</th>
                        <th>작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty mylikeList}">
                    <tr>
                        <td>추천한 글이 없습니다.</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </c:if>
                    <c:forEach var="board" items="${mylikeList}">
                    <tr onclick="location.href='freeView?num=${board.num}&board_num=${board.board_num}&pageNum=${pageNum}'" style="cursor: pointer;">
                        <td>
                        <c:if test="${board.category == '1'}">자유</c:if>
                        <c:if test="${board.category == '2'}">질문</c:if>
                        <c:if test="${board.category == '3'}">토론</c:if>
                        </td>
                        <td>${board.subject}</td>
                        <td>${board.nick}</td>
                        <td>${board.readcount}</td>
                        <td>${board.recom}</td>
                        <td><fmt:formatDate value="${board.reg_date}"
                                            pattern="yyyy년 MM월 dd일"/></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                  <tfoot>
                    <tr>
                       <th>구분</th>
                       <th>게시글 제목</th>
                       <th>작성자</th>
                       <th>조회수</th>
                       <th>추천수</th>
                       <th>작성일</th>
                    </tr>
                  </tfoot>

                </table>
            </div>
        </div>
    </main>
</body>
</html>

