<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$( document ).ready( function() {
    $('.signUpBtn').hover(function()
    {
    	$('.signUpBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('.signUpBtn').stop().animate({
    		backgroundColor:'white',
    		color:'black'
    	},300);
    });
    
  } );
</script>
</head>
<body>
	<div class="wrapper">
		<div class="wrapper_p">
			<div class="signUpBody">
				<a class="title">Password Change</a>
				<h3 style="color:white;">※ 비밀번호 변경 완료</h3><br>
					<div class="signUpFormDiv">
						<a>비밀번호가 변경되었습니다. 로그인 해주세요.</a>
					</div>
			</div>
		</div>
	</div>
</body>
</html>