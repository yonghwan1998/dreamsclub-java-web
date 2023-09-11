<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<p style="margin-top: -12px">
	<em class="link"> <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')"> </a>
	</em>
</p>
<div id="map" style="width: 100%; height: 350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5dc82718c2ad8c1ad788070395eae5cf&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 강남구 테헤란로 124 ', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">재송 드림즈</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<div class="custom-row-2">
	<div class="col-lg-4 col-md-5">
		<div class="contact-info-wrap">
			<div class="single-contact-info">
				<div class="contact-icon">
					<i class="fa fa-phone"></i>
				</div>
				<div class="contact-info-dec">
					<p>TEL 02 6255 8002</p>
					<p>PAX 02 569 8069</p>
				</div>
			</div>
			<div class="single-contact-info">
				<div class="contact-icon">
					<i class="fa fa-globe"></i>
				</div>
				<div class="contact-info-dec">
					<p>
						<a href="#">admin@itwill.co.kr</a>
					</p>
					<p>
						<a href="#">www.itwill.co.kr</a>
					</p>
				</div>
			</div>
			<div class="single-contact-info">
				<div class="contact-icon">
					<i class="fa fa-map-marker"></i>
				</div>
				<div class="contact-info-dec">
					<p>서울 강남구 테헤란로 124 삼원타워 4층</p>
				</div>
			</div>
			<div class="contact-social text-center">
				<ul>
				</ul>
			</div>
		</div>
	</div>
	<!--  빈칸 회색 ▼ -->
	<div class="col-lg-8 col-md-7">
		<div class="contact-form">
			<div class="contact-title mb-30">
				<!--  오른쪽 하단 ▼ -->
				<div class="contact-form-style">
					<div class="row">
						<div class="col-lg-6">
							<p class="txt01">지하철</p>
							<p class="txt02">
								<img src="${pageContext.request.contextPath }/img/customer/way_icon01.png" width="40" height="25"> <span class="txt03 type01"> <br> <b>강남역 1번출구 </b> "도보 150m"
								</span> <br> <span class="txt03"> <b>역삼역 3번출구 </b> "도보 200m"
								</span>
						</div>
						<div class="col-lg-6">
							<p class="txt01">버스</p>
							<p class="txt02">
								<img src="${pageContext.request.contextPath }/img/customer/way_icon02.png" width="40" height="25"> <br> <span class="txt03 type02"> <b>강남역, 역삼세무서(23-287)</b> ": 146, 341, 360, 740, N13, N61"
								</span> <br> <span class="txt03 type04"> <b> 강남역, 12번출구(23-284)</b> ": 146, 341, 360, 740, N13, N61"
								</span> <br> <br> <img src="${pageContext.request.contextPath }/img/customer/way_icon03.png" width="40" height="25"> <span class="txt03 type03"> <br> <b>강남역,역삼세무서(23-287) </b> ": 1100, 1700, 2000, 2000-1, 3002, 3007, 3200, 3300, 3400, 7007, 9303, 8001"
								</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>