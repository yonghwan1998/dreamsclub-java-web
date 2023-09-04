<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 커뮤니티 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">


<!--커뮤니티 수정하기-->
<div class="boardModifyMain">
    <div class="boardModifyTitle" style="text-align: center; font-weight: bold; color: #003E00;">
        <h3 style="margin-bottom: 40px;">커뮤니티 게시글 수정하기</h3>
    </div>
    <form action="<c:url value='/community/modify/add'/>" id="communityModify_input" method="POST" enctype="multipart/form-data">
    <div class="boardModifyContainer">
        <input type="hidden" id="communityWriter" name="memberId" value="${member.memberId }">
        <input type="hidden" name="commNo" value="${pageInfo.commNo }">
        <table class="baordModifyTable">
         <!--제목 입력-->
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" id="communityModifyTitle" name="commTitle"
                    	value="${pageInfo.commTitle }">
                </td>
            </tr>  
        <!--내용-->
            <tr>
                <th>내용</th>
                <td>
                    <textarea id="communityModifyContent" name="commCont" class="communityModifyContent"><c:out value="${pageInfo.commCont }"/></textarea>
                </td>
            </tr>
        <!--이미지 추가-->
            <!--<tr>
                <th>이미지 업로드</th>
                <td>
                    <div class="communityImgUpload">
                        <label for="communityModifyImg">이미지 업로드</label>
                        <input type="file" id="communityModifyImg" name="commImg" class="communityModifyImg"
                        	value="multpartFile">                           
                    </div>
                </td>
            </tr>-->
        </table>


        <!--작성 버튼(취소, 등록)-->
        <div class="communityWriteBtn">
            <a href=<c:url value="/community/detail?commNo=${pageInfo.commNo }"/>>취소</a>
            <a href="javascript:modify_form();">등록</a>
        </div>
    </div>
    </form>
</div>


<script type="text/javascript">


function modify_form(){
	if(document.getElementById("communityModifyTitle").value==''){
		alert("제목을 입력해주십시오.");
		return false;
	}
	if(document.getElementById("communityModifyContent").value==''){
		alert("내용을 입력해주십시오.");
		return false;
	}
	document.getElementById("communityModify_input").submit();
	alert("수정이 완료되었습니다.");
}



</script>
