<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/core.css">

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
	<div class="layout-container">
		<!-- Menu -->
		<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
			<div class="app-brand demo">
				<a href="/dreams/mypage" class="app-brand-link"> <span class="app-brand-text demo menu-text fw-bolder ms-2">My page</span>
				</a> <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none"> <i class="bx bx-chevron-left bx-sm align-middle"></i>
				</a>
			</div>

			<div class="menu-inner-shadow"></div>

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
					<span class="text-muted fw-light"> </span>주문 목록
				</h4>
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
													<c:choose>
														<c:when test="${not empty orderList}">
															<c:forEach items="${orderList}" var="order">
																<!-- ID로 비교하여 배송 리스트 뜨게 설정 -->
																	<!-- 강민경(2023/09/21): 주문 상품 리스트 출력 -->
																	<div class="myaccount-info-wrapper">
																		<div class="sc-abukv2-1 kSZYgn">
																			<!-- 주문 날짜 출력 -->
																			<fmt:formatDate pattern="yyyy-MM-dd" value="${order.payDate}" />
																			<!-- 주문 상태 출력 -->
																			<c:choose>
																				<c:when test="${order.status eq 'paid' }"><span style="color: red"> 결제 완료 </span></c:when>
																				<c:when test="${order.status eq 'complete'}"><span style="color: red"> 배송 완료 </span></c:when>
																				<c:otherwise><span style="color: red"> 고객센터로 문의 바랍니다. </span></c:otherwise>
																			</c:choose>
																		</div>
																		<div class="sc-gnmni8-0 hCVtNj">
																			<!-- 상품 정보 테이블 -->
																			<table class="sc-gnmni8-1 eSpcfO">
																				<colgroup>
																					<col width="600" />
																					<col width="" />
																				</colgroup>
																				<tbody class="sc-gnmni8-2 hryMPB">
																					<tr class="sc-gnmni8-3 gmGnuU">
																						<td class="sc-gnmni8-5 hUzAOG">
																							<!-- 상품명 및 개수 출력 -->
																							<div>
																								${order.goodsCode} &nbsp;&nbsp;&nbsp;${order.goodsCount}개
																							</div>
																							<!-- 상품 가격 출력 --> 
																							<div>
																								${order.goodsPrice}원
																							</div>
																						</td>
																						<td class="sc-gnmni8-6 gbTJl">
																							<div style='display: flex;'>
																								<form action="/goods_detail/" method="post" enctype=multipart>
																									<!-- 강민경: 배송 완료인 경우 리뷰 작성 버튼 생성  -->
																									<c:if test="${order.status eq 'complete'}">
																										<button type="button" onclick="review('${order.impUid}');" class="sreply_button_wrap">리뷰 작성하기</button>
																									</c:if>
																								</form>
																							</div>
																						</td>
																					</tr>
																				</tbody>
																			</table>
																			</div> 
																		</div>
																	</div>
															</c:forEach>
															<!-- 강민경(2023/09/21): 상품 리스트 출력 부분 끄읏 -->
														</c:when>
														<c:otherwise>
															<!-- 외않도 -->
															<div class="myaccount-info-wrapper">주문하신 상품이 없습니다.</div>
														</c:otherwise>

													</c:choose>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!--
<div class="sc-178zqvr-14 bboIjZ">- -->
					<!-- 설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이 가능합니다. -->
					<!-- 
<a href="/ssr/desktop/contact/inquiry" target="_blank" class="sc-178zqvr-16 jgRggD">1:1문의하기</a></div>
<div class="sc-178zqvr-14 bboIjZ"><strong class="sc-178zqvr-15 fWZpfp">교환</strong></div>
 -->
					<!--
<div class="sc-178zqvr-14 bboIjZ">- -->
					<!-- 상품의 교환 신청은 고객센터로 문의하여 주세요.
<a href="/ssr/desktop/contact/inquiry" target="_blank" class="sc-178zqvr-16 jgRggD">1:1문의하기</a>
</div></div>

</div>
</div>
<div style="display:contents"></div>
<div style="display:contents"></div>
<div style="display:contents"></div>
<div style="display:contents"></div>
<div style="display:contents"></div>
</div>
</div>
-->


					<div>
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light"> </span>배송 조회
						</h4>
						<img alt="" src="${pageContext.request.contextPath }/img/ready/ex3.png"> <img alt="" src="${pageContext.request.contextPath }/img/ready/ex9.png"> <img alt="" src="${pageContext.request.contextPath }/img/ready/ex4.png"> <img alt="" src="${pageContext.request.contextPath }/img/ready/ex9.png"> <img alt="" src="${pageContext.request.contextPath }/img/ready/ex5.png"> <img alt="" src="${pageContext.request.contextPath }/img/ready/ex9.png"> <img alt="" src="${pageContext.request.contextPath }/img/ready/ex6.png"> <img alt="" src="${pageContext.request.contextPath }/img/ready/ex9.png"> <img alt="" src="${pageContext.request.contextPath }/img/ready/ex7.png">
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
	 
	
	function review(impUid) {
		location.href='<c:url value="/mypage/review/write"/>?impUid='+impUid;
	}
	
</script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
