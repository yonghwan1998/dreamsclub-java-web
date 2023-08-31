<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 커뮤니티 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">

<!--전체(글+댓글)-->
<div class="communityDetail">
    <!--글제목+내용+목록으로-->
    <div class="communityDetailWrtten">
        <!--글 경로 (커뮤니티 > 꿈들의 모임)-->
        <div class="communityDetailPath">
            <h5>커뮤니티  >  꿈들의 모임</h5>
        </div>

        <!--글 컨테이너-->
        <div class="communityDetailContainer">
               <!--글 제목-->
               <div class="headwrap">
                	<div class="pageNo" style="width: 5%;"><c:out value="${pageInfo.commNo }"/></div>
                   <div class="title" style="width: 65%;"><c:out value="${pageInfo.commTitle }"/></div>
                   <div class="writer" style="width: 15%; text-align: right;">작성자 : <c:out value="${pageInfo.memberId }"/></div>
                   <div class="wrtieDate" style="width: 15%; text-align: right;">작성일자 : <c:out value="${pageInfo.commDate }"/></div>
               </div>
               
   
               <!--글 내용-->
               <div class="communityDetailContainerBody">
               		${pageInfo.commCont}
               </div>
        </div>

            <!--버튼-->
            <div class="communityDetailBtn">
                <a href=<c:url value="/community"/>>목록으로</a>
                	<c:if test="${member.memberId == pageInfo.memberId }" >
						<a href="#" role="button" id="delete_btn" name="delete_btn" onclick="deleteCheck()">삭제하기</a>   
					</c:if>       
			</div>
            <!-- 수정하기 버튼 나중에 추가
            <div class="communityDetailBtn">
                <a href="/dreams/community/modify">수정하기</a>
            </div>
            -->
           	<form id="infoForm" action=<c:url value="/community/detail"/> method="get">
				<input type="hidden" id="commNo" name="commNo" value='<c:out value="${pageInfo.commNo}"/>'>
			</form>
            
        
    </div>
    
    <!--[댓글]-->

    <!--댓글 입력폼-->
    <form id="communityReplyFrom" name="communityReplyFrom" method="post"> 
        <div class="communityReply">
            <div class="onekan" style="display: flex; width: 100%;">
            <!--댓글 입력칸-->
            <textarea class="communityReplyText"></textarea>
            <!--댓글 입력 버튼 (onclick 안에 실행될 메소드 나중에 적어주기)-->
            <button type="button" onclick="" class="onekanBtn">확인</button>
            </div>
            <!--글자수 카운팅(최대 400자로 이거 나중에 메소드 걸어주기)-->
            <div class="countwritten"><strong>0자</strong>/400자</div>
        </div>
    </form>

    <!--댓글 목록-->
    <!--댓글 개수 알려줌-->
    <!-- <div class="communityReplyView">
        <div class="communityReplyCount">
            ((여기에 개수 세는 기능 넣어야함))
            <strong style="color: green;">0개</strong>의 댓글이 등록되었습니다.
        </div>
        댓글 목록뷰
        <ul>
            <li style="border-top: none">
                <p class="txt">제작년에 반짝하고 끝날 줄 알았는데 계속 상위권ㄷㄷㄷ 꼴림즈한테 이런날이 오다니</p>
                <div>
                    <p>아이디</p>
                    <p>작성날짜</p>
                    <p>
                        <a href="답글 링크" class="commentReRely">답글</a>
                    </p>
                </div>
            </li>
            <div class="addReplyWrite" id=""></div>
                대댓글
                <div class="communityReReplyView"  
                        style="background:#f9f9f9;padding:20px 35px; margin-left:30px;">
                    <p class="text">제 생애 이런날이 다시올 줄 몰랐습니다ㅠㅠㅠ</p>
                    <div>
                        <p>아이디</p>
                        <p>작성날짜</p>
                        <p>
                            <a href="답글 링크" class="commentReRely">답글</a>
                        </p>
                    </div>
                </div>
            <div class="addReplyWrite" id=""></div>
            <li>
                <p class="txt">우승까지 가보자 화이팅!</p>
                <div>
                    <p>아이디</p>
                    <p>작성날짜</p>
                    <p>
                        <a href="답글 링크" class="commentReRely">답글</a>
                    </p>
                </div>
            </li>
            <div class="addReplyWrite" id=""></div>
            대댓글 작성폼(답글 누르지 않을때는 div에 style="display: none" 전부 설정해놓으면 된다.)
            <div class="communityReReplyForm">
                <div class="communityReReplyWrite">
                    <textarea></textarea>
                    <a href="#">답글 달기</a>
                    <a href="#">답글 취소</a>
                </div>
                글자수 카운팅(최대 400자로 이거 나중에 메소드 걸어주기)
                <div class="countwritten"><strong>0자</strong>/400자</div>
            </div>
        </ul>
    </div>
     -->
</div>


<!-- JS -->
<script type="text/javascript">
//삭제 확인하기

function deleteCheck(){
   if(confirm("정말 삭제하시겠습니까?")==true){
      location.href="<c:url value='/community/delete?commNo=${pageInfo.commNo}'/> ";
      alert("삭제되었습니다.");
   }else if(confirm==false){
      alert("취소되었습니다.");
   }
}




</script>