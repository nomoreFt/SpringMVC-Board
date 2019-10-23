<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<form action = "${cp}/member/deleteUser" method="post" name="deleteFrm" id="deleteFrm">
	<h1>회원탈퇴</h1>
	<hr>
	<p>탈퇴를 하시면 회원정보, 쿠폰, 예약 내역이 초기화 되며 복구하실 수 없습니다.</p>
	<p>정말로 탈퇴를 원하신다면 아래에 비밀번호를 입력하시고 탈퇴버튼을 눌러주세요.</p>
	<br>
	<br>
	<label id="pwCheck">비밀번호 </label>
	<input type="password" class="form-control" id="user_pw" name="user_pw"
		placeholder="PASSWORD" required>
	<br><br>
	<input type="submit" class="memeberbtn" value="탈퇴하기" id="delete">
</form>
</body>
</html>