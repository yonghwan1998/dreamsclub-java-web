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
	<input type="hidden" id="goodsCode" value="${orderInfo.goodsCode}">
	<div class="container">

		<div class="row" style="text-align: center;">
			<h1 class="page-header" style="margin-bottom: 50px;">주문이 완료되었습니다.</h1>
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>옵션</th>
						<th>결제금액</th>
					</tr>
				</thead>
				<tbody style="text-align: left; vertical-align: middle;">
						<tr>
							<td>${orderInfo.goodsCode.split("-")[0] }</td>
							<td><fmt:formatNumber type="number" value="${orderInfo.goodsPrice}"/>&nbsp;원</td>
							<td>${orderInfo.goodsCount}</td>
							<td>${orderInfo.goodsCode.spilit("-")[2]}</td>
              <td>${orderInfo.goodsPrice }</td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<hr>
		<div class="row" style="text-align: center;">
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th>주문자</th>
						<th>배송지</th>
						<th>전화번호</th>
						<th>배송상태</th>
						<th>배송메세지</th>
					</tr>
				</thead>
				<tbody style="text-align: left;">
						<tr>
							<td>${orderInfo.memberName}</td>
							<td colspan="2" style="text-align: left !important;">${orderInfo.memberPcode}<br>${orderInfo.memberAddress1}<br>${orderInfo.memberAddress2}</td>
							<td>${orderInfo.memberPhone}</td>
							<td id="order_status"></td>
							<td>${orderInfo.deliverMsg}</td>
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
	
	$(document).ready(function() {
		
		var memberId = $("#login_memberId").val();
		var goodsCode = $("#goodsCode").val();
		
		order_status();
		
		$(".back_btn").click(function(event) {
			event.preventDefault();
			//location.assign("/");
			alert(goodsCode);
		});
		
	    
    function order_status() {
    	var status = "<c:out value='${orderInfo.orderStatus}'/>";
    	if (status == '0') {
			status = "배송 준비중";
		} else if (status == '1') {
			status = "배송중";
		} else if (status == '2') {
			status = "배송 완료";
		}
    	
    	$("#order_status").html(status);
		}
	
	});
	
</script>
