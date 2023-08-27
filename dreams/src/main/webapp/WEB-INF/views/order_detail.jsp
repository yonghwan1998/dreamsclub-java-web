<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 상세 정보</title>
</head>
<body>
    <%-- <h1>주문 상세 정보</h1>
    
    <table border="1">
        <tr>
            <th>상품명</th>
            <th>수량</th>
            <th>가격</th>
        </tr>
        <c:forEach items="${orderList}" var="order">
            <tr>
                <td>${order.productName}</td>
                <td>${order.quantity}</td>
                <td>${order.price}</td>
            </tr>
        </c:forEach>
    </table>
    
    <a href="${pageContext.request.contextPath }/orders">주문 목록으로 돌아가기</a> --%>
    
    
    <div class="col-12" style="padding-right: 0px;">
    	<table class="table table-striped table-hover text-center align-middle" style="margin-bottom: 0px;">
    		<thead>
    			<tr style="background-color: yellow">
    				<td><input type="checkbox"></td>
    				<td>주문번호</td>
    				<td>구매자</td>
    				<td>상품명</td>
    				<td>수량</td>
    			</tr>
    		</thead>
    	</table>
    </div>
    <div class="col-12" style="padding-right: 0px;">
    	<table class="table table-striped table-hover text-center align-middle" style="margin-bottom: 0px;">
    		<thead>
    			<tr style="background-color: yellow">
    				<td><input type="checkbox"></td>
    				<td>주문번호</td>
    				<td>구매자</td>
    				<td>상품명</td>
    				<td>수량</td>
    			</tr>
    		</thead>
    	</table>
    </div>
</body>
</html>
