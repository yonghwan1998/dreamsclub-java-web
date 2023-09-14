<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
  #text_in_the_image{
    float: left;
    margin-top: 50px;
    margin-left: 130px;
    text-align: left;
  }
  
  #text_in_the_image h1{

    font-size: 5em;
    font-family: 'Impact';
  }
  
  #text_in_the_image h3{

    font-size: 3em;
    font-family: 'Copperplate';
  } 
  
  #text_in_the_image p{

    font-size: 8em;
    font-family: 'Impact';
  } 
  
  #text_in_the_image p span{
  
    text-align: center;
    font-family: 'Impact';
    color: red;
    text-shadow: 3px 4px 5px gray;
  }
  
  .container{
    margin-top: 50px;
  }
  
  .products li{
    list-style: none;
  }
  
  .products li .scale{
    text-align: center;
    font-family: '나눔명조 Bold';
  }
  
  .nav li{
    cursor: pointer;
  }

  
</style>

<script type="text/javascript">
function itemSum(){
    var str = "";
    var sum = 0;
    var count = $(".chkbox").length;
    for(var i=0; i < count; i++ ){
        if( $(".chkbox")[i].checked == true ){
         sum += parseInt($(".chkbox")[i].value);
        }
    }
    $("#total_sum").html(sum+" 원");
    $("#amount").val(sum);
 }

$("#allCheck").click(function(){
var chk = $("#allCheck").prop("checked");
if(chk) {
    $(".chkbox").prop("checked", true);
        itemSum();
} else {
     $(".chkbox").prop("checked", false);
    itemSum();
}
});

</script>

<div class="container">

	<c:set value="${cartMap.cartList}" var="cartList"/>
	<c:set value="${cartMap.goodsList}" var="goodsList"/>
	
	<c:forEach items="${cartList}" var="cList">
		<input type="hidden" value="${cList.cartId}" name="cartId">
	</c:forEach>
		
		<div class="row qnas" style="text-align: center;">
		<form action="/order/cartOrder" method="post" id="orderForm">
			<h1 class="page-header">장바구니</h1>
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>옵션</th>
						<th>상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:choose><c:when test="${goodsList != null}">
					<c:forEach items="${goodsList}" var="vo" varStatus="status">
						<tr>
							<td class="product-close">
							<input type="checkbox" class="chkbox" onClick="itemSum()" 
							 value="" data-cartNum="${vo.goodsCode}" checked style="margin-right: 30px;">
							<img alt="thumbnail" src="${pageContext.request.contextPath }/img/goods-img/${vo.goodsImage }"
                style="max-width: 100px; max-height: 100px;">
							</td>
							<td><a href="/goods/goods_detail/${cartList[status.index].goodsCode}">${vo.goodsCode}</a>
								<input value="${cartList[status.index].goodsCode}" name="goodsCode" type="hidden">
							</td>
							<td><fmt:formatNumber type="number" value="${vo.goodsPrice}"/>&nbsp;원<br>
								<span><fmt:parseNumber var="test" value="${vo.goodsPrice / 100}" integerOnly="true"/> ${test}&nbsp;원
										<input value="${test}" type="hidden" name="getPoint" id="point"></span></td>
								<td><c:choose>
										<c:when test="${vo.goodsStock == 0}">
											<span>품절된 상품입니다.</span>
										</c:when>
										<c:otherwise>
											<select class="form-control" name="goods_count">
												<c:forEach var="count" begin="1" end="${vo.goodsStock > 5 ? 5 : vo.goodsStock}">
													<option>${goodsCount}</option>
												</c:forEach>
											</select>
										</c:otherwise>
									</c:choose>
									</td>
                    <td>
												<div class="form-horizontal" style="text-align: left;">
													<select class="form-control opt_select" name="selected_Opt">
														<option value="S">S</option>
														<option value="M">M</option>
														<option value="L">L</option>
                            <option value="F">Free</option>
													</select>
												</div>
                     </td>
										<td>${vo.goodsInfo}</td>
									<td>	
								<c:choose>
									<c:when test="${vo.goodsStock == 0}">
										<button class="btn btn-default" disabled="disabled">주문하기</button><br>
										<button class="btn btn-default del_from_cart" data-pId="${cartList[status.index].goodsCode}">삭제하기</button>
									</c:when>
									<c:otherwise>
                    <input type="hidden" value="${member.memberId}" id="login_memberId">
										<button class="btn btn-default cart_to_order" data-pId="${cartList[status.index].goodsCode}">주문하기</button>
										<br>
										<button class="btn btn-default del_from_cart" data-pId="${cartList[status.index].goodsCode}">삭제하기</button>
									</c:otherwise>
								</c:choose> 
							</td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="5"><h3>장바구니에 내역이 없습니다.</h3></td></tr>
					</c:otherwise></c:choose>
				</tbody>
			</table>
		</form>
	</div>
		
		<div class="row" style="text-align: center; margin: 80px 0;">
			<button class="btn btn-default btn-back_to_shop">쇼핑을 계속하기</button>
		</div>
	
	</div>

  <script type="text/javascript">
  
  $(document).ready(function() {
    
    var memberId = $("#login_memberId").val();
    
    $(".del_from_cart").click(function(event) {
      event.preventDefault();
      var item = $(this);
      var goodsCode = item.attr("data-pId");
      var memberId = $("#login_memberId").val();
      
      $.ajax({
        
        type : 'post',
        url : '<c:url value='/cart/delFromCart'/>',
        data : {
          goodsCode : goodsCode,
          memberId : memberId
        },
        dataType : 'text',
        success : function(result) {
          
          if (result == 'ok') {
            alert("장바구니에서 삭제되었습니다.");
            location.assign("<c:url value='/order/mycart/' />" + memberId);
          } else {
            alert("이미 삭제 된 상품입니다.");
          }
        },
        error: function (xhr, status, error) {
          console.error(xhr.responseText);
        }
      });
      
      
    });
    
    
    $(".cart_to_order").click(function(event) {
      event.preventDefault();
      
      if (memberId != null) {
        var item = $(this);
        var goodsCode = item.attr("data-pId");
        
        location.assign("<c:url value='/order/insert'/>" + goodsCode);
      } else {
        alert("로그인이 필요합니다.");
        location.assign("/member/login");
      }

      
    });
    
     $("#orderSuccess").click(function () {
       
             var checkArr = new Array();

             
             $("input[class='chkbox']:checked").each(function () {
                 checkArr.push($(this).attr("data-cartNum"));

             });

             $("#chk").val(checkArr);
 

            if (confirm("주문 하시겠습니까?")) {
 
                 $("#orderForm").submit();
                 console.log(checkArr);
             }
         });
    
    $(".btn-back_to_shop").click(function() {
      location.assign("/");
    });
    
    
    $("#mycart_btn").click(function(event) {
      event.preventDefault();
      location.assign("<c:url value='/order/mycart'/>" + memberId);
      
    }); 
    
    $("#go_to_member_insert").click(function(event) {
      event.preventDefault();
      
      location.assign("<c:url value='/join/check'/>");
    });
    
    $("#mypage_btn").click(function(event) {
      event.preventDefault();
      var memberId = $("#login_memberId").val();
      
      location.assign("<c:url value='/mypage'/>" + memberId);
    })
    
    $("#logout_btn").click(function(event) {
      event.preventDefault();
      
      var logout = confirm("로그아웃 하시겠습니까?");
      
      if (logout) {
        location.assign("<c:url value='/logout'/>");
      }
    });
    
    $("#go_to_adminPage").click(function(event) {
      event.preventDefault();
      
      location.assign("<c:url value='/admin'/>");
    
    });
  
  });
  
</script>