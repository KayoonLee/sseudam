<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>

<%@ include file="../navigator_footer/counselor_header.jsp" %>

</head>
<body>

<!-- ======= navigator ======= -->
<%@ include file="../navigator_footer/counselor_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%@ include file="../navigator_footer/counselor_sidebar.jsp" %>

    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Profile</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Users</li>
                    <li class="breadcrumb-item active">Profile</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section profile">
            <div class="row" align="center">
                <div class="col-xl-8">
                    <div class="card">
                        <div class="card-body pt-3">
                            <!-- Bordered Tabs -->
                            <ul class="nav nav-tabs nav-tabs-bordered">
                                <li class="nav-item">
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-overview"
                                    onClick="location.href='counselorpage_main'">프로필</button>
                                </li>

                                <li class="nav-item">
                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-change-password"
                                    onClick="location.href='counselorpage_PwUpdateForm'">비밀번호 변경</button>
                                </li>

                            </ul>
 <!-- Change Password Form -->
 <div class="tab-content pt-3" >
   <div class="tab-pane fade show active profile-overview" id="profile-overview">
        <br>

   <form action="myPwUpdate" method="post">
    <input type="hidden" id="email" name="email" value="${myModel.email}">

      <div class="row mb-3">
         <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새로운 비밀번호</label>
             <div class="col-md-8 col-lg-9">
                <input type="password" id="passwd" name="passwd" class="form-control" placeholder="새 비밀번호를 입력하세요">
            </div>
      </div>

      <div class="row mb-3">
            <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">비밀번호 확인</label>
            <div class="col-md-8 col-lg-9">
               <input type="password" id="confirm-newpasswd" name="confirm-newpasswd" class="form-control"
                             placeholder="비밀번호를 다시 입력하세요">
            </div>
      </div>

       <div class="text-center">
           <button type="submit" class="btn btn-primary">변경</button>
       </div>
    </form>

   </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
 $(function(){
    $("form").submit(function(){
          if($("#passwd").val()==""){
                alert("비밀번호를 입력 하세요.");
                $("#passwd").focus();
                return false;
          }
          if($("#confirm-newpasswd").val()==""){
             alert("비밀번호 확인을 입력 하세요.");
             $("#confirm-newpasswd").focus();
             return false;
           }
          if($("#passwd").val() != $("#confirm-newpasswd").val()){
             alert("비밀번호가 일치하지 않습니다.");
             $("#passwd").val("").focus();
             $("#confirm-newpasswd").val("");
             return false;
          }
    });
 });

</script>

</body>
</html>