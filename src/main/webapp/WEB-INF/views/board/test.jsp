<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
/* 
@RequestBody/@ResponseBody
//json -> java객체, java -> json 객체컨트롤러에서 주고 받을 때 json 포맷으로 전송, 받을 떄 json으로 받기 */
$(function() {
 //todo
});

$("div");
$(".class");
$("#id");
$("*").css("boarder","1px");
$("div,span,p.myClass");
$("div:gt(2)");//div 요소 중 3번재 이후 부터
$(" :checkbox");//inputtpye에서 checkbox 모두 가져와라

//Attribute 값 읽기와 쓰기

</script>

<img id = "greatphoto">
<script>
$("#greatphoto").attr("src","brush-seller.jpg");
$("#greatphoto").attr({
	alt:"Brush Seller",
	title: "photo by Kelly"
});
</script>

<!-- append(), appendTo(), html(), html(htmlString) 함수 -->
$(".inner").append("<p>Test</p>");
$("<p>Test</p>").appendTo(".inner");

$("div.demo-container").html();<!-- //div밑에 demo-container라는 클래스 명을 가진 모든 엘리먼트 html 가져와 -->
$("div").html("<h1>제목</h1>"); <!-- div 라는 이름을 가진 모든 태그에 html을 <h1></h1>으로 변경 -->


<!-- loop 기능 .each(function(index,element))함수ㅡ-->

<ul>
	<li>foo</li>
	<li>bar</li>
</ul>
$('li').each(function(index,element){
alert(index + ': ' + $(element).text());
});
<!-- 0 : foo  1: bar-->
<!-- 
css(propertyName),css(propertyName,value),css(object)함수 -->
$("span").css("width");
$("span").css("width","100px");
$("span").css({"width":"100px","height":"50px"});
<!-- 
addClass(className)함수
:선택된 element에 해당되는 클래스 추가 -->
$("p").addClass("myClass");<!-- //p엘리먼트에 myClass라는 css 클래스를 추가해라 -->

<!-- Event처리 on()함수 : 선택된 element에 이벤트 핸들러를 묶어준다. --> 

$("p").on("click",function(){
				alert($(this).text());
});	<!-- p라는 이름을 가진 elemet에서 클릭이벤트가 발생 시 p태그의 text를 alert -->

$("div.text").on({
mouseenter:function(){
$(this).addClass("inside");
},
mouseleave:function(){
$(this).removeClass("inside");
}

});<!-- div태그의 text 영역에 마우스 들어갈 시 inside css 추가, 지나가면 삭제 -->



<!-- Ajax 처리 $.ajax()함수 -->

$('#btnSelect').on('click',function(){
	$.ajax({
		url:'users',
		type:'GET',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		error:function(xhr,status,msg){
		alert("상태값:" + status + "Http에러메세지 : " + msg);
		},
		success:userSelectResult
	});
});
</body>
</html>