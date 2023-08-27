<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

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



        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>



            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <i class="bx bx-search fs-4 lh-0"></i>
                  <input
                    type="text"
                    class="form-control border-0 shadow-none"
                    placeholder="Search..."
                    aria-label="Search..."
                  />
                </div>
              </div>
              <!-- /Search -->



              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- 우측 상단 관리자 프로필 -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="${pageContext.request.contextPath }/img/admin/1.png"  class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                              <img src="${pageContext.request.contextPath }/img/admin/1.png"  class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <span class="fw-semibold d-block">문형섭</span>
                            <small class="text-muted">관리자</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">관리자 /</span> 회원 관리</h4>

              <!-- Hoverable Table rows -->
              <div class="admin_card">
                <h5 class="admin_card-header"> 회원 목록</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>이름</th>
                        <th>회원가입 날짜</th>
                        <th>마지막 로그인 날짜</th>
                        <th>상태 (select 넣어서 선택)</th>
                        <th>변경</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>홍길동</strong></td>
                        <td>2021-02-22</td>
                        <td>2023-08-21</td>
                        <td><span class="badge bg-label-primary me-1">일반회원</span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i> 수정</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i> 삭제</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>

                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>임꺽정</strong></td>
                        <td>2021-02-22</td>
                        <td>2023-08-21</td>
                        <td><span class="badge bg-label-success me-">휴면 회원</span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i> 수정</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i> 삭제</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>

                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>전우치</strong></td>
                        <td>2021-02-22</td>
                        <td>2023-08-21</td>
                        <td><span class="badge bg-label-warning me-1">탈퇴 회원</span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i> 수정</a
                              >
                              <!-- 삭제: hidden 으로 안보이게만 -->
                              <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-trash me-1"></i> 삭제</a>
                            </div>
                          </div>
                        </td>
                      </tr>

                    </tbody>
                  </table>
                </div>
              </div>
              <!--/ Hoverable Table rows -->

              <hr class="my-5" />
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

<!-- ---------------------------------- JS here ------------------------------------ -->
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${pageContext.request.contextPath }/js/vendor/admin_jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/vendor/admin_popper.js"></script>
    <script src="${pageContext.request.contextPath }/js/vendor/admin_bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/js/vendor/perfect-scrollbar.js"></script>

    <script src="${pageContext.request.contextPath }/js/vendor/menu.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath }/js/admin.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>