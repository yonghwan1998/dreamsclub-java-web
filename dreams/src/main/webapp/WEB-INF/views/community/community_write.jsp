<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Flone - Minimal eCommerce HTML Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/img/favicon.png">
    <!-- 커뮤니티 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">
</head>
<body>

<form action="/community/write" method="post">
<!--커뮤니티 글쓰기-->
<div class="boardWriteMain">
    <div class="boardWriteTitle" style="text-align: center; font-weight: bold; color: #003E00;">
        <h3 style="margin-bottom: 40px;">커뮤니티 글쓰기</h3>
    </div>
    
    <div class="boardWriteContainer">
        <table class="baordWriteTable">
            <!--제목 입력-->
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" id="communityWriteTitle" name="comm_title" placeholder="제목을 입력해주세요.">
                </td>
            </tr>      
        <!--내용-->
            <tr>
                <th>내용</th>
                <td>
                    <textarea id="communityWriteContent" name="comm_cont" class="communityWriteContent" placeholder="내용을 입력해주세요."></textarea>
                </td>
            </tr>
        <!--이미지 추가-->
            <tr>
                <th>이미지 업로드</th>
                <td>
                    <div class="communityImgUpload">
                        <label for="communityWriteImg">이미지 업로드</label>
                        <input type="file" id="communityWriteImg" name="comm_img" class="communityWriteImg">                           
                    </div>
                </td>
            </tr>
        </table>

        <!--작성 버튼(취소, 등록)-->
        <div class="communityWriteBtn">
            <a href="/dreams/community">취소</a>
            <a href="/dreams/community" class="upload">등록</a>
        </div>
    </div>
</div>
</form>

</body>
</html>