<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
</head>
<body>

<div id="form">
<h1>비밀번호찾기결과</h1>
<hr class="line">
<br>
<div class = "div">
   <span> ${mem.user_name}회원님의 비밀번호는</span>
   <br><br>
   <span id= "id"> ${mem.user_pw}입니다!!</span>
   <br><br>
	<p>고객님 즐거운 하루되세요!</p>
   <br><br>
   <p>고객님의 비밀번호 찾기가 성공적으로 이루어졌습니다.</p>
   <p>항상 고객님의 즐겁고 편리한 병원이용을 위해</p>
   <p>최선의 노력을 다하는 병원이 되도록 하겠습니다.</p>
</div>
<br><br>
<button id= "login" onclick="location.href = '${cp}/member/memberlogin'">로그인</button>

</body>
</html>