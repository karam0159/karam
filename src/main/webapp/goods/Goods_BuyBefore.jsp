<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function()
{
	$(".menuA").click(function(){
		
		$('.menuA').removeClass('underLine');
		$(this).addClass('underLine');
	});
});
</script>
</head>
<body>
	<div class="wrapper">	<!-- sidemenuul만빼서 c:if로 할까? -->
		<div class="wrapper_p">
			<div class="GoodsFullBox">
				<div class="marginAuto" style="width:500px; margin:0 auto; height:200px; border:1px solid #dddddd; margin-top:50px; margin-bottom:50px;">
					<a style="font-size:28px; font-weight:bold; width:500px; display:inline-block; text-align:center; margin-top:30px;">상품 구매 완료</a>
					<a style="font-size:22px; font-weight:bold; width:500px; display:inline-block; text-align:center; margin-top:30px;">국민은행 김가람 688599-45-115878</a><br>
					<a style="font-size:22px; font-weight:bold; width:500px; display:inline-block; text-align:center; margin-top:30px;">${laterTime} 까지 입금완료 해주세요!</a>	
				</div>			
			</div>
		</div>
	</div>
</body>
</html>