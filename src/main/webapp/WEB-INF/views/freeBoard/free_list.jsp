<%@ page language="java" pageEncoding="UTF-8" %>
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

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>


    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/main_header.jsp" %>

    <script>
        function setActiveButton(buttonId) {
            // 현재 활성화된 버튼의 active 클래스 제거
            var activeButton = document.querySelector('.nav-link.active');
            activeButton.classList.remove('active');
            activeButton.setAttribute('aria-selected', 'false');

            // 선택한 버튼에 active 클래스 추가
            var selectedButton = document.getElementById(buttonId);
            selectedButton.classList.add('active');
            selectedButton.setAttribute('aria-selected', 'true');
        }

    </script>


    <script>
        function handleOptionChange(selectElement) {
            var selectedValue = selectElement.value;
            var num = "${num}"; // 적절한 값으로 대체해야 함
            var category = "${category}"; // 적절한 값으로 대체해야 함

            // 선택된 값에 따라 페이지 이동 처리
            if (selectedValue === "latest") {
                location.href = `freeList?num=${num}&category=${category}&sort=latest`;
            } else if (selectedValue === "readcount") {
                location.href = `freeList?num=${num}&category=${category}&sort=readcount`;
            } else if (selectedValue === "recom") {
                location.href = `freeList?num=${num}&category=${category}&sort=recom`;
            }
        }
    </script>


</head>
<body>
<!-- ======= Navigator ======= -->
<%@ include file="../navigator_footer/main_navigator.jsp" %>

<div>
    <h2 class="text-primary" align="center">게시판 목록</h2>

    <p></p>

    <div class="card" style="margin:50px">
        <div class="card-body">
            <br>
            <div>
                <div style="text-align:left; margin-left: 2em"> 총 <b>${total }</b>개의 글이 있습니다!</div>
            </div>
            <br>
            <div class="row mb-3">
                <div class="col-2">
                    <select class="form-select" aria-label="Default select example" onchange="handleOptionChange(this)">
                        <option value="latest">최신순</option>
                        <option value="readcount">조회순</option>
                        <option value="recom">추천순</option>
                    </select>
                </div>
            </div>




            <div class="d-flex justify-content-center">
                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-home-button" data-bs-toggle="pill"
                                data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                aria-selected="true"
                                onclick="setActiveButton('pills-home-button'); location.href='freeList?num=${num}&category=0'">
                            전체
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-button" data-bs-toggle="pill"
                                data-bs-target="#pills-free" type="button" role="tab" aria-controls="pills-free"
                                aria-selected="false"
                                onclick="setActiveButton('pills-profile-button'); location.href='freeList?num=${num}&category=1'">
                            자유
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-contact-button" data-bs-toggle="pill"
                                data-bs-target="#pills-question" type="button" role="tab" aria-controls="pills-question"
                                aria-selected="false"
                                onclick="setActiveButton('pills-contact-button'); location.href='freeList?num=${num}&category=2'">
                            질문
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-debate-button" data-bs-toggle="pill"
                                data-bs-target="#pills-talk" type="button" role="tab" aria-controls="pills-talk"
                                aria-selected="false"
                                onclick="setActiveButton('pills-debate-button'); location.href='freeList?num=${num}&category=3'">
                            토론
                        </button>
                    </li>
                </ul>
            </div>

            <c:if test="${!empty member.m_id }">
                <div align="right">
                    <button type="button" class="btn btn-outline-primary" onclick="location.href='freeInsertForm'">글작성
                    </button>
                </div>
                <br>
            </c:if>


            <!-- Table with hoverable rows -->
            <table class="table table-hover">
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
    </div>

    <form action="freeList" align="center">
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
    <br>


</div>
</div>
<!-- ======= Footer ======= -->
<%@ include file="../navigator_footer/main_footer.jsp" %>
</body>
</html>
