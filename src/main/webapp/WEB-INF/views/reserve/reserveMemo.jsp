<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


</body>
</html>