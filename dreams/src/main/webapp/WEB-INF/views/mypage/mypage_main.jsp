<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/core.css">

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
	<div class="layout-container">

		<!-- 왼쪽 메뉴바  -->
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
			
			<!-- 왼쪽 메뉴바 하단 -->
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
					href="/dreams/mypage/myqna/${member.memberId}" class="menu-link">
						<div data-i18n="Authentications">Q&A(나의 1:1 문의)</div>
				</a> <a href="/dreams/mypage/check" class="menu-link ">
						<div data-i18n="Authentications">주문목록/배송조회</div>
				</a> <a href="/dreams/mypage/myreview/${member.memberId }" class="menu-link">
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
					<span class="text-muted fw-light"> </span>회원 정보
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
														<div class="row">
															<div class="col-lg-6 col-md-6">
																<div class="billing-info">
																	<label>아이디</label> ${member.memberId }
																</div>
															</div>
														</div>

														<div class="row">
															<div class="col-lg-6 col-md-6">
																<div class="billing-info">
																	<label>이름</label> ${member.memberName }
																</div>
															</div>
														</div>

														<div class="row">
															<div class="col-lg-6 col-md-6">
																<div class="billing-info">
																	<label>이메일</label> ${member.memberEmail }
																</div>
															</div>
														</div>

														<div class="row">
															<div class="col-lg-6 col-md-6">
																<div class="billing-info">
																	<label>휴대폰 번호 </label> ${member.memberPhone }
																</div>
															</div>
														</div>

														<div class="row">
															<div class="col-lg-6 col-md-6">
																<div class="billing-info">
																	<label>주소1</label> ${member.memberAddress1 }
																</div>
															</div>
														</div>

														<div class="row">
															<div class="col-lg-6 col-md-6">
																<div class="billing-info">
																	<label>주소2</label> ${member.memberAddress2 }
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
					</div>

					<div>
						<h4 class="fw-bold py-3 mb-4">주문/배송 조회
							<span class="text-muted fw-light">(최근 30일 내에 진행중인 주문정보입니다.)</span>
						</h4>
						<img alt=""
							src="${pageContext.request.contextPath }/img/ready/ex3.png">
						<img alt=""
							src="${pageContext.request.contextPath }/img/ready/ex9.png">
						<img alt=""
							src="${pageContext.request.contextPath }/img/ready/ex4.png">
						<img alt=""
							src="${pageContext.request.contextPath }/img/ready/ex9.png">
						<img alt=""
							src="${pageContext.request.contextPath }/img/ready/ex5.png">
						<img alt=""
							src="${pageContext.request.contextPath }/img/ready/ex9.png">
						<img alt=""
							src="${pageContext.request.contextPath }/img/ready/ex6.png">
						<img alt=""
							src="${pageContext.request.contextPath }/img/ready/ex9.png">
						<img alt=""
							src="${pageContext.request.contextPath }/img/ready/ex7.png">
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


<!-- ---------------------------------- JS here ------------------------------------ -->
<!-- Core JS -->
<!-- build:js assets/admin/js/core.js -->
<script
	src="${pageContext.request.contextPath }/js/admin/admin_jquery.js"></script>
<script
	src="${pageContext.request.contextPath }/js/admin/admin_popper.js"></script>
<script
	src="${pageContext.request.contextPath }/js/admin/admin_bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath }/js/admin/perfect-scrollbar.js"></script>
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