<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/core.css">

<script defer>
	function confirmWithdrawal() {
		var confirmDelete = confirm("정말로 회원탈퇴하시겠습니까?");

		if (confirmDelete) {
			document.querySelector('form[action="/dreams/mypage/withdraw"]')
					.submit();
		}
	}

	function goMypage() {
		location.href = "<c:url value="/mypage" />";
	}
</script>

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
	<div class="layout-container">
		<!-- Menu -->
		<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
			<div class="app-brand demo">
				<a href="/dreams/mypage" class="app-brand-link"> <span class="app-brand-text demo menu-text fw-bolder ms-2">My page</span></a> <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none"> <i class="bx bx-chevron-left bx-sm align-middle"></i>
				</a>
			</div>

			<ul class="menu-inner py-1">
				<!-- 회원 관리 -->
				<li class="menu-header small text-uppercase"><span class="menu-header-text">회원 정보</span></li>
				<li class="menu-item"><a href="/dreams/mypage/modify" class="menu-link">
						<div data-i18n="Authentications">회원정보 변경</div>
				</a> <a href="/dreams/mypage/delete" class="menu-link">
						<div data-i18n="Authentications">회원 탈퇴</div>
				</a></li>

				<!-- 나의 상품 -->
				<li class="menu-header small text-uppercase"><span class="menu-header-text">나의 상품</span></li>
				<li class="menu-item"><a href="/dreams/mypage/myqna" class="menu-link ">
						<div data-i18n="Authentications">Q&A(나의 1:1 문의)</div>
				</a> <a href="/dreams/mypage/check" class="menu-link ">
						<div data-i18n="Authentications">주문목록/배송조회</div>
				</a> <a href="/dreams/mypage/myreview" class="menu-link">
						<div data-i18n="Authentications">My Review</div>
				</a></li>
			</ul>
		</aside>
		<!-- / Menu -->

		<!-- Content wrapper -->
		<div class="content-wrapper">
			<!-- Content -->

			<div class="container-xxl flex-grow-1 container-p-y">

				<!-- Hoverable Table rows -->
				<div class="breadcrumb-area pt-0 pb-0 ">
					<div class="container"></div>
				</div>
				<div class="login-register-area pt-0 pb-0">
					<div class="container">
						<div class="row">
							<div class="col-lg-7 col-md-12 ms-auto me-auto">
								<div class="login-register-wrapper">
									<div class="login-register-tab-list nav">
										<a class="active" data-bs-toggle="tab" href="#lg1">
											<h4>회원 탈퇴</h4>
										</a>
									</div>
									<div class="tab-content">
										<div id="lg1" class="tab-pane active">
											<div class="login-form-container">
												<div class="login-register-form">
													<form action="/dreams/mypage/withdraw" method="post">
														<input type="hidden" name="memberId" value="${member.memberId}" />
														<input type="password" name="memberPw" placeholder="Password">
														<div id="errorMessage" style="color: red;">${error}</div>
														<div class="button-box">
															<button type="button" onclick="confirmWithdrawal()">
																<span>회원 탈퇴</span>
															</button>
														</div>
														<div class="button-box">
															<button type="button" onclick="goMypage();">
																<span>탈퇴 취소</span>
															</button>
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
			<!-- Content wrapper -->
		</div>
		<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->
