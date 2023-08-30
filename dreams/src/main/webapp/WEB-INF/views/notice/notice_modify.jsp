<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 커뮤니티 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">


<form action="/notice/write" method="post">

<!--공지사항 글쓰기-->
<div class="boardWriteMain">
    <div class="boardWriteTitle" style="text-align: center; font-weight: bold; color: #003E00;">
        <h3 style="margin-bottom: 40px;">공지사항 글쓰기</h3>
    </div>
    
    <div class="boardWriteContainer">
        <table class="baordWriteTable">
            <!--제목 입력-->
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" id="noticeWriteTitle" name="title" placeholder="제목을 입력해주세요.">
                </td>
            </tr>      
        <!--내용-->
            <tr>
                <th>내용</th>
                <td>
                    <textarea id="noticeWriteContent" name="content" class="noticeWriteContent" placeholder="내용을 입력해주세요."></textarea>
                </td>
            </tr>
        </table>

        <!--작성 버튼(취소, 등록)-->
        <div class="communityWriteBtn">
            <a href="/dreams/notice">취소</a>
            <a href="/dreams/notice" class="upload">등록</a>
        </div>
    </div>
</div>
</form>