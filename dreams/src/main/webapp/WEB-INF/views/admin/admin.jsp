<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/core.css">

<script type="text/javascript">
function searchBtn() {
	var searchInput = document.getElementById("searchInput").value;
	alert(searchInput);
	
}
</script>

    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="<c:url value="/dreams/admin"/>" class="app-brand-link">
              <span class="app-brand-text demo menu-text fw-bolder ms-2">Admin</span>
            </a>
     
		     <!-- 관리자 이미지 클릭하면 드롭다운 메뉴 표시 -->
		    <span class="avatar avatar-online" id="adminAvatar">
		      <img src="${pageContext.request.contextPath }/img/admin/admin_img.png" class="w-px-40 h-auto rounded-circle" />
		    </span>
		    <div id="dropdownMenu" class="dropdown-menu" style="display: none;">
		      <!-- 드롭다운 메뉴 아이템들 -->
		      <a class="dropdown-item" href="<c:url value="/login/logout"/>">
		        <i class="bx bx-power-off me-2"></i>
		        <span class="align-middle">Log Out</span>
		      </a>
		    </div>
            
            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- 회원 관리 -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">회원 관리</span></li>
            <li class="menu-item active">
              <a href="<c:url value="/admin"/>" class="menu-link">
                <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
                <div data-i18n="Tables">회원 관리</div>
              </a>
            </li>

            <!-- 굿즈 관리 -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">굿즈 관리</span></li>
            <li class="menu-item">
              <a href="<c:url value="/admin/goods"/>" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Authentications">굿즈 관리</div>
              </a>
            </li>

            <!-- 주문 관리 -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">주문 관리</span></li>
            <li class="menu-item">
              <a href="<c:url value="/admin/order"/>" class="menu-link">
                <i class="menu-icon tf-icons bx bx-support"></i>
                <div data-i18n="Support">주문 관리</div>
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
					<i class="bx bx-search fs-4 lh-0" onclick="searchBtn()"></i> <input type="text" class="form-control border-0 shadow-none" id="searchInput" placeholder="검색어를 입력해 주세요." aria-label="Search..." />
				</div>
              </div>
              <!-- /Search -->
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
                        <th style="padding-left: 2rem;">이름</th>
                        <th>전화번호</th>
                        <th>이메일</th>
                        <th>회원가입 날짜</th>
                        <th>상태</th>
                        <th>변경</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
	                    <c:forEach items="${getMemberList }" var="member">
	                      <tr id="row-${member.memberId}">
	                        <td ><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${member.memberName }</strong></td>
      						<td>${member.memberPhone}</td>
	                        <td>${member.memberEmail }</td>
							<td><fmt:formatDate value="${member.memberRegDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                        
	                        <td>
                        		<c:choose>
                        			<c:when test="${member.memberStatus eq 1 }">
			                        	<span class="badge bg-label-success me-1">일반회원</span>
		                        	</c:when>
                        			<c:when test="${member.memberStatus eq 0 }">
                        				<span class="badge bg-label-primary me-1">탈퇴회원</span>
                        			</c:when>
                        		</c:choose>
	                       	</td>
	                        <td>
	                        
	                          <div class="dropdown">
							    <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
							      <i class="bx bx-dots-vertical-rounded"></i>
							    </button>
							    <div class="dropdown-menu">
							        <a class="dropdown-item" href="javascript:setMember(${member.memberId});">
							          <i class="bx bx-edit-alt me-1"></i> 수정
							        </a>
							        <a class="dropdown-item" href="javascript:hideMember(${member.memberId});">
							          <i class="bx bx-trash me-1"></i> 삭제
							        </a>
							    </div>
							  </div>
							  
	                        </td>
	                      </tr>
						</c:forEach>
                    </tbody>
                    
                    <%-- <form id="setInfoForm">
							  <input type="hidden" name="setInfo" value="${member.memberStatus }">
	                    	</form> --%>
                  </table>
                </div>
              </div>
              <!--/ Hoverable Table rows -->

              <hr class="my-5" />
            <!-- / Content -->

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
    <!-- build:js assets/admin/js/core.js -->
    <script src="${pageContext.request.contextPath }/js/admin/admin_jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/admin/admin_popper.js"></script>
    <script src="${pageContext.request.contextPath }/js/admin/admin_bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/js/admin/perfect-scrollbar.js"></script>
    <script src="${pageContext.request.contextPath }/js/admin/menu.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath }/js/admin/main.js"></script>

	<script>
	const adminAvatar = document.getElementById('adminAvatar');
	const dropdownMenu = document.getElementById('dropdownMenu');
	
	// 마우스가 이미지 위에 올라갔을 때 드롭다운 메뉴 표시
	adminAvatar.addEventListener('mouseenter', () => {
	  dropdownMenu.style.display = 'block';
	});
	
	// 마우스가 이미지 밖으로 나갔을 때 드롭다운 메뉴 숨김
	dropdownMenu.addEventListener('mouseleave', () => {
	  dropdownMenu.style.display = 'none';
	});
	  
	</script>
	
	<script type="text/javascript">
function hideMember(memberId) {
        var row = document.getElementById('row-' + memberId);
        row.style.display = 'none';
    }
</script>
	

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>