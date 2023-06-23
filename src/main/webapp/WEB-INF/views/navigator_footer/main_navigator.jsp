<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

</head>

<body>
<!--::header start::-->
   <header class="main_menu">
        <div class="sub_menu">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_right_content">

                        <span>Welcome To SSEUDAM</span>


                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_social_icon">

                        <c:if test="${empty sessionScope.member.m_id and empty sessionScope.admin.a_email}">
                            <a href="separate_join">회원가입</a>
                            <a href="login_form">로그인</a>
                        </c:if>

                        <c:if test="${!empty sessionScope.member.m_id or !empty sessionScope.admin.a_email}">
                            <a href="logout">로그아웃</a>
                        </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                        <!--로고-->
                            <a class="navbar-brand" href="main_page"> <img src="./images/mainlogo.png" width=100 height=50> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                 <!--상단 메뉴 카테고리-->
                                    <li class="nav-item">
                                        <a class="nav-link" href="main_page">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="intro_counsel">쓰담쓰담이란</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="counsel_list">상담사 소개</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="hasAnimal">상담신청</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            커뮤니티
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="freeList?num=2">자유게시판</a>
                                            <a class="dropdown-item" href="single-blog.html">고객 후기</a>
                                        </div>
                                    </li>
                                   <c:if test="${!empty sessionScope.member.m_id or !empty sessionScope.admin.a_email}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            My Page
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1" href="#">

                                        <c:if test="${member.identifier == 1}">
                                            <a class="dropdown-item" href="memberpage_main">일반회원 마이페이지</a>
                                        </c:if>
                                        <c:if test="${member.identifier == 2}">
                                            <a class="dropdown-item" href="counselorpage_main">상담사 마이페이지</a>
                                        </c:if>
                                        <c:if test="${!empty admin.a_email}">
                                            <a class="dropdown-item" href="adminMain">관리자 페이지</a>
                                        </c:if>
                                        </div>
                                    </li>
                                  </c:if>
                                </ul>
                            </div>
                            <c:if test="${!empty sessionScope.member.m_id}">
                            <a href="#" class="btn_1 d-none d-lg-block">${sessionScope.member.nick} 님</a>
                            </c:if>
                            <c:if test="${!empty sessionScope.admin.a_email}">
                            <a href="#" class="btn_1 d-none d-lg-block">${sessionScope.admin.name} 님</a>
                             </c:if>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header part(헤더 끝) end-->

</body>
</ht