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
                <form action="#">
                    <div class="table-content table-responsive cart-table-content">
                        <!--장바구니 테이블-->
                        <table>
                            <thead>
                                <tr>
                                    <th class="t1"><input type="checkbox" style="width: 20px"></th><!--체크박스칸-->
                                    <th class="t2"></th><!--칸은 있지만 사진칸이라 목록은 빈칸-->
                                    <th class="t3">상품 정보</th>
                                    <th class="t4">수량</th>
                                    <th class="t5">가격</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--장바구니 목록1-->
                                <c:forEach items="${cartInfo }" var="ci">
	                                <tr>                                
	                                	<!-- 체크박스 -->	
	                                    <td class="t1"><input class="cart_info_td" type="checkbox" style="width: 20px">
		                                    <input type="hidden" class="individual_goodsPrice_input" value="${ci.goodsPrice}">
		                                    <input type="hidden" class="individual_cartQuantity_input" value="${ci.cartQuantity}">
		                                    <input type="hidden" class="individual_totalPrice_input" value="${ci.goodsPrice*ci.cartQuantity}">
	                                    </td>
	                                    <td class="product-thumbnail t2">
	                                        <a href="#"><img src="assets/img/cart/cart-1.png" alt=""></a>
	                                    </td>
	                                    <!-- split 필요=> 조장님 -->
	                                    <td class="product-name t3"><a href="#">${ci.goodsCode }</a></td>
	                                    <td class="product-quantity t4">
	                                    	<!-- 이것도 학원에 코드있음 -->
	                                        <div class="cart-plus-minus">
	                                            <input class="cart-plus-minus-box" type="text" name="qtybutton" value="2">
	                                        </div>
	                                    </td>
	                                    <td class="product-subtotal t5"><fmt:formatNumber value="${ci.goodsPrice * ci.cartQuantity }"/></td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </form>
                <!--결제칸-->
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="col-lg-12">
                            <div class="cart-shiping-update-wrapper">
                                <div class="cart-shiping-update">
                                    <a href="#">선택상품 삭제하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6"></div>
                    <!--실질적으로 쓰는칸은 이거 하나-->
                    <div class="col-lg-4 col-md-12">
                        <div class="grand-totall">
                            <h4>총 상품금액 <span class="totalPrice_span"></span></h4>
                            <div class="total-shipping">
                                <ul>
                                    <li>배송비 <span>0 원</span></li>
                                </ul>
                            </div>
                            <h4 class="grand-totall-title">총 주문금액  <span class="finalTotalPrice">$260.00</span></h4>
                            <a href="#">선택상품 주문하기</a>
                            <a href="#">계속 쇼핑하기</a>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

</script>
