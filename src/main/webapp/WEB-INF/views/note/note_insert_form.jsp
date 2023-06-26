<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="../header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 작성 폼</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/main_header.jsp" %>

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="css/member.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>

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

<!-- ======= Navigator ======= -->
<%@ include file="../navigator_footer/main_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/member_sidebar.jsp" %>

<div class="card" style="margin-top: 50px; margin-right: 200px; margin-bottom: 50px; margin-left: 330px">
    <div class="card-body">
        <h6 class="card-title">쪽지 작성</h6>
<form id="frm" name="frm">
    <input type="hidden" name="sender" value="${member.m_id}">

    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">받는 사람</label>
        <div class="col-sm-10">
            <input type="text" id="receiver" name="receiver" maxlength="30" class="form-control">
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
            <input type="text" id="subject" name="subject" maxlength="30" class="form-control">
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-10">
            <textarea type="text" id="content" name="content"
                      class="form-control" style="height: 150px; resize:none" maxlength="2000" >
            </textarea>
        </div>
    </div>
    <div>
        <button type="button" class="btn btn-success" onclick="send_note()">보내기</button>
    </div>
</form>
    </div>
</div>
</body>
</html>