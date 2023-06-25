<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 작성 폼</title>

    <script>
        function send_note() {

            var formData = $("#frm").serialize();


            if($.trim($("#receiver").val()) == ""){
                alert("받는 사람을 적어주세요");
                return false;
            }
            if($.trim($("#subject").val()) == ""){
                alert("제목을 적어주세요");
                return false;
            }
            if($.trim($("#content").val()) == ""){
                alert("내용을 적어주세요");
                return false;
            }

            $.ajax({
                url: "sendNote",
                type: "post",
                data: formData,
                success: function (response) {
                    if(response == 12){
                        alert("해당 닉네임을 가진 회원이 존재하지 않습니다");
                        return false;
                    }else if(response == 1){
                        alert("쪽지를 보냈습니다");
                        location.reload();
                    }
                }
            });
        }

    </script>

</head>
<body>
<form id="frm" name="frm">
    <input type="hidden" name="sender" value="${member.m_id}">

    <table>
        <tr>
            <td>받는 사람</td>
            <td><input type="text" id="receiver" name="receiver" maxlength="30"></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" id="subject" name="subject" maxlength="30"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="content" id="content"></textarea></td>
        </tr>
    </table>
    <div>
        <button type="button" onclick="send_note()">보내기</button>
    </div>
</form>
</body>
</html>