<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/css/admin/core.css">

<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<style>
.customTable, .customTable th, .customTable td {
   border: 1px solid black;
   padding: 10px;
   /* ... 원하는 스타일 추가 ... */
}

body {
   font-family: Arial, sans-serif;
   padding: 20px;
   background-color: #f4f4f4;
   font-size: 18px;
}

h1 {
   text-align: center;
   margin-bottom: 50px;
}

table {
   width: 100%;
   max-width: 1300px;
   margin: 0 auto;
   border-collapse: collapse;
}

table, th, td {
   border: 1px solid #dddddd;
}

th, td {
   padding: 12px 15px;
   text-align: left;
   text-align: center;
}

thead {
   background-color: #f2f2f2;
}

tr:hover {
   background-color: #f5f5f5;
}

a {
   text-decoration: none;
   color: #333;
}

a:hover {
   text-decoration: underline;
}

.review-box {
   display: flex;
   align-items: center;
   border: 1px solid #e1e1e1;
   margin-bottom: 20px;
   padding: 15px;
   background-color: #fff;
}

.review-image {
   width: 150px;
   height: 150px;
   margin-right: 20px;
   overflow: hidden;
   border-radius: 8px;
}

.review-image img {
   width: 100%;
   height: 100%;
   object-fit: cover;
}

.review-content {
   flex: 1;
}

.star-rating .bx.bxs-star.filled {
   color: gold;
   -webkit-text-stroke: 0;
}

.star-rating .bx.bxs-star {
   color: transparent;
   -webkit-text-stroke: 1px grey;
}
</style>

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
   <div class="layout-container">
      <!-- Menu -->

      <aside id="layout-menu"
         class="layout-menu menu-vertical menu bg-menu-theme">
         <div class="app-brand demo">
            <a href="/dreams/mypage" class="app-brand-link"> <span
               class="app-brand-text demo menu-text fw-bolder ms-2">My page</span>
            </a> <a href="javascript:void(0);"
               class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
               <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
         </div>

         <div class="menu-inner-shadow"></div>

         <ul class="menu-inner py-1">
            <!-- 회원 관리 -->
            <li class="menu-header small text-uppercase"><span
               class="menu-header-text">회원 정보</span></li>
            <li class="menu-item"><a href="/dreams/mypage/modify"
               class="menu-link">
                  <div data-i18n="Authentications">회원정보 변경</div>
            </a> <a href="/dreams/mypage/delete" class="menu-link">
                  <div data-i18n="Authentications">회원 탈퇴</div>
            </a></li>


            <!-- 나의 상품 -->
            <li class="menu-header small text-uppercase"><span
               class="menu-header-text">나의 상품</span></li>
            <li class="menu-item"><a
               href="/dreams/mypage/myqna/${member.memberId}" class="menu-link ">
                  <div data-i18n="Authentications">Q&A(나의 1:1 문의)</div>
            </a> <a href="/dreams/mypage/check" class="menu-link ">
                  <div data-i18n="Authentications">주문목록/배송조회</div>
            </a> <a href="/dreams/mypage/myreview/${member.memberId}" class="menu-link">
                  <div data-i18n="Authentications">My Review</div>
            </a></li>
         </ul>
      </aside>
      <!-- / Menu -->

      <!-- Content wrapper -->
      <div class="content-wrapper">
         <!-- Content -->

         <div class="container-xxl flex-grow-1 container-p-y">
            <h4 class="fw-bold py-3 mb-4">
               <span class="text-muted fw-light"> </span>My review
            </h4>

            <!-- Hoverable Table rows -->


            <div class="checkout-area pb-0 pt-0">
               <div class="container">
                  <div class="row">
                     <div class="ms-auto me-auto col-lg-12">
                        <div class="checkout-wrapper">
                           <div id="faq" class="panel-group">
                              <div class="panel panel-default single-my-account">
                                 <div id="my-account-1" class="panel-collapse collapse show"
                                    data-bs-parent="#faq">
                                    <div class="panel-body">
                                       <div class="myaccount-info-wrapper">

                                          <c:forEach items="${reviewList}" var="rev">
                                             <!-- rev.revDel 컬럼이 N인 경우에만 리뷰를 출력 -->
                                             <c:if test="${rev.revDel eq 'N'}">
                                                <div class="review-box">
                                                   <div class="review-image">
                                                      <img
                                                         src="${pageContext.request.contextPath}/img/review/${rev.revImg}">
                                                   </div>
                                                   <div class="review-content">
                                                      <div class="review-id">리뷰번호: ${rev.revNo}</div>
                                                      <div class="order-info">주문번호: ${rev.impUid}</div>
                                                      <div class="product-code">상품코드: ${rev.goodsCode}</div>
                                                      <div class="review-text">내용 : ${rev.revCont}</div>


                                                      <div class="review-date">작성 날짜: ${rev.revDate}</div>

                                                      <div class="star-rating">

                                                         <c:forEach var="i" begin="1" end="5">
                                                            <i
                                                               class="bx bxs-star ${i <= rev.goodsStar ? 'filled' : ''}"></i>
                                                         </c:forEach>
                                                      </div>

                                                   </div>
                                                </div>
                                             </c:if>

                                          </c:forEach>



                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>




               <div class="content-backdrop fade"></div>
            </div>
         </div>
      </div>

      <div class="layout-overlay layout-menu-toggle"></div>
   </div>
</div>