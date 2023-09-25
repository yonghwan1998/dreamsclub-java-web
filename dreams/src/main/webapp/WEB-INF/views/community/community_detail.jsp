<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>


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
					<%-- (김예지 2023.09.25) - 네이버 혹은 카카오로 로그인 했을 경우 아이디가 맨첫글자부터 10번째 글자까지 출력됨 --%>
					<div class="writer" style="width: 15%; text-align: right;">작성자 :
						<c:if test="${fn:startsWith(pageInfo.memberId, 'naver') || fn:startsWith(pageInfo.memberId, 'kakao')}">
        					<c:set var="trimmedMemberId" value="${fn:substring(pageInfo.memberId, 0, 10)}" />
        					<c:out value="${trimmedMemberId}"/>
    					</c:if>
						<c:if test="${!fn:startsWith(pageInfo.memberId, 'naver') && !fn:startsWith(pageInfo.memberId, 'kakao')}">
							<c:out value="${pageInfo.memberId}" />
    					</c:if>
					</div>
					<div class="wrtieDate" style="width: 15%; text-align: right;">작성일자 : <c:out value="${pageInfo.commDate }"/></div>
               </div>
   
               <!--글 내용-->
				<!--  <div class="communityDetailContainerBody" style="white-space: pre;"><c:out value="${pageInfo.commCont}"/></div>-->
                <div class="communityDetailContainerBody" style="white-space: pre;">${pageInfo.commCont}</div>
                
                <!-- 좋아요 - 김예지(2023.09.24) -->
                <div style="text-align: center;">
                	<div>
		                <c:choose>
			                <%-- 로그인 상태일때 - 하트가 클릭되게 --%>
		                	<c:when test="${not empty member }">
		                		<c:choose>
		                			<c:when test="${empty likeNo }">
		                				<%-- 까만하트일때 --%>
			                			<span>
			                			<a id="${pageInfo.commNo }" href="javascript:" class="heart-click heart_icon${pageInfo.commNo }" 
			                				data-liked="false" data-member="${member.memberId}">
			                				<i class="fa-sharp fa-regular fa-thumbs-up fa-2x" style="color: black; " id="bi-suit-heart"></i>
			                			</a>
			                			</span>
		                			</c:when>
				                	<c:otherwise>
				                		<%-- 빨간 하트일때 --%>
				                		<span>
				                			<a id="${pageInfo.commNo }" href="javascript:" class="heart-click heart_icon${pageInfo.commNo }" 
				                				data-liked="true" data-member="${member.memberId}">
				                				 <i class="fa-sharp fa-regular fa-thumbs-up fa-2x" style="color: #ff0000;" id="bi-suit-heart-fill"></i>               			
				                			</a>
				                		</span>
				                	</c:otherwise>
		                		</c:choose>
		                	</c:when>
		                	<%-- 로그인 상태가 아닐때 - 하트 클릭 안되도록 --%>
		                	<c:otherwise>
		                		<span>
			                		추천 기능은 <a href=<c:url value="/login"/> type="button" id="newLogin" class="newLoginBtn">로그인</a> 후 사용 가능합니다.<br>
		                			<a href="javascript:" class="heart-notlogin">
		                				<i class="fa-sharp fa-regular fa-thumbs-up fa-2x" style="color: black; " class="bi bi-suit-heart"></i>
		                			</a>
		                		</span><br />
		                	</c:otherwise>
		                </c:choose>
	                </div>
	                <div>
	                	<span id="likeCount${pageInfo.commNo }"><c:out value="${pageInfo.likeCount }"/></span>
	                </div>
                </div>
               

            <!--목록으로, 수정, 취소 버튼-->
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
    
   	<!-- [댓글] -->
   	<!--댓글 입력폼-->
    <form id="communityReplyFrom" name=register> 
        <div class="communityReply">
            <div class="onekan" >
	            <input type="hidden" id="memberId" value="${member.memberId }">
	            <!--댓글 입력칸-->
	            <textarea class="communityReplyText" id="commReCont" name="commReCont"></textarea>
				<div class="count_btn">
		            <!--글자수 카운팅(최대 300자)-->
		            <span id="textLengthCheck">(0/300자)</span>
		            <!--댓글 입력 버튼-->
		            <div><button type="button" class="onekanBtn" id="addBtn" >댓글쓰기</button></div>
	            </div>
        	</div>
        </div>
    </form>
    <div>
        <div class="communityReplyCount" id="replyCount${pageInfo.commNo }">
            <!-- 댓글 수 카운팅 -->
            <strong style="color: green;"><c:out value="${pageInfo.replyCount }"/></strong>개의 댓글이 등록되었습니다.
        </div>
    	<div id="replyList"></div>
	</div>
</div>
</div>


<!-- JS -->
<script type="text/javascript">

/*페이지 로드시 실행될 것들 - 김예지(2023.09.22)*/
//좋아요 로드 추가(김예지 2023.09.24)
$(document).ready(function() {
	replyDisplay(); //댓글 리스트 출력
	//좋아요 상태 확인 출력 - 모든 하트 아이콘을 반복
    $(".heart-click").each(function () {
        let $heart = $(this);
        let commNo = $heart.attr("id");
        let memberId = $heart.data('member');
        let likeStatusKey = "likeStatus_" + commNo + "_" + memberId;
        
        //로컬 스토리지에서 좋아요 상태를 가져옴
        let isLiked = localStorage.getItem(likeStatusKey) === "true";
        
        //좋아요 아이콘 상태를 업데이트함
        if (isLiked) {
            $heart.data("liked", true);
            $heart.html('<i class="fa-sharp fa-regular fa-thumbs-up fa-2x" style="color: #ff0000;" id="bi-suit-heart-fill"></i>');
        } else {
            $heart.data("liked", false);
            $heart.html('<i class="fa-sharp fa-regular fa-thumbs-up fa-2x" style="color: black;" id="bi-suit-heart"></i>');
        }
    });
});



/*김예지(2023.08.25) - 삭제 확인하기 */
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
 * 가장 오래된 것이 맨위에 위치하고 가장 최근 댓글이 그 아래로 붙어나가며 출력된다.
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
				html+="<p><strong>"
				
				//김예지(2023.09.25) - 댓글 작성아이디가 naver, kakao로 로그인된 아이디라면 10번째 글자까지만 출력
				if(this.memberId.startsWith("naver")||this.memberId.startsWith("kakao")){
					html+=this.memberId.substring(0,10)+"</strong></p>";
				} else{
					html+=this.memberId
				}

				html+="</strong></p>";
				html+="<p class='commentList_date'>"+this.commReDate+"</p>";
				html+="</div>";
				html+="<p class='txt'>"+this.commReCont+"</p>";
				html+="<div style='display: flex;'>";
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
			
			//댓글 개수 업데이트 (result가 댓글의 배열이라고 가정)
			var commentCount = result.length;
			// 동적으로 ID를 설정합니다.
            var replyCountElement = $("#replyCount${pageInfo.commNo} strong");
            replyCountElement.attr("id", "replyCountValue");
            replyCountElement.text(commentCount);
		},
		error: function(xhr) {
			alert("에러 = "+xhr.status);
		}
	});
}

//초기에 replyDisplay() 함수호출
replyDisplay();


/*김예지(2023.09.14) - 댓글 등록 */
//댓글 등록 폼에서 addBtn(확인)버튼을 누르면 memberId, commReCont, 값을 받아온 commNo까지 모두 JSON 형식의 데이타로 변환하여 등록됨

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
				//김예지(2023.09.17 추가) - 댓글 쓴 후 카운팅 숫자 0으로 되돌아가기
	            $("#textLengthCheck").text("(0/300)");
			}
		},
		error: function(xhr) {
			//alert("에러 = "+xhr.status);
			alert("로그인이 필요한 서비스입니다.");
		}
	});
});


/*김예지(2023.9.15) - 댓글 삭제*/
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
				
				//댓글 개수 업데이트 (result가 댓글의 배열이라고 가정)
				var commentCount = result.length;
				// 동적으로 ID를 설정합니다.
	            var replyCountElement = $("#replyCount${pageInfo.commNo} strong");
	            replyCountElement.attr("id", "replyCountValue");
	            replyCountElement.text(commentCount);
			}
		},
		error: function(xhr){
			alert("에러="+xhr.status);
		}
	});
}



/*김예지(2023.09.18) - 댓글 수정*/
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
	html+="<button type='button' onclick='updateBtn("+commReNo+",\""+memberId+"\")'>저장</button>"
	html+="<button type='button' onclick='replyDisplay()'>취소</button>";
	html+="</div>";
	html+="</div>";
	
	//id='commReCont"+commReNo+"'의 textarea의 값이 변수 html의 값으로 대체됨
	$("#commReNo"+commReNo).replaceWith(html);
	$("#commReCont"+commReNo).focus();	//수정폼 열릴때 textarea로 포커스 맞춤
	
	//김예지(2023.09.18) - 수정시 textarea에 있는 글자수 실시간 카운팅
    $("#commReCont" + commReNo).on("input", function () {
        updateTextLength(commReNo);
    });
}


//김예지(2023.09.18) - 댓글 수정 버튼시 작동하는 ajax
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





/*김예지(2023.09.17) - 댓글 글자수 카운트*/
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



/*김예지(2023.09.18) - 댓글 수정시 댓글 수 카운트*/
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



/*김예지(2023.09.24) - 좋아요 하트 색깔 바꾸기*/ 
//로그인 한 상태에서 따봉을 클릭했을 때 (로그인한 상태인 하트의 <a></a> class명: heart-click)
$(".heart-click").click(function() {
	
	let liked = $(this).data("liked");  //data-liked 속성에서 초기 좋아요 상태를 가져옴
    let commNo = $(this).attr('id'); // 게시물 번호(commNo)를 id로 전달받아 저장
    let memberId = $(this).data('member'); //세션에 담겨진 memberId를 가져오기위해 data-member 속성에서 초기 좋아요 상태를 가져옴
    console.log("heart-click"); //클릭 확인
    
 	//commNo와 memberId를 결합하여 로컬 스토리지에 고유한 키를 만들기
    let likeStatusKey = "likeStatus_" + commNo + "_" + memberId;
    
 	//좋아요 수를 나타내는 요소에 대한 참조
    let likeCountElement = $("#likeCount" + commNo);
    
 	// 검은따봉을 눌렀을때
 	if(liked == false){
    //if ($(this).children('i').attr('id') == "bi-suit-heart") {
    	console.log("검은따봉 클릭" + commNo + memberId);
    	
    	//게시판의 좋아요 개수를 즉시 업데이트
    	let likeCount = parseInt(likeCountElement.text())+1;
    	likeCountElement.text(likeCount); 
    	
    	//좋아요 작업처리
    	$.ajax({
            url : "<c:url value='/like/saveHeart.do'/>",
            type : 'get',
            data : {
            	"commNo" : commNo, 
            	"memberId" : memberId,
            },
            success : function(cto) {
			
                //let likeCount = cto.likeCount;
                //likeCountElement.text(likeCount); // 좋아요 수를 즉시 업데이트

                console.log("따봉추가 성공");
            },
            error : function(xhr) {
            	alert("에러: " + xhr);
            }
        });
    	console.log("빨간 따봉으로 바껴라!");
    	
    	
    	 $(this).html('<i class="fa-sharp fa-regular fa-thumbs-up fa-2x" style="color: #ff0000;" id="bi-suit-heart-fill"></i> ');
    	 //$('.heart_icon'+commNo).html('<i class="fa-sharp fa-regular fa-thumbs-up fa-2x" style="color: #ff0000;" id="bi-suit-heart-fill"></i> ');
    	 
    	// data-liked 속성을 true로 업데이트함.
         $(this).data("liked", true);
    	
      	// 로컬 스토리지를 업데이트하여 좋아요 상태를 반영합니다.
        localStorage.setItem(likeStatusKey, "true");
    	
    // 빨간 따봉을 눌렀을 때
    //} else if($(this).children('i').attr('id') == "bi-suit-heart-fill"){
    } else{
        console.log("빨간따봉 클릭" + commNo + memberId);
        
    	//게시판의 좋아요 개수를 즉시 업데이트
        let likeCount = parseInt(likeCountElement.text())-1;
    	likeCountElement.text(likeCount);
        
        //좋아요 취소 작업 처리
        $.ajax({
            url : "<c:url value='/like/removeHeart.do'/>",
            type : 'get',
            data : {
            	"commNo" : commNo, 
            	"memberId" : memberId,
            },
            success : function(cto) {

                //let likeCount = cto.likeCount;
                //likeCountElement.text(likeCount); // 좋아요 수를 즉시 업데이트
                
                console.log("따봉삭제 성공");
            },
            error : function(error) {
            	alert("에러: " + error.responseText);
            }
        });
        console.log("검정 따봉으로 바껴라!");    
        
        
        $(this).html('<i class="fa-sharp fa-regular fa-thumbs-up fa-2x" style="color: black; " id="bi-suit-heart"></i>');
       // $('.heart_icon'+commNo).html('<i class="fa-sharp fa-regular fa-thumbs-up fa-2x" style="color: black; " id="bi-suit-heart"></i>');
        
    	// data-liked 속성을 false로 업데이트함.
        $(this).data("liked", false);
    	
        // 로컬 스토리지를 업데이트하여 좋아요 취소 상태를 반영
        localStorage.removeItem(likeStatusKey);
	}
});

//로그인 안한 상태에서 좋아요를 클릭하면 로그인해야한다는 알림창이 뜹니다.
//(로그인한 상태인 하트의 <a></a> class명: heart-notlogin)
$(".heart-notlogin").unbind('click');
$(".heart-notlogin ").click(function() {
 alert('로그인 하셔야 좋아요를 누를수 있습니다!');
});


</script>