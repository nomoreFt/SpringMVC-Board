<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "${cp}/member/updateUser" method="post" name="updateFrm" id="updateFrm">
	<h1>마이페이지</h1>
	<hr>
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
			
			<input type="submit" class="updatebtn" value="수정하기" id="update">
		</div>
		
		<div class="reg_button">
			<input type="button" class="couponbtn" value="보유쿠폰확인" id="coupon" onclick="location.href='${cp}/coupon/couponNum'">
		</div>
	
</form>
<form action = "${cp}/member/delete" method="post" name="deleteFrmgo" id="deleteFrmgo">		
		<br><br><br>
		<div class="form-group">
			<textarea rows="20" cols="100" readonly="readonly">탈퇴하면 어쩌구저쩌구..</textarea><br>
			<input type="submit" id="delete_check" value="탈퇴하러가기...">
			<div class="check_font" id="user_delete"></div>
		</div>
</form>
</body>
</html>