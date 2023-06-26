<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<html>
<head>
    <title>쪽지 확인</title>

    <script>
        function delete_note(note_num){
            var note_num = note_num;
            $.ajax({
                url: "deleteNote",
                type: "post",
                data: {note_num: note_num},
                success: function (data){
                    if(data == 1){
                        alert("쪽지가 삭제되었습니다");
                        location.href="noteList";
                    }
                }
            })
        }

    </script>
</head>
<body>

<div>
    <table>
        <tr>
            <td>제목</td>
            <td>${note.subject}</td>
        </tr>
        <tr>
            <td>날짜</td>
            <td>${note.time}</td>
        </tr>
        <tr>
            <td>보낸 사람</td>
            <td>${note.nick}</td>
        </tr>
        <tr>
            <td>받는 사람</td>
            <td>${note.receiver}</td>
        </tr>
        <tr>
            <td>내용</td>
            <td>${note.content}</td>
        </tr>
    </table>
</div>
<div>
    <button type="button" onclick="delete_note(${note.note_num})">삭제</button>
</div>

</body>
</html>
