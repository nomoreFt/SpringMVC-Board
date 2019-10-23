<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" />
<script type="text/javascript">
</script>
</head>
<%@ include file="/WEB-INF/views/header/head.jsp" %>

<body>

	<table class = "table table-hover">
		<thead>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>제목</td>
				<td>날짜</td>
				<td>히트</td>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.bId}</td>
					<td>${dto.bName}</td>
					<td><c:forEach begin="1" end="${dto.bIndent}">└『re』</c:forEach>
						<a href="${cp}/board/contentView?bId=${dto.bId}">${dto.bTitle}</a></td>
					<td>${dto.bDate}</td>
					<td>${dto.bHit}</td>
				</tr>

			</c:forEach>
		</tbody>
</table>
<hr/>
<a class="btn btn-default pull-right" href="${cp}/board/writeView">글작성</a>
<div class = "text-center">
<ul class= "pagination">
  <li> <c:if test="${page.prev}">
						<a style="text-decoration: none;" href="${cp}/board/showList?pagenum=${page.getStartPage()-1}&contentnum=10">&laquo;</a>
       </c:if>  </li>
       <c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
						<li><a style="text-decoration: none;" href="${cp}/board/showList?pagenum=${idx}&contentnum=10">${idx}</a></li>
					</c:forEach> 
					<li><c:if test="${page.next}">
						<a style="text-decoration: none" href="${cp}/board/showList?pagenum=${page.getEndPage()+1}&contentnum=10">&raquo;</a>
						</c:if>
						</li>
</ul>
</div>
<%@ include file="/WEB-INF/views/footer/foot.jsp" %>
</body>
</html>