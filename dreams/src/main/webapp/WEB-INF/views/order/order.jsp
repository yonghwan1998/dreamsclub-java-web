<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 컨텐츠 상단 홈/결제 -->
<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="/dreams">홈</a>
                </li>
                <li class="active" style="font-weight: bold;">결제</li>
            </ul>
        </div>
    </div>
</div>
<!-- 배송지 입력칸 -->
<div class="checkout-area pt-95 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <div class="billing-info-wrap">
                    <h3>배송정보 입력사항</h3>
                    <div class="row">
                    	<c:choose>
                    		<c:when test="${memberInfo != null }">
	                          <div class="col-lg-6 col-md-6">
	                              <div class="billing-info mb-20">
	                                  <label>이름</label>
	                                  <p><c:out value="${memberInfo.memberName}" /></p>
	                              </div>
	                          </div>
	                          <div class="col-lg-6 col-md-6">
	                              <div class="billing-info mb-20">
	                                  <label>전화번호</label>
	                                  <p><c:out value="${memberInfo.memberPhone}" /></p>
	                              </div>
	                          </div>
	
	                          <div class="col-lg-12">
	                              <div class="billing-info mb-20">
	                                  <label>이메일</label>
	                                  <p><c:out value="${memberInfo.memberEmail}" /></p>
	                              </div>
	                          </div>
	                          
	                          <div class="col-lg-6">
	                              <div class="billing-info mb-20">
	                                  <label>우편번호</label>
	                                  <p><c:out value="${memberInfo.memberPcode}" /></p>
	                              </div>
	                          </div>
	                          
	                          <div class="col-lg-12">
	                              <div class="billing-info mb-20">
	                                  <label>기본주소</label>
	                                  <p><c:out value="${memberInfo.memberAddress1}" /></p>
	                              </div>
	                          </div>
	                          
	                          <div class="col-lg-12">
	                          	<div class="billing-info mb-20">
	                                  <label>상세주소</label>
	                                  <p><c:out value="${memberInfo.memberAddress2}" /></p>
	                          	</div>
	                         </div>
                         	</c:when>
	                        <c:otherwise>
	                       	<div class="col-lg-12">
					            <p>로그인이 필요한 서비스입니다. 로그인하거나 회원 가입을 진행해주세요.</p>
					            <p><a href="/dreams/login">로그인</a> 또는 <a href="/dreams/join/check">회원 가입</a></p>
				        	</div>
	                        </c:otherwise>
						</c:choose>
                    </div>
		
					<!-- 라디오 버튼(체크박스) -->                        
                    <div class="checkout-account mb-50" style="margin-top: 10px; ">
					    <label>
					        <input class="checkout-toggle2" type="radio" name="addressOption" value="existing" checked style="height: 20px;">
					        <span>기존 배송지 사용</span>
					    </label>
					    <label>
					        <input class="checkout-toggle" type="radio" name="addressOption" value="new" style="height: 20px;">
					        <span>신규 배송지 등록</span>
					    </label>
					</div>

                    <!-- 신규 배송지 등록 토글 -->
                    <div class="different-address open-toggle mt-30">
                    <div class="row">
                    	<div class="col-lg-6 col-md-6">
                            <div class="billing-info mb-20">
                                <label>이름</label>
                                <input type="text">
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="billing-info mb-20">
                                <label>전화번호</label>
                                <input type="text">
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="billing-info mb-20">
                                <label>이메일</label>
                                <input type="text">
                            </div>
                        </div>
                        
                        <label style="margin-bottom: 7px;">주소</label>
                        <div class="form-group">
                            <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호"
                                name="addr1" id="addr1" type="text" readonly="readonly">
                            <button type="button" class="btn btn-default" onclick="execPostCode();"><i
                                    class="fa fa-search"></i> 우편번호 찾기</button>
                        </div>
                        <div class="form-group">
                            <input class="form-control" style="top: 5px;" placeholder="기본주소" name="addr2" id="addr2"
                                type="text" readonly="readonly" />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text" style="margin-bottom: 30px"/>
                        </div>
                    	</div>
                    
                    </div>
		 			<!-- 배송요청 사항 -->
                    <div class="additional-info-wrap">
                        <h4>배송 요청사항</h4>
                        <div class="additional-info">
                            <textarea placeholder="ex. 도착하면 연락주세요. " name="message"></textarea>
                        </div>
                    </div>
                </div>
            </div>

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
                                        <svg class="card_logo" width="40" height="40" viewbox="0 0 17.5 16.2">
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
                                        <svg class="wave" viewBox="0 3.71 26.959 38.787" width="26.959"
                                            height="38.787" fill="white">
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
                                        <div class="end"><span class="end-text">exp. end:</span><span
                                                class="end-date">11/28</span></div>
                                        <div class="card-holder">Hong Kill Dong </div>
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
                                            <p>This card is property of Monzo Bank, Wonderland. Misuse is criminal
                                                offence.
                                                If found, please return to Monzo Bank or to the nearest bank with
                                                MasterCard
                                                logo.</p>
                                            <p>Use of this card is subject to the credit card agreement.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        	<a class="inspiration" 
                        	href="https://dribbble.com/shots/4268384-Credit-card-design"
                            target="_blank">inspiration</a>
                        <div>
                        <div class="billing-select mb-20">
                            <select style="font-size: 20px;">
                                <option selected="selected" style="font-size: 15px;">결제수단 선택</option>
                                <option>신용카드</option>
                                <option disabled="disabled" style="font-size: 15px;">무통장 입금</option>
                                <option disabled="disabled" style="font-size: 15px;">네이버 페이</option>
                            </select>
                        </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <h3>결제 정보</h3>
                    <div class="your-order-wrap gray-bg-4">
                        <div class="your-order-product-info">
                            <div class="your-order-top">
                                <ul>
                                    <li>상품</li>
                                    <li>Total</li>
                                </ul>
                            </div>
                            <div class="your-order-middle">
                                <ul>
                                    <li><span class="order-middle-left">녹즙 X 100</span> <span
                                            class="order-price">300,000 </span></li>
                                    <li><span class="order-middle-left">생수 X 10</span> <span
                                            class="order-price">10,000 </span></li>
                                </ul>
                            </div>
                            <div class="your-order-bottom">
                                <ul>
                                    <li class="your-order-shipping">배송비</li>
                                    <li>무료</li>
                                </ul>
                            </div>
                            <div class="your-order-total">
                                <ul>
                                    <li class="order-total">Total</li>
                                    <li>310,000</li>
                                </ul>
                            </div>
                        </div>
                        <div class="payment-method">
                            <div class="payment-accordion element-mrg">
                                <div class="panel-group" id="accordion">
                                    <div class="panel payment-accordion">
                                        <div class="panel-heading" id="method-one">
                                            <h4 class="panel-title">
                                                <a data-bs-toggle="collapse" href="#method1">
                                                    무통장 입금
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="method1" class="panel-collapse collapse show"
                                            data-bs-parent="#accordion">
                                            <div class="panel-body">
                                                <p>주문 시 기재하신 입금자명과 실제 입금자명이 상이할 경우 입금 처리가 되지 않아 
                                                별도 연락 부탁 드립니다.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel payment-accordion">
                                        <div class="panel-heading" id="method-two">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-bs-toggle="collapse" href="#method2">
                                                    시스템 오류
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="method2" class="panel-collapse collapse"
                                            data-bs-parent="#accordion">
                                            <div class="panel-body">
                                                <p>현재 시스템 오류로 카드 결제만 가능합니다. 이 점 양해 부탁드립니다.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel payment-accordion">
                                        <div class="panel-heading" id="method-three">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-bs-toggle="collapse" href="#method3">
                                                    불편사항 접수
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="method3" class="panel-collapse collapse"
                                            data-bs-parent="#accordion">
                                            <div class="panel-body">
                                                <p>문의사항이나 불편사항이 있으시다면, 언제든지 고객센터(1588-1234)를 찾아주세요.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 주문하기 버튼 -->
                    <div class="Place-order mt-25">
                        <a class="btn-hover" href="/dreams/order/detail/{memberId}">주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- All JS is here
============================================ -->
<!-- 다음 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execPostCode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);


                $("[name=addr1]").val(data.zonecode);
                $("[name=addr2]").val(fullRoadAddr);

                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */

                document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr2').value = fullAddr;
            }
        }).open();
        document.getElementById("addr3").focus();
    }
</script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
    const existingAddressRadio = document.querySelector(".checkout-toggle2");
    const newAddressRadio = document.querySelector(".checkout-toggle");
    const newAddressToggle = document.querySelector(".different-address");

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