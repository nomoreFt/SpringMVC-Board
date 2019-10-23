<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <style>
  .fakeimg {
    height: 1100px;
    background: #aaa;
  }
  </style>
<body>	



<!-- Slide Show -->
<section>
  <img class="fakeimg"   src="${cp}/resources/image/3.jpg"
  style="width:100%">
  <img class="fakeimg" src="${cp}/resources/image/2.jpg"
  style="width:100%">
  <img class="fakeimg" src="${cp}/resources/image/1.jpg"
  style="width:100%">
</section>

<!-- Band Description -->
<section class="w3-container w3-center w3-content" style="max-width:600px">
  <h2 class="w3-wide">Petspital</h2>
  <p class="w3-opacity"><i>We love animal</i></p>
  <p class="w3-justify">우리는 항상 진심을 다해 고객분들을 모십니다.</p>

</section>

<!-- Band Members -->
<section class="w3-row-padding w3-center w3-light-grey">
  <article class="w3-third">
    <p>원장 1</p>
    <img src="img_bandmember.jpg" alt="Random Name" style="width:100%">
    <p>스펙 1</p>
  </article>
  <article class="w3-third">
    <p>원장 2</p>
    <img src="img_bandmember.jpg" alt="Random Name" style="width:100%">
    <p>스펙 2</p>
  </article>
  <article class="w3-third">
    <p>원장 3</p>
    <img src="img_bandmember.jpg" alt="Random Name" style="width:100%"><br>
    <p>스펙 3</p>
  </article>
</section><hr>
  <button class="btn btn-default center-block" id="btnInside" type="button" onclick="location.href='${cp}/main'">들어가기</button>
<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-black w3-xlarge">
  <a href="#"><i class="fa fa-facebook-official"></i></a>
  <a href="#"><i class="fa fa-pinterest-p"></i></a>
  <a href="#"><i class="fa fa-twitter"></i></a>
  <a href="#"><i class="fa fa-flickr"></i></a>
  <a href="#"><i class="fa fa-linkedin"></i></a>
  
</footer>

<script>
// Automatic Slideshow - change image every 3 seconds
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("fakeimg");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}
  x[myIndex-1].style.display = "block";
  setTimeout(carousel, 3000);
}

</script>

</body>
</html>

