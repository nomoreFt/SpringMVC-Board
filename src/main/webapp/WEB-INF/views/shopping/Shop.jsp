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
		var text = document.getElementById("number"); // �� ����
		var text2 = document.getElementById("price").value;
		var totalPrice = document.getElementById("totalPrice");
		// �� ���� ���ڿ��� ��ȯ
		text_val = parseInt(text.value);
		text_val += n; // ���
		text.value = text_val; // ���� ���� �ٲ۴�

		if (text_val <= 0) {
			text.value = 1; // ���� ���� 0 ���ϸ� 1�� �ǵ����ش�, 1���� ���� ���� ��Ÿ���� �ʰ��ϱ� ����   
		}
		totalPrice.value = text2 * text_val;
	}
<%--ȭ����� ������--%>
	
</script>


</head>
<body>



	<h1>��ǰ �� ������</h1>


	<div id="div1"></div>
	<table border="0" class="ta1">
		<tr>
			<td rowspan="6"><input type="hidden" id="price"
				value="${shoppingVo.product_price}"><img alt="���� ����"
				src="${cp}/resources/image/${shoppingVo.product_img }"></td>
		</tr>
		<tr>
			<td style="padding-left: 50px;">��ǰ �̸�</td>
			<td colspan="3">${shoppingVo.product_name}</td>
		</tr>
		<tr>
			<td style="padding-left: 50px;">��ǰ ����</td>
			<td colspan="3">${shoppingVo.product_price}��</td>

		</tr>

		<tr>

			<td style="padding-left: 50px;">����</td>

			<td class="text2" style="padding-right: 1px;"><button
					onclick="form_btn(-1)">-</button></td>
			<td class="text1"><input type="text" id="number" name="count"
				value="1" style="width: 80px; height: 50px;"></td>
			<td class="text2" style="padding-left: 1px;"><button
					onclick="form_btn(1)">+</button></td>


		</tr>

		<tr>
			<td>�� �հ�ݾ�</td>
			<td colspan="3"><input type="text" id="totalPrice"
				readonly="readonly"> ��</td>

		</tr>

		<tr>
			<td colspan="5">
				<button class="btn s" style="width: 166px; height: 56px;">����</button>
				<button class="btn b" style="width: 166px; height: 56px;">��ٱ���</button>
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
			<li><a href=javascript:void(0); onclick="fnMove('1')">�� �Ұ�</a></li>
			<li><a href=javascript:void(0); onclick="fnMove('2')">��� ���</a></li>
			<li><a href=javascript:void(0); onclick="fnMove('3')">���/��ȯ/��ǰ</a></li>
		</ul>
	</div>




	<!-- ====================================================================================================== -->










	<div>
		<h2>�� �Ұ�</h2>

		<c:forEach var="detailPicture" items="${list1 }">
			<img style="width: 70%;" alt="���� ����"
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
		<h2>��� ���</h2>
		<table border="2">
			<tr>
				<th>�ۼ��� �̸�</th>
				<td>�̸� �ִ� �ڸ��Դϴ�.</td>
				<th>��¥ �ִ��ڸ� �Դϴ�.</th>
			</tr>
			<tr>
				<th>��� ����</th>
				<td colspan="4">����� ��� 	 �ڸ� �Դϴ�.</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" value="��� ���� ���� �ڸ� �Դϴ�."></td>
				<td><button>�߰�</button>
					<button>����</button></td>
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
	<h4>��۾ȳ�</h4>
	-��ü�� ������ �ù��(��ü�� ����)
	<br> -��۱Ⱓ ���� �Ϸ� �� 2�� ~ 7��(�ֹ� ���� ��ǰ�� ��� �� �ҿ�� �� �ֽ��ϴ�.)
	<br> -���Ǻ� ������(��ü�� ����)
	<br> -���� �갣������ ��� ������ �߰� ���ӷᰡ �ΰ��� �� �ֽ��ϴ�.
	<br> -�Ͽ��� �� ���� �������� ������ �ʽ��ϴ�.
	<br> -���δ�� ����� �Ұ��մϴ�.
	<br> -���� ��ǰ�� �� ��ü�� �ٸ� ��� ��ü�� ��� ��å�� ����˴ϴ�.
	<br>
	<h4>��ȯ&��ǰ �Ұ� �ȳ�</h4>
	-�����Ͻ� ��¥�κ��� 7���� ���� ���
	<br> -��ǰ�� �����ϰų� ��� �Ǵ� �Ѽ�,��� �����Ƿ� �ļ�,����,�������� ���� ��ǰ�� ��ġ�� ����߷� ��ǰ��
	��ġ�� ����߷� ���ǸŰ� �Ұ����� ���
	<br> -������,�̵���,�Ƿ��� ��� ���� �� �ù� �Ŀ��� �ܼ��������� ��ǰ �Ǵ� ��ȯ�� �Ұ��� �մϴ�.
	<br> -���������� �ֹ����۵Ǵ� ��ǰ���� ���ǸŰ� �Ұ����� ���(�̴ϼ� ǥ�� ��ǰ,������ ���� ��ǰ��)
	<br> -������ ������ ��ǰ���� ������ �Ѽ��� ���


	<br>
	<br>
	<br>
	<br>
	<br>


	<div id="leftbanner">
		<ul>
			<li><img alt="���� ����" src="${cp }/resources/image/leftbanner.jpg"></li>
			<li><img alt="���� ����"
				src="${cp }/resources/image/leftbanner2.jpg"></li>
			<li><img alt="���� ����"
				src="${cp }/resources/image/leftbanner3.jpg"></li>
			<li><img alt="���� ����"
				src="${cp }/resources/image/leftbanner4.jpg"></li>
		</ul>


	</div>


	<div id="floatdiv">
		<ul>
			<li><a class="btn2" href="#" style="font-size: 25px"> Top </a></li>
			<br>
			<li><button class="btn3" onclick="fnMove('1')">�󼼼Ұ�</button></li>
			<li><button class="btn3" onclick="fnMove('2')">��۸��</button></li>
			<li><button class="btn3" onclick="fnMove('3')">��۾ȳ�</button></li>

		</ul>
	</div>
</body>
</html>