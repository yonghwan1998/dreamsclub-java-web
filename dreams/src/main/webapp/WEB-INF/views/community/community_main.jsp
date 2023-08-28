<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 커뮤니티 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">

<!--게시판 전체-->
<div class="communityContainer">
    <div class="commnunityTitle">
        <h2 style="color: #003E00;">꿈들의 모임</h2>
        <h4 style="margin-bottom: 40px;">자유롭게 의견을 나눠보세요.</h4>
    </div>

    <!--게시판테이블-->
    <div class="boardMain">
        <!--검색창-->
        <div class="boardSerchBig">
            <div class="boardSearch">
                <select class="selectBox" id="selectBox" style="width:13%;   border: 1px solid #000;  background-color: #fff;">
                    <option class="search_option" value="searchTitle">제목</option>
                    <option class="search_option" value="searchId">아이디</option>
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
                            <th class="t5" style="width: 100px">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    <!-- 
                        <tr class="boardTableList">
                            <td class="t1 listNotice">공지</td>
                            <td class="t2 listNotice text-left"><a href="#">공지</a></td>
                            <td class="t3">관리자</td>
                            <td class="t4">날짜</td>
                            <td class="t5">조회수</td>
                        </tr>
                        <tr class="boardTableList">
                            <td class="t1">1</td>
                            <td class="t2 text-left"><a href="/dreams/community/detail">드림즈 이번 포스트시즌</a></td>
                            <td class="t3">작성자</td>
                            <td class="t4">날짜</td>
                            <td class="t5">조회수</td>
                        </tr>
                         -->
                        <c:forEach items="${CommunityList }" var="CommunityList" >
	                        <tr class="boardTableList">
	                            <td class="t1"><c:out value="${CommunityList.commNo }"/></td>
	                            <td class="t2 text-left">
	                            	<a class="move" href="/dreams/community/detail?commNo=<c:out value='${CommunityList.commNo}'/>">
	                            		<c:out value="${CommunityList.commTitle }"/>
	                            	</a>
	                           	</td>
	                            <td class="t3"><c:out value="${CommunityList.memberId }"/></td>
	                            <td class="t4"><c:out value="${CommunityList.commDate }"/></td>
	                            <td class="t5"><c:out value="${CommunityList.commHit }"/></td>
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
                    <a href="/dreams/community/write">글쓰기</a>
                </div>
            </div>

            <!--페이지-->
            <div class="boardPageContainer">
                <div class="boardPage">
                    <!--jstl로 페이지가 5장 이상이 아닐때는 그냥 텍스트라는 조건을 주긴해야하지만 일단 그냥 넣는다.-->
                    <a href="/dreams/community">《</a>
                    <a href="#">〈</a>
                    <a href="#">1</a>
                    <a href="#">〉</a>
                    <a href="#">》</a>
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

    </div>
</div>

