<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
    margin-top: 1rem;
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
	<input type="hidden" name="goodsCode" value="${orderInfo.goodsCode}">
	<div class="container">
		<div class="row" style="text-align: center;">
			<h1 class="page-header" style="margin-bottom: 50px;">주문이 완료되었습니다.</h1>
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5; margin-bottom: 2rem;">
				<thead>
          <!-- 주문 정보 -->
					<tr>
						<th>상품명</th>
						<th>사이즈</th>
						<th>수량</th>
						<th>결제금액</th>
						<th>주문날짜</th>
					</tr>
				</thead>
        <!-- 굿즈 코드 분리 작업 -->
        <c:set var="goodsName" value="${fn:split(orderInfo.goodsCode, '-')}"/>
				<tbody style="text-align: center; vertical-align: middle;">
						<tr>
							<td>${goodsName[0]}</td><!-- 굿즈명 -->
							<td>${goodsName[2]}</td><!-- 굿즈 사이즈 -->
							<td>${orderInfo.goodsCount}</td><!-- 굿즈 수량 -->
							<td><fmt:formatNumber type="number" value="${orderInfo.goodsPrice}"/>&nbsp;원</td><!-- 결제금액 -->
              <td><!-- 주문날짜 -->
                 <fmt:formatDate value="${orderInfo.orderDate}" pattern="yyyy-MM-dd"/>
              </td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<hr>
		<div class="row" style="text-align: center;">
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
          <!-- 회원 정보 -->
					<tr>
						<th>주문자</th>
						<th>배송지</th>
						<th>전화번호</th>
						<th>배송상태</th>
						<th>배송메세지</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
						<tr>
							<td>${orderInfo.memberName}</td>
							<td style="text-align: center !important;">${orderInfo.memberPcode}<br>${orderInfo.memberAddress1}<br>${orderInfo.memberAddress2}</td>
							<td>${orderInfo.memberPhone}</td>
							<td id="order_status"></td>
							<td>
                  <!-- 배송 요청사항을 미작성 시 default값 설정 -->
                  <c:choose>
                      <c:when test="${empty orderInfo.deliverMsg}">
                          빠른 배송 부탁드려요 ~!
                      </c:when>
                      <c:otherwise>
                          ${orderInfo.deliverMsg}
                      </c:otherwise>
                  </c:choose>
              </td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<div class="row" style="margin: 80px 0; text-align: center;">
			<button class="btn btn-default back_btn">쇼핑을 계속하기</button>
			<button class="btn btn-default mycart_btn">장바구니로 이동하기</button>
		</div>
	</div>

<script type="text/javascript">
	
	$(function() {
		
		var memberId = $("#login_memberId").val();
		var goodsCode = $(".goodsCode").val();
		
		/* 주문 상태 출력 함수 */
		order_status();
		
		/* 쇼핑 계속하기 버튼 */
		$(".back_btn").click(function(event) {
			location.assign("<c:url value='/goods/main' />");
		});
		
		/* 장바구니 버튼 */
		$(".mycart_btn").click(function(event) {
			location.assign("<c:url value='/cart/mycart/' />" + memberId);
		});
		
		/* 주문 상태 출력을 위한 함수 */
    function order_status() {
    	var status = "<c:out value='${orderInfo.orderStatus}'/>";
    	if (status == '0') {
			status = "배송 준비중";
		} else if (status == '1') {
			status = "배송 완료";
		} 
    	
    	$("#order_status").html(status);
		}
	
	});
	
</script>
