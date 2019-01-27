<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Prologue</title>
<meta charset="utf-8">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600" rel="stylesheet" type="text/css">
<!--[if lte IE 8]>
<script src="js/html5shiv.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath }/js/crew/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/crew/skel.min.js"></script>
<script src="${pageContext.request.contextPath }/js/crew/skel-panels.min.js"></script>
<script src="${pageContext.request.contextPath }/js/crew/init.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/crew/skel-noscript.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/crew/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/crew/style-wide.css">

</head>
<body>
<div id="header" class="skel-panels-fixed">
  <div class="top">
    <div id="logo"> <span class="image avatar48"><img src="${pageContext.request.contextPath }/images/crew/avatar.jpg" alt=""></span>
      <h1 id="title">Jane Doe</h1>
      <span class="byline">${crew.crew_name }</span> </div>
    <nav id="nav">
      <ul>
        <li><a href="#top" id="top-link" class="skel-panels-ignoreHref"><span class="icon icon-home">Intro</span></a></li>
        <li><a href="#portfolio" id="portfolio-link" class="skel-panels-ignoreHref"><span class="icon icon-th">Portfolio</span></a></li>
        <li><a href="#about" id="about-link" class="skel-panels-ignoreHref"><span class="icon icon-user">About Me</span></a></li>
        <li><a href="#contact" id="contact-link" class="skel-panels-ignoreHref"><span class="icon icon-envelope">Contact</span></a></li>
      </ul>
    </nav>
  </div>
  <div class="bottom">
    <ul class="icons">
      <li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
      <li><a href="#" class="icon icon-facebook"><span>Facebook</span></a></li>
      <li><a href="#" class="icon icon-github"><span>Github</span></a></li>
      <li><a href="#" class="icon icon-dribbble"><span>Dribbble</span></a></li>
      <li><a href="#" class="icon icon-envelope"><span>Email</span></a></li>
    </ul>
  </div>
</div>
<div id="main">
  <section id="top" class="one">
    <div class="container small"> <a href="#" class="image featured"><img src="${pageContext.request.contextPath }/images/crew/pic01.jpg" alt=""></a>
      <header>
        <h2 class="alt">This is <strong>Prologue</strong>. A free, fully responsive site template by HTML5 UP.</h2>
      </header>
      <p>Ligula scelerisque justo sem accumsan diam quis. Vitae natoque dictum etiam semper magnis enim feugiat convallis convallis egestas rhoncus ridiculus in quis risus curabitur tempor. Orci penatibus quisque laoreet condimentum sollicitudin accumsan elementum.</p>
      <footer> <a href="#portfolio" class="button scrolly">Magna Aliquam</a> </footer>
    </div>
  </section>
  <section id="portfolio" class="two">
    <div class="container">
      <header>
        <h2>Portfolio</h2>
      </header>
      <p>Vitae natoque dictum etiam semper magnis enim feugiat convallis convallis egestas rhoncus ridiculus in quis risus amet curabitur tempor orci penatibus. Tellus erat mauris ipsum fermentum etiam vivamus eget. Nunc nibh morbi quis fusce hendrerit lacus ridiculus.</p>
      <div class="row">
        <div class="4u">
          <article class="item"> <a href="#" class="image full"><img src="${pageContext.request.contextPath }/images/crew/pic02.jpg" alt=""></a>
            <header>
              <h3>Ipsum Feugiat</h3>
            </header>
          </article>
          <article class="item"> <a href="#" class="image full"><img src="${pageContext.request.contextPath }/images/crew/pic03.jpg" alt=""></a>
            <header>
              <h3>Rhoncus Semper</h3>
            </header>
          </article>
        </div>
        <div class="4u">
          <article class="item"> <a href="#" class="image full"><img src="${pageContext.request.contextPath }/images/crew/pic04.jpg" alt=""></a>
            <header>
              <h3>Magna Nullam</h3>
            </header>
          </article>
          <article class="item"> <a href="#" class="image full"><img src="${pageContext.request.contextPath }/images/crew/pic05.jpg" alt=""></a>
            <header>
              <h3>Natoque Vitae</h3>
            </header>
          </article>
        </div>
        <div class="4u">
          <article class="item"> <a href="#" class="image full"><img src="${pageContext.request.contextPath }/images/crew/pic06.jpg" alt=""></a>
            <header>
              <h3>Dolor Penatibus</h3>
            </header>
          </article>
          <article class="item"> <a href="#" class="image full"><img src="${pageContext.request.contextPath }/images/crew/pic07.jpg" alt=""></a>
            <header>
              <h3>Orci Convallis</h3>
            </header>
          </article>
        </div>
      </div>
    </div>
  </section>
  <section id="about" class="three">
    <div class="container small">
      <header>
        <h2>About Me</h2>
      </header>
      <a href="#" class="image featured"><img src="${pageContext.request.contextPath }/images/crew/pic08.jpg" alt=""></a>
      <p>Tincidunt eu elit diam magnis pretium accumsan etiam id urna. Ridiculus ultricies curae quis et rhoncus velit. Lobortis elementum aliquet nec vitae laoreet eget cubilia quam non etiam odio tincidunt montes. Elementum sem parturient nulla quam placerat viverra mauris non cum elit tempus ullamcorper dolor. Libero rutrum ut lacinia donec curae mus vel quisque sociis nec ornare iaculis.</p>
    </div>
  </section>
  <section id="contact" class="four">
    <div class="container small">
      <header>
        <h2>Contact</h2>
      </header>
      <p>Elementum sem parturient nulla quam placerat viverra mauris non cum elit tempus ullamcorper dolor. Libero rutrum ut lacinia donec curae mus. Eleifend id porttitor ac ultricies lobortis sem nunc orci ridiculus faucibus a consectetur. Porttitor curae mauris urna mi dolor.</p>
      <form method="post" action="#">
        <div class="row half">
          <div class="6u">
            <input type="text" class="text" name="name" placeholder="Name">
          </div>
          <div class="6u">
            <input type="text" class="text" name="email" placeholder="Email">
          </div>
        </div>
        <div class="row half">
          <div class="12u">
            <textarea name="message" placeholder="Message"></textarea>
          </div>
        </div>
        <div class="row">
          <div class="12u"> <a href="#" class="button submit">Send Message</a> </div>
        </div>
      </form>
    </div>
  </section>
</div>
<div id="footer">
  <div class="copyright">
    <p>&copy; 2045 Jane Doe. All rights reserved.</p>
    <ul class="menu">
      <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
    </ul>
  </div>
</div>
</body>
</html>