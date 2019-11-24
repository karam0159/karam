<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="wrapper_p">
			<div class="GoodsFullBox" style="margin-bottom:30px;">
				<a style="margin-top:10px; display:inline-block; width:1100px; text-align:center; font-size:24px; font-family:'Open Sans';">BEST CHOICE</a>
				<c:forEach var="gl" items="${goodsList}" varStatus="status">
					<div class="GoodsBox">
						<a href="GoodsSelectOne.do?goods_index=${gl.goods_index}&page=1"><img src=".${gl.goods_imageTitle}" alt="이미지사진" class="goodsbox_img"/></a><br>
						<a href="GoodsSelectOne.do?goods_index=${gl.goods_index}&page=1" class="goodsTitle">${gl.goods_name}</a><br>
						<a class="goodsPrice">${gl.goods_lastprice}원</a>
					</div>
				</c:forEach>	
			</div>
			<div class="Coupon" style="width:1100px; margin-bottom:30px;">
				<a style="width:1100px; text-align:center; display:inline-block; font-size:24px; margin-bottom:30px; font-family:'Open Sans';">FOR YOU~♥</a>
				<img src="image/coupon/review2.jpg" alt="쿠폰" style="width:330px; height:230px; margin-left:0px; float:left; margin-right:50px;">
				<img src="image/coupon/blue.jpg" alt="쿠폰" style="width:330px; height:230px; margin-right:50px; float:left;">
				<img src="image/coupon/delfree2.jpg" alt="쿠폰" style="width:330px; height:230px; float:left;">
			</div>
		</div>
	</div>
</body>
</html>