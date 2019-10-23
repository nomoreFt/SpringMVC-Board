<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>Petspital</h1>
  <p>소중한 아가들을 위한 최고의 선택!</p> 
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Petspital</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${cp}">Home</a></li>
        <li><a href="#">병원소개</a></li>
        <li><a href="${cp}/reserve/reserveDateForm">예약하기</a></li>
        <li><a href="#">상품구매</a></li>
        <li><a href=" ${cp}/member/memberlogin">회원가입</a></li>
       
        <li><a href="${cp}/board/showList?pagenum=1&contentnum=10">Qna</a></li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>