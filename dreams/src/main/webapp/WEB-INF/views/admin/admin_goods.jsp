<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/core.css">

<script type="text/javascript">
function searchBtn() {
	var searchInput = document.getElementById("searchInput").value;
	alert(searchInput);
}

// 수정 버튼 클릭시
function clickChangeBtn(clicked_id) {
	
	// 기존 보여지던 값들 숨기기 	
	$('#'+clicked_id+'_price').css("display","none");
	$('#'+clicked_id+'_info').css("display","none");
	$('#'+clicked_id+'_stock').css("display","none");
	// 수정 버튼 숨기기
	$('#'+clicked_id).css("display","none");
	
	// 새로운 값을 입력할 input 태그 보이기
	$('#'+clicked_id+'_price_input').css("display","inline-block");
	$('#'+clicked_id+'_info_input').css("display","inline-block");
	$('#'+clicked_id+'_stock_input').css("display","inline-block");
	// 제출 버튼 보이기
	$('#'+clicked_id+'SubmitBtn').css("display","inline-block");
	
}

// 제출 버튼 틀릭시
function clickSubmitBtn(clicked_id) {
	
	var goodsCode = $('#'+clicked_id+'_code').val();
	var goodsPrice = $('#'+clicked_id+'_price_input').val();
	var goodsInfo = $('#'+clicked_id+'_info_input').val();
	var goodsStock = $('#'+clicked_id+'_stock_input').val();
	
	$.ajax({
		type : "post",
		url : "<c:url value="/admin/goods/modify"/>",
		contentType : "application/json",
		data : JSON.stringify({
			"goodsCode" : goodsCode,
			"goodsPrice" : goodsPrice,
			"goodsInfo" : goodsInfo,
			"goodsStock" : goodsStock,
		}),
		dataType : "text",
		success : function(result) {
			if (result == "success") {
				// 수정한 값 적용하기
				$('#'+clicked_id+'_price').text(goodsPrice);
				$('#'+clicked_id+'_info').text(goodsInfo);
				$('#'+clicked_id+'_stock').text(goodsStock);
				
				alert("[" + goodsCode + "] 정보가 성공적으로 수정됐습니다!");
				
				// 새로운 값을 입력한 input 태그 숨기기
				$('#'+clicked_id+'_price_input').css("display","none");
				$('#'+clicked_id+'_info_input').css("display","none");
				$('#'+clicked_id+'_stock_input').css("display","none");
				// 제출 버튼 숨기기	
				$('#'+clicked_id+'SubmitBtn').css("display","none");
				
				// 보여질 값들 보이기
				$('#'+clicked_id+'_price').css("display","inline-block");
				$('#'+clicked_id+'_info').css("display","inline-block");
				$('#'+clicked_id+'_stock').css("display","inline-block");
				// 수정 버튼 보이기
				$('#'+clicked_id).css("display","inline-block");
				
			}
		},
		error : function(xhr) {
			alert("[" + goodsCode + "] 정보 수정에 실패했습니다.\n에러코드 = " + xhr.stauts);
		}
	});
}

// 취소 버튼 클릭시
function clickResetBtn(clicked_id) {
	
	// 새로운 값을 입력한 input 태그 숨기기
	$('#'+clicked_id+'_price_input').css("display","none");
	$('#'+clicked_id+'_info_input').css("display","none");
	$('#'+clicked_id+'_stock_input').css("display","none");
	// 제출 버튼 숨기기	
	$('#'+clicked_id+'SubmitBtn').css("display","none");
	
	// 보여질 값들 보이기
	$('#'+clicked_id+'_price').css("display","inline-block");
	$('#'+clicked_id+'_info').css("display","inline-block");
	$('#'+clicked_id+'_stock').css("display","inline-block");
	// 수정 버튼 보이기
	$('#'+clicked_id).css("display","inline-block");
	
}

// 굿즈 판매여부 관리
function clickYnBtn(clicked_id) {
	
	// 버튼 클릭시 페이지 이동 막기
	event.preventDefault();
	
	var goodsCode = $('#'+clicked_id+'_code').val();
	var goodsYn = $('#'+clicked_id+'_yn').text();
	
	$.ajax({
		type : "post",
		url : "<c:url value="/admin/goods/modifyYn"/>",
		contentType : "application/json",
		data : JSON.stringify({
			"goodsCode" : goodsCode,
			"goodsYn" : goodsYn,
		}),
		dataType : "text",
		success : function(result) {
			// 판매여부 'Y'에서 'N'으로 바뀌었을 때
			if(goodsYn == "Y") {
				$('#'+clicked_id+'_yn').removeClass("bg-label-primary").addClass("bg-label-danger");
				$('#'+clicked_id+'_yn').html("N");
			}
			
			// 판매여부 'N'에서 'Y'로 바뀌었을 때
			if(goodsYn == "N") {
				$('#'+clicked_id+'_yn').removeClass("bg-label-danger").addClass("bg-label-primary");
				$('#'+clicked_id+'_yn').html("Y");
			}
				alert("[" + goodsCode + "] 정보가 성공적으로 수정됐습니다!");
		},
		error : function(xhr) {
			alert("[" + goodsCode + "] 정보 수정에 실패했습니다.\n에러코드 = " + xhr.stauts);
		}
	});
	
}

</script>

<style>
.color .green {
	background: #82c8a0;
}

.btn.green {
	background-color: #9abf7f;
	box-shadow: 0px 4px 0px #87a86f;
}

.btn {
	margin-left: 9px;
	position: relative;
	border: 0;
	display: inline-block;
	text-align: center;
	color: white;
	font-size: 12px;
}

.btn:active {
	top: 4px;
}

.btn.green:active {
	box-shadow: 0 0 #87a86f;
	background-color: #87a86f;
}
</style>

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
				<li class="menu-item"><a href="<c:url value="/admin"/>" class="menu-link"> <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
						<div data-i18n="Tables">회원 관리</div>
				</a></li>


				<!-- 굿즈 관리 -->
				<li class="menu-header small text-uppercase"><span class="menu-header-text">굿즈 관리</span></li>
				<li class="menu-item active"><a href="<c:url value="/admin/goods"/>" class="menu-link"> <i class="menu-icon tf-icons bx bx-table"></i>
						<div data-i18n="Authentications">굿즈 관리</div>
				</a></li>


				<!-- 주문 관리 -->
				<li class="menu-header small text-uppercase"><span class="menu-header-text">주문 관리</span></li>
				<li class="menu-item"><a href="<c:url value="/admin/order"/>" class="menu-link"> <i class="menu-icon tf-icons bx bx-support"></i>
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
							<a href="<c:url value="/admin/goods/write"/>" class="btn green rounded" >굿즈 등록</a>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>이름</th>
										<th>카테고리</th>
										<th>사이즈</th>
										<th>가격</th>
										<th>정보</th>
										<th>판매 여부</th>
										<th>재고</th>
										<th style="text-align: center;">기능</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach var="goods" items="${goodsList }">
									<form>
										<tr>
											<td>
												<strong>${goods.goodsName }</strong>
												<input id="${goods.noSpaceGoodsCode }_code" type="hidden" name="goodsCode" value="${goods.goodsCode }" />
												<input type="hidden" name="noSpaceGoodsCode" value="${goods.noSpaceGoodsCode }" />
											</td>
											<td>
												<c:if test ="${goods.goodsCategory eq 'U'}">Uniform</c:if>
												<c:if test ="${goods.goodsCategory eq 'C'}">Cap</c:if>
												<c:if test ="${goods.goodsCategory eq 'F'}">Fan Goods</c:if>
											</td>
											<td>
												<c:if test ="${goods.goodsSize eq 'L'}">L</c:if>
												<c:if test ="${goods.goodsSize eq 'M'}">M</c:if>
												<c:if test ="${goods.goodsSize eq 'S'}">S</c:if>
												<c:if test ="${goods.goodsSize eq 'F'}">Free</c:if>
											</td>
											<td>
												<span id="${goods.noSpaceGoodsCode }_price" style="display : inline-block;">${goods.goodsPrice }</span>
												<input id="${goods.noSpaceGoodsCode }_price_input" style="display : none;" name="goodsPrice" value="${goods.goodsPrice }"/>
												 원
											</td>
											<td>
												<span id="${goods.noSpaceGoodsCode }_info" style="display : inline-block;">${goods.goodsInfo }</span>
												<input id="${goods.noSpaceGoodsCode }_info_input" style="display : none;" name="goodsInfo" value="${goods.goodsInfo }"/>
											</td>
											
												<input type="hidden" name="goodsYn" value="${goods.goodsYn }" />
											<c:choose>
												<c:when test="${goods.goodsYn == 'Y'}">
													<td><button id="${goods.noSpaceGoodsCode }_yn" class="badge bg-label-primary me-1" style="border: 1px solid grey" onclick="clickYnBtn('${goods.noSpaceGoodsCode }')">${goods.goodsYn }</button></td>
												</c:when>

												<c:when test="${goods.goodsYn == 'N'}">
													<td><button id="${goods.noSpaceGoodsCode }_yn" class="badge bg-label-danger me-1"style="border: 1px solid grey" onclick="clickYnBtn('${goods.noSpaceGoodsCode }')">${goods.goodsYn }</button></td>
												</c:when>
											</c:choose>
											<td>
												<span id="${goods.noSpaceGoodsCode }_stock" style="display : inline-block;">${goods.goodsStock }</span>
												<input id="${goods.noSpaceGoodsCode }_stock_input" style="display : none;" name="goodsStock" value="${goods.goodsStock }"/>
											</td>
											<td style="text-align: center;">
												<button id="${goods.noSpaceGoodsCode }" type="button" class="btn green rounded" style="display : inline-block;" onclick="clickChangeBtn(this.id)"> 수정 </button>
												<button id="${goods.noSpaceGoodsCode }SubmitBtn" type="button" class="btn green rounded" style="display : none;" onclick="clickSubmitBtn('${goods.noSpaceGoodsCode }')"> 제출 </button>
												<button id="${goods.noSpaceGoodsCode }ResetBtn" type="reset" class="btn green rounded" style="display : inline-block;" onclick="clickResetBtn('${goods.noSpaceGoodsCode }')"> 취소 </button>
											</td>
										</tr>
									</form>
									</c:forEach>
								</tbody>
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

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
