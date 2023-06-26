<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>


<html>
<head>
    <title>쪽지 확인</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            caption-side: top;
            text-align: center;
            font-weight: bold;
            color: black;
            padding: 10px;
            margin-bottom: 15px;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

    </style>
    <link href="vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/member.css" rel="stylesheet">

    <script>
        function delete_note(note_num) {
            var note_num = note_num;
            $.ajax({
                url: "deleteNote",
                type: "post",
                data: {note_num: note_num},
                success: function (data) {
                    if (data == 1) {
                        alert("쪽지가 삭제되었습니다");
                        location.href = "noteList";
                    }
                }
            })
        }
    </script>


</head>
<body>
<br>
<div class="pagetitle">
    <h1>쪽지함&nbsp;<i class="ri-mail-send-line"></i></h1>
</div>
<div class="card">
    <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
        <table>
            <tr>
                <th>제목</th>
                <th>${note.subject}</th>
            </tr>
            <tr>
                <th>날짜</th>
                <th>${note.time}</th>
            </tr>
            <tr>
                <th>보낸 사람</th>
                <th>${note.nick}</th>
            </tr>
            <tr>
                <th>받는 사람</th>
                <th>${note.receiver}</th>
            </tr>
            <tr>
                <th>내용</th>
                <th>${note.content}</th>
            </tr>
        </table>
        <div align="center">
            <button type="button" class="btn btn-danger" onclick="delete_note(${note.note_num})">삭제</button>
        </div>
    </div>

</div>


</body>
</html>
