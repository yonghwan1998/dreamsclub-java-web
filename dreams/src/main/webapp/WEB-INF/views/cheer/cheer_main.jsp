<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 커뮤니티 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">

<style>
.speech-bubble {
  position: relative;
  background: #19945f;
  border-radius: .4em;
  margin: 100px auto 50px auto;
  height: 15rem;
  width: 45%;
  text-align: center;
}

.speech-bubble:after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  width: 0;
  height: 0;
  border: 24px solid transparent;
  border-top-color: #19945f;
  border-bottom: 0;
  border-right: 0;
  margin-left: -12px;
  margin-bottom: -24px;
}

h1 {
  font-size: 28px;
  color: white;
}

h2 {
  color: white;
  display: -webkit-box;
  overflow: hidden;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
}

textarea {
  resize: none;
  left: 15rem;
  position: relative;
  height: 15rem;
  width: 60%;
  font-size: 48px;
  line-height: 1.5;
}
</style>


<!--게시판 전체-->
<div class="communityContainer">
    <div class="commnunityTitle">
        <h2 style="color: #003E00;">응원의 한마디</h2>
        <h4 style="margin-bottom: 40px;">☆당신의 선수를 응원하세요☆</h4>
    </div>

    <!--게시판테이블-->
    <div class="boardMain">
        <!--테이블-->
		<form action="<c:url value="/cheer"/>" method="post">
           	<c:if test="${empty member }">
           		<div style="text-align: center; color: red; font-weight: bold;">로그인 후 메모를 남길 수 있습니다.</div>
           	</c:if>
           	<c:if test="${not empty member }">
				<input type="hidden" name="memberId" value="${member.memberId }"/>
				<textarea name="cheerContent" id="textBox" cols="30" rows="4" placeholder="응원의 한마디를 남겨 주세요." maxlength="200" style="resize: none;"></textarea>
				<!--글쓰기 버튼-->
	            <div class="writeBtnContainer" style="margin-top: 10px">
	                <div style="text-align: right;">
		                <span class="textCount">0자</span>
			    		<span class="textTotal">/ 50자</span>
	                   	<button type="submit">작성</button>
	                </div>
	            </div>
           	</c:if>
		</form>

        <div class="commnunityTable">
            <!--테이블 본체-->
            <div class="boardTable" style="margin: 0 auto">
                <div class="boardTableMain" width="1200px">
                    
                    <%-- <div>
                        <div>
                            <div class="t1" scope="col" style="width: 100px">번호</div>
                            <div class="t2" style="width: 100px">작성자</div>
                            <div class="t3" style="width: 700px">내용</div>
                            <div class="t4" style="width: 150px">작성일</div>
                            <c:if test="${member.memberStatus eq '9' }"><div class="t5" style="width: 75px">기능</div></c:if>
                        </div>
                    </div> --%>
                    
                    <c:forEach items="${cheerList }" var="cheerList" >
                    <div class="speech-bubble">
                      <h1><c:out value="${cheerList.memberId }"/></h1>
                      <hr style="color: lightgray;">
                      <h2><c:out value="${cheerList.cheerContent }"/></h2>
                      
                    </div>
                    </c:forEach>
                    <%-- <div>  
                        <c:forEach items="${cheerList }" var="cheerList" >
	                        <div class="boardTableList">
	                        	<!-- cheerDel 상태 ('N') -->
	                        
	                        	<!-- 1. cheerNo -->
	                            <div class="t1 ${cheerList.cheerNo }"><c:out value="${cheerList.cheerNo }"/></div>
	                            
	                        	<!-- 2. memberId -->
	                            <c:if test="${cheerList.cheerDel eq 'N' }">
		                            <div class="t2"><c:out value="${cheerList.memberId }"/></div>
	                            </c:if>
	                            <c:if test="${cheerList.cheerDel eq 'Y' }">
		                            <div class="t2"><c:out value="드림즈 관리자"/></div>
	                            </c:if>
	                            
	                        	<!-- 3. cheerContent -->
	                            <c:if test="${cheerList.cheerDel eq 'N' }">
	                            	<div class="t3" style="text-align: left"><c:out value="${cheerList.cheerContent }"/></div>
	                            </c:if>
	                            <c:if test="${cheerList.cheerDel eq 'Y' }">
	                            	<div class="t3" style="text-align: left; color: red;"><c:out value="관리자 요청에 의해 삭제된 글입니다."/></div>
	                            </c:if>
	                            
	                        	<!-- 4. cheerDate -->
	                            <div class="t4"><c:out value="${cheerList.cheerDate }"/></div>
	                            
	                        	<!-- 5. delButton, returnBtn -->
	                            <c:if test="${cheerList.cheerDel eq 'N' }">
		                            <c:if test="${member.memberStatus eq '9' }">
		                            	<div class="t5"><button onclick="deleteMemo('${cheerList.cheerNo }');">삭제</button></div>
		                            </c:if>
	                            </c:if>
	                            <c:if test="${cheerList.cheerDel eq 'Y' }">
		                            <c:if test="${member.memberStatus eq '9' }">
		                            	<div class="t5"><button onclick="returnMemo('${cheerList.cheerNo }');">복구</button></div>
		                            </c:if>
	                            </c:if>
	                        </div>
	                    </c:forEach> 
                    </div> --%>
                    
                </div>
            </div>

            <%-- 페이지 번호 출력 --%>
            <div style="text-align: center; padding-top: 10px;">
				<c:choose>
					<c:when test="${pager.startPage > pager.blockSize }">
						<a href="<c:url value="/cheer"/>?pageNum=${pager.prevPage}">[이전]</a>
					</c:when>
					<c:otherwise>
						[이전]
					</c:otherwise>
				</c:choose>
			
				<c:forEach var="i" begin="${pager.startPage }" end="${pager.endPage }" step="1">
					<c:choose>
						<c:when test="${pager.pageNum != i  }">
							<a href="<c:url value="/cheer"/>?pageNum=${i}">[${i }]</a>
						</c:when>
						<c:otherwise>
							[${i }]
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<c:choose>
					<c:when test="${pager.endPage != pager.totalPage }">
						<a href="<c:url value="/cheer"/>?pageNum=${pager.nextPage}">[다음]</a>
					</c:when>
					<c:otherwise>
						[다음]
					</c:otherwise>
				</c:choose>
            </div>
        </div>
    </div>
</div>

<script>

$('#textBox').keyup(function (e) {
	let content = $(this).val();
    
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('.textCount').text('0자');
    } else {
    	$('.textCount').text(content.length + '자');
    }
    
    // 글자수 제한
    if (content.length > 50) {
    	// 50자 부터는 타이핑 되지 않도록
        $(this).val($(this).val().substring(0, 50));
        // 50자 넘으면 알림창 뜨도록
        alert('글자수는 50자까지 입력 가능합니다.');
    };
});

function deleteMemo(cheerNo) {
	$.ajax({
		type : "post",
		url : "<c:url value="/cheer/deleteMemo"/>",
		contentType : "application/json",
		data : JSON.stringify({
			"cheerNo" : cheerNo,
		}),
		dataType : "text",
		success : function(result) {
			if (result == 'success') {
				alert("[" + cheerNo + "번 메모] 정보를 삭제했습니다.");
				location.href = "<c:url value="/cheer"/>";
			}
		},
		error: function(xhr) {
			alert("[" + cheerNo + "번 메모] 정보 수정에 실패했습니다.\n에러코드 = " + xhr.stauts);
		}
	});
}

function returnMemo(cheerNo) {
	$.ajax({
		type : "post",
		url : "<c:url value="/cheer/returnMemo"/>",
		contentType : "application/json",
		data : JSON.stringify({
			"cheerNo" : cheerNo,
		}),
		dataType : "text",
		success : function(result) {
			if (result == 'success') {
				alert("[" + cheerNo + "번 메모] 정보를 복구했습니다.");
				location.href = "<c:url value="/cheer"/>";
			}
		},
		error: function(xhr) {
			alert("[" + cheerNo + "번 메모] 정보 수정에 실패했습니다.\n에러코드 = " + xhr.stauts);
		}
	});
}
</script>
