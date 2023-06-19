<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file = "../header/header.jsp" %>


<html>
<head>
    <title>admin_member_report_view</title>

    <script>
        function reportBoardView(num, board_num) {
            $("#boardFrame").load("freeView?num="+num+"&board_num="+board_num);
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
<!-- ===============수정중=================== -->
<table id="example" class="table is-striped" style="width:100%">
    <tbody>
        <tr>
            <td>신고 내용</td>
        </tr>
        <tr id="${m_id}" value="${m_id}" >
            <td onclick="reportBoardView(${report_board.num}, ${report_board.board_num})">${report_board.report_content}
                <button type="button" >
                    글보러 가기</button></td>
        </tr>
    </tbody>
</table>
<div id="boardFrame"></div>

</body>
</html>