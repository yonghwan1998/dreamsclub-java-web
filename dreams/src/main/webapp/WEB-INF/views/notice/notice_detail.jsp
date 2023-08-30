<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">

<!--전체(글+댓글)-->
<div class="noticeDetail">
    <!--글제목+내용+목록으로-->
    <div class="noticeDetailWrtten">
        <!--글 경로 (Dreams > 공지사항)-->
        <div class="noticeDetailPath">
            <h5>Dreams > 공지사항</h5>
        </div>

        <!--글 컨테이너-->
        <div class="noticeDetailContainer">
	          <!--글 제목-->
	          <div class="headwrap">
                	<div class="pageNo" style="width: 5%;"><c:out value="${pageInfo.noticeNo }"/></div>
                   <div class="title" style="width: 65%;"><c:out value="${pageInfo.noticeTitle }"/></div>
                   <div class="writer" style="width: 15%; text-align: right;">작성자 : <c:out value="${pageInfo.memberId }"/></div>
                   <div class="wrtieDate" style="width: 15%; text-align: right;">작성일자 : <c:out value="${pageInfo.noticeDate }"/></div>
               </div>
	          
	
	          <!--글 내용-->
	          <div class="communityDetailContainerBody">
	              <c:out value="${pageInfo.noticeCont }"/>
	          <!-- 
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
	              
	               -->
	          </div>
        </div>

            <!--버튼-->
        <div class="noticeDetailBtn">
            <a href="/dreams/notice">목록으로</a>
            	<c:if test="${member.memberId == pageInfo.memberId }" >
						<a href="/dreams/notice/delete?noticeNo=${pageInfo.noticeNo}" role="button" id="delete_btn">삭제하기</a>  
					</c:if> 
        </div>
        
         <!-- 수정하기 버튼 나중에 추가
            <div class="noticeDetailBtn">
                <a href="/dreams/notice/modify">수정하기</a>
            </div>
            -->
           	<form id="infoForm" action="/notice/detail" method="get">
				<input type="hidden" id="noticeNo" name="noticeNo" value='<c:out value="${pageInfo.noticeNo}"/>'>
			</form>
            
    </div>
</div>

<!-- JS -->
<script type="text/javascript">
let form = $("#infoForm");

//수정버튼
$("#noticeDetailBtn").on("click", function(e){
	form.attr("action", "/notice/modify");
	form.submit();
});

funciton delete_btn(){
	alert("$(member.memberId)");
};

funciton delete_btn(){
	alert("$(pageInfo.memberId)");
};




</script>