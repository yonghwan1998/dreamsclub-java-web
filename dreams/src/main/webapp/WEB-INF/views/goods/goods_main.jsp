<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>

<script>
<!--
- 방용환(수정) : 2023/08/28, 정렬순서 변경 기능 (이름순(초기값), 가격순)
onchange를 통해 selectChange()호출 'map.q'는 GoodsController에서 저장한 검색 키워드,
페이지 최초 호출 시에는 검색어(q) 없음
- 방용환(수정) : 2023/09/12, 카테고리 정렬 체크 되어 있는지 확인하여 submit하는 기능
-->
function selectChange(q){
	var uniformChecked = $('#uniformCheck').is(':checked');
	var capChecked = $('#capCheck').is(':checked');
	var fanChecked = $('#fanCheck').is(':checked');
	
	$("#searchUniform").val(uniformChecked);
	$("#searchCap").val(capChecked);
	$("#searchFan").val(fanChecked);
	
	// 정렬 순서 값 가져오기, 이름순 (goods_code), 가격순 (goods_price)
	$("#searchColumn").val($("#selectFilter").val());
	
	// 검색어(q) 가져오기
	$("#searchText").val(q);
	
	$("#searchForm").submit();
}

</script>

<div class="shop-area pt-95 pb-100">
	<div class="container">
		<div class="row flex-row-reverse">
			<div class="col-lg-9">
				<div class="shop-top-bar">
					<div class="select-shoing-wrap">
						<div class="shop-select">
							<!--
							- 방용환(수정) : 2023/08/28, 정렬순서 변경 기능 (이름순(초기값), 가격순)
							onchange를 통해 selectChange()호출 'map.q'는 GoodsController에서 저장한 검색 키워드,
							페이지 최초 호출 시에는 검색어(q) 없음
							- 방용환(수정) : 2023/09/01, 선택된 정렬순서가 selected 되어 있게 변경
							GoodsController에서 'map.cloumn'에 이름순일 때는 'goods_code' 저장
							가격순일 때는 'goods_price'를 저장해서 삼항 연산자를 통해 selected 되어 있게 설정 
							-->
							<select id="selectFilter" onchange="selectChange('${map.q }');">
								<option value="goods_code" ${map.column == 'goods_code' ? 'selected="selected"' : '' }>이름순</option>
								<%-- <option value="star">별점순</option> --%>
								<option value="goods_price" ${map.column == 'goods_price' ? 'selected="selected"' : '' }>가격순</option>
								<%-- <option value="review">리뷰순</option> --%>
							</select>
						</div>
						<p>${goodsCount }개 검색 결과</p>
					</div>
				</div>
				<!-- 
				방용환(수정) : 2023/08/21, 굿즈 리스트 출력
				c태그를 이용해 전체 굿즈 리스트 출력
				방용환(수정) : 2023/08/31, 굿즈 이미지 출력
				굿즈 등록시 저장한 이미지를 출력
				 -->
				<c:forEach var="goods" items="${goodsList }">
					<div class="shop-bottom-area mt-35">
						<div class="tab-content jump">
							<div id="shop-1" class="tab-pane active">
								<div class="shop-list-wrap mb-30">
									<div class="row">
										<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">
											<div class="product-wrap">
												<div class="product-img">
													<a href="<c:url value="/goods/detail?goodsName=${goods.goodsName }"/>">
														<img class="default-img" src="${pageContext.request.contextPath }/img/goods-img/${goods.goodsImage }">
													</a>
												</div>
											</div>
										</div>
										<div class="col-xl-8 col-lg-7 col-md-7 col-sm-6">
											<div class="shop-list-content">
												<h3>
													<a href="<c:url value="/goods/detail?goodsName=${goods.goodsName }"/>" class="goodsName" >${goods.goodsName }</a>
												</h3>
												<div class="product-list-price">
													<span><fmt:formatNumber value="${goods.goodsPrice }" pattern="#,###" /> 원</span>
												</div>
												<div class="rating-review">
													<div class="product-list-rating">
														<i class="fa fa-star-o yellow"></i> <i class="fa fa-star-o yellow"></i> <i class="fa fa-star-o yellow"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
													</div>
													<a href="#">${goods.reviewCount } Reviews</a>
												</div>
												<p></p>
												<div class="shop-list-btn btn-hover">
													<a href="<c:url value="/goods/detail?goodsName=${goods.goodsName }"/>">상세정보</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="col-lg-3">
				<div class="sidebar-style mr-30">
					<div class="sidebar-widget">
						<h4 class="pro-sidebar-title">Search</h4>
						<div class="pro-sidebar-search mb-50 mt-25">
							<!-- 
							- 방용환(수정) : 2023/08/28, 검색어(q)를 통한 검색 기능 추가
							'#searchBtn' 클릭시 검색어(q) submit, 정렬순서(column)는 hidden으로 submit
							 -->
							<form class="pro-sidebar-search-form" method="post" action="<c:url value="/goods/main"/>" id="searchForm">
								<input type="hidden" name="column" id="searchColumn" value="${map.column }">
								<input type="hidden" name="uniform" id="searchUniform" value="${map.uniform }">
								<input type="hidden" name="cap" id="searchCap" value="${map.cap }">
								<input type="hidden" name="fan" id="searchFan" value="${map.fan }">
								<input type="text" name="q" id="searchText" placeholder="Search here..." value="${map.q }">
								<button id="searchBtn">
									<i class="pe-7s-search"></i>
								</button>
								<div class="price-slider-amount">
									<hr />
									<!-- 
									- 방용환(수정) : 2023/09/09, 가격 범위 검색 기능 추가
									'#priceSearchBtn' 클릭시 가격 범위 submit
									hidden 되어 있는 값들 동시 submit 
									 -->
									<h4 class="pro-sidebar-title">Filter By Price</h4>
									<input type="number" id="minAmount" name="minPrice" placeholder="Add Your Min Price" value="${map.minPrice }"/>
									<h3 class="pro-sidebar-title" align="left" style="margin-left: 10px;"> ~ </h3>
									<input type="number" id="maxAmount" name="maxPrice" placeholder="Add Your Max Price" value="${map.maxPrice }"/>
									<input type="submit" id="priceSearchBtn" value="검색" style="padding: 0px; margin-top: 15px;"/>
								</div>
							</form>
						</div>
					</div>
					<div class="sidebar-widget mt-40">
						<h4 class="pro-sidebar-title">Category</h4>
						<!-- 
						- 방용환(수정) : 2023/09/11, 체크박스 클릭시 해당 카테고리 출력 or 미출력
						- 방용환(수정) : 2023/09/14, 체크박스 옆 이름 클릭시 .trigger()를 통해 체크박스 클릭되는 이벤트 생성
						 -->
						<div class="sidebar-widget-list mt-20">
							<ul>
								<li>
									<div class="sidebar-widget-list-left">
										<input type="checkbox" id="uniformCheck" onclick="selectChange('${map.q }');" ${map.uniform == 'True' ? 'checked="checked"' : '' }> <a onclick="$('#uniformCheck').trigger('click')">Uniform</a> <span class="checkmark"></span>
									</div>
								</li>
								<li>
									<div class="sidebar-widget-list-left">
										<input type="checkbox" id="capCheck" value="" onclick="selectChange('${map.q }');" ${map.cap == 'True' ? 'checked="checked"' : '' }> <a onclick="$('#capCheck').trigger('click')">Cap</a> <span class="checkmark"></span>
									</div>
								</li>
								<li>
									<div class="sidebar-widget-list-left">
										<input type="checkbox" id="fanCheck" value="" onclick="selectChange('${map.q }');" ${map.fan == 'True' ? 'checked="checked"' : '' }> <a onclick="$('#fanCheck').trigger('click')">Fan Goods</a> <span class="checkmark"></span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>