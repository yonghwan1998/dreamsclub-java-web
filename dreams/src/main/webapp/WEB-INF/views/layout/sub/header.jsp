<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>

<!doctype html>
<html class="no-js" lang="zxx">

<body>
    <!-- 헤더 시작 -->
    <header class="header-area header-padding-2 sticky-bar header-res-padding clearfix">
        <div class="header-top-area">
            <div class="container">
                <div class="header-top-wap">
                    <!-- 헤더 상단 왼쪽 -->
                    <!-- 형섭: 이거 넣을까요? -->
                    <!-- 민경: 좋아요! -->
                    <div class="language-currency-wrap">
                    ${member.memberName }님, 환영합니다!
                    </div>
                    <!-- 헤더 우측 상단 -->
                    <div class="header-offer">
                        <p>배송비 <span>무료</span> 이벤트 진행 중!!</p>
                    </div>
                    
                    
                    <div>
                    <!-- 진서 로그인 페이지로 이동 ▼-->
                    <div class="header-login">
                   	<a href="<c:url value="/login"/>"> 로그인 </a>
                    
                   <!-- 진서 회원가입 페이지로 이동 ▼-->
                    <div class="header-join">
                   	<a href="<c:url value="/join/check"/>"> 회원가입 </a>
               		</div>
                </div>
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
                                <!-- 형섭: 마우스 올리면 서브메뉴 두 개 선택되던 것 수정 -->
                                <li><a href="index.html" >Dreams <i
                                            class="fa fa-angle-down"></i></a>
                                    <ul class="submenu">
                                        <li><a href="<c:url value="/introduction"/>">구단소개</a></li>
                                        <li><a href="#">공지사항</a></li>
                                    </ul>
                                </li>
                                <!-- Navbar - 선수단 -->
                                <li><a href="<c:url value="/team"/>"> 선수단 </a></li>
                                <!-- Navbar - 굿즈 -->
                                <li><a href="<c:url value="/goods/main"/>" > 굿즈</a></li>
                                <!-- Navbar - 커뮤니티 -->
                                <li><a href="#">커뮤니티 <i class="fa fa-angle-down"></i></a>
                                    <ul class="submenu">
                                        <li><a href="#">응원의 한마디</a></li>
                                        <li><a href="<c:url value="/community"/>">꿈들의 모임</a></li>
                                    </ul>
                                </li>
                                <!-- Navbar - 고객센터 -->
                                <li><a href="<c:url value="/customer"/>"> 고객센터</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-4 col-8">
               	 	<!-- 헤더 중간 우측 아이콘들  -->
                    <div class="header-right-wrap">
                        <div class="same-style account-satting">
                            <!-- 강민경 사람 아이콘 누른 경우 회원: 마이페이지 이동/ 비회원: 로그인페이지 이동  
                            근데 시도해봤는데 안되서 나중에 다시 확인.-->
                            <a class="account-satting-active" href="<c:url value="/mypage"/>" > 
                            	<button id= "main_mypage" onclick="location.href='<c:url value="/mypage"/>';">
                            		<i class="pe-7s-user-female" ></i>
                            	</button>
                            </a> 
                            
                            <!--  강민경: 헤더 로그인 아이콘 누르면 리스트 뜨는 코드 주석 처리-->
                           <!-- <div class="account-dropdown">
                                <button onclick="location.href='/dreams/mypage'"></button>
                            </div>-->
                           
                        </div>
                        <div class="same-style cart-wrap">
                            <button class="icon-cart" onclick="location.href='<c:url value="/cart/${member.memberId }"/>';">
                                <i class="pe-7s-shopbag"></i>
                                <!-- 강민경: 장바구니 아이콘 위 숫자 삭제 -->
                            </button>
                        </div>
                	 </div>
                 </div>
	            
	        </div>
        </div>
    </header>
</html>