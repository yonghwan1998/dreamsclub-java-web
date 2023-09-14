<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
  /* 
    function purchaseGoods() {
      if ( purchase.goodsSize.value == "0" ) {
            alert("사이즈를 선택해주세요.");
            purchase.goodsSize.focus();
            return;
         } 
         purchase.action = "<c:url value="/goods/detail"/>";
         purchase.submit();
   }  
   */

  /* 장바구니 */
  $(document).ready(function () {
    var contextPath = "${pageContext.request.contextPath}";

    // 주문하기 버튼 클릭
    $(".btn-order").click(function () {
      event.preventDefault();
      $("form").submit();
    });

    // 장바구니 버튼 클릭
    $(".btn-cart").click(function () {
      event.preventDefault();
      var qty = $("#select_count").val();
      var price = $("#price").val();
      var goodsCode = $(this).data("goods-code");
      var addToCartUrl = contextPath + "/cart/" + goodsCode;

      $.ajax({
        type: "post",
        url: addToCartUrl,
        data: {
          goodsCode: goodsCode,
        },
        dataType: "text",
        success: function (result) {
          if (result.trim() == 'add_success') {
            var check = confirm("상품이 장바구니에 담겼습니다. 확인하시겠습니까?");
            if (check) {
              var myCartUrl = contextPath + "/cart/mycart/" + memberId;
              location.assign(myCartUrl);
            }
          } else if (result.trim() == 'already_existed') {
            alert("이미 장바구니에 등록된 상품입니다.");
          }
        },
        error: function (xhr, status, error) {
          console.error(xhr.responseText);
        }
      });
    });
  });
</script>



<div class="shop-area pt-100 pb-100">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product-details">
					<div class="product-details-img">
						<div class="tab-content jump">
							<div id="shop-details-2" class="tab-pane active large-img-style">
								<img src="${pageContext.request.contextPath }/img/goods-img/${goodsDetail.goodsImage }">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="product-details-content ml-70">
					<form method="post" action="<c:url value='/order/insert'/>" name="purchase">
						<h2>${goodsDetail.goodsName }</h2>
						<input type="hidden" name="goodsName" value="${goodsDetail.goodsName }" id="goodsCode">
						<div class="product-details-price">
							<input type="hidden" name="goodsPrice" value="${goodsDetail.goodsPrice }" id="price">
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
								<span>Size</span> <select id="select_count" name="goodsSize" style="border: 1px solid black;">
									<option value="0" selected>사이즈를 선택해 주세요.</option>
									<option value="L">L</option>
									<option value="M">M</option>
									<option value="S">S</option>
									<option value="F">Free</option>
								</select>
							</div>
						</div>
						<div class="pro-details-quality">
							<div class="cart-plus-minus">
								<input class="cart-plus-minus-box" type="text" name="goodsCount" value="1" id="goodsCount">
							</div>
							<div class="pro-details-cart btn-hover">
								<button class="btn btn-default btn-order" type="submit">주문하기</button>
								<button class="btn btn-default btn-cart" data-goods-code="${goodsDetail.goodsCode}">장바구니</button>
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
                <a data-bs-toggle="tab" href="#des-details2">Q & A</a>
                
                <!-- 강민경: 리뷰 버튼 수정 -->
                <a data-bs-toggle="tab" href="#des-details3">상품 리뷰</a>
            </div>     
            
            
            
                
                <!-- ▼ QnA -->
                
            <div class="tab-content description-review-bottom">
                <div id="des-details2" class="tab-pane active">
                    <div class="product-description-wrapper">
                    
                    
                       <!-- QnA 전체? -->
                  <div class = "QnaContainer" >
                     <div class = "QnaTitle">
                        <h2 style = "color: gray;">Q&A</h2>
                        <h4 style = "color: gray;">구매하는 상품에 대해 궁금한점이 있으신 경우 문의해주세요</h4>
                     </div>
                     
                  <!-- 문의 테이블 -->
                  <div class = "qnaTable" style = "margin: 0 auto">
                     <table class = "qnaTableMain" width = "1200px">
                        <thead>   
                           <tr>
                              <!-- <th class="t1" scope="col" style="width: 100px">번호</th>  -->
                              <th class="t2" style="width: 100px">답변상태</th>
                                     <th class="t3" style="width: 700px">제목</th>
                                     <th class="t4" style="width: 150px">작성자</th>
                                     <th class="t5" style="width: 150px">작성일</th>
                           </tr>
                        </thead>
                        
                        <!-- 정보 받아옴 -->
                        <tbody>
                           <c:forEach items ="${qnaList}" var ="qna"> <!-- qna리스트받아옴 -->
                              <tr class = "boardTableList">
                                 <td class="t1"><c:out value="${qna.qnaNo }"/></td>  <!-- 번호불러옴 -->
                                 <td class = "t2"> <c:out value = "${qna.qnaYn}"/> </td> <!--  답변여부 -->
                                        <td class="t3 text-left"> </td> <!-- 제목 우측 -->
                                 <td class = "t3"> <c:out value= "${qna.qnaTitle}"/> </td> <!-- 제목받아옴 -->
                                 <td class = "content" id= "qnacontent">
                                 
                                 <td class = "t4"> <c:out value= "${qna.memberId}"/> </td> <!-- 회원id 받아옴 -->
                                 <td class = "t5"> <c:out value="${qna.qnaDare}"/> </td> <!-- 날짜받아옴 -->
                                 <td class="t6" style="display: none;"> <c:out value="${qna.qnaContent}" /> </td> <!-- 추가 열: 내용 -->
                                 
                                 
                              </tr>
                              </c:forEach>         
                        </tbody>
                     </table>
                  </div>
               </div>
                  </div>
                </div>
                
                   <!-- 로그인한 사람만 생기는 q&a 글쓰기 버튼-->
                  <div class="writeBtnContainer">
                      <div class="boardWriteBtn" style="text-align: right;">
                         <c:if test="${!empty(member)}">
                             <a href=<c:url value="/goods/qna/write"/>>문의하기</a> <!-- 페이지 이동 -->
                          </c:if>
                      </div>
                  </div>
                
                
                <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js">
                $(document).ready(function() {
                    $(".t3").click(function() { // 질문 제목을 클릭했을 때
                        $(this).closest("tr").find(".t6").toggle(); // 클릭한 행에서 다음 열(.t6)을 토글(show/hide)합니다.
                    });
                });
                
                
                
                
                </script>
                
                
                
                
                <!-- 상품디테일설명 ▼ -->
                
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
                                            <p>너무 예뻐요~</p>
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

