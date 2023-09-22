<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<style>
.communityDetailContainerBody {
   word-wrap: break-word; /* 단어가 너무 길 경우 줄바꿈 */
   white-space: pre-line; /* whitespace를 보존하면서 줄바꿈 가능 */
}
</style>

<body>

   <div class="communityDetail">

      <!-- 공지사항 경로 -->
      <div class="communityDetailPath">
         <h5>Dreams > 공지사항</h5>
      </div>

      <!-- 공지사항 제목 및 내용 -->
      <div class="communityDetailContainer">
         <div class="headwrap">
            <div class="pageNo" style="width: 5%;">
               <c:out value="${pageInfo.noticeNo }" />
            </div>
            <div class="title" style="width: 65%;">
               <strong>${pageInfo.noticeTitle }"</strong>
            </div>
            <div class="writer" style="width: 15%; text-align: right;">작성자: 드림즈 관리자
            </div>
            <div class="writeDate" style="width: 15%; text-align: right;">작성일자 : <c:out value="${pageInfo.noticeDate }" />
            </div>
         </div>
         <div class="communityDetailContainerBody">${fn:trim(pageInfo.noticeCont)}
         </div>
      </div>

      <!-- 목록, 삭제 버튼 -->
      <div class="communityDetailBtn">
         <a href="/dreams/notice">목록으로</a>

         <c:if test="${member.memberStatus == 9}">
            <a href="/dreams/notice/modify?noticeNo=${pageInfo.noticeNo}" role="button" id="modify_btn">수정하기</a>
            <a href="/dreams/notice/delete?noticeNo=${pageInfo.noticeNo}" role="button" id="delete_btn">삭제하기</a>
         </c:if>
      </div>


      <form id="infoForm" action="/dreams/notice/detail" method="get">
         <input type="hidden" id="noticeNo" name="noticeNo" value='<c:out value="${pageInfo.noticeNo}"/>'>
      </form>

   </div>

</body>
</html>