<%@page import="com.or.petspital.shopping.controller.ShoppingController"%>
<%@page import="com.or.petspital.shopping.vo.ShoppingVO"%>
<%@page import="java.util.List"%>
<%@page import="com.or.petspital.shopping.DAO.ShoppingDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	background-color: #f1f1f1;
	padding: 20px;
	font-family: Arial;
}

.btn.active {
	background-color: #666;
	color: white;
}

.btn:hover {
	background-color: #ddd;
}

.btn {
	border: none;
	outline: none;
	padding: 12px 16px;
	background-color: white;
	cursor: pointer;
}

.column {
	float: left;
	width: 33.33%;
	display: none; /* Hide all elements by default */
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.content {
	background-color: white;
	padding: 10px;
}

.show {
	display: block;
}

.row {
	margin: 10px -16px;
}

.row, .row>.column {
	padding: 8px;
}

h1 {
	font-size: 50px;
	word-break: break-all;
}

a:link {
	text-decoration: none;
	color: #333333;
}

a:visited {
	text-decoration: none;
	color: #333333;
}

a:active {
	text-decoration: none;
	color: #333333;
}

a:hover {
	text-decoration: underline;
	color: red;
}
</style>

</head>
<body>

	<h1>쇼핑리스트</h1>
	<div id="myBtnContainer">
		<button class="btn active" onclick="filterSelection('all')">
			전체 목록</button>
		<button class="btn" onclick="filterSelection('feed')">사료</button>
		<button class="btn" onclick="filterSelection('snack')">간식</button>
		<button class="btn" onclick="filterSelection('fashion')">패션/의류</button>
		<button class="btn" onclick="filterSelection('beauty')">
			미용/목욕</button>
	</div>



	<div class="row">
		<c:forEach var="amugona" items="${list}">
			<div class="column ${amugona.product_kind}">

				<a
					href="${cp}/shopping/Shop?product_img=${amugona.product_img}&product_name=${amugona.product_name}&product_kind=${amugona.product_kind }&product_price=${amugona.product_price}&product_num=${amugona.product_num}">
					<div class="content">
						<img src="${cp}/resources/image/${amugona.product_img}"
							alt="사진 공간" style="width: 100%; height: 250px;">
						<h4>${amugona.product_name}</h4>
						<p>${amugona.product_kind }</p>
						<p>${amugona.product_price}원</p>
					</div>
				</a>

			</div>
		</c:forEach>
	</div>





	<script type="text/javascript">
		filterSelection("all")
		function filterSelection(c) {
			var x, i;
			x = document.getElementsByClassName("column");
			if (c == "all")
				c = "";
			for (i = 0; i < x.length; i++) {
				w3RemoveClass(x[i], "show");
				if (x[i].className.indexOf(c) > -1)
					w3AddClass(x[i], "show");
			}
		}

		function w3AddClass(element, name) {
			var i, arr1, arr2;
			arr1 = element.className.split(" ");
			arr2 = name.split(" ");
			for (i = 0; i < arr2.length; i++) {
				if (arr1.indexOf(arr2[i]) == -1) {
					element.className += " " + arr2[i];
				}
			}
		}

		function w3RemoveClass(element, name) {
			var i, arr1, arr2;
			arr1 = element.className.split(" ");
			arr2 = name.split(" ");
			for (i = 0; i < arr2.length; i++) {
				while (arr1.indexOf(arr2[i]) > -1) {
					arr1.splice(arr1.indexOf(arr2[i]), 1);
				}
			}
			element.className = arr1.join(" ");
		}

		// Add active class to the current button (highlight it)
		var btnContainer = document.getElementById("myBtnContainer");
		var btns = btnContainer.getElementsByClassName("btn");
		for (var i = 0; i < btns.length; i++) {
			btns[i].addEventListener("click", function() {
				var current = document.getElementsByClassName("active");
				current[0].className = current[0].className.replace(" active",
						"");
				this.className += " active";
			});
		}
	</script>


</body>
</html>