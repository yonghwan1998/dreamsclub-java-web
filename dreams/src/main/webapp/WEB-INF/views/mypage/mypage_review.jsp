<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/core.css">

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

/* th와 td의 첫 번째 칸 (문의번호) 너비 지정 */
table th:nth-child(1), table td:nth-child(1) {
	width: 100px;
}

/* th와 td의 두 번째 칸 (제목) 너비 지정 */
table th:nth-child(2), table td:nth-child(2) {
	width: 300px;
}

/* th와 td의 세 번째 칸 (내용) 너비 지정 */
table th:nth-child(3), table td:nth-child(3) {
	width: 400px;
}
.answer-ready {
   color: red !important;
}

.answer-done {
   color: green !important;
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

														<table class="customTable">
															<thead>
																<tr>

																	<th>문의번호</th>

																	<th>제목</th>
																	<th>내용</th>

																	<th>상품코드</th>
																	<th>문의 날짜</th>
																	<th>답변 여부</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${reviewList}" var="rev">
																
																	<tr>
																		<td>${rev.revNo}</td>
																		<td class="revCont">${rev.revCont}</td>




																		<td>${rev.goodsCode}</td>
																		<td><c:choose>
																				<c:when test="${rev.revYn == 'Y'}">
																					<span class="answer-done">답변 완료</span>
																				</c:when>
																				<c:otherwise>
																					<span class="answer-ready">답변 준비중</span>
																				</c:otherwise>
																			</c:choose></td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>


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