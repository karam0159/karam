<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> -->
<title>Insert title here</title>
<style>
	.mainImg
	{
		width:100%;
	}
	
	.mainImg img
	{
		float:left;
		width:50%;
		height:850px;
	}

</style>
</head>
<body>
	<div class="wrapper">
			<c:import url="./slideShow.jsp" />

		<div class="wrapper_p">
			<c:import url="./BasicPage.jsp" />
		</div>
		
		<div class="mainImg" style="float:left; margin-top:30px;">
			<a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=All"><img src="image/goods/neatImg1/1.jpg" alt="메인화면 이미지1"></a>
			<a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=All"><img src="image/goods/neatImg1/2.jpg" alt="메인화면 이미지1" style="width:49%;margin-left:1%;"></a>
		</div>		
	</div>
</body>
</html>