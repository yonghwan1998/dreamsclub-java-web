<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
		$(".btn-back_to_shop").click(function() {
			history.back();
		});
</script>

<div class="container">
	
	<c:set value="${cartMap.cartlist}" var="cartlist"/>
	<c:set value="${cartMap.goodsList}" var="goodsList"/>
		
		<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">장바구니</h1>
			<table class="table table-hover" style="width: 70%; margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">상품명</th>
						<th style="text-align: center;">가격</th>
						<th style="text-align: center;">수량</th>
						<th>상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:choose><c:when test="${goodsList != null}">
					<c:forEach items="${goodsList}" var="vo" varStatus="status">
						<tr>
							<td><img alt="thumbnail" src="${pageContext.request.contextPath }/img/goods-img/${vo.goodsImage }"
								style="max-width: 100px; max-height: 100px;"></td>
							<td>${vo.goodsCode}</td>
							<td><fmt:formatNumber type="number" value="${vo.goodsPrice}"/>&nbsp;원</td>
							<td style="text-align: center;">
								<select>
									<c:forEach var="count" begin="1" end="${vo.goodsStock > 5 ? 5 : vo.goodsStock}">
									<option>${count}</option>
									</c:forEach>
								</select>
							</td>
							<td style="text-align: center;">${vo.goodsInfo}</td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="5"><h3>장바구니에 내역이 없습니다.</h3></td></tr>
					</c:otherwise></c:choose>
				</tbody>
			</table>
		</div>
		
		<div class="row" style="text-align: center; margin: 80px 0;">
			<button class="btn btn-default">주문하기</button>
			<button class="btn btn-default btn-back_to_shop">쇼핑을 계속하기</button>
		</div>

	</div>
