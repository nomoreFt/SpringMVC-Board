<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
<h1>상품목록</h1>
<table border="1">
<tr>
<th>상품번호</th>
<th>상품종류</th>
<th>상품명</th>
<th>상품이미지</th>
<th>상품가격</th>
</tr>
<c:forEach var="product" items="${productList}">
<tr>
<td>
${product.product_num}
</td>
<td>
${product.product_kind}
</td>
<td>
${product.product_name}
</td>
<td>
<img src="${cp}/resources/images/${product.product_img}">
</td>
<td>
${product.product_price}
</td>
</tr>
</c:forEach>
</table>

</body>
</html>