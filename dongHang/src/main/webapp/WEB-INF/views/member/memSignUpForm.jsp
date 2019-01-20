<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Bowlby+One+SC|Do+Hyeon|Dokdo|Gaegu|Nanum+Pen+Script|Poor+Story|Sunflower:300" rel="stylesheet">
<html lang="kr">
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>회원가입 폼</title>
   
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signup.css">
	
</head>
<body>

<section class="container">
          <article class="half">
                 <h1>동 행</h1>
                 <div class="tabs">
                        <span class="tab signin active"><a href="#signin">Member</a></span>
                        <span class="tab signup"><a href="#signup">Corporation</a></span>
                 </div>
                 
                 <div class="content">
                    <div class="signin-cont cont">
                       <form action="<c:url value ="/signup/member.do" />" method="post">
                            <input type="text" name="person_id"  class="inpt" required="required" placeholder="아이디">
                            <input type="password" name="person_pass"  class="inpt" required="required" placeholder="비밀번호">
                            <input type="text" name="person_name"  class="inpt" required="required" placeholder="이름">
                            <input type="email" name="person_mail"  class="inpt" required="required" placeholder="이메일">
                            <input type="text" name="person_tel"  class="inpt" required="required" placeholder="핸드폰번호">
                            <input type="text" name="person_zip"  class="inpt" required="required" placeholder="우편번호">
                            <input type="text" name="person_addr1"  class="inpt" required="required" placeholder="상세주소">
                            <input type="text" name="person_addr2"  class="inpt" required="required" placeholder="주소">
		                    <div class="submit-wrap">
		                      <input type="submit" value="Sign up" class="submit">
		                    </div>
                      </form>
                </div>
                    
                <div class="signup-cont cont">
               		<form action="<c:url value ="/signup/member.do" />" method="post">
                            <input type="text" name="person_id"  class="inpt" required="required" placeholder="아이디">
                            <input type="password" name="person_pass"  class="inpt" required="required" placeholder="비밀번호">
                            <input type="text" name="person_name"  class="inpt" required="required" placeholder="이름">
                            <input type="email" name="person_mail"  class="inpt" required="required" placeholder="이메일">
                            <input type="text" name="person_tel"  class="inpt" required="required" placeholder="핸드폰번호">
                            <input type="text" name="person_zip"  class="inpt" required="required" placeholder="우편번호">
                            <input type="text" name="person_addr1"  class="inpt" required="required" placeholder="상세주소">
                            <input type="text" name="person_addr2"  class="inpt" required="required" placeholder="주소">
		                   
		                    <div class="submit-wrap">
		                      <input type="submit" value="Sign up" class="submit">
		                    </div>
                      </form>
            	</div>
             </div>
          </article>
          
          
          <div class="half bg"></div>
   </section>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>
</body>
</html>