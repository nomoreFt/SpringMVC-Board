<%@page import="com.or.petspital.shopping.DAO.ShoppingDAO"%>
<%@page import="com.or.petspital.shopping.vo.ShoppingVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
body {
	width: 1300px;
	margin: 0 auto;
}

.btn {
	border: none;
	color: white;
	padding: 14px 28px;
	font-size: 16px;
	cursor: pointer;
}

.s {
	background-color: #FFFF00;
	color: black;
	font-weight: bold;
}

.s:hover {
	background-color: #333333;
	color: white;
}

.b {
	background-color: #f44336;
	font-weight: bold;
}

.b:hover {
	background-color: #333333;
	color: white;
}

.ta1 td {
	font-size: 28px;
	font-weight: normal;
}

th, td {
	padding: 16px;
	text-align: center;
}

.btn2 {
	border-radius: 4px;
	background-color: #333333;
	border: none;
	color: white;
	text-align: center;
	font-size: 13px;
	padding: 13%;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	display: inline;
	width: 120px;
}

.btn3 {
	border-radius: 4px;
	background-color: #FFFF00;
	border: none;
	color: black;
	text-align: center;
	font-size: 17px;
	padding: 13%;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	display: inline;
	font-weight: bold;
	width: 120px;
}

#leftbanner {
	position: fixed;
	_position: absolute;
	_z-index: -1;
	width: 170px;
	overflow: hidden;
	left: 30px;
	top: 300px;
	background-color: transparent;
	margin: 0;
	padding: 0;
}

#leftbanner li {
	list-style-type: none;
}

#leftbanner img {
	width: 100px;
	height: 100px;
}

#floatdiv {
	position: fixed;
	_position: absolute;
	_z-index: -1;
	width: 170px;
	overflow: hidden;
	right: 0px;
	top: 300px;
	background-color: transparent;
	margin: 0;
	padding: 0;
}

#floatdiv ul {
	list-style: none;
	padding-left: 0px;
}

.text2 button {
	font-size: 40px;
	width: 66px;
	height: 56px;
}

.text1 {
	padding-left: 0px;
	padding-right: 0px;
}

.text1 input {
	font-size: 40px;
	font-weight: bold;
	width: 30px;
	height: 20px;
	width: 30px;
	text-align: center;
}

#totalPrice {
	height: 50px;
	font-size: 30px;
	font-weight: bold;
	width: 200px;
	color: red;
	width: 200px;
	text-align: right;
}

.itemgoods {
	border-top: 2px solid #333;
	border-bottom: 1px solid #cccccc;
	background: #f2f2f2;
	letter-spacing: -1px;
}

.itemgoods li.in {
	margin-top: 0;
	z-index: 20;
}

.itemgoods ul {
	float: none;
	width: 1200px;
	height: 52px;
	margin: 0 auto;
	padding: 0 335px 0 0;
	font-size: 0;
	-webkit-box-sizing: border-box;
}

.itemgoods li {
	float: left;
	position: relative;
	width: 25%;
	font-size: 12px;
	text-align: center;
	z-index: 10;
	list-style-type: none;
}

.itemgoods li a {
	display: block;
	margin: 0 0 0 -1px;
	padding: 12px 0 13px 0;
	color: #333333;
	font-size: 20px;
	font-weight: 400;
	border: 1px solid #cccccc;
	border-top: none;
	border-bottom: 1px solid #cccccc;
	background: #f2f2f2;
}

a {
	text-decoration: none;
}
</style>

<script>
	function fnMove(seq) {
		var offset = $("#div" + seq).offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	}

	function form_btn(n) {
		var text = document.getElementById("number"); // 폼 선택
		var text2 = document.getElementById("price").value;
		var totalPrice = document.getElementById("totalPrice");
		// 폼 값을 숫자열로 변환
		text_val = parseInt(text.value);
		text_val += n; // 계산
		text.value = text_val; // 계산된 값을 바꾼다

		if (text_val <= 0) {
			text.value = 1; // 만약 값이 0 이하면 1로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해   
		}
		totalPrice.value = text2 * text_val;
	}
<%--화폐단위 포매팅--%>
	
</script>


</head>
<body>



	<h1>상품 상세 페이지</h1>


	<div id="div1"></div>
	<table border="0" class="ta1">
		<tr>
			<td rowspan="6"><input type="hidden" id="price"
				value="${shoppingVo.product_price}"><img alt="사진 공간"
				src="${cp}/resources/image/${shoppingVo.product_img }"></td>
		</tr>
		<tr>
			<td style="padding-left: 50px;">상품 이름</td>
			<td colspan="3">${shoppingVo.product_name}</td>
		</tr>
		<tr>
			<td style="padding-left: 50px;">상품 가격</td>
			<td colspan="3">${shoppingVo.product_price}원</td>

		</tr>

		<tr>

			<td style="padding-left: 50px;">수량</td>

			<td class="text2" style="padding-right: 1px;"><button
					onclick="form_btn(-1)">-</button></td>
			<td class="text1"><input type="text" id="number" name="count"
				value="1" style="width: 80px; height: 50px;"></td>
			<td class="text2" style="padding-left: 1px;"><button
					onclick="form_btn(1)">+</button></td>


		</tr>

		<tr>
			<td>총 합계금액</td>
			<td colspan="3"><input type="text" id="totalPrice"
				readonly="readonly"> 원</td>

		</tr>

		<tr>
			<td colspan="5">
				<button class="btn s" style="width: 166px; height: 56px;">구매</button>
				<button class="btn b" style="width: 166px; height: 56px;">장바구니</button>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	<!-- ====================================================================================================== -->

	<div class="itemgoods">
		<ul>
			<li><a href=javascript:void(0); onclick="fnMove('1')">상세 소개</a></li>
			<li><a href=javascript:void(0); onclick="fnMove('2')">댓글 목록</a></li>
			<li><a href=javascript:void(0); onclick="fnMove('3')">배송/교환/반품</a></li>
		</ul>
	</div>




	<!-- ====================================================================================================== -->










	<div>
		<h2>상세 소개</h2>

		<c:forEach var="detailPicture" items="${list1 }">
			<img style="width: 70%;" alt="사진 공간"
				src="${cp}/resources/image/${detailPicture.d_img}">

		</c:forEach>
	</div>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<!-- ======================================================================================================= -->


	
	<div id="div2"></div>
	
	<div id="reply">
		<h2>댓글 목록</h2>
		<table border="2">
			<tr>
				<th>작성자 이름</th>
				<td>이름 넣는 자리입니다.</td>
				<th>날짜 넣는자리 입니다.</th>
			</tr>
			<tr>
				<th>댓글 내용</th>
				<td colspan="4">여기는 댓글 	 자리 입니다.</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" value="댓글 내용 적는 자리 입니다."></td>
				<td><button>추가</button>
					<button>삭제</button></td>
			</tr>
		</table>
	</div>
	
	<hr>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>

	<div id="div3"></div>
	<h4>배송안내</h4>
	-업체가 지정한 택배사(업체별 상이)
	<br> -배송기간 결제 완료 후 2일 ~ 7일(주문 제작 상품의 경우 더 소요될 수 있습니다.)
	<br> -조건부 무료배송(업체별 상이)
	<br> -도서 산간지역의 경우 별도의 추가 운임료가 부과될 수 있습니다.
	<br> -일요일 및 법정 공휴일은 출고되지 않습니다.
	<br> -군부대는 배송이 불가합니다.
	<br> -구매 상품의 각 업체가 다를 경우 업체별 배송 정책이 적용됩니다.
	<br>
	<h4>교환&반품 불가 안내</h4>
	-수령하신 날짜로부터 7일이 지난 경우
	<br> -제품을 개봉하거나 사용 또는 훼손,취급 부주의로 파손,고장,오염으로 인해 제품의 가치를 떨어뜨려 재품의
	가치를 떨어뜨려 재판매가 불가능한 경우
	<br> -슬링백,이동장,의류의 경우 개봉 및 시박 후에는 단순변심으로 반품 또는 교환이 불가능 합니다.
	<br> -개별적으로 주문제작되는 상품으로 재판매가 불가능한 경우(이니셜 표시 상품,사이즈 맞춤 상품등)
	<br> -복제가 가능한 상품등의 포장을 훼손한 경우


	<br>
	<br>
	<br>
	<br>
	<br>


	<div id="leftbanner">
		<ul>
			<li><img alt="사진 공간" src="${cp }/resources/image/leftbanner.jpg"></li>
			<li><img alt="사진 공간"
				src="${cp }/resources/image/leftbanner2.jpg"></li>
			<li><img alt="사진 공간"
				src="${cp }/resources/image/leftbanner3.jpg"></li>
			<li><img alt="사진 공간"
				src="${cp }/resources/image/leftbanner4.jpg"></li>
		</ul>


	</div>


	<div id="floatdiv">
		<ul>
			<li><a class="btn2" href="#" style="font-size: 25px"> Top </a></li>
			<br>
			<li><button class="btn3" onclick="fnMove('1')">상세소개</button></li>
			<li><button class="btn3" onclick="fnMove('2')">댓글목록</button></li>
			<li><button class="btn3" onclick="fnMove('3')">배송안내</button></li>

		</ul>
	</div>
</body>
</html>