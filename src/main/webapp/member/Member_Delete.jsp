<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$( document ).ready( function() {
   
    
    $('.deleteBtn').hover(function()
    {
    	$('.deleteBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('.deleteBtn').stop().animate({
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
			<div class="deleteBody">
				<a class="title">Drop Account</a>
				<form action="Member_Delete.do?member_id=${memberVO.member_id }" method="post" name = "signUpForm" class="signUpForm" onsubmit="return confirm();">
					<div class="deleteFormDiv">
						<a style="display:inline-block; width:700px; text-align:center;">회원탈퇴하시는 이유를 간략히 적어주시면 고객님의 의견을 적극 반영하겠습니다.</a><br>
						<label id="deleteMsg1"><input type="checkbox" name="deleteMsg1" value="사이트 디자인이 별로에요." id="deleteMsg1"><a>사이트 디자인이 별로에요</a></label><br>
						<label id="deleteMsg2"><input type="checkbox" name="deleteMsg2" value="옷의 갯수가 너무 적어요." id="deleteMsg2"><a>옷의 갯수가 너무 적어요</a></label><br>
						<label id="deleteMsg3"><input type="checkbox" name="deleteMsg3" value="더이상 사이트 이용을 안할래요." id="deleteMsg3"><a>더이상 사이트 이용을 안할래요.</a></label><br>
						<input type="text" name="deleteMsg" value="" style="margin-top:40px; display:inline-block; width:300px; height:50px; margin-left:31%;" placeholder="기타 사유를 적어주세요."/><br>
						<a style="display:inline-block; width:700px; text-align:center;">그 동안 저희 Neating사이트를 사랑해주시고 이용해주셔서 너무 감사드립니다.</a><br>
						<a style="display:inline-block; width:700px; text-align:center;">더 나은 서비스로 고객님들을 만족시킬수 있도록 최선을 다하겠습니다.</a><br>
						<a style="display:inline-block; width:700px; text-align:center;">감사합니다.</a><br>
						<br><input type="submit" value="탈퇴하기" class="deleteBtn"/>
					</div>	
				</form>
			</div>
		</div>
	</div>
	<script>
		function confirm()
		{
			if(confirm("정말 탈퇴하시겠습니까?"))
			{
				return true;
			}
			else
			{
				return false;	
			}	
		}
	</script>
</body>
</html>

