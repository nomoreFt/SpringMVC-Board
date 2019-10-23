<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function check()
	{
	   if(!document.userInfo.name.value) {
	       alert("이름을 입력해 주세요");
	       return false;
	   }
	   
	   if(!document.userInfo.tel.value) {
	       alert("핸드폰번호를 입력해 주세요");
	       return false;
	   }
	   if (document.userInfo.tel.value.indexOf("-") >= 0) {
	       alert("핸드폰번호는'-'를 제외하고 입력해주세요.")
	       document.userInfo.tel.focus();
	       document.userInfo.tel.select();
	       return false;
	   }
	   
	   if (document.userInfo.tel.value.length>11) {
	      alert("핸드폰번호를 정확하게 입력해 주세요")
	   }
	}
</script>

</head>
<body>
<form id = "form" method="post" action="memberSearchId.do" name="userInfo" onsubmit="return check()">

<h1>아이디찾기</h1>
<hr class="line">
   <table>
      <tr>
         <td>
            <input class="text" type="text" name="name" placeholder="이름">
         </td>
         <td rowspan="2">
            <input id = "btn"type="submit" value="확인">
         </td>
      </tr>
      <tr>
         <td>
            <input class="text" type="text" name="tel" placeholder="핸드폰번호">
         </td>
      </tr>
   </table>
</form>


</body>
</html>