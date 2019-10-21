<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" />
<script type="text/javascript">

/*  function page(idx){
	var pagenum =idx;
	var contentnum =$("#contentnum option:selected").val();
	location.href="${cp}/board/showList?pagenum="+pagenum+"&contentnum="+contentnum;
}  */

</script>



</head>
<body>

	<select name="contentnum" id="contentnum">
		<option value="10">10</option>
		<option value="20">20</option>
		<option value="30">30</option>

	</select>

	<table>
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
					<td><c:forEach begin="1" end="${dto.bIndent}">-_re</c:forEach>
						<a href="${cp}/board/contentView?bId=${dto.bId}">${dto.bTitle}</a></td>
					<td>${dto.bDate}</td>
					<td>${dto.bHit}</td>
				</tr>

			</c:forEach>
		</tbody>


		<tfoot>
			<tr>
				<td colspan="2">
				<c:if test="${page.prev}">
						<a style="text-decoration: none;" href="${cp}/board/showList?pagenum=${page.getStartPage()-1}&contentnum=10">&laquo;</a>
						
           					</c:if> 
					<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
						<%-- <a style="text-decoration: none;" href="javascript:page(${idx});">${idx}</a> --%>
						<a style="text-decoration: none;" href="${cp}/board/showList?pagenum=${idx}&contentnum=10">${idx}</a>
					</c:forEach> 
					<c:if test="${page.next}">
						<a style="text-decoration: none" href="${cp}/board/showList?pagenum=${page.getEndPage()+1}&contentnum=10">&raquo;</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="5"><a href="${cp}/board/writeView">글작성</a></td>
			</tr>
		</tfoot>
	</table>


</body>
</html>