<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    #qnaWriteTitle 
    {width: 400px; /* 제목 */}
    
    #qnaWriteContent 
    {width: 400px; height: 200px; /* 내용 */}
    
 /*  등록 및 취소 버튼 꾸미기 */
    .qnaWriteBtn button, .qnaWriteBtn a { /* 버튼 및 a태그 꾸미기 */
    display: inline-block; /* 링크를 블록 요소로 변환하여 버튼처럼 표시 */
    padding: 10px 20px; /* 내부 여백 설정 */
    background-color: #64BE5B; /* 버튼 배경색 */
    color: #fff; /* 버튼 텍스트 색상 */
    text-decoration: none; /* 밑줄 제거 */
    border: none; /* 테두리 제거 */
    cursor: pointer; /* 커서 모양을 포인터로 변경하여 클릭 가능하게 함 */
    }
</style>



<!--문의하기-->
<form id="qnaForm" action="<c:url value='/goods/write/add'/>" method="post"> <!-- 제출시 이동됨 -->
   <input type="hidden" name="memberId" value="${member.memberId }">
   <input type="hidden" name="goodsCode" value="${goodsCode }"> 
   <!-- <input type="hidden" name="goodsCode" value="${goodsCode }">  --> <!-- 원본 -->
   
   <div class="boardWriteMain">
       <div class="boardWriteTitle" style="text-align: center; font-weight: bold; color: #003E00;">
           <h3 style="margin-bottom: 40px; margin-right: 20rem;">문의하기</h3>

       </div>
       
       <div class="boardWriteContainer">
           <table class="baordWriteTable">
               <!--제목 입력-->
               <tr>
                   <th>제목</th>
                   <td>
                       <input type="text" id="qnaWriteTitle" name="qnaTitle" placeholder="제목을 입력해주세요." value="${pageInfo.qnaTitle }">
                   </td>
               </tr>
               
                 <!--내용-->
               <tr>
                   <th>내용</th>
                   <td>
                       <textarea id="qnaWriteContent" name="qnaCont" class="qnaWriteContent" placeholder="내용을 입력해주세요.">${pageInfo.qnaCont}</textarea>
                   </td>
               </tr>
                           
               <!-- 굿즈 사이즈 -->
               <tr>
               <th>굿즈 사이즈</th>
               <td colspan="4" bgcolor="ffffff" style="padding-left: 10px;">
                  <select name="goodsSize">
                     <option value="0" selected>사이즈를 선택해주세요.</option>
                     <option value="L">L</option>   
                     <option value="M">M</option>
                     <option value="S">S</option>
                     <option value="F">F</option>
                  </select>
               </td>
            </tr>      
            
           </table>
           
           <!-- 비밀글 여부 --> 
           <!--  구현못함 잠드소서
              <p style="margin-top: 1rem;">
            <input id = "secretYn" name="qnaStatus"  type = "checkbox"  value= "${pagrInfo.qnaStatus}"  style="transform: scale(0.8); 
                    position: relative; left: 3rem; height: 30px;">
                <label for="secretYn" style="position: relative; left: 26rem; 
                    bottom: 2rem; font-size: 15px;">비밀글</label>
           <p>
            -->
           
           
            <!--작성 버튼(등록, 취소) -->
           <div class="qnaWriteBtn" style= "margin-left: 200px;">
               <button type="submit">등록</button>
               <a href="javascript:void(0);" onclick="closePopup();">취소</a>
           </div>  
           
       </div>
   </div>
</form>

<script>

    // 팝업 창 닫기 함수
    function closePopup() {
        window.close(); 
    }

</script>

