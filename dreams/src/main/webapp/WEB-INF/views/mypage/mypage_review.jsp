<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin/core.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mypage.css">


<!-- 페이지 시작 -->
<div class="layout-wrapper layout-content-navbar">
	<div class="layout-container">
		<!-- 왼쪽 상단 메뉴바 -->
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
				<li class="menu-item"><a href="/dreams/mypage/myqna"
					class="menu-link ">
						<div data-i18n="Authentications">Q&A(나의 1:1 문의)</div>
				</a> <a href="/dreams/mypage/check" class="menu-link ">
						<div data-i18n="Authentications">주문목록/배송조회</div>
				</a> <a href="/dreams/mypage/myreview" class="menu-link">
						<div data-i18n="Authentications">My Review</div>
				</a></li>
			</ul>
		</aside>
		<!--왼쪽 메뉴바 끝-->
		<!-- Content 시작 -->
		<div class="content-wrapper">
			<!-- Content -->
			<div class="container-xxl flex-grow-1 container-p-y">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light"> </span>My Review
				</h4>

				<!-- My Review 내용 -->
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
														<div id="cont-wrap">
															<div class="cont-box">
																<div class="title">
																	<h4>
																		My Review<span class="sub">총 <span>0</span>건
																		</span>
																	</h4>
																</div>
																<form id="searchForm">
																	<div class="search-filter">
																		<ul class="filter-tab" style="margin: 0 0;">
																			<li class="searchperiod">조회기간</li>
																			<li><button type="button" class="datebutton">오늘</button></li>
																			<li><button type="button" class="datebutton">7일</button></li>
																			<li><button type="button" class="datebutton">15일</button></li>
																			<li><button type="button" class="datebutton">1개월</button></li>
																			<li><button type="button" class="datebutton">3개월</button></li>
																			<li><button type="button" class="datebutton">1년</button></li>
																			<li><input type="date" class="datebutton"
																				value="2023-08-27" name="startDate"></li>
																			<li class="searchperi">~</li>
																			<li><input type="date" class="datebutton"
																				value="2023-08-27" name="endDate"></li>
																			<li><button type="button" class="searchbutton">조회</button></li>
																		</ul>
																	</div>
																</form>
															</div>
														</div>
														<div class="councelbox" style="margin: 0 0;">
															<div class="councelheader">
																<div class="counceldate">작성 날짜</div>
																<div class="ordernumber">주문번호</div>
																<div class="counceltitle">내용</div>
															</div>
															<div class="councelbody"></div>
														</div>
														<ul class="pagination">
															<li class="first disabled" onclick="goToPage(1);"><span></span></li>
															<li class="prev disabled" onclick="goToPage(0);"><span></span></li>

															<li class="next disabled" onclick="goToPage(2);"><span></span></li>
															<li class="last disabled" onclick="goToPage(0);"><span></span></li>
														</ul>
													</div>
												</div>
											</div>
											<!--페이지-->
											<div class="boardPageContainer">
												<div class="boardPage">
													<!--jstl로 페이지가 5장 이상이 아닐때는 그냥 텍스트라는 조건을 주긴해야하지만 일단 그냥 넣는다.-->
													<a href="/mypage/myqna">《</a> <a href="#">〈</a> <a href="#">1</a>
													<a href="#">〉</a> <a href="#">》</a>
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
</div>
<script>
    function moveNotice(idx) {
        movePage('/board/notice/'+idx)
    }
</script>
<script>
        $(".dateButton").click(function () {
            $(this).addClass("active");
            $(".dateButton").not(this).removeClass("active");

            var now = new Date();
            var startDate = new Date();

            let html = $(this).html();

            if(html === '오늘') {
                startDate.setDate(startDate.getDate());
            } else if(html === '7일') {
                startDate.setDate(startDate.getDate() - 6);
            } else if(html === '15일') {
                startDate.setDate(startDate.getDate() - 14);
            } else if(html === '1개월') {
                startDate.setMonth(startDate.getMonth() -1);
            } else if(html === '3개월') {
                startDate.setMonth(startDate.getMonth() -3);
            } else {
                startDate.setFullYear(startDate.getFullYear() - 1);
            }

            $('input[name=startDate]').val(changeDateFormat(startDate))
            $('input[name=endDate]').val(changeDateFormat(now));
        })

        function searchQnaList() {
            let activeButtonDoc = document.getElementById("activeButton")

            if(activeButtonDoc != null) {
                activeButtonDoc.remove();
            }

            const form = document.getElementById("searchForm")

            if(form.startDate.value === '') {
                alert("시작날짜를 입력해주세요.")
                return
            }

            if(form.endDate.value === '') {
                alert("종료날짜를 입력해주세요.")
                return;
            }

            if(form.startDate.value > form.endDate.value) {
                alert("날짜를 확인해주세요.")
                return;
            }

            let activeButtonText = $(".dateButton.active").html()

            if(activeButtonText === undefined) {
                activeButtonText = '';
            }

            if(activeButtonText === '오늘') {
                activeButtonText = '1d';
            } else if(activeButtonText === '7일') {
                activeButtonText = '7d';
            } else if(activeButtonText === '15일') {
                activeButtonText = '15d';
            } else if(activeButtonText === '1개월') {
                activeButtonText = '1m';
            } else if(activeButtonText === '3개월') {
                activeButtonText = '3m';
            } else if(activeButtonText === '1년'){
                activeButtonText = '1y';
            }

            var i = document.createElement("input");
            i.setAttribute("type", "hidden");
            i.setAttribute("name", "activeButton");
            i.setAttribute("id", "activeButton");
            i.setAttribute("value", activeButtonText);
            form.appendChild(i);

            form.submit()
        }
    </script>



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