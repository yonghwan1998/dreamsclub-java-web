<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>    
    #qnaReWriteContent 
    {width: 400px; height: 200px; /* 내용 */}
    
 /*  등록 및 취소 버튼 꾸미기 */
    .qnaReWriteBtn button, .qnaReWriteBtn a { /* 버튼 및 a태그 꾸미기 */
    display: inline-block; /* 링크를 블록 요소로 변환하여 버튼처럼 표시 */
    padding: 10px 20px; /* 내부 여백 설정 */
    background-color: #64BE5B; /* 버튼 배경색 */
    color: #fff; /* 버튼 텍스트 색상 */
    text-decoration: none; /* 밑줄 제거 */
    border: none; /* 테두리 제거 */
    cursor: pointer; /* 커서 모양을 포인터로 변경하여 클릭 가능하게 함 */
    }
</style>



<!-- 9/22 오진서 / 문의 답변하기-->
<form action="<c:url value='/goods/rewrite/add'/>" method="post"> <!-- 제출시 이동됨 -->
	
	<div class="boardReWriteMain">
	    <div class="boardReWriteTitle" style="text-align: center; font-weight: bold; color: #003E00;">
	        <h3 style="margin-bottom: 40px; margin-right: 800px;">문의답변</h3>

	    </div>
	    
	    <div class="boardReWriteContainer">
	        <table class="baordReWriteTable">

	            
	       	 	<!--내용-->
	            <tr>
	                <th>내용</th>
	                <td>
	                    <textarea id="qnaReWriteContent" name="qnaReCont" class="qnaReWriteContent" placeholder="내용을 입력해주세요." value="${pageInfo.qnaReCont}"></textarea>
	                </td>
	            </tr>
	                        		
				
	        </table>
	        <input type="hidden" name="qnaNo" value="${qnaNo }">
	        
	         <!--작성 버튼(등록, 취소) -->
	        <div class="qnaReWriteBtn" style= "margin-left: 200px;">
	            <button type="submit">등록</button>
	            <!-- <a href="<c:url value="/goods/main"/>">취소</a> --> <!-- **굿즈 코드 넣어서 현페이지 어케함????-->  
	            <a href="<c:url value="/goods/main"/>">취소</a> <!-- **굿즈 코드 넣어서 현페이지 어케함????-->
	        </div>  
	        
	    </div>
	</div>
</form>


