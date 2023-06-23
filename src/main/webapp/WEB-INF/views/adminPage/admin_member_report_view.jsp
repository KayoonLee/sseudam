<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header/header.jsp" %>


<html>
<head>
    <title>admin_member_report_view</title>

    <script>
        function reportBoardView(num, board_num) {
            $("#boardFrame").load("freeView?num=" + num + "&board_num=" + board_num);
            // $.ajax({
            //     type: "get",
            //     url: "freeView",
            //     data: {num: num, board_num: board_num},
            //     success: function (response) {
            //         alert(response);
            //         $("#boardFrame").load(response);
            //     }
            // });
        }

    </script>
</head>
<body>

<div class="pagetitle">
    <h1>신고받은 회원관리</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">신고받은 회원관리</a></li>
            <%-- adminCatPage --%>
            <%--<li class="breadcrumb-item">하위페이지</li>--%>
        </ol>
    </nav>
</div><%-- End Page Title --%>

<div class="card">
    <div class="card-body">
<table id="example" class="table is-striped" style="width:100%">
    <tbody>
    <tr>
        <div class="card-title" align="center">신고내용</div>
    </tr>
    <tr>
    <%--<tr id="${m_id}" value="${m_id}">--%>
        <td onclick="reportBoardView(${report_board.num}, ${report_board.board_num})">${report_board.report_content}
            <button type="button" class="btn btn-outline-primary">
                글조회
            </button>
        </td>
    </tr>
    </tbody>
</table>
    </div>
</div>

<div id="boardFrame"></div>

</body>
</html>