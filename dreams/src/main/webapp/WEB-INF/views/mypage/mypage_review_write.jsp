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
/* 별점 관련 css
#review fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#review fieldset legend{
    text-align: right;
}
#review input[type=radio]{
    display: none;
}
#review label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#review label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#review label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#review input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
*/
</style>


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

			<form name="review" id="review" method="post">
				<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="22">구매 상품</td>
						<td colspan="4" bgcolor="ffffff" style="padding-left: 10px;">
							<input type ="text" style="width: 150" name="goodsCode" value="${goods.goodsCode }" readonly="readonly" >
						</td>
					</tr>
					<!-- 강민경(2023/09/11): 리뷰 별점  -->
					<tr>
					<!--
						<fieldset>
							<span class="text-bold">별점을 선택해주세요</span>
							<input type="radio" name="reviewStar" value="5" id="rate1"><label
								for="rate1">★</label>
							<input type="radio" name="reviewStar" value="4" id="rate2"><label
								for="rate2">★</label>
							<input type="radio" name="reviewStar" value="3" id="rate3"><label
								for="rate3">★</label>
							<input type="radio" name="reviewStar" value="2" id="rate4"><label
								for="rate4">★</label>
							<input type="radio" name="reviewStar" value="1" id="rate5"><label
								for="rate5">★</label>
						</fieldset>
						-->
						
						<td width=100 align=center bgcolor="E6ECDE" height="22">별점</td>
						<td colspan="4" bgcolor="ffffff" style="padding-left: 10px;">
							<input type="text" style="width: 150" name="goodsStar" value="5">
						</td>
						</td>
					
					</tr>
					<!-- 강민경(2023/09/11): 리뷰 내용  -->
					<tr>
						<!-- 
						<div>
							<textarea class="col-auto form-control" type="text" id="reviewContents" name="revCont"
									  placeholder="좋은 수강평을 남겨주시면 Cocolo에 큰 힘이 됩니다! 포인트 5000p도 지급!!"></textarea>
						</div>
						-->
						<td width=100 align=center bgcolor="E6ECDE" height="22">리뷰 내용</td>
						<td colspan="4" bgcolor="ffffff" style="padding-left: 10px;">
							<input type="text" style="width: 150" name="revCont" value="넘예뻐여 ">
						</td>
						 
					</tr>
					<!-- 강민경(2023/09/11): 리뷰 사진  -->
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="22">리뷰 사진</td>
						<td colspan="4" bgcolor="ffffff" style="padding-left: 10px;">
							<input type="file" style="width: 240" name="revImg" value="">
						</td>
					</tr>
				<tr>
					<td align=center>
						<button type="button" onClick="review_writer();"><span>리뷰 등록</span></button>
					</td>
				</tr>
				</table>
			</form> <br>
			<table width=590 border=0 cellpadding=0 cellspacing=0>
				<tr>
					<td align=center>
					<a href="<c:url value="/mypage/mypage_check"/>">뒤로 가기</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<script>
		
	
	function review_writer() {
		
		if(review.goodsStar.value == ""){
			alert("별점을 선택해 주세요.");
			review.goodsStar.focus();
			return;
		}
		if(review.revCont.value == ""){
			alert("구매후기를 입력해 주세요.");
			review.revCont.focus();
			return;
		}
		
		alert("상품 후기가 등록되었습니다.");
		review.action = "<c:url value="/mypage/review/write"/>";
		review.submit();
	}
</script>