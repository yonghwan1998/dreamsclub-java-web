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
                            <th class="t5" style="width: 100px">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="boardTableList">
                            <td class="t1 listNotice">공지</td>
                            <td class="t2 listNotice text-left"><a href="#">공지사항</a></td>
                            <td class="t3">관리자</td>
                            <td class="t4">날짜</td>
                            <td class="t5">조회수</td>
                        </tr>
                        <tr class="boardTableList">
                            <td class="t1">1</td>
                            <td class="t2 text-left"><a href="/dreams/notice/detail">드림즈-NC, 지역사회 발전 위해 힘 모은다</a></td>
                            <td class="t3">관리자</td>
                            <td class="t4">2023-08-05</td>
                            <td class="t5">조회수</td>
                        </tr>
                        <tr class="boardTableList">
                            <td class="t1">2</td>
                            <td class="t2 text-left"><a href="/dreams/notice/detail">365바른약속치과의원-드림즈, 2023시즌 스폰서십 체결</a></td>
                            <td class="t3">관리자</td>
                            <td class="t4">2023-08-07</td>
                            <td class="t5">조회수</td>
                        </tr>
                        <tr class="boardTableList">
                            <td class="t1">3</td>
                            <td class="t2 text-left"><a href="/dreams/notice/detail">본인확인 서비스 일시중단 안내(8월 8일 화요일 19시~20시)</a></td>
                            <td class="t3">관리자</td>
                            <td class="t4">2023-08-07</td>
                            <td class="t5">조회수</td>
                        </tr>
                        <tr class="boardTableList">
                            <td class="t1">4</td>
                            <td class="t2 text-left"><a href="/dreams/notice/detail">드림즈, 고성군야구협회와 함께하는 일일 야구교실 열어</a></td>
                            <td class="t3">관리자</td>
                            <td class="t4">2023-08-12</td>
                            <td class="t5">조회수</td>
                        </tr>
                        <tr class="boardTableList">
                            <td class="t1">5</td>
                            <td class="t2 text-left"><a href="/dreams/notice/detail">드림즈, '메모리얼 리노베이션'진행...구단 역사 창원드림즈파크에 새겨</a></td>
                            <td class="t3">관리자</td>
                            <td class="t4">2023-08-14</td>
                            <td class="t5">조회수</td>
                        </tr>
                    </tbody>
                </table>
            </div>




   					   <!--글쓰기 버튼-->
            
						<c:choose>

							<c:when test="${member.memberStatus == 9}">
								<div class="writeBtnContainer">
             						   <div class="boardWriteBtn" style="text-align: right;">
                						    <a href="/dreams/notice/write">등록</a>
                  							<a href="/dreams/notice/write">수정</a>
                    						<a href="/dreams/notice/write">삭제</a>
               						   </div>
       					        </div>
							</c:when>

						</c:choose>

            

            <!--페이지-->
            <div class="boardPageContainer">
                <div class="boardPage">
                    <!--jstl로 페이지가 5장 이상이 아닐때는 그냥 텍스트라는 조건을 주긴해야하지만 일단 그냥 넣는다.-->
                    <a href="/notice/main">《</a>
                    <a href="#">〈</a>
                    <a href="#">1</a>
                    <a href="#">〉</a>
                    <a href="#">》</a>
                </div>
            </div>
        </div>

    </div>
</div>