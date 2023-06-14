<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<head>
    <title>Admin_Page</title>

    <!-- ======= Header ======= -->
    <%@ include file="../navigator_footer/admin_header.jsp" %>

    <!-- ======= Table ======= -->
    <%@ include file="../navigator_footer/admin_table.jsp" %>

    <%-- 관리자 메인화면 첫화면에 현황을 알려주는 대시보드 띄움 --%>
    <script>
        <%-- 관리자 첫화면 = 대시보드(회원수 통계) --%>
        $(function() {
            $("#adminmain").load("adminDashboard"); // 아래의 태그 안의 id="" // load(Controller 에서 사용하는 매핑값)
            //return false;

            <%-- 대시보드 --%>
            $("#ad_dashboard").click(function() {
                $("#adminmain").load("adminDashboard");
            });

            <%-- 일반회원 --%>
            $("#ad_member_page").click(function() {
                $("#adminmain").load("adminMemberPage");
            });

            <%-- 신고받은 회원관리 --%>
            $("#ad_member_report").click(function() {
                $("#adminmain").load("adminMemberReport");
            });

            <%-- 반려동물 -> 강아지 --%>
            $("#ad_dog_page").click(function() {
                $("#adminmain").load("adminDogPage");
            });

            <%-- 반려동물 -> 고양이 --%>
            $("#ad_cat_page").click(function() {
                $("#adminmain").load("adminCatPage");
            });

            <%-- 상담사 -> 상담사 정보 --%>
            $("#ad_counselor_page").click(function() {
                $("#adminmain").load("adminCounselorPage");
            });

            <%-- 상담사 -> 상담사 신청관리 테스트중 --%>
            $("#ad_counselor_apply").click(function() {
                alert("ㅋ")
                $("#adminmain").load("adminCounselorApply")
            });

            <%-- 관리자 프로필 --%>
            $("#ad_profile").click(function() {
                $("#adminmain").load("adminProfile");
            });

            <%-- 관리자 등록 --%>
            $("#ad_register").click(function() {
                $("#adminmain").load("adminRegister");
            });
        });
    </script>

</head>
<body>

<!-- ======= Navigator ======= -->
<%--<jsp:include page="../navigator_footer/admin_navigator.jsp"></jsp:include>--%>
<%@ include file="../navigator_footer/admin_navigator.jsp" %>

<!-- ======= Sidebar ======= -->
<%--<jsp:include page="../navigator_footer/admin_sidebar.jsp"></jsp:include>--%>
<%@ include file="../navigator_footer/admin_sidebar.jsp" %>

<!-- ======= Dashboard ======= -->
<main id="main" class="main">

    <div id="adminmain"></div>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%--<jsp:include page="../navigator_footer/admin_footer.jsp"></jsp:include>--%>
<%@ include file="../navigator_footer/admin_footer.jsp" %>

</body>
</html>
