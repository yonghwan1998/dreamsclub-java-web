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
<!--커뮤니티 글쓰기-->
<div class="boardWriteMain">
    <div class="boardWriteTitle" style="text-align: center; font-weight: bold; color: #003E00;">
        <h3 style="margin-bottom: 40px;">커뮤니티 글쓰기</h3>
    </div>
    
    <form id="communityWrite_input" action="<c:url value='/community/write/add'/>" method="post" enctype="multipart/form-data"/>
    <div class="boardWriteContainer">
        <table class="baordWriteTable">
            <!--제목 입력-->
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" id="communityWriteTitle" name="comm_title" placeholder="제목을 입력해주세요." 
                    	value="${community.commTitle }">
                </td>
            </tr>  
            <!-- 작성자 -->   
            <tr>
                <th>작성자</th>
                <td>
                    <input type="text" id="communityWriter" name="member_id" 
                    	value="${member.memberId }" readonly="readonly" placeholder=" 입력해주세요.">
                </td>
            </tr>    
        <!--내용-->
            <tr>
                <th>내용</th>
                <td>
                    <textarea id="communityWriteContent" name="comm_cont" class="communityWriteContent" placeholder="내용을 입력해주세요."
                    value="${community.commCont}"></textarea>
                </td>
            </tr>
        <!--이미지 추가-->
            <tr>
                <th>이미지 업로드</th>
                <td>
                    <div class="communityImgUpload">
                        <label for="communityWriteImg">이미지 업로드</label>
                        <input type="file" id="communityWriteImg" name="comm_img" class="communityWriteImg"
                        	value="multpartFile">                           
                    </div>
                </td>
            </tr>
        </table>

        <!--작성 버튼(취소, 등록)-->
        <div class="communityWriteBtn">
            <a href="/dreams/community">취소</a>
            <button type="submit" class="upload" value="등록" onclick="chk_form()">등록</button>
        </div>
    </div>
</div>
</form>

<script type="text/javascript">

funtion chk_form(){
if(document.getElementById("comm_title").value==''){
	alert("제목을 입력해주십시오.");
	return false;
}
if(document.getElementById("comm_cont").value==''){
	alert("내용을 입력해주십시오.");
	return false;
}
document.getElementById('communityWrite_input').submit();
}


</script>

</body>
</html>