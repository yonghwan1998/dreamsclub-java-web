<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>

<!-- 메인 사진 슬라이더 -->
<div class="slider-area">
    <div class="slider-active owl-carousel nav-style-1 owl-dot-none">
        <!--슬라이더1-->
        <div class="single-slider-1 slider-height-20 d-flex align-items-center res-black-overly-xs slider-height-res bg-img">
            <div>
                <a href="product-details-2.html"><img src="${pageContext.request.contextPath }/img/slider/slider-32-1.jpg" alt=""></a>
            </div>
        </div>
        <!--슬라이더2-->
        <div class="single-slider-2 slider-height-20 d-flex align-items-center res-black-overly-xs slider-height-res bg-img">
            <div>
                <a href="shop-right-sidebar.html"><img src="${pageContext.request.contextPath }/img/slider/slider-32-1.jpg" alt=""></a>
            </div>
        </div>
        <!--슬라이더3-->
        <div class="single-slider-3 slider-height-20 d-flex align-items-center res-black-overly-xs slider-height-res bg-img">
            <div>
                <a href="blog-details.html"><img src="${pageContext.request.contextPath }/img/slider/slider-32-1.jpg" alt=""></a>
            </div>
        </div>
    </div>
</div>

<!-- 공지사항, 선수단 -->
<div class="banner-area pb-80 pt-100">
    <div class="container padding-20-row-col">
        <div class="row">
            <!-- 공지사항 -->
            <div class="tab-board" style="width: 50%">
                <div class="dreams_news">
                    <h2>구단소식</h2>
                    <p>드림즈의 다양한 소식들을 만나보세요</p>
                </div>
				<table id="tab-container" width=100%>
					<tr class="cont_sort">
						<th class="sort">공지사항</th>
						<td class="tit_n"><a href="공지사항 링크1" class="tit_new">NC 다이노스, ‘메모리얼 리노베이션’ 진행…...</a></td>
						<td class="date">2023-08-14</td>
					</tr>
					<tr class="cont_sort">
						<th class="sort">공지사항</th>
						<td class="tit_n"><a href="공지사항 링크2" class="tit_new">NC, 고성군야구협회와 함께하는 일일 야구교실...</a></td>
						<td class="date">2023-08-12</td>
					</tr>
					<tr class="cont_sort">
						<th class="sort">공지사항</th>
						<td class="tit_n"><a href="공지사항 링크3" class="tit_new">본인확인 서비스 일시 중단 안내 (8월 8일 ...  </a></td>
						<td class="date">2023-08-07</td>
					</tr>
					<tr class="cont_sort">
						<th class="sort">공지사항</th>
						<td class="tit_n"><a href="공지사항 링크4" class="tit_new">365바른약속치과의원-NC, 2023시즌 스폰... </a></td>
						<td class="date">2023-08-07</td>
					</tr>
					<tr class="cont_sort">
						<th class="sort">공지사항</th>
						<td class="tit_n"><a href="공지사항 링크5" class="tit_new">NC-경상남도, 지역사회 발전 위해 힘 모은다</a></td>
						<td class="date">2023-08-05</td>
					</tr>
				</table>
              </div>
            <!-- 선수단 -->
            <!--CSS는 공지사항으로 묶음-->
            <div class="col-lg-6 col-md-6" class="player">
                <div class="player_name">
                    <div class="player_name_tit">
                        <h2>선수단</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="single-banner mb-20">
                            <!--선수단 페이지 링크 추가-->
                            <a href="선수단 페이지 링크">
                                <!-- 선수단 이미지 -->
                                <img src="${pageContext.request.contextPath }/img/banner/deal.png" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 유튜브 -->
<div class="blog-area pt-95 pb-70">
    <div class="container">
        <div class="section-title-6 mb-50 text-center">
            <h2>드림즈 영상</h2>
            <p>드림즈의 업로드 영상을 감상해보세요! </p>
        </div>

        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog-wrap mb-30 scroll-zoom">
                    <div class="blog-img mb-10">
                        <a href="유튜브로 가는 링크"><img src="${pageContext.request.contextPath }/img/blog/blog-10.jpg" alt=""></a>
                    </div>
                    <div class="blog-content-3 text-center">
                        <h3><a href="유튜브로 가는 링크">동영상 제목</a></h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog-wrap mb-30 scroll-zoom">
                    <div class="blog-img mb-10">
                        <a href="유튜브로 가는 링크"><img src="${pageContext.request.contextPath }/img/blog/blog-11.jpg" alt=""></a>
                    </div>
                    <div class="blog-content-3 text-center">
                        <h3><a href="유튜브로 가는 링크">동영상 제목</a></h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog-wrap mb-30 scroll-zoom">
                    <div class="blog-img mb-10">
                        <a href="유튜브로 가는 링크"><img src="${pageContext.request.contextPath }/img/blog/blog-12.jpg" alt=""></a>
                    </div>
                    <div class="blog-content-3 text-center">
                        <h3><a href="유튜브로 가는 링크">동영상 제목</a></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 굿즈샵 -->
<div class="product-area pt-95 pb-70">
    <div class="container">
        <div class="section-title-5 text-center">
            <h2>굿즈샵</h2>
        </div>
        <div class="product-tab-list nav pt-35 pb-60 product-tab-cake text-center">
            <a class="active" href="#product-1" data-toggle="tab" >
                <h4>신상품  </h4>
            </a>
            <a href="#product-2" data-toggle="tab">
                <h4>베스트 </h4>
            </a>
        </div>
        <div class="tab-content jump">
            <div class="tab-pane" id="product-1">
                <div class="row item-wrapper3">
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6 toggle-item-active3">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-4.jpg" alt="">
                                    <img class="hover-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-4.jpg" alt="">
                                </a>
                                <span class="purple">new</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-eye"></i></a>                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Product Title Here</a></h3>
                                    <div class="price-2">
                                        <span>$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6 toggle-item-active3">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-4.jpg" alt="">
                                    <img class="hover-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-4.jpg" alt="">
                                </a>
                                <span class="purple">new</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-eye"></i></a>                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Product Title Here</a></h3>
                                    <div class="price-2">
                                        <span>$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6 toggle-item-active3">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-4.jpg" alt="">
                                    <img class="hover-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-4.jpg" alt="">
                                </a>
                                <span class="purple">new</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-eye"></i></a>                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Product Title Here</a></h3>
                                    <div class="price-2">
                                        <span>$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6 toggle-item-active3">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-4.jpg" alt="">
                                    <img class="hover-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-4.jpg" alt="">
                                </a>
                                <span class="purple">new</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-eye"></i></a>                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Product Title Here</a></h3>
                                    <div class="price-2">
                                        <span>$ 60.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane active" id="product-2">
                <div class="row item-wrapper">
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6 toggle-item-active">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-2.jpg" alt="">
                                    <img class="hover-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-2.jpg" alt="">
                                </a>
                                <span class="pink">Best</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Product Title Here</a></h3>
                                    <div class="price-2">
                                        <span>$ 40.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6 toggle-item-active">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-2.jpg" alt="">
                                    <img class="hover-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-2.jpg" alt="">
                                </a>
                                <span class="pink">Best</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Product Title Here</a></h3>
                                    <div class="price-2">
                                        <span>$ 40.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6 toggle-item-active">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-2.jpg" alt="">
                                    <img class="hover-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-2.jpg" alt="">
                                </a>
                                <span class="pink">Best</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Product Title Here</a></h3>
                                    <div class="price-2">
                                        <span>$ 40.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6 toggle-item-active">
                        <div class="product-wrap-2 mb-25">
                            <div class="product-img">
                                <a href="product-details.html">
                                    <img class="default-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-2.jpg" alt="">
                                    <img class="hover-img" src="${pageContext.request.contextPath }/img/product/hm26-pro-2.jpg" alt="">
                                </a>
                                <span class="pink">Best</span>
                                <div class="product-action-2">
                                    <a title="Add To Cart" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a title="Quick View" href="#" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-eye"></i></a>
                                </div>
                            </div>
                            <div class="product-content-2">
                                <div class="title-price-wrap-2">
                                    <h3><a href="product-details.html">Product Title Here</a></h3>
                                    <div class="price-2">
                                        <span>$ 40.00</span>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
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
                                <a class="active" data-toggle="tab" href="#pro-1"><img src="${pageContext.request.contextPath }/img/product/quickview-s1.jpg" alt=""></a>
                                <a data-toggle="tab" href="#pro-2"><img src="${pageContext.request.contextPath }/img/product/quickview-s2.jpg" alt=""></a>
                                <a data-toggle="tab" href="#pro-3"><img src="${pageContext.request.contextPath }/img/product/quickview-s3.jpg" alt=""></a>
                                <a data-toggle="tab" href="#pro-4"><img src="${pageContext.request.contextPath }/img/product/quickview-s2.jpg" alt=""></a>
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
