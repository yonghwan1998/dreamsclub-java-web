<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function purchaseGoods() {
		if ( purchase.goodsSize.value == "0" ) {
	         alert("사이즈를 선택해주세요.");
	         purchase.goodsSize.focus();
	         return;
	      } 
      	purchase.action = "<c:url value="/goods/detail"/>";
      	purchase.submit();
	}
</script>

<div class="shop-area pt-100 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product-details">
                    <div class="product-details-img">
                        <div class="tab-content jump"> 
                            <div id="shop-details-1" class="tab-pane large-img-style">
                                <img src="${pageContext.request.contextPath }/img/product-details/large-1.jpg" alt="">
                                <span class="dec-price">-10%</span>
                                <div class="img-popup-wrap">
                                    <a class="img-popup" href="${pageContext.request.contextPath }/img/product-details/b-large-1.jpg"><i class="pe-7s-expand1"></i></a>
                                </div>
                            </div>
                            <div id="shop-details-2" class="tab-pane active large-img-style">
                                <img src="${pageContext.request.contextPath }/img/product-details/large-2.jpg" alt="">
                                <span class="dec-price">-10%</span>
                                <div class="img-popup-wrap">
                                    <a class="img-popup" href="${pageContext.request.contextPath }/img/product-details/b-large-2.jpg"><i class="pe-7s-expand1"></i></a>
                                </div>
                            </div>
                            <div id="shop-details-3" class="tab-pane large-img-style">
                                <img src="${pageContext.request.contextPath }/img/product-details/large-3.jpg" alt="">
                                <div class="img-popup-wrap">
                                    <a class="img-popup" href="${pageContext.request.contextPath }/img/product-details/b-large-3.jpg"><i class="pe-7s-expand1"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="shop-details-tab nav">
                            <a class="shop-details-overly" href="#shop-details-1" data-bs-toggle="tab">
                                <img src="${pageContext.request.contextPath }/img/product-details/small-1.jpg" alt="">
                            </a>
                            <a class="shop-details-overly active" href="#shop-details-2" data-bs-toggle="tab">
                                <img src="${pageContext.request.contextPath }/img/product-details/small-2.jpg" alt="">
                            </a>
                            <a class="shop-details-overly" href="#shop-details-3" data-bs-toggle="tab">
                                <img src="${pageContext.request.contextPath }/img/product-details/small-3.jpg" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product-details-content ml-70">
                        <form  method="post" name="purchase">
                    <h2>${goodsCode }</h2>
                    <div class="product-details-price">
                    <input type="hidden" name="goodsCode" value="${goodsDetail.goodsCode }">
                    <input type="hidden" name="goodsPrice" value="${goodsDetail.goodsPrice }">
                        <span><fmt:formatNumber value="${goodsDetail.goodsPrice }" pattern="#,###" /> 원</span>
                    </div>
                    <div class="pro-details-rating-wrap">
                        <div class="pro-details-rating">
                            <i class="fa fa-star-o yellow"></i>
                            <i class="fa fa-star-o yellow"></i>
                            <i class="fa fa-star-o yellow"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <span><a href="#">3 Reviews</a></span>
                    </div>
                    <p>${goodsDetail.goodsInfo }</p>
                    <div class="pro-details-size-color">
                        <div class="pro-details-size">
                            <span>Size</span>
                            <select name="goodsSize">
                            	<option value="0" selected>사이즈를 선택해 주세요.</option>
                            	<option value="L">L</option>
                            	<option value="M">M</option>
                            	<option value="S">S</option>
                            </select>
                        </div>
                    </div>
                    <div class="pro-details-quality">
                        <div class="cart-plus-minus">
                            <input class="cart-plus-minus-box" type="text" name="goodsCount" value="1" id="goodsCount" >
                        </div>
                        <div class="pro-details-cart btn-hover">
                            <a onclick="purchaseGoods();">구매하기</a>
                        </div>
                    </div>
                        </form>
                    <div class="pro-details-meta">
                        <span>Category :</span>
                        <ul>
                            <li>${goodsDetail.goodsCategory }</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="description-review-area pb-90">
    <div class="container">
        <div class="description-review-wrapper">
            <div class="description-review-topbar nav">
                <a data-bs-toggle="tab" href="#des-details1">Additional information</a>
                
                <!--  오진서: QnA 버튼 수정 -->
                <a class="active" data-bs-toggle="tab" href="#des-details2">Q&A</a>
                
                <!-- 강민경: 리뷰 버튼 수정 -->
                <a data-bs-toggle="tab" href="#des-details3">상품 리뷰</a>
            </div>
            
            <!-- ▼ QnA -->
            <div class="tab-content description-review-bottom">
                <div id="des-details2" class="tab-pane active">
                    <div class="product-description-wrapper">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
                        <p>ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commo consequat. Duis aute irure dolor in reprehend in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt </p>
                    </div>
                </div>
                
                
                <div id="des-details1" class="tab-pane ">
                    <div class="product-anotherinfo-wrapper">
                        <ul>
                            <li><span>Weight</span> 400 g</li>
                            <li><span>Dimensions</span>10 x 10 x 15 cm </li>
                            <li><span>Materials</span> 60% cotton, 40% polyester</li>
                            <li><span>Other Info</span> American heirloom jean shorts pug seitan letterpress</li>
                        </ul>
                    </div>
                </div>
                
                <!-- 강민경: 상품 리뷰 작성 부분  -->
                <div id="des-details3" class="tab-pane">
                    <div class="row">
                        <div class="col-lg-11">
                            <div class="review-wrapper">
                                 <!-- 리뷰 작성 칸인데 크기가 이상해서 밑에 있는 대댓글 사용할 예정 
                                <div class="single-review">
                                    <div class="review-img">
                                        <img src="${pageContext.request.contextPath }/img/testimonial/1.jpg" alt="">
                                    </div>
                                    <div class="review-content">
                                        <div class="review-top-wrap">
                                            <div class="review-left">
                                                <div class="review-name">
                                                    <h4>작성자 id</h4>
                                                </div>
                                                <div class="review-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="review-left">
                                                <a href="#">삭제</a>
                                            </div>
                                        </div>
                                        <div class="review-bottom">
                                            <p>넝협은행ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
                                        </div>
                                    </div>
                                </div>-->
                                
                                <!-- 강민경: 리뷰 답글 부분 주석처리 (추후 사용할 가능성 있음) -->
                                <div class="single-review child-review">
                                    <div class="review-img">
                                        <img src="${pageContext.request.contextPath }/img/testimonial/2.jpg" alt="">
                                    </div>
                                    <div class="review-content">
                                        <div class="review-top-wrap">
                                            <div class="review-left">
                                                <div class="review-name">
                                                    <h4>강민*</h4>
                                                </div>
                                                <div class="review-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="review-left">
                                                <a href="#">삭제</a>
                                            </div>
                                        </div>
                                        <div class="review-bottom">
                                            <p>넘예버여ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ아 집가고 싶다 집가서 침대에 누워서 고양이 만지면서 멍때리고 싶다 샤워 때리고 맥주 갈기고 싶다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                <a class="active" data-bs-toggle="tab" href="#pro-1"><img src="${pageContext.request.contextPath }/img/product/quickview-s1.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-2"><img src="${pageContext.request.contextPath }/img/product/quickview-s2.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-3"><img src="${pageContext.request.contextPath }/img/product/quickview-s3.jpg" alt=""></a>
                                <a data-bs-toggle="tab" href="#pro-4"><img src="${pageContext.request.contextPath }/img/product/quickview-s2.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-12 col-xs-12">
                        <div class="product-details-content quickview-content">
                            <h2>Products Name Here</h2>
                            <div class="product-details-price">
                                <span>$18.00 </span>
                                <span class="old">$20.00 </span>
                            </div>
                            <div class="pro-details-rating-wrap">
                                <div class="pro-details-rating">
                                    <i class="fa fa-star-o yellow"></i>
                                    <i class="fa fa-star-o yellow"></i>
                                    <i class="fa fa-star-o yellow"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <span>3 Reviews</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisic elit eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim ad minim venialo quis nostrud exercitation ullamco</p>
                            <div class="pro-details-list">
                                <ul>
                                    <li>- 0.5 mm Dail</li>
                                    <li>- Inspired vector icons</li>
                                    <li>- Very modern style  </li>
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

