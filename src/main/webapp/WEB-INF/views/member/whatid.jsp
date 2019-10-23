<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">

	$('#btn').click(function() {
		//var user_name = $('#user_name').val();
		//var user_phone = $('#user_phone').val();
		
	   if($('#user_name').val() == null) {
	       alert("이름을 입력해 주세요");
		    $("#user_name").focus();
	       return false;
	   }
	   
	   if($('#user_phone').val() == null) {
	       alert("핸드폰번호를 입력해 주세요");
		    $("#user_phone").focus();
	       return false;
	   }
	   
	   var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		  if (!(regExp.test($('#user_phone').val()))){
			alert("핸드폰번호를 정확하게 입력해 주세요")
		    $("#user_phone").val("");
		    $("#user_phone").focus();
		    return false;
		  }
 				
 				var user_name = $("#user_name").val();
 				var user_phone = $("#user_phone").val();
		  
/*  			$.ajax({
 				
				url : 'what_id?user_name='+user_name+'&user_phone='+user_phone,
				type : 'post',
				success : function(data) {
					if (data == null) {
						alert("입력하신정보로 아이디없다. 돌아가");
						return false;
					} else {
						return true;
					}
				}
			});  */
	});
	
	
</script>

</head>
<body>

	<form action = "${cp}/member/what_id" method="post" name="whatid" id="whatid">

<h1>아이디찾기</h1>
<hr class="line">
   <table>
      <tr>
         <td>
            <input class="text" type="text" name="user_name" id="user_name" placeholder="이름" required>
         </td>
         <td rowspan="2">
            <input type="submit" id="btn" value="확인">
         </td>
      </tr>
      <tr>
         <td>
            <input class="text" type="text" name="user_phone" id = "user_phone" placeholder="핸드폰번호 ('-'를 포.함.한 번호를 입력해주세요)" required>
         </td>
      </tr>
   </table>
</form>


</body>
</html>