<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$(document).ready(function(e) {
			var idx = false;
			var getCheck= /^[a-z0-9]{4,12}$/;
			
			$('#idcbtn').click(function() {
				var user_id = $('#user_id').val();
				$("#id_check").text("");
					$.ajax({
						url : 'id_Check?user_id=' + user_id,
						type : 'get',
						success : function(data) {
						//console.log("1 = 중복o / 0 = 중복x : "+ data);
							if (data == 1) {
								// 1 : 아이디가 중복되는 문구
								$("#id_check").text("사용중인 아이디입니다");
								$("#id_check").css("color","red");
								$("#join").attr("disabled",true);
								idx = false;
							} else if (data == 0) {
								$("#id_check").text("사용가능한 아이디입니다");
								$("#id_check").css("color","blue");
								$("#join").attr("disabled",false);
								idx = true;
							}
						}
					});
			});

	
					$('#join').click(function() {
						
						 if($('#user_name').val()==""){
						      alert("이름을 입력해주세요");
						      $("#user_name").val("");
						      $("#user_name").focus();
						      return false;
						    }
						 if($('#user_phone').val()==""){
						      alert("휴대전화 입력해주세요");
						      $("#user_phone").val("");
						      $("#user_phone").focus();
						      return false;
						    }
						 
						 var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
						  if (!(regExp.test($('#user_phone').val()))){
						    $('#phone_check').text('잘못된 입력입니다.');
						    $("#phone_check").css("color","red");
						    $("#user_phone").val("");
						    $("#user_phone").focus();
						    return false;
						  }
						    
						 if($('#user_addr').val()==""){
						      alert("주소를 입력해주세요");
						      $("#user_addr").val("");
						      $("#user_addr").focus();
						      return false;
						    }
						//패스워드 확인
						if ($('#user_pw').val() != $('#user_pw2').val()) {
								alert('패스워드가 다릅니다.');
								$('#user_pw').focus();
								$("#user_pw2").val("");
								return false;
							}
						
						 //이름의 유효성 검사
					      if(!getCheck.test($("#user_id").val())){
					        alert("아이디를 영소문자와 숫자 조합으로 4-12글자 형식에 맞게 입력해주세요");
					        $("#user_id").val("");
					        $("#user_id").focus();
					        return false;
					      }

					    //비밀번호의 유효성 검사
					      if(!getCheck.test($("#user_pw").val())){
					        alert("비밀번호를 영소문자와 숫자 조합으로 4-12글자 형식에 맞게 입력해주세요");
					        $("#user_pw").val("");
					        $("#user_pw").focus();
					        return false;
					      }

							if (idx == false) {
								alert("아이디 중복체크를 해주세요.");
								return false;
							} else if (idx == true){
								$('#signFrm').submit();							
							}
						});
	});
</script>
</head>

<body>
<h1>회원가입</h1>
<hr>
	
	<form action = "${cp}/member/insertUser" method="post" name="signFrm" id="signFrm">
	<div class="form-group">
			<label for="user_agree">약관동의</label> <br>
			<textarea rows="20" cols="100" readonly="readonly">회원가입 하려면 어쩌구저쩌구..</textarea><br>
			<input type="checkbox" id="agree_checkbox" required>약관에 동의
			<div class="check_font" id="user_agree"></div>
		</div>
		<!-- 이름 -->
		<div class="form-group">
			<label for="user_name">이름</label> <input type="text"
				class="form-control" id="user_name" name="user_name"
				placeholder="Name" required>
			<div class="check_font" id="name_check"></div>
		</div>
		<!-- 아이디 -->
		<div class="form-group">
			<label for="user_id">아이디</label> <input type="text"
				class="form-control" id="user_id" name="user_id" placeholder="ID"
				required>
				<input type="button" id="idcbtn" value="중복확인" >
			<div class="check_font" id="id_check"></div>
		</div>
		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="user_pw">비밀번호</label> <input type="password"
				class="form-control" id="user_pw" name="user_pw"
				placeholder="PASSWORD" required>
			<div class="check_font" id="pw_check"></div>
		</div>
		<!-- 비밀번호 재확인 -->
		<div class="form-group">
			<label for="user_pw2">비밀번호 확인</label> <input type="password"
				class="form-control" id="user_pw2" name="user_pw2"
				placeholder="Confirm Password" required>
			<div class="check_font" id="pw2_check"></div>
		</div>
		<!-- 휴대전화 -->
		<div class="form-group">
			<label for="user_phone">휴대전화 ('-'를 포.함.한 번호를 입력해주세요)</label> 
				<input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="Phone Number" required>
			<div class="check_font" id="phone_check"></div>
		</div>
		<!-- 주소 -->
		<div class="form-group">
			<label for="user_email">주소</label> 
				<input type="text" class="form-control" id="user_addr" name="user_addr" placeholder="Address" required>
			<div class="check_font" id="addr_check"></div>
		</div>

		
		<div class="reg_button">
			<a class="btn btn-danger px-3"
				href="${pageContext.request.contextPath}"> <i
				class="joinbtn" aria-hidden="true"></i>취소하기
			</a>&emsp;&emsp;
			
			<input type="submit" class="joinbtn" value="회원가입" id="join">
		</div>
		
	</form>
</body>


</html>