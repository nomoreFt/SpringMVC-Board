<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html lang="en">
<head>
  <title>Bootstrap Website Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>
<body>

<%@ include file="/WEB-INF/views/header/head.jsp" %>

<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h2>현관 모습</h2>
      <h5>Photo of PETSPITAL:</h5>
      <div class="fakeimg">Fake Image</div>
      <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
      <h3>협력 업체</h3>
      <p>Lorem ipsum dolor sit ame.</p>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#">업체1</a></li>
        <li><a href="#">업체2</a></li>
        <li><a href="#">업체3</a></li>
      </ul>
      <hr class="hidden-sm hidden-md hidden-lg">
    </div>
    <div class="col-sm-8">
      <h2>최초 애견을 위한 면역체계 발견</h2>
      <h5>반려견을 더 소중히, Dec 7, 2017</h5>
      <div class="fakeimg">Fake Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
      <br>
      <h2>대형 견들을 위한 시설 구비</h2>
      <h5>입마개는 물론 필수, Sep 2, 2017</h5>
      <div class="fakeimg">Fake Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
  </div>
</div>
<%@ include file="/WEB-INF/views/footer/foot.jsp" %>

 <script>
 window.onload = function(){
	popup();
 }
 
        function popup(){
            var url = "chat/chatbot";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 300, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>

</body>
</html>
