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
	<div id="gnb">
		<a href="/">Hello World</a>
		<div  class="text-right" >
			<c:choose>
				<c:when test="${login.userid != null}">
					<span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
					<span id="login_log" style="border-bottom: 1px solid white;">${login.userid} 님, 환영합니다.</span>
					<span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${login.userid == 'admin'}">
						<button id="go_to_adminPage">관리자 페이지</button>
					</c:if>
					<button class="mycart_btn">장바구니</button>
					<button id="mypage_btn">마이페이지</button>
					<button id="logout_btn">로그아웃</button>
					<input type="hidden" value="${login.userid}" id="login_userid">
				</c:when>
				
				<c:otherwise>
					<button onclick="location.href='/member/login'">로그인</button><button onclick="location.href='/member/insert'">회원가입</button>
				</c:otherwise>
			</c:choose>	
			
		</div>
	</div>

	<div class="container logo">
		<a href="/">Hello World</a>
	</div>

	<div class="nav">
		<nav>
			<ul class="nav nav-tabs nav-justified">
				<li value="outer">OUTER</li>
				<li value="top">TOP</li>
				<li value="bottom">BOTTOM</li>
				<li value="bag">BAG</li>
				<li value="acc">ACC</li>
				<li value="qna">Q&A</li>
			</ul>
		</nav>
	</div>
	
	<br>
	
	<div class="container">

		<c:set value="${orderDTO}" var="dto"/>
		<div class="row" style="text-align: center;">
			<h1 class="page-header" style="margin-bottom: 50px;">주문이 완료되었습니다.</h1>
			<table class="table table-hover" style="margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center !important;">상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>옵션</th>
						<th>결제금액</th>
					</tr>
				</thead>
				<tbody style="text-align: left; vertical-align: middle;">
						<tr>
							<td style="text-align: center;"><img alt="thumbnail" src="/resources/upload${dto.fullname}" width="30%">
							<input type="hidden" value="${dto.productId}" name="productId" id="productId">
							</td>
							<td>${dto.productName}<br>${dto.productInfo}</td>
							<td><fmt:formatNumber type="number" value="${dto.price}"/>&nbsp;원</td>
							<td>${dto.order_Qty}</td>
							<td>${dto.selected_Opt}</td>
							<td><fmt:formatNumber type="number" value="${dto.totalAmount}"/>&nbsp;원</td>
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
							<td>${dto.username}</td>
							<td>${dto.postcode}<br>${dto.useraddress}</td>
							<td>${dto.tel}</td>
							<td id="del_situ"></td>
							<td>${dto.deliver_msg}</td>
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
		
		var userid = $("#login_userid").val();
		var productId = $("#productId").val();
		
		del_situ();
		
		
		$(".back_btn").click(function(event) {
			event.preventDefault();
			location.assign("/");
		});

		$(".mycart_btn").click(function(event) {
			event.preventDefault();
			location.assign("/order/mycart/" + userid);
			
		});
		
		$("li").on('click', function() {
			var productDist = $(this).attr("value");
			
			if (productDist == 'qna') {
				location.assign("/board/qna");
			} else {
				location.assign("/product/" + productDist);
			}		
		});
		
		$("#go_to_member_insert").click(function(event) {
			event.preventDefault();
			
			location.assign("/member/insert");
		});
		
		$("#mypage_btn").click(function(event) {
			event.preventDefault();
			var userid = $("#login_userid").val();
			
			location.assign("/member/read/" + userid);
		})
		
		$("#logout_btn").click(function(event) {
			event.preventDefault();
			
			var logout = confirm("로그아웃 하시겠습니까?");
			
			if (logout) {
				location.assign("/member/logout");
			}
		});
		
		$("#go_to_adminPage").click(function(event) {
			event.preventDefault();
			
			location.assign("/admin/orderedlist");
		
		});
		
		$("#searchAdd").click(function(event) {
			event.preventDefault();
			postcode();

		});
	    
	    function del_situ() {
	    	var situ = "<c:out value='${dto.deliver_situ}'/>";
	    	if (situ == '0') {
				situ = "배송 준비중";
			} else if (situ == '1') {
				situ = "배송중";
			} else if (situ == '2') {
				situ = "배송 완료";
			}
	    	
	    	$("#del_situ").html(situ);
		}
	
	});
	
</script>
