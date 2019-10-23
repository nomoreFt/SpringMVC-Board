<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<style type="text/css">

	tr{
           width: 50px;
           height: 100px;
           text-align: center;
     }
     
   {
     	width : 110px;
     	height : 70px;
     	font-size: 20px;
     }
	
	
	
</style>

<script type="text/javascript">
	
	function resTime(id) {
		var time = document.getElementById(id).value;
		document.form2.res_time.value = time;
	}

  	$(function(){
		var str = ['time1','time2','time3','time4','time5','time6','time7','time8','time9'];
		for(var i = 0; i < str.length; i++){ 
			time_check(str[i]);
		}
  	});

 	
 	function time_check(id) {
		
		var time = $("#"+id).val();
		var date = $("#date").val();
		$.ajax({
			url : 'time_check?time='+ time+'&date=' + date,
			type : 'get',
			success : function(data) {
								
				if (data == 1) {
						$("#"+id).val("예약불가");
						$("#"+id).css("color", "red");
						$("#"+id).attr("disabled", true);
					}
		
				}, error : function(jqXHR, error) {
					console.log("Error "+error);
				}
			});
	
		};
	
</script>

</head>
<body>


	<table border="2" width="500" >

			<tr>	
				<td id="time"><input type="button" id="time1" value="10:00" onclick="resTime(this.id);"></td>
				<td id="time"><input type="button" id="time2" value="11:00" onclick="resTime(this.id);"></td>
				<td id="time"><input type="button" id="time3" value="12:00" onclick="resTime(this.id);"></td>
			</tr>
			<tr>
				<td id="time"><input type="button" id="time4" value="14:00" onclick="resTime(this.id);"></td>
				<td id="time"><input type="button" id="time5" value="15:00" onclick="resTime(this.id);"></td>
				<td id="time"><input type="button" id="time6" value="16:00" onclick="resTime(this.id);"></td>
			</tr>
			<tr>
				<td id="time"><input type="button" id="time7" value="17:00" onclick="resTime(this.id);"></td>
				<td id="time"><input type="button" id="time8" value="18:00" onclick="resTime(this.id);"></td>
				<td id="time"><input type="button" id="time9" value="19:00" onclick="resTime(this.id);"></td>
			</tr>

	</table>

	<form name="form2" action="${cp}/reserve/reserveTimeOk">
		<p>&nbsp;</p>
		<input type="text" id="date" name="res_date" size="10" value="${res_date}">
		<input type="text" name="res_time" size="5">
		<p>&nbsp;</p>
		<textarea rows="10" cols="50" name="res_memo" placeholder="의사선생님께 전달할 메모가 있으면 작성해주세요 ~
예) 반려동물 상태, 반려동물 주의사항 등
		"></textarea>
		<input type="submit" value="다음">
	</form>


</body>
</html> 