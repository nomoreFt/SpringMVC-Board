<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">

	$('#btn').click(function() {
		var user_id = $('#user_id').val();
		var user_name = $('#user_name').val();
		var user_phone = $('#user_phone').val();
		
	   if(user_id == null) {
	       alert("아이디를 입력해 주세요");
	       return false;
	   }
	   if(user_name == null) {
	       alert("이름을 입력해 주세요");
	       return false;
	   }
	   
	   if(user_phone == null) {
	       alert("핸드폰번호를 입력해 주세요");
	       return false;
	   }
	   
	   var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		  if (!(regExp.test($('#user_phone').val()))){
			alert("핸드폰번호를 정확하게 입력해 주세요")
		    $("#user_phone").val("");
		    $("#user_phone").focus();
		    return false;
		  }
		  
			/* $.ajax({
				url : 'what_pw',
				type : 'get',
				success : function(data) {
					if (data == null) {
						alert("입력하신정보로 비밀번호없다. 돌아가");
						return false;
					} else {
						return true;
					}
				}
			}); */
	});
	
	
</script>

</head>
<body>

	<form action = "${cp}/member/what_pw" method="post" name="whatpw" id="whatpw">
	<h1>비밀번호찾기</h1>
	<hr class = "line">
	   <table>
	      <tr>
	         <td>
	            <input class = "text" type="text" name="user_id" id="user_id" placeholder="아이디" required>
	         </td>
	         <td rowspan="3">
	            <input id= "btn" type="submit" value="확인">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <input class = "text" type="text" name="user_name" id="user_name" placeholder="이름" required>
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <input class = "text" type="text" name="user_phone" id="user_phone" placeholder="핸드폰번호 ('-'를 포.함.한 번호를 입력해주세요)" required>
	         </td>
	      </tr>
	   </table>
	</form>

</body>
</html>