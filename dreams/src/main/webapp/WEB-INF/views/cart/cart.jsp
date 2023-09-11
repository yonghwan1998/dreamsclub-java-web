<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">

<!--장바구니 메인-->
<div class="cart-main-area pt-90 pb-100">
    <div class="container">
        <h3 class="cart-page-title">장바구니</h3>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                <!--장바구니 목록 전체-->
                    <div class="table-content table-responsive cart-table-content">
                        <!--장바구니 테이블-->
                        <table>
                            <thead>
                                <tr>
                                    <th class="t1 all_checkbox"><input type="checkbox" style="width: 20px"></th><!--체크박스칸-->
                                    <th class="t2"></th><!--칸은 있지만 사진칸이라 목록은 빈칸-->
                                    <th class="t3">상품 정보</th>
                                    <th class="t4">수량</th>
                                    <th class="t5">가격</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--장바구니 목록-->
                                <c:forEach items="${cartInfo }" var="ci">
	                                <tr>                                
	                                	<!-- 체크박스 -->	
	                                    <td class="t1 cart_info_td"><input class="individual_cart_checkbox" type="checkbox" checked="checked" style="width: 20px">
		                                    <input type="hidden" class="individual_goodsPrice_input" value="${ci.goodsPrice}">
		                                    <input type="hidden" class="individual_cartQuantity_input" value="${ci.cartQuantity}">
		                                    <input type="hidden" class="individual_goodsCountPrice_input" value="${ci.goodsPrice*ci.cartQuantity}">
		                                    <input type="hidden" class="individual_goodsCode_input" value="${ci.goodsCode}">
	                                    </td>
	                                    <!-- 이미지 추가 작업하기 -->
	                                    <td class="product-thumbnail t2">
	                                        <!-- <a href="#"><img src="assets/img/cart/cart-1.png" alt=""></a> -->
	                                        <div class="image_wrap" data-goodsCode="${ci.goodsImage }" data-path=<c:out value="/images/${ci.goodsImage }"/>>
	                                        
	                                        </div>
	                                    </td>
	                                    <!-- 상품 정보 출력 -->
	                                    <td class="product-name t3">	                                  
                                    		<h4>${ci.goodsCode[0] }</h4>	<!-- 제품명 -->
                                    		<h6>사이즈 : ${ci.goodsCode[2] }</h6>	   <!-- 사이즈 -->                         	
	                                    </td>
	                                    <td class="product-quantity t4">
	                                    	<!-- 수량조절 -->
	                                        <div class="cart-plus-minus">
	                                            <button class="quantity_btn plus_btn">-</button>
	                                            <input class="cart-plus-minus-count quantity_input" type="text" name="quantity_button" value="${ci.goodsQuantity}">
	                                            <button class="quantity_btn minus_btn">+</button>
	                                        </div>
	                                    </td>
	                                    <td class="product-subtotal t5">
	                                    	<fmt:formatNumber value="${ci.goodsPrice * ci.cartQuantity }" pattern="#,###원"/>
	                                    </td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                <!--결제칸-->
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="col-lg-12">
                            <div class="cart-shiping-update-wrapper">
                                <div class="cart-shiping-update">
                                    <a href="#" data-cartNo="${ci.cartNo }">선택상품 삭제하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6"></div>
                    <!--실질적으로 쓰는칸은 이거 하나-->
                    <div class="col-lg-4 col-md-12">
                        <div class="grand-totall">
                            <h4>총 상품금액 <span class="totalPrice_span"></span><span>원</span></h4>
                            <div class="total-shipping">
                                <ul>
                                    <li>배송비 <span class="delivery_price">0</span><span>원</span></li>
                                </ul>
                            </div>
                            <h4 class="grand-totall-title">총 주문금액  <span class="finalTotalPrice_span">${ci.orderPrice }</span><span>원</span></h4>
                            <a href="#" class="order_btn">선택상품 주문하기</a>
                            <a href="#" class="continue_Shopping">계속 쇼핑하기</a>
                        </div>
                    </div>
                </div>
                
                <!-- 수량조절 form -->
                <form action="<c:url value='/cart/update'/>" method="post" class="quantity_update_form">
                	<input type="hidden" name="cartNo" class="update_cartNo">
                	<input type="hidden" name="cartQuantity" class="update_cartQuantity">
                	<input type="hidden" name="memberId" class="${member.memberId }">                	
                </form>

                <!-- 굿즈 삭제 form -->
                <form action="<c:url value='/cart/delete'/>" method="post" class="quantity_delete_form">
                	<input type="hidden" name="cartNo" class="delete_cartNo">
                	<input type="hidden" name="memberId" class="${member.memberId }">                	
                </form>
                
                <!-- 주문 form -->
                <form action="<c:out value='/order/new'/>" method="get" class="order_form">
                
                </form>
                
            </div>
        </div>
    </div>
</div>




