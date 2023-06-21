<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>자유게시판 목록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.6.0/materia/bootstrap.min.css">
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
    <style>
        body {
            background-color: #fafafa;
        }

        .container {
            margin: 150px auto;
        }
    </style>
</head>
<body>

<%-- tip: 헤더랑 푸터는 소빈님이 작업후에 같다 붙이셔야 합니다. --%>

<%-- 자유게시판 가운데 container--%>
<div class="container">

    <%-- 자유게시판 타이틀 --%>
    <%-- tip: h2 or h1 둘 중에 하나 맘에 드는 거 남기세요. --%>
    <h2 class="text-primary" align="center">게시판 목록</h2><br>
    <h1>자유게시판</h1>
    <p class="lead">자유롭게 글을 작성할 수 있는 자유게시판 입니다.</p>

    <%-- 최신순/조회순/추천순 --%>
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

    <%-- 사이드바 --%>
    <%-- tip: 나중에 사이드바로 처리해야 할 것 같습니다. --%>
    <div>
        <ul>
            <li><a href="freeList?num=${num}&category=0">전체</a></li>
            <li><a href="freeList?num=${num}&category=1">자유</a></li>
            <li><a href="freeList?num=${num}&category=2">질문</a></li>
            <li><a href="freeList?num=${num}&category=3">토론</a></li>
        </ul>
    </div>

    <%-- 검색기능 --%>
    <input class="form-control" id="myInput" type="text" placeholder="Search..">
    <br>

    <%-- 게시판 리스트들 --%>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>번호</th>
            <%-- tip: 컬럼이 어떤거는 7개고 어떤거는 6개여서 게시글 컬럼 주석처리 했습니다. 확인해보시고 수정해주세요. --%>
            <%--<th>게시글</th>--%>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>추천수</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody id="myTable">
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
                    <td>작성자명 출력</td>
                    <td>${board.readcount}</td>
                    <td>${board.recom}</td>
                    <td><fmt:formatDate value="${board.reg_date }"
                                        pattern="yyyy년 MM월 dd일"/></td>
                </tr>
                <c:set var="no" value="${no-1}"/>
            </c:forEach>
        </c:if>
        </tbody>
        <tfoot>
        <tr>
            <th>번호</th>
            <%--<th>게시글</th>--%>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>추천수</th>
            <th>작성일</th>
        </tr>
        </tfoot>
    </table>

    <%-- 검색 select --%>
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

    <c:if test="${!empty m_id }">
        <div align="center">
            <a href="freeInsertForm">글 작성입니다</a>
        </div>
    </c:if>

</div><%-- 컨테이너 end --%>

<%-- 검색창 기능 JavaScript --%>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>

<%--
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-36251023-1']);
	_gaq.push(['_setDomainName', 'jqueryscript.net']);
	_gaq.push(['_trackPageview']);

	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
</script>

<script>
	try {
		fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
			return true;
		}).catch(function(e) {
			var carbonScript = document.createElement("script");
			carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
			carbonScript.id = "_carbonads_js";
			document.getElementById("carbon-block").appendChild(carbonScript);
		});
	} catch (error) {
		console.log(error);
	}
</script>
--%>
</body>
</html>
