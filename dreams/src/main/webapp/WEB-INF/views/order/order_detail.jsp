<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨텐츠 상단 홈/결제 -->
<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="<c:url value="/dreams"/>">홈</a>
                </li>
                <li class="active" style="font-weight: bold;">주문 내역</li>
            </ul>
        </div>
    </div>
</div>

<!-- 주문 내역 -->
<div class="cart-main-area pt-90 pb-100">
    <div class="container">
        <h3 class="cart-page-title">${member.memberName }님의 주문 내역</h3>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="table-content table-responsive cart-table-content">
                    <table>
                        <thead>
                            <tr>
                                <th>상품 이미지</th>
                                <th>상품명</th>
                                <th>사이즈</th>
                                <th>수량</th>
                                <th>가격</th>
                                <th>배송메모</th>
                                <!-- <th>주문일</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="product-thumbnail">
                                    <%-- <img src="${pageContext.request.contextPath }/img/cart/cart-1.png" alt=""> --%>
                                    <img src="${pageContext.request.contextPath }/img/product/${goods.goodsImage}" alt="">
                                </td>
                                <td class="product-quantity">${goods.goodsCode }</td>
                                <td class="product-subtotal">${goods.goodsSize }</td>
                                <td class="product-subtotal">${goods.goodsCount }</td>
                                <td class="product-subtotal"><span class="amount">
                                	<fmt:formatNumber value="${goods.goodsPrice }" pattern="#,###" /> 원</span></td>
                                <td class="product-price-cart">${orderMemo }</td>
                                <!-- <td class="product-wishlist-cart">2023/08/26</td> -->
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
