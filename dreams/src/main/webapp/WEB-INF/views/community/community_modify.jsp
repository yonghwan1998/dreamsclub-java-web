<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 커뮤니티 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">
	
<!-- 썸머노트- 게시판 에디터(김예지:2023.09.19) -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


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
                    <textarea id="myEditor" name="commCont"><c:out value="${pageInfo.commCont }"/></textarea>
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
			<a href="#" role="button" id="cancle_btn" name="cancle_btn" onclick="cancleCheck()">취소</a>   
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
	if(document.getElementById("myEditor").value==''){
		alert("내용을 입력해주십시오.");
		return false;
	}
	document.getElementById("communityModify_input").submit();
	alert("수정완료되었습니다.");
}

//수정 취소 확인하기
function cancleCheck(){
   if(confirm("정말 취소하시겠습니까?")==true){
      location.href="<c:url value='/community/detail?commNo=${pageInfo.commNo }'/> ";
      alert("취소되었습니다.");
   }else if(confirm==false){
   }
}


//썸머노트 API
$('#myEditor').summernote({
    lang: 'ko-KR',
    height: 300,
    placeholder: '내용을 입력하세요',
    toolbar: [
        ['fontname', ['fontname']],
        ['fontsize', ['fontsize']],
        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
        ['color', ['forecolor', 'color']],
        ['table', ['table']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['insert', ['picture', 'link']],
        ['view', ['help']]
      ],
      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체',
        '굴림', '돋음체', '바탕체'],
      fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36',
        '50', '72']
   
    
});




</script>
