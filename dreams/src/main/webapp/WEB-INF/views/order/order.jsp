<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/order.css">

<!-- 컨텐츠 상단 홈/결제 -->
<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
  <div class="container">
    <div class="breadcrumb-content text-center">
      <ul>
        <li><a href="<c:url value="/"/>">홈</a></li>
        <li class="active" style="font-weight: bold;">결제</li>
      </ul>
    </div>
  </div>
</div>

<!-- 배송지 입력칸 -->
<form id="orderForm" action="<c:url value="/order/result"/>" method="post">
  <div class="checkout-area pt-95 pb-100">
    <div class="container">
      <div class="row">
        <div class="col-lg-7">
          <div class="billing-info-wrap">
            <h3>배송정보 입력사항</h3>
            <div class="row">
              <!-- 회원정보가 존재하는 경우, 회원정보 출력 -->
              <c:choose>
                <c:when test="${member == null }">
                  <div class="col-lg-12">
                    <h3>로그인이 필요한 서비스입니다.<br> 
                    <a href="<c:url value="/login"/>">로그인</a>하거나 
                    <a href="<c:url value="/join/check"/>">회원가입</a>을 진행해주세요.
                    </h3>
                  </div>
                </c:when>
                
                <c:otherwise>
                  <div class="col-lg-6 col-md-6">
                    <div class="orderOld">
                      <label>이름</label> <input type="text"
                        value="<c:out value="${member.memberName}" />"
                        disabled="disabled"></input>
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6">
                    <div class="orderOld">
                      <label>전화번호</label> <input type="text"
                        value="<c:out value="${member.memberPhone}" />"
                        disabled="disabled"></input>
                    </div>
                  </div>

                  <div class="col-lg-12">
                    <div class="orderOld">
                      <label>이메일</label> <input type="text"
                        value="<c:out value="${member.memberEmail}" />"
                        disabled="disabled"></input>
                    </div>
                  </div>

                  <div class="col-lg-6">
                    <div class="orderOld">
                      <label>우편번호</label> <input type="text"
                        value="<c:out value="${member.memberPcode}" />"></input>
                    </div>
                  </div>

                  <div class="col-lg-12">
                    <div class="orderOld">
                      <label>기본주소</label> <input type="text"
                        value="<c:out value="${member.memberAddress1}" />"></input>
                    </div>
                  </div>

                  <div class="col-lg-12">
                    <div class="orderOld">
                      <label>상세주소</label> <input type="text"
                        value="<c:out value="${member.memberAddress2}" />"></input>
                    </div>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>

            <!-- 라디오 버튼(체크박스): 배송지 선택 -->
            <div class="checkout-account mb-50"
              style="margin-top: 10px;">
              <label> <input class="checkout-toggle2"
                type="radio" name="addressOption" value="existing"
                checked style="height: 20px;"> <span>기존
                  배송지 사용</span>
              </label> <label> <input class="checkout-toggle"
                type="radio" name="addressOption" value="new"
                style="height: 20px;"> <span>신규 배송지 등록</span>
              </label>
            </div>

            <!-- 신규 배송지 등록 토글 -->
            <div class="different-address open-toggle mt-30">
              <div class="row">
                <div class="col-lg-6 col-md-6">
                  <div class="billing-info mb-20">
                    <label>이름</label> <input type="text" name="name">
                  </div>
                </div>
                <div class="col-lg-6 col-md-6">
                  <div class="billing-info mb-20">
                    <label>전화번호</label> <input type="text" name="phone">
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="billing-info mb-20">
                    <label>이메일</label> <input type="text" name="email">
                  </div>
                </div>
                <label style="margin-bottom: 7px;">주소</label>
                <div class="form-group">
                  <input class="form-control"
                    style="width: 40%; display: inline;"
                    placeholder="우편번호" name="memberNewPcode" id="addr1"
                    type="text" readonly="readonly">
                  <button type="button" class="btn btn-default"
                    onclick="execution_daum_address();">
                    <i class="fa fa-search"></i> 주소 찾기
                  </button>
                </div>
                <div class="form-group">
                  <input class="form-control" style="top: 5px;"
                    placeholder="기본주소" name="memberNewAddress1"
                    id="addr2" type="text" readonly="readonly" />
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="상세주소"
                    name="memberNewAddress2" id="addr3" type="text"
                    style="margin-bottom: 30px" />
                </div>

                <!-- 배송 요청사항 -->
                <div class="additional-info-wrap">
                  <h4>배송 요청사항</h4>
                  <div class="additional-info">
                    <textarea placeholder="ex. 도착하면 연락주세요. "
                      name="deliverMsg"></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- 전달해야하는 값 -->
        <input type="hidden" value="${member.memberId}" name="memberId">
        <input type="hidden" value="${member.memberName}" name="memberName"> 
        <input type="hidden" value="${member.memberEmail}" name="memberEmail"> 
        <input type="hidden" value="${member.memberPhone}" name="memberPhone">
        <input type="hidden" value="${member.memberPcode}" name="memberPcode"> 
        <input type="hidden" value="${member.memberAddress1}" name="memberAddress1">
        <input type="hidden" value="${member.memberAddress2}" name="memberAddress2"> 
        <input type="hidden" value="1" name="newSelected"> 
        <input type="hidden" value="${cartInfo.goodsCode}" name="goodsCode" id="goodsCode"> 
        <input type="hidden" value="${cartInfo.goodsPrice}" name="goodsPrice">
        <input type="hidden" value="${cartInfo.goodsCount}" name="goodsCount"> 
        <input type="hidden" value="${cartInfo.goodsInfo}" name="goodsInfo">

        <!-- 컨텐츠 우측 주문 정보 -->
        <div class="col-lg-5">
          <!-- 카드 정보  -->
          <div class="your-order-area">
            <h3>결제 수단</h3>
            <div class="your-order-wrap gray-bg-4">
              <!-- 카드 -->
              <div class="center">
                <div class="card">
                  <div class="flip">
                    <div class="front">
                      <svg class="card_logo" width="40" height="40"
                        viewbox="0 0 17.5 16.2">
		                                            <path
                          d="M3.2 0l5.4 5.6L14.3 0l3.2 3v9L13 16.2V7.8l-4.4 4.1L4.5 8v8.2L0 12V3l3.2-3z"
                          fill="white"></path>
		                                        </svg>
                      <div class="investor">Itwill</div>
                      <div class="chip">
                        <div class="chip-line"></div>
                        <div class="chip-line"></div>
                        <div class="chip-line"></div>
                        <div class="chip-line"></div>
                        <div class="chip-main"></div>
                      </div>
                      <svg class="wave" viewBox="0 3.71 26.959 38.787"
                        width="26.959" height="38.787" fill="white">
		                                            <path
                          d="M19.709 3.719c.266.043.5.187.656.406 4.125 5.207 6.594 11.781 6.594 18.938 0 7.156-2.469 13.73-6.594 18.937-.195.336-.57.531-.957.492a.9946.9946 0 0 1-.851-.66c-.129-.367-.035-.777.246-1.051 3.855-4.867 6.156-11.023 6.156-17.718 0-6.696-2.301-12.852-6.156-17.719-.262-.317-.301-.762-.102-1.121.204-.36.602-.559 1.008-.504z">
		                                            </path>
		                                            <path
                          d="M13.74 7.563c.231.039.442.164.594.343 3.508 4.059 5.625 9.371 5.625 15.157 0 5.785-2.113 11.097-5.625 15.156-.363.422-1 .472-1.422.109-.422-.363-.472-1-.109-1.422 3.211-3.711 5.156-8.551 5.156-13.843 0-5.293-1.949-10.133-5.156-13.844-.27-.309-.324-.75-.141-1.114.188-.367.578-.582.985-.542h.093z">
		                                            </path>
		                                            <path
                          d="M7.584 11.438c.227.031.438.144.594.312 2.953 2.863 4.781 6.875 4.781 11.313 0 4.433-1.828 8.449-4.781 11.312-.398.387-1.035.383-1.422-.016-.387-.398-.383-1.035.016-1.421 2.582-2.504 4.187-5.993 4.187-9.875 0-3.883-1.605-7.372-4.187-9.875-.321-.282-.426-.739-.266-1.133.164-.395.559-.641.984-.617h.094zM1.178 15.531c.121.02.238.063.344.125 2.633 1.414 4.437 4.215 4.437 7.407 0 3.195-1.797 5.996-4.437 7.406-.492.258-1.102.07-1.36-.422-.257-.492-.07-1.102.422-1.359 2.012-1.075 3.375-3.176 3.375-5.625 0-2.446-1.371-4.551-3.375-5.625-.441-.204-.676-.692-.551-1.165.122-.468.567-.785 1.051-.742h.094z">
		                                            </path>
		                                        </svg>
                      <div class="card-number">
                        <div class="section">5453</div>
                        <div class="section">****</div>
                        <div class="section">****</div>
                        <div class="section">1234</div>
                      </div>
                      <div class="end">
                        <span class="end-text">exp. end:</span><span
                          class="end-date">11/28</span>
                      </div>
                      <div class="card-holder">Hong Kill Dong</div>
                      <div class="master">
                        <div class="circle master-red"></div>
                        <div class="circle master-yellow"></div>
                      </div>
                    </div>
                    <div class="back">
                      <div class="strip-black"></div>
                      <div class="ccv">
                        <label>ccv</label>
                        <div>123</div>
                      </div>
                      <div class="terms">
                        <p>This card is property of Monzo Bank,
                          Wonderland. Misuse is criminal offence. If
                          found, please return to Monzo Bank or to the
                          nearest bank with MasterCard logo.</p>
                        <p>Use of this card is subject to the credit
                          card agreement.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <a class="inspiration"
                href="https://dribbble.com/shots/4268384-Credit-card-design"
                target="_blank">inspiration</a>
              <div>
                <!-- 결제수단 선택 -->
                <div class="billing-select mb-20">
                  <select id="payHow" style="font-size: 20px;">
                    <option selected="selected" style="font-size: 15px;">결제수단 선택</option>
                    <option id="html5_inicis">카드</option>
                    <option id="kakaopay" style="font-size: 15px;">카카오페이</option>
                    <option disabled="disabled" style="font-size: 15px;">무통장 입금</option>
                  </select>
                </div>
              </div>
            </div>
            <br> <br>
            
            <h3>결제 정보</h3>
            <div class="your-order-wrap gray-bg-4">
              <div class="your-order-product-info">
                <div class="your-order-top">
                  <ul>
                    <li>상품</li>
                    <li>결제 금액</li>
                  </ul>
                </div>
                <div class="your-order-middle">
                  <ul>
                    <li>
                        <!-- 구매하고자 하는 상품명, 수량 가격 -->
                        <span class="order-middle-left">${cartInfo.goodsCode.split("-")[0]} &nbsp;&nbsp; X &nbsp;&nbsp; ${cartInfo.goodsCount }</span> 
                        <span class="order-price"><fmt:formatNumber value="${cartInfo.goodsPrice }" pattern="#,###" /> 원 </span>
                    </li>
                  </ul>
                </div>
                <!-- 배송비 -->
                <div class="your-order-bottom">
                  <ul>
                    <li class="your-order-shipping">배송비</li>
                    <li style="color: red;">무료</li>
                  </ul>
                </div>
                <!-- 결제 금액 -->
                <div class="your-order-total">
                  <ul>
                    <li class="order-total">총 금액</li>
                    <li>
                      <span><fmt:formatNumber value="${cartInfo.goodsPrice }" pattern="#,###" /> 원</span>
                    </li>
                  </ul>
                </div>
              </div>
              <!-- 결제정보 아래 Notice -->
              <div class="payment-method">
                <div class="payment-accordion element-mrg">
                  <div class="panel-group" id="accordion">
                    <div class="panel payment-accordion">
                      <div class="panel-heading" id="method-one">
                        <h4 class="panel-title">
                          <a class="collapsed" data-bs-toggle="collapse"
                            href="#method1"> 시스템 오류 </a>
                        </h4>
                      </div>
                      <div id="method1"
                        class="panel-collapse collapse show"
                        data-bs-parent="#accordion">
                        <div class="panel-body">
                          <p>
                            현재 시스템 오류로 카드 결제만 가능합니다. <br>이 점 양해
                            부탁드립니다.
                          </p>
                        </div>
                      </div>
                    </div>
                    <div class="panel payment-accordion">
                      <div class="panel-heading" id="method-two">
                        <h4 class="panel-title">
                          <a data-bs-toggle="collapse" href="#method2">
                            무통장 입금 </a>
                        </h4>
                      </div>
                      <div id="method2" class="panel-collapse collapse"
                        data-bs-parent="#accordion">
                        <div class="panel-body">
                          <p>주문 시 기재하신 입금자명과 실제 입금자명이 상이할 경우 입금 처리가
                            되지 않아 별도 연락 부탁 드립니다.</p>
                        </div>
                      </div>
                    </div>
                    <div class="panel payment-accordion">
                      <div class="panel-heading" id="method-three">
                        <h4 class="panel-title">
                          <a class="collapsed" data-bs-toggle="collapse"
                            href="#method3"> 불편사항 접수 </a>
                        </h4>
                      </div>
                      <div id="method3" class="panel-collapse collapse"
                        data-bs-parent="#accordion">
                        <div class="panel-body">
                          <p>문의사항이나 불편사항이 있으시다면, 언제든지
                            고객센터(1588-1234)를 찾아주세요.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 주문하기 버튼 -->
            <section>
              <div class="Place-order mt-25">
                <button type="button" class="btn-hover" id="confirm">주문하기</button>
              </div>
            </section>

            <!-- confirm 모달을 쓸 페이지에 추가 start-->
            <section class="modal modal-section type-confirm">
              <div class="enroll_box">
                <p class="menu_msg"></p>
              </div>
              <div class="enroll_btn">
                <button class="btn pink_btn btn_ok">예</button>
                <button class="btn gray_btn modal_close">아니오</button>
              </div>
            </section>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>

<!-- 다음 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	/* 전달해야하는 정보들을 submit 하는 form */
	function submitOrderForm() {
		var form = document.getElementById("orderForm");
		form.submit();
	}
	</script>
  
  
  <script>
		var csrfHeaderName="${_csrf.headerName}"
	  var csrfTokenValue="${_csrf.token}";
	  var goodsPrice="${cartInfo.goodsPrice }";
	  var goodsName = "${cartInfo.goodsCode.split("-")[0]}";
	  var payMethod = document.querySelector("#payHow");
	  $(document).ajaxSend(function(e, xhr) {
	    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	  });
	  
  	$("#confirm").click(function() {
  		var option = payMethod.options[payMethod.selectedIndex];
  		
  		//결제수단 check
  		if (option.textContent === "결제수단 선택") {
  		    alert("결제수단을 선택해 주세요.");
  		  $('html, body').animate({
  		      scrollTop: $("#payHow").offset().top - 200
  		    }, 1000); // 스크롤 속도(1초)

  		    return; // 주문 처리 중단
  		  }
  		
  		  // 선택된 결제수단에 따라 pg 값을 업데이트
  		  var optionId = option.id;
  		  if (optionId === "html5_inicis") {
  		    pg = "html5_inicis";
  		  } else if (optionId === "kakaopay") {
  		    pg = "kakaopay";
  		  }
	    
	    var IMP=window.IMP;
	    //IMP 객체 초기화 - 가맹점 식별코드
	    IMP.init("imp05520283");
	    //주문번호 - 주문테이블에서 제공된 값 사용 
	    var merchantUid="merchant_"+new Date().getTime();
	    //결제금액 - 주문테이블에서 제공된 값 사용 
	    var amount=goodsPrice;
	    //주문상품
	    var name=goodsName;
	    //결제 전 주문번호와 결제금액을 세션에 저장하기 위한 페이지 요청
	    // => 결제 후 결제정보와 비교하여 검증하기 위해 세션에 저장 
	    $.ajax({
	      type: "post",
	      url: "<c:url value="/payment/pay"/>",
	      contentType: "application/json",
	      data: JSON.stringify({"merchantUid":merchantUid, "amount":amount, "name":name}),
	      dataType: "text",
	      success: function(result) {
	        if(result=="ok") {
	          //결제를 요청하는 메소드 호출
	          IMP.request_pay({
	            // 결제 대행사 : kakaopay, html5_inicis, nice, jtnet, uplus, danal, payco 등
	            pg : pg,
	            // 결제 방식 : card(카드), samsung(삼성페이), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
	            pay_method : "card",
	            //주문번호
	            merchant_uid : merchantUid,
	            //결제금액
	            amount : parseInt(amount),
	            //결제창에 보여질 제품명
	            name: name, 
	            //결제 사용자의 이메일 주소 
	            buyer_email: "gudtjq0306@naver.com",
	            buyer_name: "홍길동",//결제 사용자 이름
	            buyer_tel: "010-1234-5678",//결제 사용자 전화번호
	            buyer_postcode: "123-456",//결제 사용자 우편번호
	            buyer_addr: "서울시 강남구 역삼동 내빌딩 5층 501호",//결제 사용자 주소
	          //m_redirect_url: "http://localhost:8000:auth/payment/pay",//모바일의 리다이렉트 URL 주소
	          }, function(response) {//결제 관련 응답 결과를 제공받아 처리하는 함수
	            //response : 응답결과를 저장한 Object 객체
	            if (response.success) {//결제한 경우
	              //결제금액을 검증하기 위한 페이지를 요청
	              $.ajax({
	                type: "post",
	                url: "<c:url value="/payment/complate"/>",
	                contentType: "application/json",
	                data: JSON.stringify({"impUid": response.imp_uid, "merchantUid": response.merchant_uid}),
	                dataType: "text",
	                success: function(result) {
	                  if(result == "success") {
	                    //결제 성공 페이지로 이동
	                    var msg = '결제가 완료되었습니다.';
	              			msg += '\n고유ID : ' + response.imp_uid;
	              			msg += '\n상점 거래ID : ' + response.merchant_uid;
	              			msg += '\결제 금액 : ' + response.paid_amount;
	              			msg += '카드 승인번호 : ' + response.apply_num;
	      
	        						alert(msg);
	        						submitOrderForm();
	                  } else {
	                    //결제 실패 페이지로 이동
	                	  var msg = '결제에 실패하였습니다.';
	     		         		msg += '//' + response.error_msg;
		                  alert(msg);
	                  }
	                  alert(msg);
	                }, 
	                error: function(xhr) {
	                  alert("에러 = "+xhr.status);
	                }
	              });
	            }
	          });
	        }
	      }, 
	      error: function(xhr) {
	        alert("에러 = "+xhr.status);
	      }
	    });
		});
				
</script>

<script type="text/javascript">
	$(function() {
		// memberPcode 값이 null인 경우 클래스 변경
		if ("<c:out value="${member.memberPcode}" />" === "") {
			$(".orderOld label:contains('우편번호')").closest(".orderOld")
					.removeClass("orderOld").addClass("billing-info mb-20");
		}

		// memberAddress1 값이 null인 경우 클래스 변경
		if ("<c:out value="${member.memberAddress1}" />" === "") {
			$(".orderOld label:contains('기본주소')").closest(".orderOld")
					.removeClass("orderOld").addClass("billing-info mb-20");
		}

		// memberAddress2 값이 null인 경우 클래스 변경
		if ("<c:out value="${member.memberAddress2}" />" === "") {
			$(".orderOld label:contains('상세주소')").closest(".orderOld")
					.removeClass("orderOld").addClass("billing-info mb-20");
		}
	});
</script>

<script>
  /* 다음 주소 연동 */
  function execution_daum_address() {
    console.log("동작");
    new daum.Postcode({
      oncomplete : function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if (data.userSelectedType === 'R') {
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraAddr += (extraAddr !== '' ? ', '
                + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraAddr !== '') {
            extraAddr = ' (' + extraAddr + ')';
          }
          // 추가해야할 코드
          // 주소변수 문자열과 참고항목 문자열 합치기
          addr += extraAddr;

        } else {
          addr += ' ';
        }

        // 제거해야할 코드
        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        $("#addr1").val(data.zonecode);
        $("#addr2").val(addr);
        // 커서를 상세주소 필드로 이동한다.
        $("#addr3").attr("readonly", false);
        $("#addr3").focus();

      }
    }).open();
  }
</script>
<script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function() {
    const existingAddressRadio = document
        .querySelector(".checkout-toggle2");
    const newAddressRadio = document.querySelector(".checkout-toggle");
    const newAddressToggle = document.querySelector(".different-address");

    //

    existingAddressRadio.addEventListener("change", function() {
      if (this.checked) {
        newAddressToggle.style.display = "none";
      }
    });

    newAddressRadio.addEventListener("change", function() {
      if (this.checked) {
        newAddressToggle.style.display = "block";
      }
    });
  });
</script>
