<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- 커뮤니티 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/community.css">

<!--전체(글+댓글)-->
<div class="communityDetail">
    <!--글제목+내용+목록으로-->
    <div class="communityDetailWrtten">
        <!--글 경로 (커뮤니티 > 꿈들의 모임)-->
        <div class="communityDetailPath">
            <h5>커뮤니티  >  꿈들의 모임</h5>
        </div>

        <!--글 컨테이너-->
        <div class="communityDetailContainer">
               <!--글 제목-->
               <div class="headwrap">
                	<div class="pageNo" style="width: 5%;"><c:out value="${pageInfo.commNo }"/></div>
                   <div class="title" style="width: 65%;"><strong><c:out value="${pageInfo.commTitle }"/></strong></div>
                   <div class="writer" style="width: 15%; text-align: right;">작성자 : <c:out value="${pageInfo.memberId }"/></div>
                   <div class="wrtieDate" style="width: 15%; text-align: right;">작성일자 : <c:out value="${pageInfo.commDate }"/></div>
               </div>
   
               <!--글 내용-->
               <div class="communityDetailContainerBody" style="white-space: pre;"><c:out value="${pageInfo.commCont}"/></div>
        </div>

            <!--버튼-->
            <div class="communityDetailBtn">
            	<a href=<c:url value="/community"/>>목록으로</a>
                	<c:if test="${member.memberId == pageInfo.memberId }" > <!-- 로그인세션 아이디와 글쓴 유저의 아이디가 같다면 수정하기와 삭제하기 버튼이 보임 -->
                		<a href=<c:url value="/community/modify?commNo=${pageInfo.commNo }"/> role="button" id="modify_btn">수정하기</a>
						<a href="#" role="button" id="delete_btn" onclick="deleteCheck()">삭제하기</a>   
					</c:if>
			</div>

            
           	<form id="infoForm" action=<c:url value="/community/detail"/> method="get">
				<input type="hidden" id="commNo" name="commNo" value='<c:out value="${pageInfo.commNo}"/>'>
			</form>
    </div>
    
    <!--[댓글]-->

    <!--댓글 입력폼-->
    <form id="communityReplyFrom" name=register> 
        <div class="communityReply">
            <div class="onekan" >
	            <input type="hidden" id="memberId" value="${member.memberId }">
	            <!--댓글 입력칸-->
	            <textarea class="communityReplyText" id="commReCont" name="commReCont"></textarea>
				<div class="count_btn">
		            <!--글자수 카운팅(최대 300자로 이거 나중에 메소드 걸어주기)-->
		            <!-- <div id="commentCount"><strong>0자</strong></div><div>/400자</div> -->
		            <span id="textLengthCheck">(0/300자)</span>
		            <!--댓글 입력 버튼-->
		            <div><button type="button" class="onekanBtn" id="addBtn" >댓글쓰기</button></div>
	            </div>
        	</div>
        </div>
    </form>
    <div>
        <div class="communityReplyCount">
            <!-- ((여기에 개수 세는 기능 넣어야함)) -->
            <strong style="color: green;"><c:out value="${pageInfo.replyCount }"/>개</strong>의 댓글이 등록되었습니다.
        </div>
    	<div id="replyList"></div>
	</div>
</div>


<!-- JS -->
<script type="text/javascript">

/*삭제 확인하기 - 김예지(2023.08.25)*/
function deleteCheck(){
   if(confirm("정말 삭제하시겠습니까?")==true){
      location.href="<c:url value='/community/delete?commNo=${pageInfo.commNo}'/> ";
      alert("삭제되었습니다.");
   }else if(confirm==false){
      alert("취소되었습니다.");
   }
}



/*댓글 출력 - 김예지(2023.09.14)*/
/* 글쓴 유저의 memberId, 내용(commReCont), 작성날짜(commReDate)만 사용자 화면에 출력됨.
 * 가장 오래된 것이 맨위에 가장 최근 댓글이 아래로 붙어나가며 출력된다.
 */
function replyDisplay() {
	$.ajax({
		type: "get",
		url: "<c:url value="/reply/list"/>/"+${pageInfo.commNo },
		dataType: "json",
		success: function(result) {

			var html="";
			$(result).each(function() {
				html+="<div class='commentList' style='border-top: none' id='commReNo"+this.commReNo+"'>";
				html+="<div style='display: flex;'>";
				html+="<p><strong>"+this.memberId+"</strong></p>";
				html+="<p class='commentList_date'>"+this.commReDate+"</p>";
				html+="</div>";
				html+="<p class='txt'>"+this.commReCont+"</p>";
				html+="<div style='display: flex;'>";
					//html+="<p><a href='#' class='commentReRely'>답글</a></p>";
				//세션에서 불러온 로그인된 memberId와 댓글 글쓴이의 memberId가 같다면 수정과 삭제 버튼이 나타남.
				if("${member.memberId}"==this.memberId){
					//수정 버튼을 눌렀을때 여기서 입력된 commReNo, memberId, commReDate, commReCont 값이 수정폼으로 가기위해 버튼 안에 변수값을 넣어 가져가도록함)
					//삭제 버튼을 눌렀을때 여기서 입력된 commReNo가 있어야 mapper의 조건문의 조건을 맞출 수 있기 때문에 변수 값을 가져감.
					html+="<p><a href='#' class='commentReRely' id='modify_reply_btn' onclick='UpdateCommentBtn(" + this.commReNo + ", \"" + this.memberId + "\", \"" + this.commReDate + "\",  \"" + this.commReCont + "\")'>수정</a></p>";
					html+="<p><a href='#' class='commentReRely' id='delete_reply_btn' onclick='delete_reply("+this.commReNo+")'>삭제</a></p>";
				}
				html+="</div>";
				html+="</div>";
			});
			//위의 HTMLdml id="replyList"의 자리에 댓글목록이 아래로 출력된다.
			$("#replyList").html(html);
		},
		error: function(xhr) {
			alert("에러 = "+xhr.status);
		}
	});
}

replyDisplay();


/*댓글 등록 - 김예지(2023.09.14)*/
/* 댓글 등록 폼에서 addBtn(확인)버튼을 누르면 memberId, commReCont, 값을 받아온 commNo까지 모두 JSON 형식의 데이타로 변환하여 등록됨
 */
$("#addBtn").click(function() {
	var writer=$("#memberId").val();
	
	var content=$("#commReCont").val();
	if(content == "") {
		alert("댓글 내용을 입력해 주세요.");
		return;
	}
	$("#content").val("");
	$.ajax({
		type: "post",
		url: "<c:url value='/reply/register'/>",
		contentType: "application/json",
 		data: JSON.stringify({"memberId": writer, "commReCont": content, "commNo": ${pageInfo.commNo}}),
		
		dataType: "text",
		success: function(result) {
			if(result=="success") {
				//댓글 입력 성공시 댓글 목록으로 바로 댓글이 입력됨
				replyDisplay();
				//댓글을 쓴 후 댓글 창에 기입한 텍스트가 사라지도록 함
				$("#commReCont").val("");
			}
		},
		error: function(xhr) {
			//alert("에러 = "+xhr.status);
			alert("로그인이 필요한 서비스입니다.");
		}
	});
});


/*댓글 삭제 - 김예지(2023.9.15)*/
function delete_reply(commReNo){

	if(!confirm("정말 삭제하시겠습니까?")){
		return false;
	}
	//삭제 ajax
	$.ajax({
		type: "delete",
		url: "<c:url value='/reply/delete/"+commReNo+"'/>",
		dataType:"text",
		success: function(result){

			if(result=="success"){
				replyDisplay();		//성공시 댓글목록 바로 출력
			}
		},
		error: function(xhr){
			alert("에러="+xhr.status);
		}
	});
}



/*댓글 수정 - 김예지(2023.09.18)*/
/*댓글 수정 폼  
 * 폼만바꾸면 되는거라서 ajax 안씀. 댓글 출력 목록에서 내용만 textarea태그로 바꿔서 내용을 수정하게 만들어줌.
 * 매개변수로 commReNo, memberId, commReDate, commReCont를 받아옴. 
 * 수정 버튼 클릭시 updateBtn() 메소드 시작되어 수정하는 ajax 작동함.
 */
function UpdateCommentBtn(commReNo, memberId, commReDate, commReCont){
	var html="";
	html+="<div class='commentList' style='border-top: none' id='commReNo"+commReNo+"'>";
	html+="<div style='display: flex;'>";
	html+="<p><strong>"+memberId+"</strong></p>";
	html+="<p class='commentList_date'>"+commReDate+"</p>";
	html+="</div>";
	//id='commReCont"+commReNo+"'는 내용의 넘버를 같이 id명으로 지정해서 수정 버튼 중복 작동하는 일이 없도록 만듦
	html+="<p><textarea class='form-control' name='commReCont2' id='commReCont"+commReNo+"' style='max-height: 100px; max-width: 1000px;'>"+commReCont+"</textarea></p>";
	html+="<span id='textLengthCheck2" + commReNo + "'>(" + commReCont.length + "/300자)</span>"
	html+="<div style='display: flex;'>";
		//html+="<p><a href='#' class='commentReRely'>답글</a></p>";
	html+="<button type='button' onclick='updateBtn("+commReNo+",\""+memberId+"\")'>저장</button>"
	html+="<button type='button' onclick='replyDisplay()'>취소</button>";
	html+="</div>";
	html+="</div>";
	
	//id='commReCont"+commReNo+"'의 textarea의 값이 변수 html의 값으로 대체됨
	$("#commReNo"+commReNo).replaceWith(html);
	$("#commReCont"+commReNo).focus();	//수정폼 열릴때 textarea로 포커스 맞춤
	
	//수정시 textarea에 있는 글자수 실시간 카운팅
    $("#commReCont" + commReNo).on("input", function () {
        updateTextLength(commReNo);
    });
}


//댓글 수정 버튼시 작동하는 ajax
function updateBtn(commReNo, memberId){
	
	var replyContent = $("#commReCont"+commReNo).val(); //수정폼의 textarea값 읽어오기
	
	$.ajax({
		url: "<c:url value='/reply/update'/>",
		type: "PUT",
		contentType : "application/json",
		data: JSON.stringify({"commReCont": replyContent, "commReNo": commReNo, }),
		dataType: "text",
		success: function(result){
			console.log(result);
			replyDisplay();	//수정완료시 댓글목록 출력
		},
		error: function(xhr) {
			console.log("에러="+xhr.status);
		}
	});
}





/*댓글 글자수 카운트*/
 
/*//아래 코드는 jQuery를 사용한 댓글 글자수 카운트 예제
$("#commReCont").keyup(function (e){
	console.log("키업!");
	var content = $(this).val();
	$("#textLengthCheck").html("("+content.length +"/300자)"); //실시간 글자수 카운팅(최대300자)
	if(content.length > 300){
		alert("최대 300자까지 입력 가능합니다.");
		$(this).val(content.substring(0, 300));
		$("#textLengthCheck").html("(300/300자)");
	}
});
*/

// jQuery를 사용하지 않고 순수 JavaScript를 사용하여 댓글 글자 수를 셀 수 있는 코드 예제
document.getElementById("commReCont").addEventListener("input", function () {
    console.log("키업!");
    var content = this.value;
    var textLengthCheck = document.getElementById("textLengthCheck");
    textLengthCheck.textContent = "(" + content.length + "/300자)"; // 실시간 글자수 카운팅(최대300자)
    if (content.length > 300) {
        alert("최대 300자까지 입력 가능합니다.");
        this.value = content.substring(0, 300);
        textLengthCheck.textContent = "(300/300자)";
    }
});



//댓글 수정시 댓글 수 카운트
function updateTextLength(commReNo) {
    var textarea = $("#commReCont" + commReNo);
    var lengthSpan = $("#textLengthCheck2" + commReNo);
    var currentLength = textarea.val().length;
    lengthSpan.text("(" + currentLength + "/300자)");
    
    //300자 이상 입력될 경우 경고창이 뜨고 300자로 제한됨.
    if (currentLength > 300) {
        alert("최대 300자까지 입력 가능합니다.");
        textarea.val(textarea.val().substring(0,300));
        lengthSpan.text("(300/300자)");
    }
}

</script>