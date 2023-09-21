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
  
		<div class="row qnas" style="text-align: center;">
		<form name="frm_order_all_cart">
    <c:set value="${pageContext.request.contextPath}" var="contextPath" />
			<h1 class="page-header">장바구니</h1>
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>사이즈</th>
						<th>상품정보</th>
            <th></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
            <c:when test="${cartList != null}">
  					<c:forEach items="${cartList}" var="cartList" varStatus="status">
              <input type="hidden" id="cartId" value="${cartList.cartId}">
            
  						<tr>
                <!-- 이미지 -->
  							<td class="product-close">
    							<img alt="thumbnail" src="${pageContext.request.contextPath }/img/goods-img/${cartList.goodsImage}"
                    style="max-width: 100px; max-height: 100px;">
  							</td>
                <!-- 이름 -->
                <td><a href="<c:url value='/goods/goods_detail?goodsName=' />${cartList}">${cartList.goodsCode}</a>
                    <input value="${cartList.goodsCode}" id="goodsCode" type="hidden" >
                </td>

                <!-- 가격 -->
  							<td>
                  <fmt:formatNumber type="number" value="${cartList.goodsPrice}"/>&nbsp;원<br>
  							</td>
                
                <!-- 수량 -->
                <td>
                  ${cartList.goodsCount}
                </td>
                <!-- 사이즈 -->
                <%-- <td>${cartList.goodsSize }</td> --%>
                <td>S</td>
                <!-- 정보 -->
								<td>${cartList.goodsInfo}</td>
								<td>	
                  <input type="hidden" value="${member.memberId}" id="login_memberId">
									<button style="border: 1px solid forestgreen" class="btn btn-default cart_to_order" data-pId="${cartList.goodsCode}">주문하기</button>
									<br>
									<button type="button" style="border: 1px solid forestgreen" class="btn btn-default del_from_cart" data-pId="${cartList.goodsCode}">삭제하기</button>
						    </td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="5"><h3>장바구니에 내역이 없습니다.</h3></td></tr>
					</c:otherwise>
          </c:choose>
				</tbody>
			</table>
		</form>
	</div>
		
		<div class="row" style="text-align: center; margin: 80px 0;">
			<button class="btn btn-default btn-back_to_shop">쇼핑을 계속하기</button>
		</div>
</div>

  <script type="text/javascript">
    var memberId = $("#login_memberId").val();
    //var goodsCode = document.getElementById("goodsCode").value;
		var cartId = document.getElementById("cartId").value;
    
    $(".del_from_cart").click(function(event) {
      		event.preventDefault();
      		
      		if(memberId != null) {
  	        alert(goodsCode);
  	        alert(cartId);
  	        
      			$.ajax({
      	            type : "post",
      	            url : "<c:url value='/cart/delFromCart/' />",
      	            data : {
      	            	"goodsCode": goodsCode,
      	              "memberId" : memberId
      	            },
      	            dataType : 'text',
      	            success : function(result) {
      	              
      	              if (result == 'ok') {
      	                alert("장바구니에서 삭제되었습니다.");
      	                location.assign("<c:url value='/cart/mycart/' />" + memberId);
      	              } else {
      	                alert("이미 삭제 된 상품입니다.");
      	              }
      	            },
      	            error: function (xhr, status, error) {
      	              console.error(xhr.responseText);
      	            	}
      	          });
      		} else {
      			alert("로그인 후 이용해 주세요.");
      			location.assign("<c:url value='/login' />");
      		} 
    });
    
     
    $(".cart_to_order").click(function(event) {
      event.preventDefault();
      
      if (memberId != null) {
    	  var item = $(this);
    	  var goodsCode = item.attr("data-pId");
    	  
        alert("goodsCode = "+goodsCode);
        location.assign("<c:url value='/order/insert/'/>" + cartId);
      } else {
				alert("로그인 후 이용해 주세요.");
  			location.assign("<c:url value='/login' />");
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
      location.assign("<c:url value='/goods/main' />");
    });
    
    /* 
    function orderBtn(cartId){
    	var test = $('#'+cartId).val();
    	alert(test);
    }
   */

  
</script>