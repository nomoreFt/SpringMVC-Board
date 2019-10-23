<%@page import="com.or.petspital.reserve.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	Calendar cal = Calendar.getInstance();

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	Calendar firstday = Calendar.getInstance();
	firstday.set(Calendar.YEAR , year);
	firstday.set(Calendar.MONTH , month);
	firstday.set(Calendar.DAY_OF_MONTH , 1);
	int week = firstday.get(Calendar.DAY_OF_WEEK);
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<style type="text/css">
	
	table{
		width: 500px;
		height: 500px;
		border-color:#3333FF;
	}
	
	tr{
		height: 40px;
	}
	
	td{
            width: 50px;
            height: 50px;
            text-align: center;
            font-size: 20px;
            font-family: 굴림;
            border:2px border-color:#3333FF;
            border-radius: 8px;/*모서리 둥글게*/
    }
	
</style>

<script type="text/javascript">
	
	function res(year, month, j){
		
		var today = new Date();
		
		if(today.getDate() > j){
			alert("날짜를 다시 선택해주세요");
		}else{
			document.form1.res_date.value = year+"-"+month+"-"+j;
		}
	}
	
 	function check(id){
	    if(!document.form1.res_date.value){
	        alert("날짜를 선택하세요.");
	        return false;
	    }
	} 
	

	

	
</script>

</head>
<body>
<%@ include file="/WEB-INF/views/header/head.jsp" %>
    <p></p>
    <h1 align="center">10월 예약 OPEN</h1>
    <h3 align="center">예약 날짜를 선택하세요.</h3>
	<table id="calendar" border="3" align="center">
	    <tr>
	        <td align="center" id="tbCalendarYM" colspan="7"><%=year %>년 <%=month+1 %>월</td>
	    </tr>
	    <tr>
	        <td align="center"><font color ="#F79DC2">일</td>
	        <td align="center">월</td>
	        <td align="center">화</td>
	        <td align="center">수</td>
	        <td align="center">목</td>
	        <td align="center">금</td>
	        <td align="center"><font color ="skyblue">토</td>
	    </tr>
		<tr>
			<%
			
				for(int i = 1; i < week; i++){
			%>
				<td>&nbsp;</td>
			<%
				}
			%>
			<%
				for(int j = 1; j <= endDay; j++){
					week++;
					if(week % 7 == 2){
			%>	
		</tr>
		<tr>
			<%		} %>
			
			
			<%		if(week %7 ==1){ %>
						<td onclick="javascript:res(<%=year%>,<%=month+1%>,<%=j%>)", style=color:blue; align="center"><%=j%></td>
			<%		}else if(week %7 ==2){%>
						<td onclick="javascript:res(<%=year%>,<%=month+1%>,<%=j%>)", style=color:red; align="center"><%=j%></td>
			<%		}else{ %>
						<td onclick="javascript:res(<%=year%>,<%=month+1%>,<%=j%>)", style=color:black; align="center"><%=j%></td>
			<%		}
			
				}%>
		</tr>
	</table>
	<p>&nbsp;</p>
	<div align="center">
	<form name="form1" id="form1" action="${cp}/reserve/reserveDateOk">
		<input type="text" name="res_date" readonly="readonly">
		<input type="submit" value="다음" onclick="return check()">
	</form>
	</div>
<%@ include file="/WEB-INF/views/footer/foot.jsp" %>	
</body>
</html>	
</body>
</html>