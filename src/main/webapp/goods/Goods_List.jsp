<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function()
{
	var goods_kind = $("#goods_kind").val();
	var goods_class = $("#goods_class").val();
	//   Tops
	if(goods_kind == "T-Shirt")
	{
		$("#T-Shirt").css("text-decoration","underline");
	}
	if(goods_kind == "Blouse")
	{
		$("#Blouse").css("text-decoration","underline");
	}
	if(goods_kind == "Neat")
	{
		$("#Neat").css("text-decoration","underline");
	}
	if(goods_kind == "Hood")
	{
		$("#Hood").css("text-decoration","underline");
	}
	if(goods_kind == "Training")
	{
		$("#Training").css("text-decoration","underline");
	}
	//      Bottoms
	if(goods_kind == "Shorts")
	{
		$("#Shorts").css("text-decoration","underline");
	}
	if(goods_kind == "Skirts")
	{
		$("#Skirts").css("text-decoration","underline");
	}
	if(goods_kind == "Crops")
	{
		$("#Crops").css("text-decoration","underline");
	}
	if(goods_kind == "Leggings")
	{
		$("#Leggings").css("text-decoration","underline");
	}
	if(goods_kind == "Pants")
	{
		$("#Pants").css("text-decoration","underline");
	}
	//      Shoes
	if(goods_kind == "Sneakers")
	{
		$("#Sneakers").css("text-decoration","underline");
	}
	if(goods_kind == "Shoes")
	{
		$("#Shoes").css("text-decoration","underline");
	}
	if(goods_kind == "High_Heel")
	{
		$("#High_Heel").css("text-decoration","underline");
	}
	if(goods_kind == "Running_Shoes")
	{
		$("#Running_Shoes").css("text-decoration","underline");
	}
	// Best
	if(goods_class == "Tops" && goods_kind == "Best")
	{
		$("#Tops").css("text-decoration","underline");
	}
	if(goods_class == "Bottoms" && goods_kind == "Best")
	{
		$("#Bottoms").css("text-decoration","underline");
	}
	if(goods_class == "Shoes" && goods_kind == "Best")
	{
		$("#Shoes").css("text-decoration","underline");
	}	
	
});
</script>
</head>
<body>
	<div class="wrapper">	<!-- sidemenuul만빼서 c:if로 할까? -->
		<div class="topSideBorder">
			<div class="topSideMenu">
			<c:set var="goods_class" value="${goods_class }"></c:set>
			<input type="hidden" value="${goods_kind }" id="goods_kind" />
			<input type="hidden" value="${goods_class }" id="goods_class" />
			
				<c:if test="${goods_class eq 'Tops' && goods_kind ne 'Best' }">
					<ul class="topSideMenuUl" style="width:750px;">
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=T-Shirt" class="menuA" id="T-Shirt">T-Shirt</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Blouse" class="menuA" id="Blouse">Blouse</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Neat" class="menuA" id="Neat">Neat</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Hood" class="menuA" id="Hood">Hood</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Training" class="menuA" id="Training">Training</a></li>
					</ul>
				</c:if>
				<c:if test="${goods_class eq 'Bottoms' && goods_kind ne 'Best'}">
					<ul class="topSideMenuUl" style="width:750px;">
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Shorts" class="menuA" id="Shorts">Shorts</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Skirts" class="menuA" id="Skirts">Skirts</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Crops" class="menuA" id="Crops">Crops</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Leggings" class="menuA" id="Leggings">Leggings</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Pants" class="menuA" id="Pants">Pants</a></li>
					</ul>
				</c:if>
				<c:if test="${goods_class eq 'Shoes' && goods_kind ne 'Best'}">
					<ul class="topSideMenuUl" style="width:600px;">
						<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=Sneakers" class="menuA" id="Sneakers">Sneakers</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=Shoes" class="menuA" id="Shoes">Shoes</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=High_Heel" class="menuA" id="High_Heel">High Heel</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=Running_Shoes" class="menuA" id="Running_Shoes">Running Shoes</a></li>
					</ul>
				</c:if>	
				<c:if test="${goods_kind eq 'Best'}">
					<ul class="topSideMenuUl" style="width:450px;">
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Best" class="menuA" id="Tops">Tops</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Best" class="menuA" id="Bottoms">Bottoms</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=Best" class="menuA" id="Shoes">Shoes</a></li>
					</ul>
				</c:if>							
			</div>
		</div>
		<div class="wrapper_p">
			<div class="mainImg">
			<c:if test="${goods_class eq 'Tops' }">
				<img src="./image/main/main1.jpg" alt="메인이미지" class="goodsMainImg" />
			</c:if>
			<c:if test="${goods_class eq 'Bottoms' }">
				<img src="./image/main/main2.jpg" alt="메인이미지" class="goodsMainImg" />
			</c:if>			
			<c:if test="${goods_class eq 'Shoes' }">
				<img src="./image/main/main3.jpg" alt="메인이미지" class="goodsMainImg" />
			</c:if>			
			</div>
			<div class="GoodsFullBox">
				<c:forEach var="gl" items="${goodsList}" varStatus="status">
					<div class="GoodsBox">
						<a href="GoodsSelectOne.do?goods_index=${gl.goods_index}&page=1"><img src=".${gl.goods_imageTitle}" alt="이미지사진" class="goodsbox_img"/></a><br>
						<a href="GoodsSelectOne.do?goods_index=${gl.goods_index}&page=1" class="goodsTitle">${gl.goods_name}</a><br>
						<a class="goodsPrice">${gl.goods_lastprice}원</a>
					</div>
				</c:forEach>	
			</div>
			<div class="pagenum">
				<div class="pagenum_loc">
				<div class="paging" style="text-align:center;">
				<ul style="display:inline-block; list-style:none;">
					<c:if test="${page > 9}">
						<li style="float:left;"><a href="GoodsSelectList.do?page=${startPage - 9}&goods_class=${goods_class}&goods_kind=${goods_kind}" style="float:left; position:relative; ">이전으로</a></li>
					</c:if>
					<c:set var="i" value = "5"/>
					<c:forEach begin="${startPage }"  end="${endPage }" var = "i" varStatus="status" step="1">
						<c:if test="${status.count <= 9 }">
							<li style="float:left;"><a href="GoodsSelectList.do?page=${i}&goods_class=${goods_class}&goods_kind=${goods_kind}" style="float:left; position:relative; ">[${i}]</a></li>
						</c:if>
						
					</c:forEach>
						<fmt:parseNumber var="eqpage" value="${((page / 10) + 1)}" integerOnly="true"/>
						<fmt:parseNumber var="endeqpage" value="${endPage /10 + 1}" integerOnly="true"/>
					<c:if test="${ endeqpage > eqpage }">
							<li style="float:left;"><a href="GoodsSelectList.do?page=${startPage+9}&goods_class=${goods_class}&goods_kind=${goods_kind}" style="float:left; position:relative; ">다음으로</a>	</li><!-- 페이지는 페이지가 움직임 -->
					</c:if>
				</ul>
				</div>
				
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>