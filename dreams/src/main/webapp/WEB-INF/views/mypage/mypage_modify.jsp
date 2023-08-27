<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">



<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Flone - Minimal eCommerce HTML Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    
    <!-- CSS
	============================================ -->
   
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="assets/css/icons.min.css">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>



<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="#" class="app-brand-link">
              <span class="app-brand-text demo menu-text fw-bolder ms-2">My page</span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- 회원 관리 -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">회원 정보</span></li>
            <li class="menu-item">
              <a 
              	href="#" 
              	target="_blank"
              	class="menu-link">                
                <div data-i18n="Authentications">회원정보 변경</div>                
              </a>
              <a 
              	href="#" 
              	target="_blank"
              	class="menu-link">                
                <div data-i18n="Authentications">회원 탈퇴</div>                
              </a>
            </li>


            <!-- 나의 상품 -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">나의 상품</span></li>
            <li class="menu-item">
              <a 
              	href="#" 
              	target="_blank" 
              	class="menu-link ">
                <div data-i18n="Authentications">Q&A(나의 1:1 문의)</div>
              </a>
                <a 
              	href="#" 
              	target="_blank" 
              	class="menu-link ">
                <div data-i18n="Authentications">주문목록/배송조회</div>
              </a>
            </li>
          </ul>
        </aside>
        <!-- / Menu -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"> </span>회원 정보 변경</h4>

              <!-- Hoverable Table rows -->
       
       
       <div class="checkout-area pb-0 pt-0">
    <div class="container">
        <div class="row">
            <div class="ms-auto me-auto col-lg-12">
                <div class="checkout-wrapper">
                    <div id="faq" class="panel-group">
                        <div class="panel panel-default single-my-account">
                            <div id="my-account-1" class="panel-collapse collapse show" data-bs-parent="#faq">
                                <div class="panel-body">
                                    <div class="myaccount-info-wrapper">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>아이디</label>
                                                    <input type="text">
                                                </div>
                                            </div>
                                         </div>
                                            
                                         <div class="row">
                                             <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>새 비밀번호</label>
                                                    <input type="password">
                                                </div>
                                            </div>
                                         </div>
                                            
                                          <div class="row">
                                             <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>새 비밀번호 확인</label>
                                                    <input type="password">
                                                </div>
                                            </div>
                                          </div>
                                        
                                          <div class="row">
                                             <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>이름</label>
                                                    <input type="text">
                                                </div>
                                            </div>
                                          </div>
                                          
                                          <div class="row">
                                             <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>이메일</label>
                                                    <input type="email">
                                                </div>
                                            </div>
                                          </div>
                                          
                                          <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>휴대폰 번호 </label>
                                                    <input type="text">
                                                </div>
                                            </div>
                                         </div>
                                        
                                         <div class="row">
                                             <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>주소1</label>
                                                    <input type="text">
                                                </div>
                                            </div>
                                         </div>
                                         
                                         <div class="row">
                                             <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>주소2</label>
                                                    <input type="text">
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
                                  </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

              <!--/ Hoverable Table rows -->

            <!-- / Content -->

            <!-- Footer -->
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
     </div>
    </div>
    <!-- / Layout wrapper -->


</body>
</html>