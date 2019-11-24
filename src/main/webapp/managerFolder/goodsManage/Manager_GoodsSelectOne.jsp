<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$( document ).ready( function() {

    $('#signUpBtn').hover(function()
    {
    	$('#signUpBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('#signUpBtn').stop().animate({
    		backgroundColor:'white',
    		color:'black'
    	},300);
    });
    
    
    $('#deleteBtn').hover(function()
  	{
		$('#deleteBtn').stop().animate({
		backgroundColor:'black',
		color:'white'
	},300);
  	    			
    },
    function()
    {
	   	$('#deleteBtn').stop().animate({
   		backgroundColor:'white',
   		color:'black'
   	},300);
    }); 
    
  });
  
</script>
</head>
<body>

<c:set var = "goods_class" value="${param.goods_class}"></c:set>

	<div class="wrapper">
		<div class="wrapper_p">
			<c:if test="${goodsVO.goods_class eq 'Tops' }">
				<a class="ManagerTitle">상품 등록(Tops)</a>
			</c:if>
			<c:if test="${goodsVO.goods_class eq 'Bottoms' }">
				<a class="ManagerTitle">상품 등록(Bottoms)</a>
			</c:if>
			<c:if test="${goodsVO.goods_class eq 'Shoes' }">
				<a class="ManagerTitle">상품 등록(Shoes)</a>
			</c:if>
			<div class="signUpBody">
				<form action="Manager_Goods_Update.do" method="post" name = "signUpForm" class="signUpForm" enctype="multipart/form-data">
					<div class="signUpFormDiv">
						<a>GOODS_NAME</a><br><input type="text" name="goods_name" id="goods_name" value="${goodsVO.goods_name }"required="required"/><br>
						<input type="hidden" value="${goodsVO.goods_name}" name="goods_OriginName" />
						<a>GOODS_CLASS</a><br><input type="text" name="goods_class" id="goods_class" value="${goodsVO.goods_class }" required="required" readonly="readonly"/><br>
						
						<c:if test="${goodsVO.goods_class eq 'Tops' }">
							<a>GOODS_KIND</a><br>
							<c:if test="${goodsVO.goods_kind eq 'T-Shirt'}">
								<a style="font-size:22px; display:inline-block; height:50px;">T-Shirt</a><input type="radio" name="goods_kind" id="goods_kind" value="T-Shirt" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Blouse</a><input type="radio" name="goods_kind" id="goods_kind" value="Blouse" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Neat</a><input type="radio" name="goods_kind" id="goods_kind" value="Neat" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Hood</a><input type="radio" name="goods_kind" id="goods_kind" value="Hood" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Training</a><input type="radio" name="goods_kind" id="goods_kind" value="Training" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<br>
							</c:if>
							<c:if test="${goodsVO.goods_kind eq 'Blouse'}">
								<a style="font-size:22px; display:inline-block; height:50px;">T-Shirt</a><input type="radio" name="goods_kind" id="goods_kind" value="T-Shirt"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Blouse</a><input type="radio" name="goods_kind" id="goods_kind" value="Blouse" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Neat</a><input type="radio" name="goods_kind" id="goods_kind" value="Neat" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Hood</a><input type="radio" name="goods_kind" id="goods_kind" value="Hood" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Training</a><input type="radio" name="goods_kind" id="goods_kind" value="Training" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<br>
							</c:if>
							<c:if test="${goodsVO.goods_kind eq 'Neat'}">
								<a style="font-size:22px; display:inline-block; height:50px;">T-Shirt</a><input type="radio" name="goods_kind" id="goods_kind" value="T-Shirt"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Blouse</a><input type="radio" name="goods_kind" id="goods_kind" value="Blouse"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Neat</a><input type="radio" name="goods_kind" id="goods_kind" value="Neat" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Hood</a><input type="radio" name="goods_kind" id="goods_kind" value="Hood" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Training</a><input type="radio" name="goods_kind" id="goods_kind" value="Training" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<br>
							</c:if>
							<c:if test="${goodsVO.goods_kind eq 'Hood'}">
								<a style="font-size:22px; display:inline-block; height:50px;">T-Shirt</a><input type="radio" name="goods_kind" id="goods_kind" value="T-Shirt"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Blouse</a><input type="radio" name="goods_kind" id="goods_kind" value="Blouse"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Neat</a><input type="radio" name="goods_kind" id="goods_kind" value="Neat"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Hood</a><input type="radio" name="goods_kind" id="goods_kind" value="Hood" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Training</a><input type="radio" name="goods_kind" id="goods_kind" value="Training" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<br>
							</c:if>
							<c:if test="${goodsVO.goods_kind eq 'Training'}">
								<a style="font-size:22px; display:inline-block; height:50px;">T-Shirt</a><input type="radio" name="goods_kind" id="goods_kind" value="T-Shirt"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Blouse</a><input type="radio" name="goods_kind" id="goods_kind" value="Blouse"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Neat</a><input type="radio" name="goods_kind" id="goods_kind" value="Neat"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Hood</a><input type="radio" name="goods_kind" id="goods_kind" value="Hood"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Training</a><input type="radio" name="goods_kind" id="goods_kind" value="Training" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<br>
							</c:if>							
						</c:if>
						
						<c:if test="${goodsVO.goods_class eq 'Bottoms' }">
							<a>GOODS_KIND</a><br>
							<c:if test="${goodsVO.goods_kind eq 'Shorts' }">
								<a style="font-size:22px; display:inline-block; height:50px;">Shorts</a><input type="radio" name="goods_kind" id="goods_kind" value="Shorts" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Skirts</a><input type="radio" name="goods_kind" id="goods_kind" value="Skirts" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Crops</a><input type="radio" name="goods_kind" id="goods_kind" value="Crops" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Leggings</a><input type="radio" name="goods_kind" id="goods_kind" value="Leggings" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Pants</a><input type="radio" name="goods_kind" id="goods_kind" value="Pants" required="required" style="display:inline-block;width:50px; height:50px;"/>
							<br>
							</c:if>
							<c:if test="${goodsVO.goods_kind eq 'Skirts' }">
								<a style="font-size:22px; display:inline-block; height:50px;">Shorts</a><input type="radio" name="goods_kind" id="goods_kind" value="Shorts"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Skirts</a><input type="radio" name="goods_kind" id="goods_kind" value="Skirts" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Crops</a><input type="radio" name="goods_kind" id="goods_kind" value="Crops" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Leggings</a><input type="radio" name="goods_kind" id="goods_kind" value="Leggings" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Pants</a><input type="radio" name="goods_kind" id="goods_kind" value="Pants" required="required" style="display:inline-block;width:50px; height:50px;"/>
							<br>
							</c:if>	
							<c:if test="${goodsVO.goods_kind eq 'Crops' }">
								<a style="font-size:22px; display:inline-block; height:50px;">Shorts</a><input type="radio" name="goods_kind" id="goods_kind" value="Shorts"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Skirts</a><input type="radio" name="goods_kind" id="goods_kind" value="Skirts"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Crops</a><input type="radio" name="goods_kind" id="goods_kind" value="Crops" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Leggings</a><input type="radio" name="goods_kind" id="goods_kind" value="Leggings" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Pants</a><input type="radio" name="goods_kind" id="goods_kind" value="Pants" required="required" style="display:inline-block;width:50px; height:50px;"/>
							<br>
							</c:if>	
							<c:if test="${goodsVO.goods_kind eq 'Leggings' }">
								<a style="font-size:22px; display:inline-block; height:50px;">Shorts</a><input type="radio" name="goods_kind" id="goods_kind" value="Shorts"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Skirts</a><input type="radio" name="goods_kind" id="goods_kind" value="Skirts"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Crops</a><input type="radio" name="goods_kind" id="goods_kind" value="Crops" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Leggings</a><input type="radio" name="goods_kind" id="goods_kind" value="Leggings"  checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Pants</a><input type="radio" name="goods_kind" id="goods_kind" value="Pants" required="required" style="display:inline-block;width:50px; height:50px;"/>
							<br>
							</c:if>
							<c:if test="${goodsVO.goods_kind eq 'Pants' }">
								<a style="font-size:22px; display:inline-block; height:50px;">Shorts</a><input type="radio" name="goods_kind" id="goods_kind" value="Shorts"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Skirts</a><input type="radio" name="goods_kind" id="goods_kind" value="Skirts"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Crops</a><input type="radio" name="goods_kind" id="goods_kind" value="Crops" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Leggings</a><input type="radio" name="goods_kind" id="goods_kind" value="Leggings"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Pants</a><input type="radio" name="goods_kind" id="goods_kind" value="Pants" checked="checked"  required="required" style="display:inline-block;width:50px; height:50px;"/>
							<br>
							</c:if>																	
						</c:if>
						
						<c:if test="${goodsVO.goods_class eq 'Shoes' }">
							<c:if test="${goodsVO.goods_kind eq 'Sneakers' }">
								<a>GOODS_KIND</a><br>
								<a style="font-size:22px; display:inline-block; height:50px;">Sneakers</a><input type="radio" name="goods_kind" id="goods_kind" value="Sneakers" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Shoes</a><input type="radio" name="goods_kind" id="goods_kind" value="Shoes" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">High Heel</a><input type="radio" name="goods_kind" id="goods_kind" value="High Heel" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Running Shoes</a><input type="radio" name="goods_kind" id="goods_kind" value="Running Shoes" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<br>
							</c:if>
							<c:if test="${goodsVO.goods_kind eq 'Shoes' }">
								<a>GOODS_KIND</a><br>
								<a style="font-size:22px; display:inline-block; height:50px;">Sneakers</a><input type="radio" name="goods_kind" id="goods_kind" value="Sneakers"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Shoes</a><input type="radio" name="goods_kind" id="goods_kind" value="Shoes" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">High Heel</a><input type="radio" name="goods_kind" id="goods_kind" value="High Heel" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Running Shoes</a><input type="radio" name="goods_kind" id="goods_kind" value="Running Shoes" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<br>
							</c:if>
							<c:if test="${goodsVO.goods_kind eq 'High Heel' }">
								<a>GOODS_KIND</a><br>
								<a style="font-size:22px; display:inline-block; height:50px;">Sneakers</a><input type="radio" name="goods_kind" id="goods_kind" value="Sneakers"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Shoes</a><input type="radio" name="goods_kind" id="goods_kind" value="Shoes"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">High Heel</a><input type="radio" name="goods_kind" id="goods_kind" value="High Heel" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Running Shoes</a><input type="radio" name="goods_kind" id="goods_kind" value="Running Shoes" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<br>
							</c:if>
							<c:if test="${goodsVO.goods_kind eq 'Running Shoes' }">
								<a>GOODS_KIND</a><br>
								<a style="font-size:22px; display:inline-block; height:50px;">Sneakers</a><input type="radio" name="goods_kind" id="goods_kind" value="Sneakers"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Shoes</a><input type="radio" name="goods_kind" id="goods_kind" value="Shoes"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">High Heel</a><input type="radio" name="goods_kind" id="goods_kind" value="High Heel"  required="required" style="display:inline-block;width:50px; height:50px;"/>
								<a style="font-size:22px; display:inline-block; height:50px;">Running Shoes</a><input type="radio" name="goods_kind" id="goods_kind" value="Running Shoes" checked="checked" required="required" style="display:inline-block;width:50px; height:50px;"/>
								<br>
							</c:if>														
						</c:if>
						
						<a>GOODS_IMAGE(TITLE)</a><br><input type="file" name="goods_imageTitle" id="goods_image"  required="required" /><br>
						<a>GOODS_IMAGE(TITLE_SUB1)</a><br><input type="file" name="goods_imageTitleSub1" id="goods_image2"  required="required" /><br>
						<a>GOODS_IMAGE(TITLE_SUB2)</a><br><input type="file" name="goods_imageTitleSub2" id="goods_image3"  required="required" /><br>
						<a>GOODS_IMAGE(TITLE_SUB3)</a><br><input type="file" name="goods_imageTitleSub3" id="goods_image4"  required="required" /><br>
						<a>GOODS_IMAGE(CONTENT)</a><br><input multiple="multiple" type="file" name="goods_ContentImage"/>
						<a>GOODS_COUNT-S</a><br><input type="number" name="goods_countS" id="goods_countS" value="${goodsVO.goods_countS}" required="required" /><br>
						<a>GOODS_COUNT-M</a><br><input type="number" name="goods_countM" id="goods_countM" value="${goodsVO.goods_countM}" required="required" /><br>
						<a>GOODS_COUNT-L</a><br><input type="number" name="goods_countL" id="goods_countL" value="${goodsVO.goods_countL}" required="required" /><br>
						<a>GOODS_PRICE</a><br><input type="number" name="goods_price" id="goods_price" value="${goodsVO.goods_price}" required="required" /><br>
						<a>GOODS_SALE</a><br><input type="number" name="goods_sale" id="goods_sale" value="${goodsVO.goods_sale}" required="required" /><br>
						<a>GOODS_CONTENT</a><br><input type="text" name="goods_content" id="goods_content" value="${goodsVO.goods_content}" required="required" /><br>
						
						<input type="hidden" name="goods_index" value="${goodsVO.goods_index }" />
						
						<input type="submit" value="상품수정하기" class="signUpBtn" id="signUpBtn" style="margin-bottom:20px;"/>
						<input type="button" value="상품삭제하기" class="signUpBtn" id="deleteBtn" style="margin-top:20px; margin-bottom:150px;" onclick="goodsDeleteGo('${goodsVO.goods_index}','${goodsVO.goods_class}','${goodsVO.goods_kind}','${goodsVO.goods_name}');"/>
						
					</div>	
				</form>
			</div>
		</div>
	</div>
	<script>
	function goodsDeleteGo(goods_index,goods_class,goods_kind, goods_name)
	{
		if(confirm("정말 삭제하시겠습니까?"))
		{
			location.href = "Goods_Delete.do?goods_index="+goods_index+"&goods_class="+goods_class+"&goods_kind="+goods_kind+"&goods_name="+goods_name;  
		}
		else
		{
			return;
		}
		  
	}
	</script>
</body>
</html>