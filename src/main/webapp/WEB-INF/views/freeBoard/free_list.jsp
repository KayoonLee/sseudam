<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판 목록</title>

    <!-- Image CSS -->
    <link rel="stylesheet" href="css/image_image.css">
    <style>
        .profile_image {
            width: 30px;
            height: 30px;
        }
    </style>
</head>
<body>

<div>
    <h2 class="text-primary" align="center">게시판 목록</h2>
    <div>
        <div style="text-align:left; margin-left: 2em"> 총 <b>${total }</b>개의 글이 있습니다!</div>
        <div class="btn-group">
            <button type="button" class="btn btn-outline-success"
                    onClick="location.href='freeList?num=${num}&category=${category}'">최신순
            </button>
            <button type="button" class="btn btn-outline-success" onClick=
                    "location.href='freeList?num=${num}&category=${category}&sort=readcount'">조회순
            </button>
            <button type="button" class="btn btn-outline-success" onClick=
                    "location.href='freeList?num=${num}&category=${category}&sort=recom'">추천순
            </button>
        </div>
    </div>
    <div>
        <ul>
            <li><a href="freeList?num=${num}&category=0">전체</a></li>
            <li><a href="freeList?num=${num}&category=1">자유</a></li>
            <li><a href="freeList?num=${num}&category=2">질문</a></li>
            <li><a href="freeList?num=${num}&category=3">토론</a></li>
        </ul>
    </div>
    <p></p>

    <div class="container" align="center">
        <table>
            <thead>
            <tr>
                <th>번호</th>
                <th>게시글 제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>추천수</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${empty list}">
                <tr align="center">
                    <td colspan="6">데이터가 없습니다</td>
                </tr>
            </c:if>

            <c:if test="${not empty list}">
                <c:set var="no" value="${number}"/>
                <c:forEach var="board" items="${list }">
                    <tr>
                        <td>${no}</td>
                        <td><a href="freeView?num=${board.num}&board_num=${board.board_num}
                           &pageNum=${pageNum}">
                                ${board.subject}</a></td>
                        <td><c:if test="${not empty board.profile_num}">
                            <img src="./memberImg/${board.profile_name}" class="profile_image"></c:if>
                        ${board.nick}</td>
                        <td>${board.readcount}</td>
                        <td>${board.recom}</td>
                        <td><fmt:formatDate value="${board.reg_date }"
                                            pattern="yyyy년 MM월 dd일"/></td>
                    </tr>
                    <c:set var="no" value="${no-1}"/>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>

    <form action="freeList">
        <input type="hidden" name="num" value="${num}">
        <input type="hidden" name="category" value="${category}">
        <select name="search">
            <option value="subject" ${search=='subject' ? 'selected' : ''}>제목</option>
            <option value="content" ${search=='content' ? 'selected' : ''}>내용</option>
            <option value="subcon" ${search=='subcon' ? 'selected' : ''}>제목+내용</option>
        </select>
        <input type="text" name="keyword">
        <input type="submit" value="확인">
    </form>


    <c:if test="${not empty keyword}">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:if test="${pp.startPage > pp.pagePerBlk }">
                    <li class="page-item"><a class="page-link"
                                             href="freeList?num=${num}&category=${category }&pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a>
                    </li>
                </c:if>

                <c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
                    <c:if test="${pp.currentPage==i}">
                        <li class="page-item active" aria-current="page">
                            <a class="page-link"
                               href="freeList?num=${num}&category=${category }&pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
                        </li>
                    </c:if>

                    <c:if test="${pp.currentPage!=i}">
                        <li class="page-item">
                            <a class="page-link"
                               href="freeList?num=${num}&category=${category }&pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
                        </li>
                    </c:if>

                </c:forEach>

                <c:if test="${pp.endPage < pp.totalPage}">
                    <li>
                        <a href="freeList?num=${num}category=${category }&&pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </c:if>

    <c:if test="${empty keyword}">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:if test="${pp.startPage > pp.pagePerBlk }">
                    <li class="page-item"><a class="page-link"
                                             href="freeList?num=${num}&category=${category }&pageNum=${pp.startPage - 1}">이전</a>
                    </li>
                </c:if>


                <c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
                    <c:if test="${pp.currentPage==i}">
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#">${i}</a>
                        </li>
                    </c:if>

                    <c:if test="${pp.currentPage!=i}">
                        <li class="page-item">
                            <a class="page-link" href="freeList?num=${num}&category=${category }&pageNum=${i}">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <c:if test="${pp.endPage < pp.totalPage}">
                    <li class="page-item"><a class="page-link"
                                             href="freeList?num=${num}&category=${category }&pageNum=${pp.endPage + 1}">다음</a>
                    </li>
                </c:if>

            </ul>
        </nav>
    </c:if>

    <c:if test="${!empty member.m_id }">
        <div align="center">
            <a href="freeInsertForm">글 작성입니다</a>
        </div>
    </c:if>
</div>
</div>

</body>
</html>
