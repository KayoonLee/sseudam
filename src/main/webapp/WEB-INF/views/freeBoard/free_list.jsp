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

        .search-bar {
            min-width: 360px;
            padding: 0 20px;
        }

        @media (max-width: 1199px) {
            .search-bar {
                position: fixed;
                top: 50px;
                left: 0;
                right: 0;
                padding: 20px;
                box-shadow: 0px 0px 15px 0px rgba(1, 41, 112, 0.1);
                background: white;
                z-index: 9999;
                transition: 0.3s;
                visibility: hidden;
                opacity: 0;
            }
        }

        .search-form {
            width: 30%;
        }

        .search-select {
            width: 30px;
        }


        .search-form input {
            border: 0;
            font-size: 14px;
            color: #012970;
            border: 1px solid rgba(1, 41, 112, 0.2);
            padding: 7px 38px 7px 8px;
            border-radius: 3px;
            transition: 0.3s;
            width: 100%;
        }

        .search-form input:focus,
        .search-form input:hover {
            outline: none;
            box-shadow: 0 0 10px 0 rgba(1, 41, 112, 0.15);
            border: 1px solid rgba(1, 41, 112, 0.3);
        }

        .search-form button {
            border: 0;
            padding: 0;
            margin-left: -30px;
            background: none;
        }

        .search-form button i {
            color: #012970;
        }

        .search-select{
            width: 40%;
            height: 35px;
            border-radius: 5px;
            border-color: #8b95a5;
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
                location.href = `freeList?num=${num}&category=${category}&sort=board_num`;
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
                        <option value="latest" <c:if test="${sort == 'latest'}">selected="selected"></c:if>>최신순</option>
                        <option value="readcount" <c:if test="${sort == 'readcount'}">selected="selected"></c:if>>조회순</option>
                        <option value="recom" <c:if test="${sort == 'recom'}">selected="selected"></c:if>>추천순</option>
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
                            <td width="100">${no}</td>
                            <td width="500"><a href="freeView?num=${board.num}&board_num=${board.board_num}
                           &pageNum=${pageNum}">
                                    ${board.subject}</a></td>
                            <td width="250"><c:if test="${not empty board.profile_num}">
                                <img src="./memberImg/${board.profile_name}" class="profile_image"></c:if>
                                    ${board.nick}</td>
                            <td width="100">${board.readcount}</td>
                            <td width="100">${board.recom}</td>
                            <td width="250"><fmt:formatDate value="${board.reg_date }"
                                                pattern="yyyy년 MM월 dd일"/></td>
                        </tr>
                        <c:set var="no" value="${no-1}"/>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>



    <div class="search-bar" align="center">
        <form action="freeList" class="search-form d-flex align-items-center">
            <input type="hidden" name="num" value="${num}">
            <input type="hidden" name="category" value="${category}">
            <select name="search" class="search-select" aria-label="Default select example">
                <option value="subject" ${search=='subject' ? 'selected' : ''}>제목</option>
                <option value="content" ${search=='content' ? 'selected' : ''}>내용</option>
                <option value="subcon" ${search=='subcon' ? 'selected' : ''}>제목+내용</option>
            </select>
            <input type="text" name="keyword">
            <button type="submit" value="확인"><i class="bi bi-search"></i></button>
        </form>
    </div>
    <br><br>


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
