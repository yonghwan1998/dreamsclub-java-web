<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
function selectChange(obj){
	var option = obj.value;
	
	$.ajax({
		type : "post",
		url : "<c:url value="/goods/rest_option"/>",
		contentType : "application/json",
		data : JSON.stringify({
			"option" : option
		}),
		dateType : "text",
		success : function(result) {
			if (result == "success") {
				alert("success");
			}
				alert("fail");
		},
		error : function(xhr) {
			alert("에러코드(게시글 삽입) = " + xhr.stauts);
		}
	});
	
}

</script>


<div class="shop-area pt-95 pb-100">
	<div class="container">
		<div class="row flex-row-reverse">
			<div class="col-lg-9">
				<div class="shop-top-bar">
					<div class="select-shoing-wrap">
						<div class="shop-select">
							<select id="selectFilter" onchange="selectChange(this);">
								<option value="name">이름순</option>
								<option value="star">별점순</option>
								<option value="price">가격순</option>
								<option value="review">리뷰순</option>
							</select>
						</div>
						<p>${goodsCount }개 검색 결과</p>
					</div>
				</div>


				<c:forEach var="goods" items="${goodsList }">
					<div class="shop-bottom-area mt-35">
						<div class="tab-content jump">
							<div id="shop-1" class="tab-pane active">
								<div class="shop-list-wrap mb-30">
									<div class="row">
										<div class="col-xl-4 col-lg-5 col-md-5 col-sm-6">
											<div class="product-wrap">
												<div class="product-img">
													<a href="<c:url value="/goods/detail?goodsCode=${goods.goodsCode }"/>"> <img class="default-img" src="${pageContext.request.contextPath }/img/product/pro-1.jpg" alt=""> <img class="hover-img" src="${pageContext.request.contextPath }/img/product/pro-1-1.jpg" alt="">
													</a>
												</div>
											</div>
										</div>
										<div class="col-xl-8 col-lg-7 col-md-7 col-sm-6">
											<div class="shop-list-content">
												<h3>
													<a href="<c:url value="/goods/detail?goodsCode=${goods.goodsCode }"/>" class="goodsCode" >${goods.goodsCode }</a>
												</h3>
												<div class="product-list-price">
													<span><fmt:formatNumber value="${goods.goodsPrice }" pattern="#,###" /> 원</span>
												</div>
												<div class="rating-review">
													<div class="product-list-rating">
														<i class="fa fa-star-o yellow"></i> <i class="fa fa-star-o yellow"></i> <i class="fa fa-star-o yellow"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
													</div>
													<a href="#">3 Reviews</a>
												</div>
												<p></p>
												<div class="shop-list-btn btn-hover">
													<a href="<c:url value="/goods/detail?goodsCode=${goods.goodsCode }"/>">상세정보</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 
				<div class="pro-pagination-style text-center mt-30">
					<ul>
						<li><a class="prev" href="#"><i class="fa fa-angle-double-left"></i></a></li>
						<li><a class="active" href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a class="next" href="#"><i class="fa fa-angle-double-right"></i></a></li>
					</ul>
				</div>
				-->


			</div>
			<div class="col-lg-3">
				<div class="sidebar-style mr-30">
					<div class="sidebar-widget">
						<h4 class="pro-sidebar-title">Search</h4>
						<div class="pro-sidebar-search mb-50 mt-25">
							<form class="pro-sidebar-search-form" method="get" action="/dreams/goods/main/search">
								<input id="searchText" type="text" name="q" placeholder="Search here...">
								<button id="searchBtn">
									<i class="pe-7s-search"></i>
								</button>
							</form>
						</div>
					</div>
					<div class="sidebar-widget mt-45">
						<h4 class="pro-sidebar-title">Filter By Price</h4>
						<div class="price-filter mt-10">
							<div class="price-slider-amount">
								<input type="text" id="amount" name="price" placeholder="Add Your Price" />
							</div>
							<div id="slider-range"></div>
						</div>
					</div>
					<div class="sidebar-widget mt-40">
						<h4 class="pro-sidebar-title">Category</h4>
						<div class="sidebar-widget-list mt-20">
							<ul>
								<li>
									<div class="sidebar-widget-list-left">
										<input type="checkbox" value=""> <a href="#">Uniform</a> <span class="checkmark"></span>
									</div>
								</li>
								<li>
									<div class="sidebar-widget-list-left">
										<input type="checkbox" value=""> <a href="#">Cap</a> <span class="checkmark"></span>
									</div>
								</li>
								<li>
									<div class="sidebar-widget-list-left">
										<input type="checkbox" value=""> <a href="#">Fan</a> <span class="checkmark"></span>
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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-5 col-sm-12 col-xs-12">
						<div class="tab-content quickview-big-img">
							<div id="pro-1" class="tab-pane fade show active">
								<img src="${pageContext.request.contextPath }/img/product/quickview-l1.jpg" alt="">
							</div>
							<div id="pro-2" class="tab-pane fade">
								<img src="${pageContext.request.contextPath }/img/product/quickview-l2.jpg" alt="">
							</div>
							<div id="pro-3" class="tab-pane fade">
								<img src="${pageContext.request.contextPath }/img/product/quickview-l3.jpg" alt="">
							</div>
							<div id="pro-4" class="tab-pane fade">
								<img src="${pageContext.request.contextPath }/img/product/quickview-l2.jpg" alt="">
							</div>
						</div>
						<!-- Thumbnail Large Image End -->
						<!-- Thumbnail Image End -->
						<div class="quickview-wrap mt-15">
							<div class="quickview-slide-active owl-carousel nav nav-style-1" role="tablist">
								<a class="active" data-bs-toggle="tab" href="#pro-1"><img src="${pageContext.request.contextPath }/img/product/quickview-s1.jpg" alt=""></a> <a data-bs-toggle="tab" href="#pro-2"><img src="${pageContext.request.contextPath }/img/product/quickview-s2.jpg" alt=""></a> <a data-bs-toggle="tab" href="#pro-3"><img src="${pageContext.request.contextPath }/img/product/quickview-s3.jpg" alt=""></a> <a data-bs-toggle="tab" href="#pro-4"><img src="${pageContext.request.contextPath }/img/product/quickview-s2.jpg" alt=""></a>
							</div>
						</div>
					</div>
					<div class="col-md-7 col-sm-12 col-xs-12">
						<div class="product-details-content quickview-content">
							<h2>Products Name Here</h2>
							<div class="product-details-price">
								<span>$18.00 </span> <span class="old">$20.00 </span>
							</div>
							<div class="pro-details-rating-wrap">
								<div class="pro-details-rating">
									<i class="fa fa-star-o yellow"></i> <i class="fa fa-star-o yellow"></i> <i class="fa fa-star-o yellow"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
								</div>
								<span>3 Reviews</span>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisic elit eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim ad minim venialo quis nostrud exercitation ullamco</p>
							<div class="pro-details-list">
								<ul>
									<li>- 0.5 mm Dail</li>
									<li>- Inspired vector icons</li>
									<li>- Very modern style</li>
								</ul>
							</div>
							<div class="pro-details-size-color">
								<div class="pro-details-color-wrap">
									<span>Color</span>
									<div class="pro-details-color-content">
										<ul>
											<li class="blue"></li>
											<li class="maroon active"></li>
											<li class="gray"></li>
											<li class="green"></li>
											<li class="yellow"></li>
											<li class="white"></li>
										</ul>
									</div>
								</div>
								<div class="pro-details-size">
									<span>Size</span>
									<div class="pro-details-size-content">
										<ul>
											<li><a href="#">s</a></li>
											<li><a href="#">m</a></li>
											<li><a href="#">l</a></li>
											<li><a href="#">xl</a></li>
											<li><a href="#">xxl</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="pro-details-quality">
								<div class="cart-plus-minus">
									<input class="cart-plus-minus-box" type="text" name="qtybutton" value="2">
								</div>
								<div class="pro-details-cart btn-hover">
									<a href="#">Add To Cart</a>
								</div>
								<div class="pro-details-wishlist">
									<a href="#"><i class="fa fa-heart-o"></i></a>
								</div>
								<div class="pro-details-compare">
									<a href="#"><i class="pe-7s-shuffle"></i></a>
								</div>
							</div>
							<div class="pro-details-meta">
								<span>Categories :</span>
								<ul>
									<li><a href="#">Minimal,</a></li>
									<li><a href="#">Furniture,</a></li>
									<li><a href="#">Electronic</a></li>
								</ul>
							</div>
							<div class="pro-details-meta">
								<span>Tag :</span>
								<ul>
									<li><a href="#">Fashion, </a></li>
									<li><a href="#">Furniture,</a></li>
									<li><a href="#">Electronic</a></li>
								</ul>
							</div>
							<div class="pro-details-social">
								<ul>
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
									<li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal end -->
<script type="text/javascript">

	// 장바구니 버튼 클릭시
	$("#addCartBtn").click(function() {
		var goodsCode = $(".goodsCode").text();

		alert(goodsCode);
		
		$.ajax({
			type : "post",
			url : "<c:url value="/goods/rest_test"/>",
			contentType : "application/json",
			data : JSON.stringify({
				"goodsCode" : goodsCode
			}),
			dateType : "text",
			success : function(result) {
				if (result == "success") {
					alert("jsp");
				}
			},
			error : function(xhr) {
				alert("에러코드(게시글 삽입) = " + xhr.stauts);
			}
		});
	});
	
</script>
