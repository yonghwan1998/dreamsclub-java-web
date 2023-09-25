<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="shop-area pt-100 pb-100">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product-details">
					<div class="product-details-img">
						<div class="tab-content jump">
							<div id="shop-details-2" class="tab-pane active large-img-style">
								<img
									src="${pageContext.request.contextPath }/img/goods-img/${goodsDetail.goodsImage }">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6" style="border: 1px solid lightgray;">
				<div class="product-details-content ml-70"
					style="margin-left: 5rem; margin-top: 3rem;">
					<form method="post" action="<c:url value="/order/insertGoods"/>"
						name="orderForm">
						<h2>${goodsDetail.goodsName }</h2>
						<input type="hidden" name="goodsCode"
							value="${goodsDetail.goodsCode }" id="goodsCode">
						<div class="product-details-price">
							<input type="hidden" name="goodsPrice"
								value="${goodsDetail.goodsPrice }" id="price"> <span><fmt:formatNumber
									value="${goodsDetail.goodsPrice }" pattern="#,###" /> 원</span>
						</div>
						<div class="pro-details-rating-wrap">
							<div class="pro-details-rating">
								<i class="fa fa-star-o yellow"></i> <i
									class="fa fa-star-o yellow"></i> <i class="fa fa-star-o yellow"></i>
								<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
							</div>
							<span><a href="#">${reviewCount } Reviews</a></span>
						</div>
						<p>${goodsDetail.goodsInfo }</p>
						<div class="pro-details-size-color">
							<div class="pro-details-size">
								<span>Size</span> <select id="goodsSize" name="goodsSize"
									style="border: 1px solid black;">
									<option value="0" selected>사이즈를 선택해 주세요.</option>
									<c:choose>
										<c:when test="${goodsDetail.goodsCategory eq 'Uniform' }">
											<option value="L"
												<c:if test="${goodsDetail.goodsYnL eq 'N'}">disabled</c:if>>
												L&nbsp;&nbsp; (재고 : ${goodsDetail.goodsStockL })
												<c:if test="${goodsDetail.goodsYnL eq 'N'}">(선택불가)</c:if>
											</option>
											<option value="M"
												<c:if test="${goodsDetail.goodsYnM eq 'N'}">disabled</c:if>>
												M&nbsp;(재고 : ${goodsDetail.goodsStockM })
												<c:if test="${goodsDetail.goodsYnM eq 'N'}">(선택불가)</c:if>
											</option>
											<option value="S"
												<c:if test="${goodsDetail.goodsYnS eq 'N'}">disabled</c:if>>
												S&nbsp;&nbsp;(재고 : ${goodsDetail.goodsStockS })
												<c:if test="${goodsDetail.goodsYnS eq 'N'}">(선택불가)</c:if>
											</option>
										</c:when>
										<c:otherwise>
											<option value="F"
												<c:if test="${goodsDetail.goodsYnF eq 'N'}">disabled</c:if>>
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
								<input class="cart-plus-minus-box" type="text" name="goodsCount"
									value="1" id="goodsCount">
							</div>
							<div class="pro-details-cart btn-hover">
								<input type="hidden" name="isLogOn" id="isLogOn"
									value="${member.memberId }" />
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
				<a data-bs-toggle="tab" href="#des-details1">상세 정보</a>

				<!--  오진서: QnA 버튼 수정 -->
				<a data-bs-toggle="tab" href="#des-details2">Q & A</a>

				<!-- 강민경: 리뷰 버튼 수정 -->
				<a data-bs-toggle="tab" href="#des-details3">상품 리뷰</a>
			</div>
			<div class="tab-content description-review-bottom">

				<!-- 제품 상세 정보 출력 div -->
				<div id="des-details1" class="tab-pane ">
					<div class="product-anotherinfo-wrapper">
						<ul>
							<li><span>Weight</span> 400 g</li>
							<li><span>Dimensions</span>10 x 10 x 15 cm</li>
							<li><span>Materials</span> 60% cotton, 40% polyester</li>
							<li><span>Other Info</span> American heirloom jean shorts
								pug seitan letterpress</li>
						</ul>
					</div>
				</div>

				<!-- QnA 출력 div-->
				<div id="des-details2" class="tab-pane active">
					<div class="product-description-wrapper">
						<div class="QnaContainer">
							<div class="QnaTitle">
								<h2 style="color: gray;">Q&A</h2>
								<h4 style="color: gray;">구매하는 상품에 대해 궁금한점이 있으신 경우 문의해주세요</h4>
								<div class="writeBtnContainer">
									<div class="boardWriteBtn" style="text-align: right;">
										<!-- 방용환(수정) : 2023/09/23, 일반 유저만 보이는 버튼 -->
										<c:if test="${member.memberStatus eq 1}">
											<form action="<c:url value="/goods/qna/write"/>" method="get">
												<input type="hidden" name="goodsCode"
													value="${goodsDetail.goodsCode }"> <input
													type="hidden" name="goodsName"
													value="${goodsDetail.goodsName }">
												<button type="submit">문의하기</button>
											</form>
										</c:if>
									</div>
								</div>
							</div>
							<hr>
							<!-- 구분 선 -->
						</div>

						<!-- 문의 테이블 -->
						<div class="qnaTable" style="margin: 0 auto">
							<table class="qnaTableMain" width="1200px"
								style="border-collapse: separate; border-spacing: 0px 10px;">
								<thead>
									<tr>
										<th class="t1" style="width: 100px">답변상태</th>
										<th class="t2" style="width: 150px">제목</th>
										<th class="t3" style="width: 700px">내용</th>
										<th class="t4" style="width: 150px">작성자</th>
										<th class="t5" style="width: 150px">작성일</th>
										<c:if test="${member.memberStatus eq 9}">
											<th class="t6" style="width: 100px">기능</th>
										</c:if>
									</tr>
								</thead>

								<!-- 정보 받아옴 -->
								<tbody>
									<c:forEach items="${qnaList}" var="qna">
										<!-- controller 에서 받아옴 -->
										<!-- qna리스트받아옴 -->
										<tr class="boardTableList">

											<!--  답변여부 -->
											<td class="t1"><c:if test="${qna.qnaYn eq 'N'}">
													미답변
												</c:if> <c:if test="${qna.qnaYn eq 'Y'}">
													답변완료
												</c:if></td>

											<!-- 제목받아옴 -->
											<td class="t2"><c:out value="${qna.qnaTitle}" /></td>

											<!-- 내용 받아옴 / 안보이다가 누르면 보이게할거임  -->
											<td class="t3"><c:out value="${qna.qnaCont}" /></td>

											<!-- 회원id 받아옴 -->
											<td class="t4"><c:out value="${qna.memberId}" /></td>

											<!-- 방용환(수정) : 2023/09/23, 날짜에서 시간 제거 -->
											<!-- 날짜받아옴 -->
											<td class="t5"><c:out
													value="${fn:substring(qna.qnaDate,0,10)}" /></td>

											<!-- 방용환(수정) : 2023/09/23, 관리자인 경우와 답변 상태가 'N'인 글만 답변하기 버튼 생성 -->
											<td class="t6">
												<!-- 로그인한 사람과, memberStatus 가 9 (관리자) 인경우 --> <c:if
													test="${member.memberStatus eq 9 && qna.qnaYn eq 'N'}">
													<form action="<c:url value="/goods/qna/rewrite"/>"
														method="get">
														<input type="hidden" name="goodsCode"
															value="${goodsDetail.goodsCode }"> <input
															type="hidden" name="qnaNo" value="${qna.qnaNo }">
														<input type="hidden" name="goodsName"
															value="${goodsDetail.goodsName }">
														<button type="submit">답변하기</button>
													</form>
												</c:if>
											<td>
										</tr>

										<!-- !! Re답변  -->
										<c:choose>
											<c:when test="${qna.qnaYn eq 'Y'}">
												<!-- qnaYn 가 'Y'일경우 보이도록-->
												<tr class="boardTableList"
													style="border-bottom: 1px solid gray;">

													<!--  답변여부 -->
													<td class="t1"></td>

													<!-- 제목받아옴 -->
													<td class="t2"></td>

													<!-- 내용 받아옴 -->
													<td class="t3">&nbsp;&nbsp;&nbsp;&nbsp;<c:out
															value="ㄴ${qna.qnaReCont }" /></td>

													<!-- 회원id 받아옴 -->
													<td class="t4">드림즈 관리자</td>

													<!-- 날짜받아옴 -->
													<td class="t5"><c:out
															value="${fn:substring(qna.qnaReDate,0,10)}" /></td>
												</tr>
											</c:when>
										</c:choose>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<%-- 페이지 번호 출력 --%>
					<div style="text-align: center; padding-top: 10px;">
						<c:choose>
							<c:when test="${qnaPager.startPage > qnaPager.blockSize }">
								<a
									href="<c:url value="/goods/detail"/>?goodsName=${goodsDetail.goodsName }&qnaPageNum=${qnaPager.prevPage}">[이전]</a>
							</c:when>
							<c:otherwise>
								[이전]
							</c:otherwise>
						</c:choose>

						<c:forEach var="i" begin="${qnaPager.startPage }"
							end="${qnaPager.endPage }" step="1">
							<c:choose>
								<c:when test="${qnaPager.pageNum != i  }">
									<a
										href="<c:url value="/goods/detail"/>?goodsName=${goodsDetail.goodsName }&qnaPageNum=${i}">[${i }]</a>
								</c:when>
								<c:otherwise>
									[${i }]
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${qnaPager.endPage != qnaPager.totalPage }">
								<a
									href="<c:url value="/goods/detail"/>?goodsName=${goodsDetail.goodsName }&qnaPageNum=${qnaPager.nextPage}">[다음]</a>
							</c:when>
							<c:otherwise>
								[다음]
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<!-- 강민경: 상품 리뷰 작성 부분  -->
				<div id="des-details3" class="tab-pane">
					<div class="row">
						<div class="col-lg-11">
							<div class="review-wrapper">
								<c:forEach var="review" items="${goodsReview }">
									<div class="single-review">
										<c:choose>
											<c:when test="${not empty review.revImg}">
												<div class="review-img">
													<img
														src="${pageContext.request.contextPath }/img/review/${review.revImg}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="review-img">
													<img
														src="${pageContext.request.contextPath }/img/sheep.png">
												</div>
											</c:otherwise>
										</c:choose>
										<div class="review-content">
											<div class="review-top-wrap">
												<div class="review-left">
													<div class="review-name" style='display: flex;'>
														<p>
															<strong><c:out value="${review.memberId}" /></strong>
														</p>
														<p>&nbsp;</p>
														<p>&nbsp;</p>
														<p>&nbsp;</p>
														<p>&nbsp;</p>
														<p>
															별점 :
															<c:out value="${review.goodsStar}" />
														</p>
													</div>
												</div>
											</div>
											<p style="line-height: 0.1;">
												<c:out value="${review.revCont}" />
											</p>
											<div class="review-left">
												<c:if test="${member.memberId == review.memberId}">
													<a href="#" role="button" id="delete_btn"
														onclick="deleteCheck(${review.revNo})">삭제하기</a>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<%-- 페이지 번호 출력 --%>
					<div style="text-align: center; padding-top: 10px;">
						<c:choose>
							<c:when test="${reviewPager.startPage > reviewPager.blockSize }">
								<a
									href="<c:url value="/goods/detail"/>?goodsName=${goodsDetail.goodsName }&reviewPageNum=${reviewPager.prevPage}">[이전]</a>
							</c:when>
							<c:otherwise>
								[이전]
							</c:otherwise>
						</c:choose>

						<c:forEach var="i" begin="${reviewPager.startPage }"
							end="${reviewPager.endPage }" step="1">
							<c:choose>
								<c:when test="${reviewPager.pageNum != i  }">
									<a
										href="<c:url value="/goods/detail"/>?goodsName=${goodsDetail.goodsName }&reviewPageNum=${i}">[${i }]</a>
								</c:when>
								<c:otherwise>
									[${i }]
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${reviewPager.endPage != reviewPager.totalPage }">
								<a
									href="<c:url value="/goods/detail"/>?goodsName=${goodsDetail.goodsName }&reviewPageNum=${reviewPager.nextPage}">[다음]</a>
							</c:when>
							<c:otherwise>
								[다음]
							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<script>
  	// 구매하기 클릭 시
    $(".btn-order").click(function () {
      
    	//로그인을 안한 경우 로그인 페이지로 이동
      if (memberId === "false" || memberId === '') {
          alert("로그인 후 주문이 가능합니다!");
          window.location.href = "<c:url value='/login' />";
          event.preventDefault();
      } else {
    	//로그인을 한 경우 form 태그 제출
    	  var form = document.getElementById("orderForm");
        form.submit();
      }
    });
    
  	

 // 장바구니 버튼 클릭 시
    $(".btn-cart").click(function (event) {
      event.preventDefault();
      var goodsCode = $("#goodsCode").val();	//굿즈명
      var count = $("#goodsCount").val();			//굿즈 수량
      var goodsSize = $("#goodsSize").val();			
      var goodsCount = parseInt(count);
      var memberId = $("#isLogOn").val();			//회원 아이디
      var goodsPrice = $("#goodsPrice").val();//굿즈 가격
      
      goodsCode = "${goodsDetail.goodsCode.split('-')[0] }" + "-${goodsDetail.goodsCode.split('-')[1] }-" + goodsSize;
      
      //로그인을 안한 경우 로그인 페이지 이동
      if (memberId === "false" || memberId === '') {
          alert("로그인 후 주문이 가능합니다!");
          window.location.href = "<c:url value='/login' />";
          event.preventDefault();
      } else {
    	  	
          $.ajax({
            type: "post",
            url: "<c:url value="/cart/addGoodsInCart"/>",
            contentType : "application/json",
            data: JSON.stringify({
              "goodsCode": goodsCode,
              "goodsCount": goodsCount,
              "goodsSize": goodsSize
            }),
            dataType: "text",
            success: function (result) {
            	//장바구니에 존재하지 않은 상품인 경우
            	if (result.trim() == 'add_success') {
                var check = confirm("상품이 장바구니에 담겼습니다. 확인하시겠습니까?");
                var goMyCart = "<c:url value='/cart/mycart/' />";
                
                //confirm 창에서 확인 클릭 시 나의 장바구니 이동
                if (check) {
                  location.assign(goMyCart + memberId);
                }
              } 
            	//장바구니에 존재하는 상품인 경우
            	else if (result.trim() == 'already_existed') {
                alert("이미 장바구니에 등록된 상품입니다.");
              }
            },
            error: function(xhr) {
                alert(xhr.status);
            }
          });
          
        }
    });
  
   
   //강민경(2023/09/20): 상세 페이지의 리뷰 삭제 기능 
     function deleteCheck(no) {
    if (confirm("정말 삭제하시겠습니까?") == true) {
      //goodsName, revNo를 컨트롤러에게 전달해서 삭제해야 함
      location.href = "<c:url value='/goods/detail/delete?revNo="+no+"&goodsName=${goodsDetail.goodsName}'/> ";
      alert("삭제되었습니다.");
    } else if (confirm == false) {
      alert("취소되었습니다.");
    }
  }
   
</script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js">
  	$(function() {
    
  		$(".t3").click(function() { // 질문 제목을 클릭했을 때
      alert('success');
      $(this).closest("td").find(".t4").toggle(); // 클릭한 행에서 다음 열(.t4)을 토글(show/hide)합니다.
    });
  });
</script>