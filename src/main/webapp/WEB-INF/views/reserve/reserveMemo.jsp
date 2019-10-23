<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	
	function check(){
		
		var result = confirm("예약을 취소하시겠습니까?");
		
		if(result){
			delete_check();	    
		}else{
		   
		}
	}
	
/* 	swal({
		  title: "예약을 취소하시겠습니까?",
		  text: "예약취소는 예약 전일까지만 가능합니다! 예약 당일 취소를 원하실 경우, 병원으로 전화해주세요 :-)",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		    swal("예약이 취소되었습니다!", {
		      icon: "success",
		    });
		  } else {
		  }
		}); */
	
	
	function delete_check() {
		
		var res_num = $("#res_num").val();
		var res_date = $("#res_date").val();
		
		console.log("delete_check() 실행 "+res_num+"/"+res_date);
		
		$.ajax({
			url : 'delete_check?res_num='+res_num+'&res_date='+res_date,
			type : 'get',
			success : function(data) {
								
				if (data == 0) { //예약취소불가능
					alert("예약취소는 전일까지만 가능합니다!");
				
				} else{ //예약취소 성공
					alert("취소되었습니다!");
					location.href="reserveList";
				}
		
			}, error : function(jqXHR, error) {
					console.log("Error "+error);
				}
		});
	};
	
</script>

</head>
<body>
	<form action="${cp}/reserve/memoUpdate">
		<table border="1">
			<tr>
				<th>작성자</th>
				<th>예약날짜</th>
				<th>예약시간</th>		
			</tr>
			<tr>
				<td><input type="text" name="res_id" value="${reserveMemo.res_id}" readonly="readonly"></td>
				<td><input type="text" name="res_date" id="res_date" value="${reserveMemo.res_date}" readonly="readonly"></td>
				<td><input type="text" name="res_time" value="${reserveMemo.res_time}" readonly="readonly"></td>	
			</tr>
		</table>
		<table border="1">
			<tr>
				<th>메모</th>
			</tr>
			<tr>
				<td><textarea rows="10" cols="50" name="res_memo">${reserveMemo.res_memo}</textarea></td>
			</tr>
		</table>
		<input type="hidden" name="res_num" id="res_num" value="${reserveMemo.res_num}">
		<input type="submit" value="[메모수정]">
	</form>
	<hr>
	<input type="button" value="[예약취소]" onclick="check();">
	<input type="button" value="[예약내역]" onclick="location.href='${cp}/reserve/reserveList'">

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