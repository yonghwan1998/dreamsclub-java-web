<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">

<!--공지사항 전체-->
<div class="communityContainer">
    <div class="commnunityTitle">
        <h2 style="color: #003E00;">공지사항</h2>
        <h4 style="margin-bottom: 40px;">드림즈의 다양한 소식들을 만나보세요.</h4>
    </div>

    <!--공지사항 테이블-->
    <div class="boardMain">
        <!--검색창-->
        <div class="boardSerchBig">
            <div class="boardSearch">
                <select class="selectBox" id="selectBox" style="width:13%;   border: 1px solid #000;  background-color: #fff;">
                    <option class="search_option" value="searchTitle">제목</option>
                    <option class="search_option" value="searchContent">내용</option>
                </select>
                <!--돋보기 이미지-->
                <div class="searchTalk" style="width: 70%; padding: 0 10px" ><input type="text" id="searchTalk" placeholder="검색어를 입력해주세요."></div>
                <div class="searchBtn"><button type="button">검색</button></div>
            </div>
        </div>

        <!--테이블-->
        <div class="commnunityTable">
            <!--테이블 본체-->
            <div class="boardTable" style="margin: 0 auto">
                <table class="boardTableMain" width="1200px">
                    <thead>
                        <tr>
                            <th class="t1" scope="col" style="width: 100px">번호</th>
                            <th class="t2" style="width: 700px">제목</th>
                            <th class="t3" style="width: 150px">작성자</th>
                            <th class="t4" style="width: 150px">작성일</th>
                           <!--  <th class="t5" style="width: 100px">조회수</th>  -->
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach items="${NoticeList }" var="NoticeList" >
	                        <tr class="boardTableList">
	                            <td class="t1"><c:out value="${NoticeList.noticeNo }"/></td>
	                            <td class="t2 text-left">
	                            	<a class="move" href="/dreams/notice/detail?noticeNo=<c:out value='${NoticeList.noticeNo}'/>">
	                            		<c:out value="${NoticeList.noticeTitle }"/>
	                            	</a>
	                           	</td>
	                            <td class="t3"><c:out value="${NoticeList.memberId }"/></td>
	                            <td class="t4"><c:out value="${NoticeList.noticeDate }"/></td>
	                       <!--   <td class="t5"><c:out value="${NoticeList.noticeHit }"/></td> -->    
	                        </tr>
	                    </c:forEach>                      
                    </tbody>
               </table>
               
              
                    
                    
                <form id="moveForm" method="get">
                </form>   
            </div>




			<!--글쓰기 버튼-->
         
			<c:choose>

				<c:when test="${member.memberStatus == 9}">
					<div class="writeBtnContainer">
     						   <div class="boardWriteBtn" style="text-align: right;">
        						    <a href="/dreams/notice/write">등록</a>
          							<a href="/dreams/notice/modify">수정</a>
            						<a href="/dreams/notice/delete?noticeNo=${pageInfo.noticeNo}">삭제</a>  
      						   </div>
			        </div>
				</c:when>

			</c:choose>

            

            <!--페이징-->
            <div class="boardPageContainer">
                <div class="boardPage">
					<c:choose>
						<c:when test="${pager.startPage > pager.blockSize }">
							<a href="<c:url value="/notice"/>?pageNum=${pager.prevPage}">《</a>
						</c:when>
						<c:otherwise>
							《
						</c:otherwise>
					</c:choose>	
					
					<c:forEach var="i" begin="${pager.startPage }" end="${pager.endPage }" step="1">
						<c:choose>
							<c:when test="${pager.pageNum != i  }">
								<a href="<c:url value="/notice"/>?pageNum=${i+1}">${i+1}</a>
							</c:when>
							<c:otherwise>
								${i+1 }
							</c:otherwise>
						</c:choose>	
					</c:forEach>
				
					<c:choose>
						<c:when test="${pager.endPage != pager.totalPage }">
							<a href="<c:url value="/notice"/>?pageNum=${pager.nextPage}">》</a>
						</c:when>
						<c:otherwise>
							》
						</c:otherwise>
					</c:choose>	
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
	
	moveForm.append("<input type='hidden' name='noticeNo' value='"+$(this).attr("href")+"'>");
	moveForm.attr("action", "/notice/detail");
	moveForm.submit();
}

</script>




    </div>
</div>