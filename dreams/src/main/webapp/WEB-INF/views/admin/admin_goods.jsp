<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<a href="/dreams/admin" class="app-brand-link"> <span class="app-brand-text demo menu-text fw-bolder ms-2">Admin</span>
				</a>

				<!-- 관리자 이미지 클릭하면 드롭다운 메뉴 표시 -->
				<span class="avatar avatar-online" id="adminAvatar"> <img src="${pageContext.request.contextPath }/img/admin/admin_img.png" class="w-px-40 h-auto rounded-circle" />
				</span>
				<div id="dropdownMenu" class="dropdown-menu" style="display: none;">
					<!-- 드롭다운 메뉴 아이템들 -->
					<a class="dropdown-item" href="#"> <i class="bx bx-power-off me-2"></i> <span class="align-middle">Log Out</span>
					</a>
				</div>

				<a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none"> <i class="bx bx-chevron-left bx-sm align-middle"></i>
				</a>
			</div>

			<div class="menu-inner-shadow"></div>

			<ul class="menu-inner py-1">
				<!-- 회원 관리 -->
				<li class="menu-header small text-uppercase"><span class="menu-header-text">회원 관리</span></li>
				<li class="menu-item"><a href="/dreams/admin" class="menu-link"> <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
						<div data-i18n="Tables">회원 관리</div>
				</a></li>


				<!-- 굿즈 관리 -->
				<li class="menu-header small text-uppercase"><span class="menu-header-text">굿즈 관리</span></li>
				<li class="menu-item active"><a href="/dreams/admin/goods" class="menu-link"> <i class="menu-icon tf-icons bx bx-table"></i>
						<div data-i18n="Authentications">굿즈 관리</div>
				</a></li>


				<!-- 주문 관리 -->
				<li class="menu-header small text-uppercase"><span class="menu-header-text">주문 관리</span></li>
				<li class="menu-item"><a href="/dreams/admin/order" class="menu-link"> <i class="menu-icon tf-icons bx bx-support"></i>
						<div data-i18n="Support">주문 관리</div>
				</a></li>
			</ul>
		</aside>
		<!-- / Menu -->

		<!-- Layout container -->
		<div class="layout-page">
			<!-- Navbar -->
			<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
				<div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
					<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)"> <i class="bx bx-menu bx-sm"></i>
					</a>
				</div>

				<div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
					<!-- Search -->
					<div class="navbar-nav align-items-center">
						<div class="nav-item d-flex align-items-center">
							<i class="bx bx-search fs-4 lh-0" onclick="searchBtn()"></i> <input type="text" class="form-control border-0 shadow-none" id="searchInput" placeholder="검색어를 입력해 주세요." aria-label="Search..." />
						</div>
					</div>
					<!-- / Search -->

				</div>
			</nav>

			<!-- / Navbar -->

			<!-- Content wrapper -->
			<div class="content-wrapper">
				<!-- Content -->

				<div class="container-xxl flex-grow-1 container-p-y">
					<h4 class="fw-bold py-3 mb-4">
						<span class="text-muted fw-light">관리자 /</span> 굿즈 관리
					</h4>

					<!-- Hoverable Table rows -->
					<div class="admin_card">
						<h5 class="admin_card-header">굿즈 목록</h5>
						<div class="table-responsive text-nowrap">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>굿즈 코드</th>
										<th>가격</th>
										<th>정보</th>
										<th>판매 여부</th>
										<th>재고</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">

									<c:forEach var="goods" items="${goodsList }">
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${goods.goodsCode }</strong></td>
											<td><fmt:formatNumber value="${goods.goodsPrice }" pattern="#,###" /> 원</td>
											<td>${goods.goodsInfo }</td>
											<td><span class="badge bg-label-primary me-1">${goods.goodsYn }</span></td>
											<!-- <td><span class="badge bg-label-primary me-1">Y (이 색을 Y로)</span></td> -->
											<!-- <td><span class="badge bg-label-warning me-1">N (이 색을 N으로)</span></td> -->
											<td>${goods.goodsStock }</td>
										</tr>
									</c:forEach>

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

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
