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
    <c:set value="${pageContext.request.contextPath}" var="contextPath" />
			<h1 class="page-header">장바구니</h1>
			<div class="table table-hover" style="display:table; margin: auto; border-bottom: 1px solid #D5D5D5;">
				<div style="display:table-row;">
					<div style="text-align: center; display:table-cell;">상품명</div>
					<div style="display:table-cell">가격</div>
					<div style="display:table-cell">수량</div>
					<div style="display:table-cell">사이즈</div>
					<div style="display:table-cell">상품정보</div>
				</div>
				<c:choose>
      		<c:when test="${cartList != null}">
  				<c:forEach items="${cartList}" var="cartList" varStatus="status">
					  <form id="orderForm" action="<c:url value="/order/insert"/>" method="post">
							<div style="display:table-row">
  							<input type="hidden" value="${cartList.cartId}" name="cartId">
  							<input type="hidden" value="${cartList.goodsCode}" name="goodsCode">
  							<input type="hidden" value="${member.memberId}" id="login_memberId" name="memberId">
  							
      		  	<!-- 이미지 -->
  						<div class="product-close" style="display:table-cell">
  							<img alt="thumbnail" src="${pageContext.request.contextPath }/img/goods-img/${cartList.goodsImage}" style="max-width: 100px; max-height: 100px;">
  						</div>
  							
              <!-- 이름 -->
              <div style="display:table-cell">
              	<a href="<c:url value='/goods/goods_detail?goodsName=' />${cartList}">${cartList.goodsCode.split("-")[0]}</a>
              </div>
			                
      			 <!-- 가격 -->
						<div style="display:table-cell">
              				<fmt:formatNumber type="number" value="${cartList.goodsPrice * cartList.goodsCount}"/>&nbsp;원<br>
						</div>
                
      			<!-- 수량 -->
      			<div style="display:table-cell">
        				${cartList.goodsCount}
      			</div>
                			
      			<!-- 사이즈 -->
      			<div>
      				${cartList.goodsCode.split("-")[2]}
      			</div>
                			
    			 <!-- 정보 -->
					<div style="display:table-cell">
						${cartList.goodsInfo}
					</div>
							
					<div style="display:table-cell">	
						<button type="submit" style="border: 1px solid forestgreen" class="btn btn-default cart_to_order" data-pId="${cartList.goodsCode}">주문하기</button>
						<br>
						<button type="button" style="border: 1px solid forestgreen" class="btn btn-default del_from_cart" data-pId="${cartList.goodsCode}">삭제하기</button>
				    </div>
				</div>
		</form>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<div style="display:table-row">
							<div style="display:table-cell">
								<h3>장바구니에 내역이 없습니다.</h3>
							</div>
						</div>
					</c:otherwise>
          </c:choose>
			</div>
	</div>
		
		<div class="row" style="text-align: center; margin: 80px 0;">
			<button class="btn btn-default btn-back_to_shop">쇼핑을 계속하기</button>
		</div>
</div>

  <script type="text/javascript">
    var memberId = $("#login_memberId").val();
		
    //형섭(수정): 2023/09/21, 삭제 버튼 누르면 동작하는 함수
    $(".del_from_cart").click(function(event) {
      		event.preventDefault();
      		
      		if(memberId != null) {
    	      var item = $(this);
      	 		var goodsCode = item.attr("data-pId");
      	 		var cartId = document.getElementById("cartId").value;
  	        
      			$.ajax({
      	            type : "post",
      	            url : "<c:url value='/cart/delFromCart/' />",
      	            data : {
      	            	"goodsCode": goodsCode,
      	              "memberId" : memberId
      	            },
      	            dataType : 'text',
      	            success : function(result) {
      	              
      	            	//컨트롤러에서 받아온 result 값에 따라 삭제 처리
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
    
     
     //형섭(생성): 2023/09/12, 쇼핑 계속하기 버튼 클릭 시 굿즈 메인 페이지로 이동
    $(".btn-back_to_shop").click(function() {
      location.assign("<c:url value='/goods/main' />");
    });
    
    
    //형섭(생성): 2023/09/22, 주문하기 버튼 클릭 시 form 태그 제출 함수
    function submitOrderForm() {
	    var form = document.getElementById("orderForm");
	    form.submit();
	}
    
  
</script>