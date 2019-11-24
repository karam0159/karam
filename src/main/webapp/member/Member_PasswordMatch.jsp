<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>		// 버튼에 마우스 올리면 생기는 애니매이션
$( document ).ready( function() {
   
    
    $('.passwordCheckBtn').hover(function()
    {
    	$('.passwordCheckBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('.passwordCheckBtn').stop().animate({
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
			<div class="passwordCheckBody">
				<a class="title">Password Check</a>
				<form action="MemberPasswordCheck.do" method="post" name = "signUpForm" class="passwordCheckForm" >
					<a>비밀번호를 입력해주시면 다음 페이지로 이동합니다.</a>
					<div class="passwordCheckDiv">
						<input type="hidden" name="member_id" value="${memberVO.member_id }"/>
						<input type="password" name="member_password" id="password" /><br>
						<input type="submit" value="비밀번호 입력" class="passwordCheckBtn"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

