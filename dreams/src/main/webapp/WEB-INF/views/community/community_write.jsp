<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 커뮤니티 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">

<!--커뮤니티 글쓰기-->
<form id="communityWrite_input" action="<c:url value='/community/write/add'/>" method="post" enctype="multipart/form-data">
<input type="hidden" id="communityWriter" name="memberId" value="${member.memberId }">
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
                    <input type="text" id="communityWriteTitle" name="commTitle" placeholder="제목을 입력해주세요." 
                    	value="${community.commTitle }">
                </td>
            </tr>  
        <!--내용-->
            <tr>
                <th>내용</th>
                <td>
                    <textarea id="communityWriteContent" name="commCont" class="communityWriteContent" placeholder="내용을 입력해주세요."
                    value="${community.commCont}"></textarea>
                </td>
            </tr>
        <!--이미지 추가-->
            <!--<tr>
                <th>이미지 업로드</th>
                <td>
                    <div class="communityImgUpload">
                        <label for="communityWriteImg">이미지 업로드</label>
                        <input type="file" id="communityWriteImg" name="commImg" class="communityWriteImg"
                        	value="multpartFile">                           
                    </div>
                </td>
            </tr>-->
        </table>

        <!--작성 버튼(취소, 등록)-->
        <div class="communityWriteBtn">
            <a href="<c:url value="/dreams/community"/>">취소</a>
            <a href="javascript:chk_form();">등록</a>
        </div>
    </div>
</div>
</form>

<script type="text/javascript">

function chk_form() {
	if(document.getElementById("communityWriteTitle").value==''){
		alert("제목을 입력해주십시오.");
		return false;
	}
	if(document.getElementById("communityWriteContent").value==''){
		alert("내용을 입력해주십시오.");
		return false;
	}
	document.getElementById('communityWrite_input').submit();
	  alert("게시글이 등록되었습니다.");
}


</script>
