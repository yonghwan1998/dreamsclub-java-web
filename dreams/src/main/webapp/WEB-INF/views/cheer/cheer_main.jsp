<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 커뮤니티 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">

<!--게시판 전체-->
<div class="communityContainer">
    <div class="commnunityTitle">
        <h2 style="color: #003E00;">응원의 한마디</h2>
        <h4 style="margin-bottom: 40px;">☆당신의 선수를 응원하세요☆</h4>
    </div>

    <!--게시판테이블-->
    <div class="boardMain">
        <!--테이블-->
        <div class="commnunityTable">
            <!--테이블 본체-->
            <div class="boardTable" style="margin: 0 auto">
                <table class="boardTableMain" width="1200px">
                    <thead>
                        <tr>
                            <th class="t1" scope="col" style="width: 100px">번호</th>
                            <th class="t2" style="width: 700px">내용</th>
                            <th class="t3" style="width: 150px">작성자</th>
                            <th class="t4" style="width: 150px">작성일</th>
                        </tr>
                    </thead>
                    <tbody>  
                        <c:forEach items="${cheerList }" var="cheerList" >
	                        <tr class="boardTableList">
	                            <td class="t1"><c:out value="${cheerList.cheerNo }"/></td>
	                            <td class="t2"><c:out value="${cheerList.memberId }"/></td>
	                            <td class="t3"><c:out value="${cheerList.cheerContent }"/></td>
	                            <td class="t4"><c:out value="${cheerList.cheerDate }"/></td>
	                        </tr>
	                    </c:forEach> 
                    </tbody>
                </table>
                <form id="moveForm" method="get">
                </form>
            </div>

            <!--글쓰기 버튼-->
            <div class="writeBtnContainer">
                <div class="boardWriteBtn" style="text-align: right;">
                	<%-- <c:if test="${!empty(member)}">
                    	<a href=<c:url value="/community/write"/>>글쓰기</a>
                    </c:if> --%>
                   	<a href=<c:url value="/community/write"/>>글쓰기</a>
                </div>
            </div>

            <!--페이징-->
            <div class="boardPageContainer">
                <div class="boardPage">
					<c:choose>
						<c:when test="${pager.startPage > pager.blockSize }">
							<a href="<c:url value="/community"/>?pageNum=${result.pager.prevPage}&column=${search.column}&keyword=${search.keyword}">《</a>
						</c:when>
						<c:otherwise>
							《
						</c:otherwise>
					</c:choose>	
					
					<c:forEach var="i" begin="${result.pager.startPage }" end="${result.pager.endPage }" step="1">
						<c:choose>
							<c:when test="${result.pager.pageNum != i  }">
								<a href="<c:url value="/community"/>?pageNum=${i}&column=${search.column}&keyword=${search.keyword}">[${i }]</a>
							</c:when>
							<c:otherwise>
								${i }
							</c:otherwise>
						</c:choose>	
					</c:forEach>
				
					<c:choose>
						<c:when test="${result.pager.endPage != result.pager.totalPage }">
							<a href="<c:url value="/community"/>?pageNum=${result.pager.nextPage}&column=${search.column}&keyword=${search.keyword}">》</a>
						</c:when>
						<c:otherwise>
							》
						</c:otherwise>
					</c:choose>	
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript"
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">

//글 등록 성공 경고창
$(document).ready(function(){
	let result = '<c:out value="${result}"/>';
	checkAlert(result);
	function checkAlert(result){
		if(result==""){
			return;
		} else if(result=="enroll success"){
			alert("글이 등록되었습니다.")
		}
	}
});
  

//<a>태그 동작코드
let moveForm=$("#moveForm");

$(".move").on("click", funtion(e){
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='commNo' value='"+$(this).attr("href")+"'>");
	moveForm.attr("action", "/community/detail");
	moveForm.submit();
}

</script>
