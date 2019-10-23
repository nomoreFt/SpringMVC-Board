<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>로그인</h1>
	<hr>

	<form action="${cp}/member/logincheck" method="get">
	
		<!-- 아이디 -->
		<div class="form-group">
			<label for="user_id">아이디</label> 
			<input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID" required>
			<div class="check_font" id="id_check"></div>
		</div>
		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="user_pw">비밀번호</label> 
			<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="PASSWORD" required>
			<div class="check_font" id="pw_check"></div>
		</div>
		
		<div class="login_button">
			<input type="submit" value="LOGIN">
		</div>
		<div>
			<a href="whatid">아이디/</a> <a href="whatpw">비밀번호 찾기</a> <a href="${cp}/member/join">회원가입</a>
		</div>
	</form>

</body>
</html>