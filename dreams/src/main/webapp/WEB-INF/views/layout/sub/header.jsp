<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 헤더 시작 -->
<header class="header-area header-padding-2 sticky-bar header-res-padding clearfix">
	<div class="header-top-area">
		<div class="container">
			<div class="header-top-wap">
				<div class="language-currency-wrap">
					<!--  회원 권한에 따라 다르게 보여지는 문구 -->
					<c:choose>

						<c:when test="${member.memberStatus == 1}">
							<a> ♡${member.memberName }님♡, 환영합니다!</a>
						</c:when>


						<c:when test="${member.memberStatus == 9}">
							<a>관리자님, 환영합니다!</a>
						</c:when>


						<c:otherwise>
							<a>Dreams 환영합니다!</a>
						</c:otherwise>
					</c:choose>
				</div>	
				
				<!-- 헤더 우측 상단 -->
				<div class="header-offer">
					<p>
						☆★배송비 <span>무료</span> 이벤트 진행 중★☆
					</p>
				</div>
				<!--강민경: 회원이면 로그아웃 버튼 뜨도록 설정 --> 
				<c:choose>
					<c:when test = "${empty (member)}">
						<div class="header-login">
							<a href="<c:url value="/login"/>"> 로그인 </a>
							<a href="<c:url value="/join/check"/>"> 회원가입 </a>
						</div>
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/login/logout"/>"> 로그아웃 </a>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-2 col-lg-2 col-md-6 col-4">
				<div class="logo">
					<a href="<c:url value="/"/>">
						<img alt="logo" src="${pageContext.request.contextPath }/img/logo/logo.png" width="150" height="130">
					</a>
				</div>
			</div>
			<!-- 헤더 중간 메뉴 -->
			<div class="col-xl-8 col-lg-8 d-none d-lg-block">
				<div class="main-menu">
					<nav>
						<ul>
							<!-- Navbar - 드림즈 -->
							<li><a href="<c:url value="#"/>">Dreams <i class="fa fa-angle-down"></i></a>
								<ul class="submenu">
									<li><a href="<c:url value="/introduction"/>">구단소개</a></li>
									<li><a href="<c:url value="/notice"/>">공지사항</a></li>
								</ul></li>
								
							<!-- Navbar - 선수단 -->
							<li><a href="<c:url value="/team"/>"> 선수단 </a></li>
							
							<!-- Navbar - 굿즈 -->
							<li><a href="<c:url value="/goods/main"/>"> 굿즈</a></li>
							
							<!-- Navbar - 커뮤니티 -->
							<li><a href="<c:url value="#"/>">커뮤니티 <i class="fa fa-angle-down"></i></a>
								<ul class="submenu">
									<li><a href="<c:url value="#"/>">응원의 한마디</a></li>
									<li><a href="<c:url value="/community"/>">꿈들의 모임</a></li>
								</ul></li>
								
							<!-- Navbar - 고객센터 -->
							<li><a href="<c:url value="service"/>"> 고객센터</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-xl-2 col-lg-2 col-md-4 col-8">
				<!-- 헤더 중간 우측 아이콘들  -->
				<div class="header-right-wrap">
					<c:choose>

						<c:when test="${member.memberStatus == 1}">
							<div class="same-style account-satting" onclick="location.href='<c:url value="/mypage"/>'" style="cursor: pointer;">
								<i class="pe-7s-user-female"></i>

							</div>
						</c:when>

						<c:when test="${member.memberStatus == 9}">
							<div class="same-style account-satting" onclick="location.href='<c:url value="/admin"/>'" style="cursor: pointer;">
								<i class="pe-7s-user-female"></i>

							</div>
						</c:when>

						<c:otherwise>
							<div class="same-style account-satting" onclick="location.href='<c:url value="/login"/>'" style="cursor: pointer;">
								<i class="pe-7s-user-female"></i>

							</div>
						</c:otherwise>
					</c:choose>
					
					<!-- 장바구니 -->
					<div class="same-style cart-wrap">
						<button class="icon-cart" onclick="location.href='<c:url value="/cart/${member.memberId }"/>'">
							<i class="pe-7s-shopbag"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- 헤더 끝 -->
