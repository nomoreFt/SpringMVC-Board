<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<table class = "table table-hover">
		<form action="${cp}/board/modify" method="post">
			<input type="hidden" name="bId" value="${contentOne.bId}">
			<tr>
				<td> 번호 </td>
				<td> ${contentOne.bId} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${contentOne.bHit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="bName" value="${contentOne.bName}"></td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="bTitle" value="${contentOne.bTitle}"></td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea rows="10" name="bContent" >${contentOne.bContent}</textarea></td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp; <a href="${cp}/board/showList?pagenum=1&contentnum=10">목록보기</a> &nbsp;&nbsp; <a href="${cp}/board/delete?bId=${contentOne.bId}">삭제</a> &nbsp;&nbsp; <a href="${cp}/board/replyView?bId=${contentOne.bId}">답변</a></td>
			</tr>
		</form>
	</table>
	
	<%@ include file="/WEB-INF/views/board/comment.jsp" %>
	
</body>
</html>