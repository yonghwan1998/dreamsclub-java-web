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

h1 {
  margin-bottom: 6rem;
}
  
.btn-back_to_shop {
  border: none;
  display: block;
  text-align: center;
  cursor: pointer;
  text-transform: uppercase;
  outline: none;
  overflow: hidden;
  position: relative;
  color: #fff;
  font-weight: 700;
  font-size: 15px;
  background-color: #222;
  padding: 17px 60px;
  margin: 0 auto;
  box-shadow: 0 5px 15px rgba(0,0,0,0.20);
  width: 20%;
}

.btn-back_to_shop span {
  position: relative; 
  z-index: 1;
}

.btn-back_to_shop:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  height: 490%;
  width: 140%;
  background: #a749ff;
  -webkit-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
  -webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
  transform: translateX(-98%) translateY(-25%) rotate(45deg);
}

.btn-back_to_shop:hover:after {
  -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
  transform: translateX(-9%) translateY(-25%) rotate(45deg);
  color: white;
}

.cart_to_order,.del_from_cart {
  display: block;
  position: relative;
  float: left;
  top: -3rem;
  left: 2rem;
  width: 120px;
  padding: 0;
  margin: 10px 20px 10px 0;
  background: #00AE68;
  font-weight: 600;
  text-align: center;
  line-height: 45px;
  color: #FFF;
  border-radius: 5px;
  transition: all 0.2s ;
  box-shadow: 0px 5px 0px 0px #007144;
}

.cart_to_order,.del_from_cart:hover {
  margin-top: 15px;
  margin-bottom: 5px;
  box-shadow: 0px 5px 0px 0px #1E8185;
  
}
</style>
<div class="container">
  
		<div class="row qnas">
    <c:set value="${pageContext.request.contextPath}" var="contextPath" />
			<h1 class="page-header" style="text-align: center;">장바구니</h1>
			<div class="table table-hover" style="display:table; margin: auto; border-bottom: 1px solid #D5D5D5;">
				<div class="table1" style="display:table-row; height: 4rem;">
					<div style="text-align: center; display:table-cell; left: 7rem; position: relative; font-weight: bold; font-size: 25px;">상품명</div>
					<div style="display:table-cell; left: 12rem; position: relative; font-weight: bold; font-size: 25px;">가격</div>
					<div style="display:table-cell; left: 10rem; position: relative; font-weight: bold; font-size: 25px;">수량</div>
					<div style="display:table-cell; left: 10rem; position: relative; font-weight: bold; font-size: 25px;">사이즈</div>
					<div style="display:table-cell; left: 13rem; position: relative; font-weight: bold; font-size: 25px;">상품정보</div>
				</div>
        <!-- 장바구니에 굿즈가 존재하는 경우 -->
				<c:choose>
      		<c:when test="${cartList != null}">
  				    <c:forEach items="${cartList}" var="cartList" varStatus="status">
							<div style="display:table-row; font-size: 20px;">
  							
      		  	<!-- 이미지 -->
  						<div class="product-close" style="display:table-cell;">
  							<img alt="thumbnail" src="${pageContext.request.contextPath }/img/goods-img/${cartList.goodsImage}" style="max-width: 150px; max-height: 150px;">
  						</div>
  							
              <!-- 이름 -->
              <div style="display:table-cell;">
              	<a href="<c:url value='/goods/goods_detail?goodsName=' />${cartList}">${cartList.goodsCode.split("-")[0]}</a>
              </div>
			                
      			  <!-- 가격 -->
  						<div style="display:table-cell;">
          				<fmt:formatNumber type="number" value="${cartList.goodsPrice * cartList.goodsCount}"/>&nbsp;원<br>
  						</div>
                  
        			<!-- 수량 -->
        			<div style="display:table-cell; text-align: center;">
          				${cartList.goodsCount}
        			</div>
                			
        			<!-- 사이즈 -->
        			<div style="display: table-cell; text-align: center;">
        				${cartList.goodsCode.split("-")[2]}
        			</div>
                			
      			 <!-- 정보 -->
  					<div style="display:table-cell; text-align: center;">
  						${cartList.goodsInfo}
  					</div>
  					<form id="orderForm" action="<c:url value="/order/insert"/>" method="post">
  					<div style="display:table-cell">	
              <input type="hidden" value="${cartList.cartId}" name="cartId">
              <input type="hidden" value="${cartList.goodsCode}" name="goodsCode">
              <input type="hidden" value="${cartList.goodsCount}" name="goodsCount">
              <input type="hidden" value="${cartList.goodsPrice}" name="goodsPrice">
              <input type="hidden" value="${member.memberId}" id="login_memberId" name="memberId">
					 <button type="submit" style="border: 1px solid forestgreen" class="btn btn-default cart_to_order" data-pId="${cartList.goodsCode}">주문하기</button>
  					<br>
  					<button type="button" style="border: 1px solid forestgreen" class="btn btn-default del_from_cart" data-pId="${cartList.goodsCode}">삭제하기</button>
  			    </div>
    		    </form>
  				  </div>
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
			<button class="btn btn-default btn-back_to_shop"><span>쇼핑을 계속하기</span></button>
		</div>
</div>

  <script type="text/javascript">
    var memberId = $("#login_memberId").val();
		
    //형섭(수정): 2023/09/21, 삭제 버튼 누르면 동작하는 함수
    $(".del_from_cart").click(function(event) {
      		event.preventDefault();
      		
      		if(memberId != null) {
    	      var item = $(this);
      	 		var goodsCode = item.attr("data-pId"); //선택한 object의 data속성을 가져오기
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
      	            	  //경고창 출력 및 현재 페이지 유지
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