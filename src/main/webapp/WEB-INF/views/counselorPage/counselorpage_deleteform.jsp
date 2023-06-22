<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2023-06-10
  Time: 오후 8:43
  To change this template use File | Settings | File Templates.
--%>
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
                                    onClick="location.href='memberpage_main'">프로필</button>
                                </li>

                            </ul>
 <!-- 탈퇴폼 -->
 <div class="tab-content pt-3" >
   <div class="tab-pane fade show active profile-overview" id="profile-overview">
        <br>

   <form action="counsel_delete" method="post" name="myform" onSubmit="return check()">
    <input type="hidden" id="email" name="email" value="${myModel.email}">
    <input type="hidden" name="passwd2" value="${myModel.passwd}">
      <div class="row mb-3">
         <label for="password" class="col-md-4 col-lg-3 col-form-label">비밀번호 확인</label>
             <div class="col-md-8 col-lg-9">
                <input type="password" id="passwd" name="passwd" class="form-control" placeholder="비밀번호를 입력하세요">
            </div>
      </div>

       <div class="text-center">
           <button type="submit" class="btn btn-danger">탈퇴하기</button>
       </div>
    </form><!-- End Form -->

   </div>
</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
 function check(){
    if(document.myform.passwd.value == ""){
       alert("비밀번호를 입력하세요.");
       document.myform.passwd.focus();
       return false;
    }

    if(document.myform.passwd.value != document.myform.passwd2.value){
       alert("비밀번호가 일치하지 않습니다.");
       document.myform.passwd.value = "";
       return false;
    }
 }
</script>

</body>
</html>