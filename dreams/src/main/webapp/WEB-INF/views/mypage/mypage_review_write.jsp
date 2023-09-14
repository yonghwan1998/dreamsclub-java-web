<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
A:link {
	color: #333333;
	font-family: "돋움", "굴림";
	font-size: 12px;
	text-decoration: none;
}

A:visited {
	color: #333333;
	font-family: "돋움", "굴림";
	font-size: 12px;
	text-decoration: none;
}

A:active {
	color: #333333;
	font-family: "돋움", "굴림";
	font-size: 12px;
	text-decoration: none;
}

A:hover {
	color: #BEA12C;
	font-family: "돋움", "굴림";
	font-size: 12px;
	text-decoration: underline;
}

A.user:link {
	color: #333333;
	font-family: "돋움", "굴림";
	font-size: 12px;
	text-decoration: underline;
}

A.user:visited {
	color: #333333;
	font-family: "돋움", "굴림";
	font-size: 12px;
	text-decoration: underline;
}

A.user:active {
	color: #333333;
	font-family: "돋움", "굴림";
	font-size: 12px;
	text-decoration: underline;
}

td {
	font-family: 돋움;
	font-size: 12px;
	color: #333333;
	line-height: 18px;
}

.title {
	font-family: 돋움;
	font-size: 12pt;
	color: #000000;
	line-height: 22px;
}

/* Form css */
.text {
	font-family: 돋움;
	font-size: 8pt;
	color: #333333;
}

.textarea {
	font-family: 돋움;
	font-size: 8pt;
	color: #333333;
}

.password {
	font-family: 돋움;
	font-size: 8pt;
	color: #333333;
}

.file {
	font-family: 돋움;
	font-size: 8pt;
	color: #333333;
}

.select {
	font-family: 돋움;
	font-size: 8pt;
	color: #333333;
}
</style>

<script>
	function ReviewCreate() {
		f.action = "<c:url value="/mypage/review/write"/>";
		f.submit();
	}
</script>
<table width=780 border=0 cellpadding=0 cellspacing=0>
	<tr>
		<td width="20"></td>
		<td style="color: red;">${message }</td>
	</tr>

	<tr>
		<td width="20"></td>
		<td>
			<table width=590 border=0 cellpadding=0 cellspacing=0>
				<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>리뷰 등록</b></td>
				</tr>
			</table> <br>

			<form name="/mypage/mypage_check" method="post" enctype="multipart/form-data">
				<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="22">구매 상품</td>
						<td colspan="4" bgcolor="ffffff" style="padding-left: 10px;">${order.goodsCode }</td>
					</tr>
					<!-- 강민경(2023/09/11): 리뷰 별점  -->
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="22">별점</td>
						<td colspan="4" bgcolor="ffffff" style="padding-left: 10px;">
						<!-- value 부분이 저장할 테이블에 컬럼명을 적는건지 아니면 가져올 정보에 대한 테이블의 컬럼명을 적는건지 -->
							<input type="text" style="width: 150" name="goodsName" value="${review.goodsStar }">
						</td>
					</tr>
					<!-- 강민경(2023/09/11): 리뷰 내용  -->
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="22">리뷰 내용</td>
						<td colspan="4" bgcolor="ffffff" style="padding-left: 10px;">
							<input type="text" style="width: 150" name="goodsPrice" value="${review.Cont }">
						</td>
					</tr>
					<!-- 강민경(2023/09/11): 리뷰 사진  -->
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="22">리뷰 사진</td>
						<td colspan="4" bgcolor="ffffff" style="padding-left: 10px;">
							<input type="file" style="width: 240" name="uploadImage" value="${review.revImg }">
						</td>
					</tr>
				</table>
			</form> <br>
			<table width=590 border=0 cellpadding=0 cellspacing=0>
				<tr>
					<td align=center>
						<input type="submit" value="리뷰등록" onClick=" ReviewCreate();">
					</td>
				</tr>
				<tr>
					<td align=center>
					<a href="<c:url value="/mypage/mypage_check"/>">뒤로 가기</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>