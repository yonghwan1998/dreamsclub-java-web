<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">

<!--전체(글+댓글)-->
<div class="communityDetail">
    <!--글제목+내용+목록으로-->
    <div class="communityDetailWrtten">
        <!--글 경로 (Dreams > 공지사항)-->
        <div class="communityDetailPath">
            <h5>Dreams > 공지사항</h5>
        </div>

        <!--글 컨테이너-->
        <div class="communityDetailContainer">
	          <!--글 제목-->
	          <div class="headwrap">
	              <div class="title" style="width: 70%;">드림즈-경상남도, 지역사회 발전 위해 힘 모은다</div>
	              <div class="writer" style="width: 15%; text-align: right;">작성자 : 관리자</div>
	              <div class="wrtieDate" style="width: 15%; text-align: right;">작성일자 : 2023-08-05 </div>
	          </div>
	          
	
	          <!--글 내용-->
	          <div class="communityDetailContainerBody">
	              드림즈가 경상남도와 '파트너십 구축을 통한 상생 협력 업무 협약'을 4일(금) 맺었습니다.
	              <br>
	              <br>
	              이번 협약으로 드림즈와 경상남도는 도민 소통 강화를 위한 도정 홍보에 협력하고, 도민 스포츠 관람 기획 확대를 위해 사회공헌 활동을 함께
	              <br>
	              하는 등 지역사회 발전에 힘을 모으기로 했습니다. 
	              <br>
	              경기에 앞서 열린 협약식에는 최만림 경상남도 행정부지사와 권일도 재송 드림즈 대표이사 등이 참석했습니다.
	              <br>
	              <br>
	              최만림 경상남도 행정부지사는 "이번 협약을 통해 도민과의 소통이 확대되고 많은 도민이 스포츠 관람 기회를 가질 수 있기를 기대하고 있
	              <br>
	              다. 도민이 실질적으로 더 많은 혜택과 정보를 누릴 수 있도록 재송 드림즈와의 협력체계를 더욱 강화하겠다"라고 이야기했습니다.
	              <br>
	              <br>
	              권일도 재송 드림즈 대표이사는 "이번 협약을 계기로 구단의 사회공헌 활동인 D-NATION과 연계한 도민들의 스포츠 관람 기회 확대와 지
	              <br>
	              역 취약계층 지원에 더 많은 노력을 기울이겠다"라고 말했습니다.
	          </div>
        </div>

            <!--버튼-->
        <div class="communityDetailBtn">
            <a href="/dreams/notice">목록으로</a>
        </div>
    </div>
</div>