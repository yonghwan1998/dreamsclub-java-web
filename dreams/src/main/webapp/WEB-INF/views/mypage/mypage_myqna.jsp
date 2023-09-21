<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 QnA</title>
<style>
body {
   font-family: Arial, sans-serif;
   padding: 20px;
   background-color: #f4f4f4;
}

h1 {
   text-align: center;
   margin-bottom: 50px;
}

table {
   width: 100%;
   max-width: 1300px;
   margin: 0 auto;
   border-collapse: collapse;
}

table, th, td {
   border: 1px solid #dddddd;
}

th, td {
   padding: 12px 15px;
   text-align: left;
   text-align: center;  
}

thead {
   background-color: #f2f2f2;
}

tr:hover {
   background-color: #f5f5f5;
}

a {
   text-decoration: none;
   color: #333;
}

a:hover {
   text-decoration: underline;
}

/* th와 td의 첫 번째 칸 (문의번호) 너비 지정 */
table th:nth-child(1),
table td:nth-child(1) {
    width: 100px;
}

/* th와 td의 두 번째 칸 (제목) 너비 지정 */
table th:nth-child(2),
table td:nth-child(2) {
    width: 300px;
}

/* th와 td의 세 번째 칸 (내용) 너비 지정 */
table th:nth-child(3),
table td:nth-child(3) {
    width: 400px;
}

</style>
</head>
<body>
   <h1>나의 QnA</h1>
   <table>
      <thead>
         <tr>

            <th>문의번호</th>

            <th>제목</th>
            <th>내용</th>

            <th>상품코드</th>
            <th>문의 날짜</th>
            <th>답변 여부</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${qnaList}" var="qna">
            <tr>
               <td>${qna.qnaNo}</td>
               <td class="qnaTitle">${qna.qnaTitle}</td>
               <td class="qnaCont">${qna.qnaCont}</td>




               <td>${qna.goodsCode}</td>
               <td>${qna.qnaDate}</td>
               <td><c:choose>
                     <c:when test="${qna.qnaYn == 'Y'}">답변 완료</c:when>
                     <c:otherwise>답변 준비중</c:otherwise>
                  </c:choose></td>
            </tr>
         </c:forEach>
      </tbody>
   </table>
</body>
</html>