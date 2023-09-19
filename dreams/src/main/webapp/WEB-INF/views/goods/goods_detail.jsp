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
      var goodsCode = $("#goodsCode").val();
      var goodsCount = $("#goodsCount").val();
      var memberId = $("#isLogOn").val();
      var qty = $("#cartGoodsQty").val();
      var price = $("#price").val();

      // 주문하기 버튼 클릭
    $(".btn-order").click(function () {
    	
      if (memberId === "false" || memberId === '') {
          alert("로그인 후 주문이 가능합니다!");
          window.location.href = "<c:url value='/login' />";
          event.preventDefault();
      } else {
    	  
          $.ajax({
          type: "post",
          //url: "",//orderController로 받을 메서드 작성 후 추가할 것
          data: {
            goodsCode: goodsCode,
            goodsSize: goodsSize,
            goodsCount: goodsCount,
            memberId: memberId
          },
          success: function (response) {
            if(response.success) {
              alert("주문을 완료 하였습니다.");
              //주문 확인 페이지 이동
            } else {
              alert("주문을 실패 하였습니다.");
            }
          },
          error: function(xhr) {
            alert(xhr.status);
          }
        });
      }
    });

    // 장바구니 버튼 클릭
    $(".btn-cart").click(function (event) {
      event.preventDefault();
			var goodsCode = $('#goodsCode').val();
      alert(goodsCode);
      var memberId = $('#isLogOn').val();
      alert(memberId);
			
      $.ajax({
        type: "post",
        url: "<c:url value='/cart/addGoodsInCart/' />" + goodsCode,
        data: {
          goodsCode: goodsCode,
        },
        dataType: "text",
        success: function (result) {
          if (result.trim() == 'add_success') {
            var check = confirm("상품이 장바구니에 담겼습니다. 확인하시겠습니까?");
            var goMyCart = "<c:url value='/cart/mycart/' />";
            if (check) {
              location.href("" + memberId);
            }
          } else if (result.trim() == 'already_existed') {
            alert("이미 장바구니에 등록된 상품입니다.");
          }
        },
        error: function(xhr) {
            alert(xhr.status);
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
						<input type="hidden" name="goodsCode" value="${goodsDetail.goodsCode }" id="goodsCode">
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
								<span>Size</span> <select id="cartGoodsQty" name="cartGoodsQty" style="border: 1px solid black;">
									<option value="0" selected>사이즈를 선택해 주세요.</option>
									<c:choose>
										<c:when test="${goodsDetail.goodsCategory eq 'Uniform' }">
											<option value="L" <c:if test="${goodsDetail.goodsYnL eq 'N'}">disabled</c:if>>
												L&nbsp;&nbsp; (재고 : ${goodsDetail.goodsStockL })
												<c:if test="${goodsDetail.goodsYnL eq 'N'}">(선택불가)</c:if>
											</option>
											<option value="M" <c:if test="${goodsDetail.goodsYnM eq 'N'}">disabled</c:if>>
												M&nbsp;(재고 : ${goodsDetail.goodsStockM })
												<c:if test="${goodsDetail.goodsYnM eq 'N'}">(선택불가)</c:if>
											</option>
											<option value="S" <c:if test="${goodsDetail.goodsYnS eq 'N'}">disabled</c:if>>
												S&nbsp;&nbsp;(재고 : ${goodsDetail.goodsStockS })
												<c:if test="${goodsDetail.goodsYnS eq 'N'}">(선택불가)</c:if>
											</option>
										</c:when>
										<c:otherwise>
											<option value="F" <c:if test="${goodsDetail.goodsYnF eq 'N'}">disabled</c:if>>
												Free&nbsp;(재고 : ${goodsDetail.goodsStockF })
												<c:if test="${goodsDetail.goodsYnF eq 'N'}">(선택불가)</c:if>
											</option>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
						</div>
						<div class="pro-details-quality">
							<div class="cart-plus-minus">
								<input class="cart-plus-minus-box" type="text" name="goodsCount" value="1" id="goodsCount">
							</div>
							<div class="pro-details-cart btn-hover">
                <input type="hidden" name="isLogOn" id="isLogOn" value="${member.memberId }"/>
								<button class="btn btn-default btn-order" type="submit">주문하기</button>
								<button class="btn btn-default btn-cart">장바구니</button>
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

			<!--
			- 방용환(수정) : 2023/09/13, 전체 태그 위치 및 tabs 수정, script 작성 완료시 최상단 혹은 최하단 이동 요망
			 -->
			<div class="tab-content description-review-bottom">

				<!-- 제품 상세 정보 출력 div -->
				<div id="des-details1" class="tab-pane ">
					<div class="product-anotherinfo-wrapper">
						<ul>
							<li><span>Weight</span> 400 g</li>
							<li><span>Dimensions</span>10 x 10 x 15 cm</li>
							<li><span>Materials</span> 60% cotton, 40% polyester</li>
							<li><span>Other Info</span> American heirloom jean shorts pug seitan letterpress</li>
						</ul>
					</div>
				</div>

				<!-- QnA 출력 div-->
				<div id="des-details2" class="tab-pane active">
					<div class="product-description-wrapper">

						<!-- QnA 전체? -->
						<div class="QnaContainer">
							<div class="QnaTitle">
								<h2 style="color: gray;">Q&A</h2>
								<h4 style="color: gray;">구매하는 상품에 대해 궁금한점이 있으신 경우 문의해주세요</h4>
							</div>

							<!-- 문의 테이블 -->
							<div class="qnaTable" style="margin: 0 auto">
								<table class="qnaTableMain" width="1200px">
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
										<c:forEach items="${qnaList}" var="qna">
											<!-- qna리스트받아옴 -->
											<tr class="boardTableList">
												<td class="t1"><c:out value="${qna.qnaNo }" /></td>
												<!-- 번호불러옴 -->
												<td class="t2"><c:out value="${qna.qnaYn}" /></td>
												<!--  답변여부 -->
												<td class="t3 text-left"></td>
												<!-- 제목 우측 -->
												<td class="t3"><c:out value="${qna.qnaTitle}" /></td>
												<!-- 제목받아옴 -->
												<td class="content" id="qnacontent">
												<td class="t4"><c:out value="${qna.memberId}" /></td>
												<!-- 회원id 받아옴 -->
												<td class="t5"><c:out value="${qna.qnaDare}" /></td>
												<!-- 날짜받아옴 -->
												<td class="t6" style="display: none;"><c:out value="${qna.qnaContent}" /></td>
												<!-- 추가 열: 내용 -->
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--
                   로그인한 사람만 생기는 q&a 글쓰기 버튼
                   - 방용환(수정) : 2023/09/13, 'des-details2' id를 가진 태그 내부로 이동 
                   -->
					<div class="writeBtnContainer">
						<div class="boardWriteBtn" style="text-align: right;">
							<c:if test="${!empty(member)}">
								<a href=<c:url value="/goods/qna/write"/>>문의하기</a>
								<!-- 페이지 이동 -->
							</c:if>
						</div>
					</div>
				</div>

				<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js">
					$(document).ready(function() {
						$(".t3").click(function() { // 질문 제목을 클릭했을 때
							$(this).closest("tr").find(".t6").toggle(); // 클릭한 행에서 다음 열(.t6)을 토글(show/hide)합니다.
						});
					});
				</script>


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
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
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