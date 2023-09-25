<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/core.css">

<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<script>
   function searchAddress() {
      new daum.Postcode({
         oncomplete : function(data) {
            document.getElementById('memberAddress1').value = data.address;
            document.getElementById('memberAddress2').focus();
         }
      }).open();
   }

   function validateForm() {
      var submitResult = true;
      var originalPassword = document.getElementById("new_password").value;
      var originalConfirmPassword = document.getElementById("confirm_password").value;
      var originalName = document.getElementsByName("memberName")[0].value;
      var originalEmail = document.getElementsByName("memberEmail")[0].value;
      var originalPhone = document.getElementsByName("memberPhone")[0].value;
      var originalAddress1 = document.getElementById("memberAddress1").value;
      var originalAddress2 = document.getElementById("memberAddress2").value;

      var passwd = document.getElementById("new_password").value;
      var repasswd = document.getElementById("confirm_password").value;
      var passwdReg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;

      if (!passwd) {
         alert("비밀번호를 입력하세요.");
         submitResult = false;
      } else if (!passwdReg.test(passwd)) {
         alert("비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.");
         submitResult = false;
      } else if (passwd !== repasswd) {
         alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
         submitResult = false;
      }

      var name = document.getElementsByName("memberName")[0].value;
      if (!name) {
         alert("이름을 입력하세요.");
         submitResult = false;
      }

      var email = document.getElementsByName("memberEmail")[0].value;
      var emailReg = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
      if (!email) {
         alert("이메일을 입력하세요.");
         submitResult = false;
      } else if (!emailReg.test(email)) {
         alert("올바른 이메일 주소를 입력해주세요.");
         submitResult = false;
      }

      var phone = document.getElementsByName("memberPhone")[0].value;
      var phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;
      if (!phone) {
         alert("휴대폰 번호를 입력하세요.");
         submitResult = false;
      } else if (!phoneReg.test(phone)) {
         alert("올바른 휴대폰 번호를 입력해주세요.");
         submitResult = false;
      }
      var address1 = document.getElementById("memberAddress1").value;
      var address2 = document.getElementById("memberAddress2").value;

      if (!address1 || !address2) {
         alert("주소를 완전히 입력해주세요.");
         submitResult = false;
      }
      if (!submitResult) {
         document.getElementById("new_password").value = originalPassword;
         document.getElementById("confirm_password").value = originalConfirmPassword;
         document.getElementsByName("memberName")[0].value = originalName;
         document.getElementsByName("memberEmail")[0].value = originalEmail;
         document.getElementsByName("memberPhone")[0].value = originalPhone;
         document.getElementById("memberAddress1").value = originalAddress1;
         document.getElementById("memberAddress2").value = originalAddress2;
      }

      return submitResult;
   }
</script>

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
            <li class="menu-item"><a href="/dreams/mypage/myqna/${member.memberId}"
               class="menu-link ">
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
               <span class="text-muted fw-light"> </span>회원 정보 변경
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

                                          <form action="/dreams/mypage/modify" method="post"
                                             onsubmit="return validateForm()">


                                             <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                   <div class="billing-info">
                                                      <label>아이디</label> <input type="text"
                                                         readonly="readonly" value="${member.memberId }"
                                                         name="memberId">
                                                   </div>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                   <div class="billing-info">
                                                      <label for="new_password">새 비밀번호</label> <input
                                                         type="password" id="new_password" name="memberPw">
                                                   </div>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                   <div class="billing-info">
                                                      <label for="confirm_password">새 비밀번호 확인</label> <input
                                                         type="password" id="confirm_password"
                                                         name="confirm_password">
                                                   </div>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                   <div class="billing-info">
                                                      <label>이름</label> <input type="text"
                                                         value="${member.memberName }" name="memberName">
                                                   </div>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                   <div class="billing-info">
                                                      <label>이메일</label> <input type="email"
                                                         value="${member.memberEmail }" name="memberEmail">
                                                   </div>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                   <div class="billing-info">
                                                      <label>휴대폰 번호 </label> <input type="text"
                                                         value="${member.memberPhone }" name="memberPhone">
                                                   </div>
                                                </div>
                                             </div>


                                             <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                   <div class="billing-info">
                                                      <label>주소1</label> <input type="text"
                                                         id="memberAddress1" value="${member.memberAddress1}"
                                                         name="memberAddress1" readonly>
                                                      <button type="button" onclick="searchAddress()">주소
                                                         검색</button>
                                                   </div>
                                                </div>
                                             </div>

                                             <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                   <div class="billing-info">
                                                      <label>주소2</label> <input type="text"
                                                         id="memberAddress2" value="${member.memberAddress2}"
                                                         name="memberAddress2">
                                                   </div>
                                                </div>
                                             </div>


                                             <div class="billing-back-btn">
                                                <div class="billing-back">
                                                   <a href="#"><i class="fa fa-arrow-up"></i>위로</a>
                                                </div>
                                                <div class="billing-btn">

                                                   <button type="submit">확인</button>
                                                </div>
                                             </div>

                                          </form>

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
