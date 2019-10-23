<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.or.petspital.product.vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.Form{
	margin-left:30%;
	margin-right:30%
	
	/* position: static; */
}
#TextArea{
	display: block;
	clear: both;
	margin-left : 10%
	margin-bottom : 30px;
	text-align: center;
	font-size: 18px;
	font-weight: 400;
	color: #999;
	letter-spacing: -0.03em;

}

.table{
	/* padding-left : 20%; */
	font-family: 함초롬돋움,NanumGothic,돋움,Dotum;
	 float: center;
	 width: 730px;
}

.line{
	margin-bottom: 5%;
}

.btn{
	background-color : black;
	width: 300px;
	height: 50px;
	font-family: 함초롬돋움,NanumGothic,돋움,Dotum;
	color: white;
	border-radius: 8px;
	font-size: 18px;
	margin-top: 20px;
	margin-bottom: 10px;
	margin-left: 30%;
}
#sang_img{
	width: 150px;
	height: 150px;
}
table.table {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : 20px 10px;
 
  
}
table.table th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: center;
    text-align : center;
    align-content : center;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.table td {
    width: 30px;
    padding: 10px;
    vertical-align: center;
    text-align:center;
    border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
<div class="Form">
		<div id="TextArea">
<h1>장바구니</h1>
</div>
<hr>

<% request.setCharacterEncoding("UTF-8"); %>

<%HttpSession sess = request.getSession();
Map<String,ProductVO> map = (Map<String,ProductVO>)sess.getAttribute("map");%>

<table class="table">
<tr>
<th></th>
<th>상품명</th>
<th>종류</th>
<th>가격</th>
<th>수량</th>
<th>합계</th>
</tr>


<%for(Map.Entry<String,ProductVO> entry : map.entrySet()){ %>
<%-- ${error} --%>
<tr>
<td  style=" width:400px;height:200px"><img src="${cp}/resources/image/<%=entry.getValue().getProduct_name() %>"  style="width: 100%;height: 200px;"></td>
<td><%=entry.getValue().getProduct_img()%></td>
						<td><%=entry.getValue().getProduct_kind() %></td>
						<td><%=entry.getValue().getProduct_price() %></td>
						<td><%=entry.getValue().getProduct_count() %></td>
						<td><%=Integer.parseInt(entry.getValue().getProduct_price()) * Integer.parseInt(entry.getValue().getProduct_count())%></td>
						</tr>
						
											
<%
}
%>
</table>
<div style="margin-left:36%">
<a href="${cp}/product/cartRemove">[장바구니삭제]</a>
<a href="${cp}/shopping/ShoppingList">[쇼핑하러가기]</a>
</div>
</body>
</html>