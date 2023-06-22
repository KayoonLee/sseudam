<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <%@ include file="../navigator_footer/main_header.jsp" %>
       <%@ include file="../navigator_footer/intro_counselor_header.jsp" %>
    </head>


    <body id="page-top">
   <!--::네이게이션 start::-->
    <%@ include file="../navigator_footer/main_navigator.jsp" %>
    <%@ include file="../navigator_footer/intro_counselor_navigator.jsp" %>

            <!--모달-->
           <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-lg">
               <div class="modal-content">
                 <div class="modal-header">
                   <h5 class="modal-title" id="exampleModalLabel">쓰담쓰담 상담사 소개</h5>
                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                 </div>
                 <div class="modal-body">
                   <img src="images/intro_counsel.png" width=750 height=750>
                   <img src="images/intro_counsel2.png" width=750 height=750>
                   <img src="images/counsel1.png" width=750 height=750>
                   <img src="images/counsel2.png" width=750 height=750>
                   <img src="images/counsel3.png" width=750 height=750>
                   <img src="images/counsel_over.png" width=750 height=750>
                 </div>
                 <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                 </div>
               </div>
             </div>
           </div>



        <!-- Content section 1-->
        <section id="scroll">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-5"><img width = 500 height= 500 src="images/counsel_icon2.jpg"/></div>
                        <!--<div class="p-5"><img width = 500 height= 500 src="images/counsel2.png"/></div>-->
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h2 class="display-4">문제를 공유해요!</h2>
                            <p>반려동물과 주인 사이의 강한 유대감과 안정된 관계를 구축하는 데 있어서 노하우와 숙련된 기술을 보유하고 있습니다.
                            저희는 반려동물과 함께하는 모든 이들에게 최고의 돌봄과 지원을 제공하기 위해 열심히 노력하고 있습니다.
                            고객님과 반려동물을 위한 전문 상담을 통해 더 나은 삶의 질과 행복한 동거를 실현하는 데 도움을 드리겠습니다.
                            함께 당신의 반려동물에게 최고의 삶을 선물해보세요!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 2-->
        <section>
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="p-5"><img class="img-fluid rounded-circle" src="images/counsel_icon1.jpg" /></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <h2 class="display-4">함께 해결해요!</h2>
                            <p> 쓰담쓰담은 노하우를 바탕으로 반려동물의 특성과 상황을 꼼꼼히 분석하고, 숙련된 기술과 인간친화적인 접근법으로 개별적인 상담을 제공합니다.
                            쓰담쓰담의 목표는 주인과 반려동물 사이의 원활한 소통과 긍정적인 상호작용을 도모하여, 더욱 깊은 신뢰와 애정이 교감할 수 있는 관계를 구축하는 것입니다.
                            반려동물을 위한 가장 적합한 해결책을 찾아 나가는 여정에 참여해 보세요.
                            저희와 함께라면, 보다 행복하고 채워진 반려동물의 삶을 만들 수 있습니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 3-->
        <section>
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-5"><img class="img-fluid rounded-circle" src="images/counsel_icon2.jpg"/></div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h2 class="display-4">더 나은 동물의 삶을 위하여!</h2>
                            <p>상담사의 공통된 목표는 반려동물이 가장 건강하고 행복하게 지내는 것입니다.
                            우리는 노하우와 숙련된 기술을 바탕으로 개개인의 반려동물에게 맞춤형 조언과 지침을 제공하여 문제 해결과 긍정적인 변화를 이끌어내고자 합니다.
                            반려동물과 함께하는 시간이 더욱 의미 있는 것으로 만들기 위해, 상담사로서 항상 최선을 다할 것을 약속드립니다.
                            신뢰할 수 있는 상담사와 함께 반려동물의 행복을 추구해보세요. 쓰담쓰담은 당신을 위해 여기에 있습니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-black">
            <div class="container px-5"><p class="m-0 text-center text-white small">Copyright &copy; SSEUDAM 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
