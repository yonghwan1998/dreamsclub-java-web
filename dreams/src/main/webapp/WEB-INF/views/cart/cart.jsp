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



<script type="text/javascript">

$(document).ready(function(){
	//초기 셋팅
	setTotalInfo();
	
	//이미지 삽입하기(생각좀 해보기)!!!!!!!!!!!!!!
	
});


/*체크박스 선택시 정보변화할 것이란 것*/
$(".individual_cart_checkbox").on("change", function({
	setTotalInfo($(".cart_info_td"))
});

/*체크박스 전체 선택*/
$(".all_checkbox").on("click", function(){
	/*체크박스 체크/해제*/
	if($("all_checkbox").prop("checked")){
		$(".individual_cart_checkbox").attr("checked", true);
	} else{
		$(".individual_cart_checkbox").attr("checked", false);
	}
	
	/*총 주문 정보 세팅(총 가격, 배송비, 최종가격)*/
	setTotalInfo($(".cart_info_td"));
});
 

/*총 주문정보 세팅(총 가격, 배송비, 최종가격)*/
function setTotalInfo(){
	let totalPrice = 0;	//총 가격
	let deliveryPirce = 0;	//배송비(지금은 0)
	let finalTotalPrice = 0;	//최종가격(총 가격+배송비)
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked")==true){
			//총 가격
			totalPrice += parseInt($(element).find(".individual_goodsCountPrice_input").val());
		}
	});
	
			
	/*배송비결정*/
	/*
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else{
		delivery =3000;
	}
	*/
	
	finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	//총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	//배송비
	$(".delivery_price").text(deliveryPrice);
	//최종가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
				
}


/*수량 버튼*/
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
})
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
})


/*장바구니 row 삭제*/
//선택된 장바구니만 삭제해야함.
$(document).ready(function({
	function deleteSelectedRows(){
		if(confirm("선택 상품을 삭제하시겠습니까?")){
			$(".individual_cart_checkbox:checked").each(function(){
				$(this).closest("tr").remove();
			});
			alert("삭제되었습니다.");
		}
		return false;
	}
	
	$(".cart-shiping-update a[data-cartNo]").on("click", function(){
		deleteSelectedRows();
		
		return false;
	});
});


/*주문 페이지 이동*/
$(".order_btn").on("click", function(){
	
	if ($(".individual_cart_checkbox:checked").length > 0) {
	
		if (confirm("주문하시겠습니까?")) {
			let form_contents = '';
			let orderNumber = 0;
			
			$(".cart_info_td").each(function(index, element){
				
				if($(element).find(".individual_cart_checkbox").is(":checked")===true){
					
					let goodsCode = $(element).find(".individual_goodsCode_input").val();
					let goodsQuantity = $(element).find("individual_cartQuantity_input").val();
					
					let goodsCode_input = "<input name='orders["+ orderNumber+ "].goodsCode' type='hidden' value='" + goodsCode + "'>";
					form_contents += goodsCode_input;
					
					let cartQuantity_input = "<input name='orders[" + orderNumber + "].cartQuantity' type='hidden' value='" + cartQuantity + "'>";
					form_contents += cartQuantity_input;
					
					orderNumber +=1;
				}
			});
			
			$(".order_form").html(form_contents);
			$(".order_form").submit();
		}
	}else{
		alert("선택된 상품이 없습니다.");
	}
});


</script>
