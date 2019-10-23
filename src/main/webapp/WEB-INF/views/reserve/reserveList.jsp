<%@page import="com.or.petspital.reserve.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>예약이 완료되었습니다.</h3>
	<h4><a href="${cp}/reserve/reserveList">[나의 예약 내역 보기]</a></h4>
	
	<table border="1" width="500">
		<tr>
			<th>날짜</th>
			<th>시간</th>
			<th>메모</th>
		</tr>
		
		<c:forEach var="reserveVo" items="${reserveList}">
		<tr>
			<td>${reserveVo.res_date}</td>
			<td><a href="${cp}/reserve/reserveMemo?res_num=${reserveVo.res_num}">${reserveVo.res_time}</a></td>
			<td>${reserveVo.res_memo}</td>
		</tr>
		</c:forEach>
	</table>
	
	<h4><a href="${cp}/reserve/reserveDateForm">[새로운 예약 하러가기]</a></h4>
	
</body>
</html>